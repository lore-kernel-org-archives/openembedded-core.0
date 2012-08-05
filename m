Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Sy9h0-0008BI-CY
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 00:53:02 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2E37020637;
	Sun,  5 Aug 2012 18:33:05 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 05 Aug 2012 18:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=pq/wp/57atgnNS0+TQp8+M
	hYApc=; b=RlHfQhSq5u8OTPzNa+QsS5EIF3ddLwVmLJWtUbctu5Zh86WTdDnA1B
	lrXTvXe6TlvQRjmKS3Rf9DDgezwDevG37f/IiC1CRrMeOVNFkrJ593du1UF3hMfk
	f1xeuDhuNvlpNNqt4JAWrbPUa5+pvuvimFo6Zfad5pEEzGPTczXdE=
X-Sasl-enc: /n8T6Xkm7q/KbWxhzrwaam2/xPxFfJtiru9EITzzOLWQ 1344205984
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 55FC18E020B;
	Sun,  5 Aug 2012 18:33:04 -0400 (EDT)
Message-ID: <1344205948.3541.2.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 05 Aug 2012 18:32:28 -0400
In-Reply-To: <9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
References: <cover.1343964466.git.wenzong.fan@windriver.com>
	<9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] gdk-pixbuf: fix parallel install issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 22:53:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-03 at 11:30 +0800, wenzong.fan@windriver.com wrote:

> Make an explicit dependency to the libs install targets would fix this
> issue.

I don't think Yocto should be running the 'make install' target with
parallelism enabled; it's just going to be a source of major pain for
small gain.  Historically Automake's install targets have had a lot of
paralleism issues AIUI, even discarding modules which have custom
install hooks.





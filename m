Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 68C1873DAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RFF4xU013469; Mon, 27 Apr 2015 16:15:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TZg6Qs2a1oLf; Mon, 27 Apr 2015 16:15:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RFEpTN013460
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2015 16:15:02 +0100
Message-ID: <1430147691.13022.122.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Mon, 27 Apr 2015 16:14:51 +0100
In-Reply-To: <CABcZANmxyF3F6Oy2Gzq-jgYEZpTC+DpgA69htK4XQ8ZkB3H__g@mail.gmail.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
	<1a55976003e57036ced5e47dd031575508dfc87b.1429799661.git.cristian.iorga@intel.com>
	<1430085461.13022.89.camel@linuxfoundation.org>
	<CABcZAN=Xebt9XPGD_FgpsTp06nbs6OezJhsBNCTnoefCfknxzA@mail.gmail.com>
	<1430118811.13022.91.camel@linuxfoundation.org>
	<CABcZANmxyF3F6Oy2Gzq-jgYEZpTC+DpgA69htK4XQ8ZkB3H__g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 4/4] bluez5: don't exclude from world builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 15:15:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-27 at 07:17 -0700, Christopher Larson wrote:
> 8262012a90273a4726ebaaf5c4da61262542e69d in bitbake added the initial
> 'world' implementation, which didn't do such a removal, but did
> explicitly skip virtual/*, and it looks
> like aff3227b5e4a3dee9bceb120aac11f4bf3ac6409 implemented the first
> naive handling of it, beyond the virtual/ prefix, from a quick perusal
> of bitbake history. It skipped the non-preferred selections of every
> multiple provider.

Interestingly, that code does survive in buildWorldTargetList() in
cooker.py.

Clearly when EXCLUDE_FROM_WORLD was added to bluez it wasn't working as
intended for some reason. Could do with investigation...

Cheers,

Richard




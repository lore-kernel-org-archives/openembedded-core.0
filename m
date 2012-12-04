Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TfqNh-00031w-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 12:09:41 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 39E4AD22C0; Tue,  4 Dec 2012 11:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 73969D22B4;
	Tue,  4 Dec 2012 11:55:04 +0100 (CET)
Message-ID: <50BDD679.5030106@linaro.org>
Date: Tue, 04 Dec 2012 11:54:49 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <50B744CC.4050906@linaro.org> <50BDC8E4.1010303@linaro.org>
	<1354618155.25268.46.camel@ted>
In-Reply-To: <1354618155.25268.46.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patching eglibc for AArch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 11:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 04.12.2012 11:49, Richard Purdie pisze:

> The main thing worrying me about these now is the size of the patches.
> I'd prefer not to add them into the main repository since they then
> become part of history and increase the repo size. I'd really therefore
> like to host the patches somewhere and then point SRC_URI at them.
> 
> Is that something linaro can do or should we find somewhere on the
> yoctoproject.org infrastructure?

We can host those patches. I sent this version for review as I do
development with local patchsets. Will prepare version with hosted patches.




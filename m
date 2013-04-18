Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1USlSL-0000Ln-DC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 11:48:42 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so1259161dad.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 02:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=aRyWr4WaMDNjjLDo5pB0+QTc/AiejCXJ5shKb+oVtr0=;
	b=BeLEmm0KniySzv//SueSQ0JfjGRDGSyJGMiDO3B9TW1Zxsifw/vAGJpOWUcywhUD8B
	R4nkgUVqWSFHC2rXD56gXVaCzNYK40FcdWAiNJ7uasTq3SA1VwX8OzvgHI9SlG7YTSRX
	1Mrrh6RazrhBQLKzjisAMZyKlzw0QPWyCYEXpxNFxW8GWIW2poz+0qC59v0aZL5u2ZPu
	3BnqOMVL9pXtchcDN7jI7MtMbfLIIaiOyXQJ77d7rrt5gMbyYCglRlVLJkDOkUahiR+O
	bLNnei8+Qg49uTsPrLUpwsZU784/tsjOA6LttRBES5cGIQiZWJqCOmahnMd+boiU5fWB
	KHBA==
X-Received: by 10.67.1.97 with SMTP id bf1mr12681500pad.118.1366277467694;
	Thu, 18 Apr 2013 02:31:07 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([117.89.53.249])
	by mx.google.com with ESMTPS id mt13sm9267473pbc.15.2013.04.18.02.31.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 02:31:06 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 17:27:50 +0800
Message-ID: <3703314.99C4OZ7x1c@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.7-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <1366270160.10502.18.camel@ted>
References: <1366270160.10502.18.camel@ted>
MIME-Version: 1.0
Subject: Re: systemd/sysvinit in the 1.4 release
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
X-List-Received-Date: Thu, 18 Apr 2013 09:48:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Who need hybrid mode?

On Thursday, April 18, 2013 08:29:20 AM Richard Purdie wrote:
> I just wanted to be clear with people what has gone on with sysvinit and
> systemd in the 1.4 release.
> 
> Basically I took some patches recently on a trust that certain things
> had been checked and it was found that there were problems with the
> changes after they went in. At some point I have to trust the data I'm
> getting and in this case things broke down.
> 
> Since systemd is one of the priority features of this release, releasing
> with it broken was not the right thing to do so at the last minute we've
> basically reverted some of the recent changes to systemd and udev
> (the /sbin relocation) and then tried to fix various issues that arose
> from that (even with the reverts, there were still several issues). I
> appreciate this isn't an ideal thing to do either.
> 
> We now have a build of the dylan branch which is likely to become rc2
> and get tested by QA and may well be the final release. We're past the
> point we can consider any changes unless something is seriously broken.
> We're trying to do some additional testing today to determine whether
> there is anything seriously wrong with the recent changes.
> 
> I would point out that having the "systemd + sysvinit" hybrid mode which
> is not something we'd originally planned for gives us a ton of headaches
> since we have to test:
> 
> systemd only
> systemd+sysvinit in systemd mode
> systemd+sysvinit in sysvinit mode
> sysinit only
> 
> and for each we need to test for each architecture and we then need to
> look at for example multilibs in each case. Currently the autobuilder
> isn't able to help with this although obviously that is something we
> need to fix in the 1.5 cycle.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com



Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE1CC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 15:11:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.50728.1748013084512591750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 08:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AMzpJ4ka;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 961001FCEA;
	Fri, 23 May 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748013082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WjFVPnJft6CPa+pWtu9QbX/fUDAR3kBvDWYDMuKKaY8=;
	b=AMzpJ4kagU1c5lkDC6MQ7P8sl7y36LO6QcMqSP8aFuGqvk4NYWS0oFf9kp2rFVL2Inh3PI
	esGoxsr/93j4KHHBb/hPqmpWuwbPN0FY82w4bJt7phoZfSIXI0ghrJ7q7u5BqLlspNJkPP
	yrhNOtK5y+F1YICT/T+E2iwKSuVB3tgBJUT9MH+ajIAPiIvmUqzPAUYZTvbAYVz2GZlw0X
	V2y6lnMhBDTbqRGSoho788QWFIZBWPv+DxEh0aJ78+9beNWtIiq4lilulbcFnjcjvZbRcq
	boXxx3sc3n0w864JM2w4WSECf9ftIlLn94HKwEqUGEmwn3to1UV7EcqfYk9qtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 17:11:22 +0200
Message-Id: <DA3MX857XCJV.1B59UF4ZXWM40@bootlin.com>
Subject: Re: [OE-core] [PATCH] busybox: rm faulty .config arg to
 merge_config.sh
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joakim.tjernlund@infinera.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250522225348.2412108-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20250522225348.2412108-1-joakim.tjernlund@infinera.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeludejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhorghkihhmrdhtjhgvrhhnlhhunhgusehinhhfihhnv
 ghrrgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 15:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217214

On Fri May 23, 2025 at 12:53 AM CEST, Joakim Tjernlund via lists.openembedd=
ed.org wrote:
> .config is implicit and also an output file, its precence confuses
> merge_config.sh to not apply .cfg fragments.
>
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---

Hi Joakim,

Thanks for your patch.

It looks like this is breaking the build on the autobuilder, maybe only
with poky-altcfg distro.

Here is the error:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Postinstall scriptlets of =
['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1665
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1685
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/1690
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1670

Can you have a look at this error please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



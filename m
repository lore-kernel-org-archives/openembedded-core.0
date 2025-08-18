Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAD9CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 06:07:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.68779.1755497251805689362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 23:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iA/Xpvev;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FC7542E77;
	Mon, 18 Aug 2025 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755497249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FzDREkg7UMR5AKIU9bs3tFR1b1qxY5c5yZoBEZQUGU=;
	b=iA/XpvevPMRaFvtwiljxjaN0K0DwIZOLX5kS/rLNw+tEEwv/PVusimQglqnUYsTn3YErfH
	Syi1ps3SiW4iMwzYQ0o53Q8dO1gbGuTcMhDdYKAgjHlkjC5vJy50O/SSeaoBOQWUKIBGsp
	63XAQGvGqxPHqH6K5jgD07yS7p6ZebP00GjZuCL4j2k15FYJVMkeT4EZUctpTpdZmas32t
	y19yUxhNw1sgYlbLSmVYrkZndkqxhedSZf6WFYzbH/RT/5x+zKeinxxOLxdnsl6bmj/upG
	hCGW9IDrC7ZIx10FYhYJpUAPtWSUSm4WKw4Fz4MXzVEODV71+WLOgrbsCEEI0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 08:07:28 +0200
Message-Id: <DC5BU6ME8H5L.1TRS1N5LYWRWN@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] boost-build-native: upgrade 1.87 -> 1.89
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250816102229.55627-1-skandigraun@gmail.com>
In-Reply-To: <20250816102229.55627-1-skandigraun@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedukeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeethfdtudeguefgiedvleevjeevffdvleefleefudefgfduuefhieeuleetfeeiteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhoshhtrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgeegtdemhedugedtmeegtgelvdemfhejgeefmeeltdejjeemvdgsjegvmeektgehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmeehudegtdemgegtledvmehfjeegfeemledtjeejmedvsgejvgemkegtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshhkrghnughighhrrghunhesghhmrghilhdrtghom
 hdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 06:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222030

On Sat Aug 16, 2025 at 12:22 PM CEST, Gyorgy Sarvari via lists.openembedded=
.org wrote:
> Changelog: https://www.boost.org/releases/1.89.0/
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like this is breaking the build of kea:

ERROR: kea-2.6.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker=
/qemux86-world-alt/build/build/tmp/work/core2-64-poky-linux/kea/2.6.3/temp/=
run.do_configure.25537' failed with exit code 1
...
| checking for Boost system library... no
| configure: error: Linking with -lboost_system -lboost_system is not enoug=
h: please make sure libboost_system is installed in an expected location; C=
heck config.log for details, you may be missing other libraries.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2074
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2231
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2253
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2288

Can you fix it please?

Best regards,
Mathieu



--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



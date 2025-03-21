Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABFAC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:38:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.18417.1742553537659481557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 03:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KOb8nEwM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 231CB4327D;
	Fri, 21 Mar 2025 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742553535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMWWRBwM1XTSvOlWjF4d9AU6TmLOtHh/7dagfj6RupM=;
	b=KOb8nEwM16d2+FzJgO50hKjLRpEOJbx5VQz4xCS4/qFXfbm+CLhE6tWtrYjgfD7s/A7v8H
	zEhaag581RDBevi/tco+1Ul4B9zG9FqE74rezlkRbEBBcMd2O0BJn/hRA2AyEithdXryK5
	iDsMl7YxO381adX5r1SP/s27R2Q0jomCqF9TrGiQJbWO8H6Y7x8OoJazwXO6hRKLDnAgL6
	4HiCeq4hCBws++8COCWXoq41KPjx6fifElJyc471+aUFWBzgPErF/wJHaRluVWiKOOe6vt
	9bHWJ3FbPYo6fLwVdB9irwiwG0vRTw97+7RWuEuBUgqVF6dpMtQkutHV5Gkc+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 11:38:54 +0100
Message-Id: <D8LVOAKHBJYS.MYA33KN1ZPX4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Mario.Schuknecht@iris-sensing.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libgpg-error: Move yat2m binary to -dev
 package
Cc: "Mario Schuknecht" <mario.schuknecht@iris-sensing.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250321072046.5349-1-mario.schuknecht@iris-sensing.com>
In-Reply-To: <20250321072046.5349-1-mario.schuknecht@iris-sensing.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefueelgfffteeludehvdehteeugeevudduvdejieelgeegkeegfeejvdevvedtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepofgrrhhiohdrufgthhhukhhnv
 ggthhhtsehirhhishdqshgvnhhsihhnghdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 10:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213441

On Fri Mar 21, 2025 at 8:20 AM CET, Mario Schuknecht via lists.openembedded=
.org wrote:
> The yat2m tool is a utility that is not required to use the pure
> library.
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
> ---

Hi Mario,

Thanks for your patch.

This is breaking the selftests, as can be seen on the autobuilder:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Unable to install packages=
. Command '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-56=
8868/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysr=
oot-native/usr/bin/apt-get  install --allow-downgrades --allow-remove-essen=
tial --allow-change-held-packages --allow-unauthenticated --no-remove  apt =
dpkg gnupg packagegroup-core-boot packagegroup-core-full-cmdline packagegro=
up-core-ssh-openssh psplash run-postinsts signing-keys-packagefeed ssh-preg=
en-hostkeys' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 gnupg : Depends: gnupg-gpg but it is not going to be installed
         Depends: libgpg-error (>=3D 1.51)
         Recommends: pinentry but it is not going to be installed
E: Unable to correct problems, you have held broken packages.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1199

Can you have a look at this error please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



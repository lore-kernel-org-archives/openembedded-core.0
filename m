Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBE0C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 17:44:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.20234.1742751875822326267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bxPKb18p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89C7644437;
	Sun, 23 Mar 2025 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742751874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xarwv08dKZfF6UH3b+EqOb/JUJPoiix4ZrQLeEZEkNE=;
	b=bxPKb18pYHCkqzhSIcezkkL6WMpvMSza6thgYYmFoOYtZ0kn9zHfvQighw7/eNY46x5sSE
	iG0eIuNK2CNZbcNhoq1vnzYs2xje0YYAMDARwpkdNNAnYJpCW70OtikL1JqWShuuWJJPXA
	O73V37AWr/ecHpwqfNB4LkDhmysvOVlJh4VSZlY/YjPjnbuZ/7PTiSUe/1EHrbxcwQyvRe
	f5wT0VUxPCwgG97qh3MrIXD1YTz2jX4fxcwPa2OR4R70b6bPAWWKfAVOzrHLgxoxEr9VrZ
	VLoBAqcUc2c3TWPMgbbORyxe56NQ48XiQW5F+m4TGxtqkzsppTJ3+QLKg6+k3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Mar 2025 18:44:33 +0100
Message-Id: <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Cc: "Mario Schuknecht" <mario.schuknecht@iris-sensing.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Mario.Schuknecht@iris-sensing.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
In-Reply-To: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemhedvvdejmegrvdgsfhemkegutdhfmeeggeejvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeehvddvjeemrgdvsghfmeekugdtfhemgeegjedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepofgrrhhiohdrufgthhhukhhnvggth
 hhtsehirhhishdqshgvnhhsihhnghdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 17:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213508

On Fri Mar 21, 2025 at 4:12 PM CET, Mario Schuknecht via lists.openembedded=
.org wrote:
> Inherit lib_package to create an extra libgpg-error-bin package for
> executables. As a result, the gpg-error and yat2m executables are now in
> this libgpg-error-bin package, and no longer in the libgpg-error
> package.
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
> ---

Hi Mario,

Thanks for the v2, but it looks like we still have a build error:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Unable to install packages=
. Command '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-11=
48269/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sys=
root-native/usr/bin/apt-get  install --allow-downgrades --allow-remove-esse=
ntial --allow-change-held-packages --allow-unauthenticated --no-remove  apt=
 dpkg gnupg packagegroup-core-boot packagegroup-core-full-cmdline packagegr=
oup-core-ssh-openssh psplash run-postinsts signing-keys-packagefeed ssh-pre=
gen-hostkeys' returned 100:
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

https://autobuilder.yoctoproject.org/valkyrie/#/builders/54/builds/1247
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1159

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



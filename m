Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5CDE7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 18:25:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3072.1735928745928873844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 10:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y3uXgZJ0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADA0AE0006;
	Fri,  3 Jan 2025 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735928744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KalQyyk3X26CgK9k9Yi62dRnIKRu9wWYRp1Lr/tNcaU=;
	b=Y3uXgZJ0cXyx2d//wrEGQo1pvGpk2dy/AJ5unbZnAGv6mRpKdfDpn2KGK7QyDJxow5w8xU
	SmSs26/uf+JN2Try92u8Qa9NxQPyGUQrOAGN5HKr+RUBvvy2oFxYxdTT8htaklp4S4EC55
	alyN9V5tiZXOyj0FW8KkJtVHciI8YToxYwoq5DIoTcSCf2m7rMPDac9KYRkWtISb5Xc8QI
	cZz0pZYqmjxvKHmf82+LnZKp7Sz15NacC7fL+v+caYNsR+lLoQ/IJisMZ3k3HYntoE/a6u
	I3r5KTqY2LZdmQ3/TcqdTKBXAHkBJ8p0IhD4+tAPuYuZKfEi3rQOnnisoSJo4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jan 2025 19:25:43 +0100
Message-Id: <D6SNDRHCP2MX.20N6GPMWAZWKE@bootlin.com>
Subject: Re: [OE-core] [master][PATCH] libpng: Add ptest for libpng
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sanakazi720@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250103104625.2945957-1-sanakazi720@gmail.com>
In-Reply-To: <20250103104625.2945957-1-sanakazi720@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 18:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209368

On Fri Jan 3, 2025 at 11:46 AM CET, Sana Kazi via lists.openembedded.org wr=
ote:
> libpng is a platform-independent library which
> supports all PNG features.
> This ptest executes the below binaries, parses
> the png image and prints the image features.
>
> 1. pngfix - provides information about PNG image
> copyrights details.
>
> 2. pngtest - tests, optimizes and optionally fixes
> the zlib header in PNG files.
>
> 3. pngstest - verifies the integrity of PNG image by
> dumping chunk level information.
>
> 4. timepng - provides details about PNG image chunks.
>
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> ---

Hi,

Thanks for your patch.

It looks like something is wrong with it, as we have issues on the
autobuilder, but I fail to understand what is going on so far.

All I get is the following error message. I tried to run the same
command manually on the worker, and indeed, opkg segfaults without any
error.

ERROR: core-image-sato-1.0-r0 do_rootfs: Unable to install packages. Comman=
d '/srv/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86_=
64-poky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/opkg --vola=
tile-cache -f /srv/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wo=
rk/qemux86_64-poky-linux/core-image-sato/1.0/opkg.conf -t /srv/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86_64-poky-linux/core-i=
mage-sato/1.0/temp/ipktemp/ -o /srv/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs  --for=
ce_postinstall --prefer-arch-to-version   install locale-base-c locale-base=
-en-gb locale-base-en-us' returned -11:

https://valkyrie.yoctoproject.org/#/builders/67/builds/756/steps/11/logs/st=
dio

I believe this only happens with pkgman-non-rpm build and has reproduced
every times with this build.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



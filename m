Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A157C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:52:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2440.1783489950744073201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LMWiHaHk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0A6DC8F445
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 05:52:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04B1660337;
	Wed,  8 Jul 2026 05:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EA2411BC3102;
	Wed,  8 Jul 2026 07:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783489947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ujoo6z1R9vO2RrzCS63uEawUiH6gBDOMYWya8z4dtmI=;
	b=LMWiHaHkUyvHRzLsMAEV9ttniBvzvxEatDDS7LrFG9G5Oc9JicgnYsAybjH1nW7PvGC1gH
	hkgxTyfZ2AiQj9ZjiARW38YHvVvVlM+7jkneSflPIBjSArnvv4SThxcCpH0FBuN1XOxzOZ
	XIlTsmImglGb1n1Ov/CD6T+GyZHXyMVBTge4Nh9MLA7gPfPmfMs1IKsSmkS97ecpwuKvPn
	FQZZAejESX/3oOhn4kQ4bk5d9FM+yXIZ20tlpq2zvmcz+1yQtwCvPpeQwMNbJnFrxInW6F
	2i9AGnJnEfUY4mqfCOP+IkpVTPJ5gwo6k3cb8hvZDf6U5qXuCoP5oste8HJoLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 07:52:25 +0200
Message-Id: <DJSYF64M2ODH.ZWMOARCI56C4@bootlin.com>
Subject: Re: [OE-core] [PATCH 20/45] libical: upgrade 3.0.20 -> 4.0.3
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
 <20260706171701.70536-20-alex.kanavin@gmail.com>
In-Reply-To: <20260706171701.70536-20-alex.kanavin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240435

On Mon Jul 6, 2026 at 7:16 PM CEST, Alexander Kanavin via lists.openembedde=
d.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>

Hi Alex,

>
> Drop -DSHARED_ONLY=3DTrue (replaced upstream with LIBICAL_STATIC, false b=
y default).
>
> Backport a bluez5 patch to support the new version.
>

I believe the said patch is part of bluez 5.87, and Richard upgraded the
bluez recipe a few days ago. So now applying this patch is failing:

ERROR: bluez5-5.87-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker=
/beaglebone/build/layers/openembedded-core/meta/recipes-connectivity/bluez5=
/bluez5/0001-build-Support-libical-4.0.patch' on target directory '/srv/pok=
ybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8t2hf-neon-poky-=
linux-gnueabi/bluez5/5.87/sources/bluez-5.87'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/beaglebone/build/buil=
d/tmp/work/cortexa8t2hf-neon-poky-linux-gnueabi/bluez5/5.87/recipe-sysroot-=
native/etc/quiltrc push', 1, 'stdout: Applying patch 0001-build-Support-lib=
ical-4.0.patch
patching file configure.ac
Hunk #1 FAILED at 306.
1 out of 1 hunk FAILED -- rejects in file configure.ac
Patch 0001-build-Support-libical-4.0.patch can be reverse-applied

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4102

I believe re-sending the libical upgrade without the bluez patch should
be enough.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



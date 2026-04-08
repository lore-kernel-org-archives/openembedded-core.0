Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0614E1073C99
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:03:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103619.1775646223331386897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h5be4WKG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D9BE4E42970
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 11:03:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9667603CB;
	Wed,  8 Apr 2026 11:03:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76C7C10450236;
	Wed,  8 Apr 2026 13:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775646220; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fbobjjfS9xptFhWZISonxoBo9goJSKMfDawK0NZMnew=;
	b=h5be4WKGVLUuXFnLixjkTQKQN1LJ0uatjfj5RUMIx3aZO2846wyUE83nlLgkWeki4BZZm6
	CREMIdOTiY7JeN4UZfqhP4VcG3zDidlXq66cv/YhUJzbfYziJMSdK1tWRnSdiV9g5unFLY
	bispcfxNkFP8zw0gV+iaRP/GegrJRRmUHwjLpSgcZW/1l6QZ4UMwClECu0f9Ppnd7gMxuA
	gKn64R8wDsMxRVpnfaMkZO/5MwNRm7T/qsFZRWy1Cj1ji6/vI4BNTpgo0xlMvAFogZnt44
	quh5HzxOFUy0k11Rcg1PWnmNMqJ/TjLUcHa/oG3o0u7mwWB15Y5ZYu6N2J7Udg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 13:03:38 +0200
Message-Id: <DHNQ1VTH9ILY.38PUX5HDRZXAG@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2026.01 -> 2026.04
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260406222906.7171-1-festevam@gmail.com>
In-Reply-To: <20260406222906.7171-1-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234828

On Tue Apr 7, 2026 at 12:29 AM CEST, Fabio Estevam via lists.openembedded.o=
rg wrote:
> Upgrade to U-Boot 2026.04.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
Hi Fabio,

We did merge a new CVE patch yesterday, so you will need to remove it
(CVE-2026-33243.patch):

ERROR: u-boot-1_2026.04-r0 do_patch: Applying patch '/srv/pokybuild/yocto-w=
orker/beaglebone/build/layers/openembedded-core/meta/recipes-bsp/u-boot/fil=
es/CVE-2026-33243.patch' on target directory '/srv/pokybuild/yocto-worker/b=
eaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2=
026.04/sources/u-boot-2026.04'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/beaglebone/build/buil=
d/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2026.04/recipe-sysroo=
t-native/etc/quiltrc push', 0, 'stdout: Applying patch CVE-2026-33243.patch
patching file boot/image-fit-sig.c
Hunk #1 FAILED at 18.
Hunk #2 succeeded at 403 with fuzz 1 (offset 174 lines).
Hunk #3 FAILED at 441.
Hunk #4 FAILED at 469.
3 out of 4 hunks FAILED -- rejects in file boot/image-fit-sig.c
patching file doc/usage/fit/signature.rst
Hunk #1 FAILED at 353.
Hunk #2 FAILED at 374.
2 out of 2 hunks FAILED -- rejects in file doc/usage/fit/signature.rst
patching file test/py/tests/test_vboot.py
Hunk #1 FAILED at 362.
1 out of 1 hunk FAILED -- rejects in file test/py/tests/test_vboot.py
Patch CVE-2026-33243.patch does not apply (enforce with -f)

stderr: ')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3568

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



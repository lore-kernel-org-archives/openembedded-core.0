Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23A4CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 10:34:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8724.1778150046737351520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 03:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MMxDOyRd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 608004E42C23;
	Thu,  7 May 2026 10:34:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20ED460495;
	Thu,  7 May 2026 10:34:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEE73107F160C;
	Thu,  7 May 2026 12:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778150043; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1oC1/1gvLt3Vhy4llYCO4qHRRbWbcWE0tEqACfXTQy4=;
	b=MMxDOyRdxMlBvoeyT9i0t6B9xJncDygRf5H+nGOb4R9cYzReCLsUpNcxzoYvrFgEAdNc6b
	YWsFTW6jERHzz/NxXHpHpGuEk5P5foQQUlxGUDAkwIbSTam4xMYF7x5i0uGsP86Qo+BxfT
	NeCH4AE2WNhvNa1qYigLk0CzvdHknSIuTfetke1M0mAZEOHIN0IV9g1NIQ77tbY3696n89
	56ofyjQjO4Nm2QtUr6CDlmUwTg7WjeAAagMP+/4saW/EQt0NI8Je+PjN9JbmO/8GGajj1s
	hFp1NN0kjKQGxsGOjvo5d8v6W20c7ZIFPZMbAzxFlJayl6MNShxcFb54ZUf0iw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 12:34:01 +0200
Message-Id: <DICDKZZ8Y5MD.TV8LSEDQ3M6Q@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Quan.Sun@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
In-Reply-To: <20260506214835.1578529-1-Quan.Sun@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 10:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236573

On Wed May 6, 2026 at 11:48 PM CEST, Quan.Sun via lists.openembedded.org wr=
ote:
> From: Quan Sun <Quan.Sun@windriver.com>
>
> Key changes:
> - The qemu.qmp library was removed from the main QEMU repository
>   (see commit e1e49b35b3c3). Source the standalone python-qemu-qmp
>   v0.0.6 from https://gitlab.com/qemu-project/python-qemu-qmp to
>   continue providing QMP support for testimage.
> - Refresh patches for new version.
>
> AI-Generated: Uses kiro-cli
>
> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
> ---

Hi Quan,

Thanks for your patch.

It looks like the build is failing in some conditions:

ERROR: nativesdk-qemu-11.0.0-r0 do_configure: Execution of '/srv/pokybuild/=
yocto-worker/qemuarm64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/na=
tivesdk-qemu/11.0.0/temp/run.do_configure.663311' failed with exit code 1
...
| DEBUG: Executing shell function do_configure
| WARNING: unrecognized host CPU, proceeding with 'uname -m' output 'x86_64=
'
|
| ERROR: C compiler "i686-pokysdk-linux-gcc -march=3Di686 --sysroot=3D/srv/=
pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/i686-nativesdk-pokysd=
k-linux/nativesdk-qemu/11.0.0/recipe-sysroot" either does not exist or does=
 not work.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3717
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3699
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1514
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3743
https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/3816
...

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7C31091912
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 19:49:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4793.1773949789701928045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 12:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FPjSWeRr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B7E44E42721
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 19:49:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B8A360050;
	Thu, 19 Mar 2026 19:49:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D403C10450A9C;
	Thu, 19 Mar 2026 20:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773949786; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7R/L6SThPEAHKNHvH2yRGit4vs6FkEc04htZe9F2z9M=;
	b=FPjSWeRrBzo/RX71yEHoHwdKUYRWpU1Eeo7jADo/HrEKMgS/mp+SBvLFm9p5ZyEcLCYgZX
	AQDBv6JXr8d3aRtBK8lWHYiFKM2w0EIZqzszZ4oQFtcHQwhrLPLMvKNoyKMc0MBXRnLr3M
	OA/btas5jFhQLjfX5s/m9ALlROmNpp7FPY7tQKbuuXT2InFn4t/QWIXsBtdhF1zTE/I9oV
	fp7HGogJRsJU8R6BHLGSKndl7YpGq6jY8vyLQXtn+XrpxCRucEwRSeQ/NiJg4+38A7HV9P
	GgF/AinHtGw1ahvf7Z/7NylYQABGRBsHGaCqeYSr1zlQmwS6+HaCryCeaTnD5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 20:49:44 +0100
Message-Id: <DH70PSSK85TB.1A4ELX9TL5PA1@bootlin.com>
Subject: Re: [OE-core] [PATCH 14/40] hwlatdetect: upgrade 2.9 -> 2.10
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-14-wangmy@fujitsu.com>
In-Reply-To: <20260319101332.2067-14-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 19:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233551

On Thu Mar 19, 2026 at 11:13 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-t=
ests/rt-tests.inc
> index 2042768d5a..e782d990c8 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
> -SRCREV =3D "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
> -PV =3D "2.9"
> +SRCREV =3D "40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28"
> +PV =3D "2.10"
>  PE =3D "1"
> =20
>  SRC_URI =3D "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;br=
anch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}"

Hi Wang,

Thanks for the upgrade.

This is breaking rt-tests:

ERROR: rt-tests-1_2.10-r0 do_patch: Applying patch '/srv/pokybuild/yocto-wo=
rker/qemux86-world-alt/build/layers/openembedded-core/meta/recipes-rt/rt-te=
sts/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch' on targ=
et directory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp=
/work/x86-64-v3-poky-linux/rt-tests/2.10/sources/rt-tests-2.10'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world-alt/bui=
ld/build/tmp/work/x86-64-v3-poky-linux/rt-tests/2.10/recipe-sysroot-native/=
etc/quiltrc push', 0, 'stdout: Applying patch 0001-Makefile-Allow-for-CC-an=
d-AR-to-be-overridden.patch
patching file Makefile
Hunk #1 FAILED at 2.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch does not app=
ly (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3259

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



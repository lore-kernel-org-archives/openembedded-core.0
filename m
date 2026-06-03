Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553E8CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 06:01:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13599.1780466482680828600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 23:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uB4XS76H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DA25FC62212;
	Wed,  3 Jun 2026 06:01:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25C3D60735;
	Wed,  3 Jun 2026 06:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D000710888CC6;
	Wed,  3 Jun 2026 08:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780466479; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bi0cOVXJm23U0e+osZVowFhWi03WENAUm9ts49k2IxU=;
	b=uB4XS76HLm/Qa54EoeAoq2j9wo/NzoO8h7bzJy/GhKDikjZj2CfjeAwVYDfi2oJONpwrCR
	7bRF9ZM/y3CXUEpsKo3x0q31q/UOmxKeKWeYndJU6UUsOLnRld30ZkU2Ojh2QPQ2gvnfL3
	o8101uobCmeP52VIiKHn0uQ5fx/nvYygyGDhBvW9rRkVy12kxHHP2mHP0zVrrY/SCP6/XU
	oBsXAAXdp5W4f0Fqr7FgAFNPRhzQ+chWw9u1XYTG2iwINTgfAPye3G1Cl2wZ0p0xnZuZuU
	Y/ElKPHVhr0GYWzHpGCljk6CAVA6vqJ2wDuUwBGkDqV1BD6a4hGiwBQzAIt/qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 08:01:17 +0200
Message-Id: <DIZ6OW2BYEZG.DR60WS2Q3D56@bootlin.com>
To: <nikhilar2410@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] rsync: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602120135.4181978-1-nikhilar2410@gmail.com>
In-Reply-To: <20260602120135.4181978-1-nikhilar2410@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 06:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238079

On Tue Jun 2, 2026 at 2:01 PM CEST, nikhil via lists.openembedded.org wrote=
:
> Package the upstream rsync testsuite and helper binaries
> into rsync-ptest package and add a run-ptest wrapper for
> executing the tests.
>
> backup.test is skipped due to intermittent failures
> observed on qemux86-64.
> The issue has been reported upstream:
>
> https://github.com/RsyncProject/rsync/issues/941
>
> Tested on qemux86-64 using ptest-runner with all
> executed tests passing.
>
> Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
> ---

Hi Nikhil,

Thanks for the new version.

It looks like some tests are failing now:

AssertionError:
Failed ptests:
{'rsync': 'START: ptest-runner\n'
          '2026-06-02T19:14\n'
          '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
          'runtests.py running in /usr/lib/rsync/ptest\n'
          '    rsync_bin=3D/usr/bin/rsync\n'
          '    srcdir=3D/usr/lib/rsync/ptest\n'
          '    TLS_ARGS=3D-l -L\n'
          '    testuser=3Droot\n'
          '    os=3DLinux qemuarm64 6.18.33-yocto-standard #1 SMP PREEMPT W=
ed '
          'May 27 22:05:49 UTC 2026 aarch64 GNU/Linux\n'
	  ...
          'cd+++++++++ ./\n'
          'cd+++++++++ A weird)name/\n'
          '>f+++++++++ A weird)name/file\n'
          'tls: stat ./A\\: No such file or directory\n'
          '----- 00-hello log ends\n'
          'FAIL    00-hello\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3737
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3756
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/487
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/471

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D460C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 06:38:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16940.1784615927696862704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 23:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D9lbvaHi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8325F1A10EB
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 06:38:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48BDF60368;
	Tue, 21 Jul 2026 06:38:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAC3111BD1DCE;
	Tue, 21 Jul 2026 08:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784615924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1xaFXCpTYMg01Vnl1GIpsG5eMbXLE3aG3TyyI87d1ic=;
	b=D9lbvaHih2CThFjvmxuE4vw97lfzBU7s6rM1d25QKPnGGymZnYfmYNhwRr0FdB4ScmbPlB
	7pmNqliPAwxdBGVm1z79Ob+47MJ9tM3GavTfPgSGkiPx/+dxFG8XThz2KloKoGKseh0SVx
	P5RU1o2kBtdxlCtuH+hQrhOlK/Kp1ZJY/o3g9cZeHAAwcNkWsXWpYFlX5U5+PoK4/UUKbZ
	GIO5iAFVLqhI9yVjhsToKV5PaCoHNTMjbmU07o7pqX7VhgJsBvnHNPYIEYwmclgjANehNi
	zXTAJ1lds4xHG9KQG3l25Gs3vgKipTbnPALkoIDjZnEs4BfVi8xv4NnzZ+qJFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 08:38:41 +0200
Message-Id: <DK41JOAOYZH7.1CPT2EN28HTX7@bootlin.com>
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libpsl: upgrade 0.22.0 -> 0.23.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 06:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241505

On Mon Jul 20, 2026 at 7:35 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> License-Update: copyright notice reworded, MIT terms unchanged
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

Thanks for the upgrade.

We do have new QA issues:
ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl=
/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains reference to TM=
PDIR [buildpaths]
ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File /usr/src/debug/libpsl=
/0.23.0/src/suffixes_dafsa.h in package libpsl-src contains a reference to =
the build host HOME directory. If upstream hardcodes a directory path that =
matches your home, you can set OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in=
 the recipe. [buildpaths]
ERROR: libpsl-0.23.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4184

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



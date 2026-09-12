Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609DEC88E4D
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 08:12:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2725.1789200742674375206
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 01:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fXSOyeWg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D1B901A0345
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 08:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B65A60580;
	Sat, 12 Sep 2026 08:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B97311C78D5A;
	Sat, 12 Sep 2026 10:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789200738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yfcvXkqpJmQbWrB+XQXas30I6KOT4i1RSc3+4lxbZZk=;
	b=fXSOyeWg0aSI8o0pHhybxD6Dz+Sewzr/gq1ud/sHttrTA40aNblsuvCg4sqf/b+K5WYA9r
	wzKF5e4LMSnBPZHkV/+vb8aZSBYNqoHbEDXO5HYAN0I6MRMvJ5ycayoc8MJQxbwUUjC902
	ENVd2OBce97QzC7K/bvJ5ITH/byMr0aNvcBtwpjBp4kSwnvjLWoVVJNgCMyYJR5NdAdJEa
	rzhT2dsq8J+Eq1Eh2jFw3smY5ONXh1oFsq+iKz/gofX8NW5GiiPxrBXjB1X9rLLvQQAVKA
	EsliuKWRNfCzo/KJW4bQdO28wG4f0yX2m44v5WhWt0IxB95sXkmfeTYtKwUxAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 10:12:16 +0200
Message-Id: <DLD6Q706IGI1.1216VVUDNXW29@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: upgrade 20260810 ->
 20260910
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <vpuar@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911112650.1374309-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20260911112650.1374309-1-vpuar@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245695

On Fri Sep 11, 2026 at 1:26 PM CEST, Vivek Puar via lists.openembedded.org =
wrote:
> Upgrade the firmware package to latest release. Add firmware
> for tas2573 stereo, add Bluetooth firmware for WCN7850, add CS42L45
> SDCA codec firmware for Samsung laptops. Add audio, compute and qupv3
> firmware for Qualcomm Nord Platform, add compute firmware for Qualcomm
> Eliza Platform. Add ADSP firmware for Radxa Dragon Q8B and add GPU
> firmware for SHIFT6mq. Add 'primer' files to cirrus CS42L45 as they
> are common to all SKUs.
>
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi,

Thanks for the new version, but it looks like QA is failing:

ERROR: linux-firmware-1_20260910-r0 do_package: QA Issue: linux-firmware: F=
iles/directories were installed but not shipped in any package:
  /lib/firmware/qcom/sdm845/SHIFT
  /lib/firmware/qcom/sdm845/SHIFT/axolotl
  /lib/firmware/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4655

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805FCE63F3D
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:41:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15795.1771231292231240780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Dn0r/0/N;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4FE81A0FAB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:41:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A18E1606CF;
	Mon, 16 Feb 2026 08:41:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAB6810369070;
	Mon, 16 Feb 2026 09:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771231289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oiPYSW2l3r0fkcTpcFhwJ+5pzjVnrfRSV2AxKIjQts4=;
	b=Dn0r/0/NKJKFYqwhcwmC5YHleTdCTyxqHTG5kAkQtQPTagg7LVZR0sPae+KFlaz8Yi+982
	T9kty6IrNqxTasDCg3zAXoYAB3QSBGcILLXuLwfWZUdd6OKcGBjE0sPiYgGSdmUN9Vhd6m
	/ls93S4aInmu5STHDBEQUHmJPhzA74mV3cK+GCep5er9gu5W25UsPi3ziEqCtPovl1vC9x
	/sRKB5AuO+KHQBIax1sq+rlZ57taBNP2rgnUtv0dReaJU/pJMll6nwlikNRBxa8VWecW1R
	zS4GU0EtLmJBbZBm0RBWPX8finkVX4GpUI8IRwug3DJz6+fNJuryqHlrG+NO8w==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: JPEWhacker@gmail.com, kamel.bouhara@bootlin.com,
 jeremie.dautheribes@bootlin.com, thomas.petazzoni@bootlin.com,
 antonin.godard@bootlin.com, pascal.eberhard@se.com
Subject: Re: [PATCH] meta: fix generation of kernel CONFIG_ in SPDX3
Date: Mon, 16 Feb 2026 09:41:26 +0100
Message-ID: <5078124.31r3eYUQgx@brobin-bootlin>
In-Reply-To: <DGG6OYYX5OU2.2B78BO0SIP4WM@bootlin.com>
References: 
 <20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com>
 <DGG6OYYX5OU2.2B78BO0SIP4WM@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231184

Hello Mathieu,

On Monday, February 16, 2026 at 7:48=E2=80=AFAM, Mathieu Dubois-Briand wrot=
e:
> Hi Benjamin,
>=20
> Thanks for your patch.
>=20
> It looks like this is breaking
>=20
> 2026-02-15 20:21:08,055 - oe-selftest - INFO -
> spdx.SPDX30Check.test_kernel_config_spdx (subunit.RemotedTestCase)
> 2026-02-15 20:21:08,055 - oe-selftest - INFO -  ... FAIL

>=20
> Can you have a look at what is the issue?

Yes, I just forgot to update the test in this patch... Sorry about that.
I am preparing a v2.

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4021CC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 07:11:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9324.1789542673867409261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 00:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AZrmD/Pi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C6164E4064C;
	Wed, 16 Sep 2026 07:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3BF960337;
	Wed, 16 Sep 2026 07:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7CFB11C7AFD8;
	Wed, 16 Sep 2026 09:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789542671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DDlzLk51PIFB2yWn0EIG3JVgFpmsB4ZmifLE8n5jO7o=;
	b=AZrmD/PifQd4qwiRwT6LYeBlH2Lcb9F2AwsDUKTLAfZIzV469wuTQ1WEFi7+BlxnOe2dX3
	1Wi7Tcf9s650Fp8nlw5igkC2NcOCg1WN4zs7TXtwygCVTAP8+hPf5y6m3WVR2y2p99xT8H
	vrGVmxgN4R3g/Fr17I2DVYxIcTFvWzXDfTp/y031RVMh57dLOGktRI4634AZh63eblI38u
	LRehVuggUpwQDL25L/CJZeS+GS08T3aEDXQEytoMDqgqXJ73XJHNnUkxV29+hA3MxdKMHo
	QklyLJr7JjdRzir1IX5et4m/7DRdn9jjNg9V3FI0/y0yttQuSdhS0uGR/EMX1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 09:11:08 +0200
Message-Id: <DLGJXKMXWUBQ.ANERMDF75DG@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alhe@linux.microsoft.com>, <SunilKumar.Dora@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
Cc: <richard.purdie@linuxfoundation.org>, <sundeep.kokkonda@windriver.com>,
 <Randy.Macleod@windriver.com>, <alejandro@enedino.org>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
 <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
In-Reply-To: <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245931

Hi,

On Tue Sep 15, 2026 at 5:53 PM CEST, Alejandro Hernandez Samaniego via list=
s.openembedded.org wrote:
> Hopefully these fix reproducibility issue when built from different hosts=
.
>
> Unfortunately these go in a bit of a different way than my next version, =
so I
> will wait for the result before sending to avoid confusion, but I'm fine =
with these
> if they work, lets just add my sign off to the actual patches based off o=
f mine
> instead of the "Patch from Alejandro + OE link".

Sunil, can you please send a v2 with Alejandro's sign-offs, as he requested=
?

Thanks
Antonin


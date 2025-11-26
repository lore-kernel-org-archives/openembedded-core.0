Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8639D1118A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 17:32:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19178.1764178366334466057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 09:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wiTU9xG/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BD075C16A09
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 17:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8525860721;
	Wed, 26 Nov 2025 17:32:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0804B102F1D8D;
	Wed, 26 Nov 2025 18:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178363; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GVSQICJviJWVOIlowR+CjbE/IG0oTMlb4CgCtTGj44Q=;
	b=wiTU9xG/0Jf8hIWJvIZOgbQQfvvAl4qU+2l5xqX6dFmA2Il610XDsjl7DzLmHT4dafZ2zC
	M1vboDEiUO//J8o8gv+aZiHuyp5+En+8oJEhtzvA7Hiivifa3t33QwUUDCp4eSYZ1KDWyM
	hSr1zCD/gru4qpzHVkzeItcQGSc93qs3QZcpKCJCmVDkxvq9LiH1QYKM4G9nOjwfivpgAt
	V94zvDt1KS3xucR96Tfqut0AVPi1DbAgVdBTGLlzjhOuMySrj397ldv93yhrhzYZJJnTed
	VP3ElxACInZymWKJ6VXO2AZ85SL2CCGHDNgvd/C+jSAS5mKEjzsZXOEZIjc38w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 18:32:41 +0100
Message-Id: <DEIT1AQE9UED.25L2WY7E8RYCY@bootlin.com>
Subject: Re: [OE-core][PATCH v3 2/2] ovmf: fix build error with Nasm 3.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251126034801.1997488-1-ankur.tyagi85@gmail.com>
 <20251126034801.1997488-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20251126034801.1997488-2-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 17:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226808

On Wed Nov 26, 2025 at 4:48 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for your patch.

We do have the usual new line issue with ovmf patches: they tend to be
messed up while sending patches by mail. Do you have the possibility to
push a branch somewhere with your patches, so I can pick them directly?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



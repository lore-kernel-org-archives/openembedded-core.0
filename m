Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7775ACA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 13:45:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12450.1790948736835446305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 06:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i89GpV94;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FDEC1A10C3;
	Fri,  2 Oct 2026 13:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52D16603DC;
	Fri,  2 Oct 2026 13:45:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA20E1032820F;
	Fri,  2 Oct 2026 15:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790948729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YSGC/HOiOvbfj+OTERPM3XPxlAfH9/SmjG/4tCJZ3TM=;
	b=i89GpV94WWECW7AhPVOK5MUhv94hbWt5jC+GDGryXwlwk6EPYkNCpdedmHk4tNZkImI71J
	adLMLrCGN5dMqeAe5jw3/uKhR4GhXPKKsFsuCkO4GxiTNq/2vXN1RVQRseeeKXSm/MDGeQ
	baqvm5lCDZsB7jxrnbKNTPnQVCdLE44zjVn85sWX02ZQeCLV8ZjQnLJ4EONwnJssYeFROo
	FOPWeoXAJ+2n3K6bDklxvF6dPfM68nnw4v0qwRXdfqM/jPBH/h8H0329HezKLQLW1Jhktq
	HcPZ56tTN9sdbqXyPCvx27nNXIljtaJgmDUmhMsp1n2nLpDFQWn78KtGYGQKFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 15:45:26 +0200
Message-Id: <DLUEC6Z600N1.2V4ABN2U2KRVS@bootlin.com>
Subject: Re: [OE-core] [PATCH] maintainers.inc: Update maintainer for bash
 and libxml2
Cc: "pbarker.dev@lists.openembedded.org"
 <pbarker.dev@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Josiah.Metz@windriver.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <18D7C34ABB5D4136.1120428@lists.openembedded.org>
 <e9fe138e-ac11-4f1e-a637-4afa5f81b841@windriver.com>
In-Reply-To: <e9fe138e-ac11-4f1e-a637-4afa5f81b841@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 13:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247122

On Fri Oct 2, 2026 at 1:43 PM CEST, Josiah via lists.openembedded.org Metz =
wrote:
> +Paul
>
> Gentle ping on this maintainer change. Let me know if I should provide=20
> more info.
>
> Thanks,
> Josiah
>

Hi Josiah,

It looks like this was already merged:

https://git.openembedded.org/openembedded-core/commit/?id=3D1e01f813ac57877=
7459a10a3c0c9d22ecf09e9bd

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



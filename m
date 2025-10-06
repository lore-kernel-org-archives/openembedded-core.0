Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DE7CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:09:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.28534.1759738152885150407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 01:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Nb6twOmQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B5B61A1158;
	Mon,  6 Oct 2025 08:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46B8E606B7;
	Mon,  6 Oct 2025 08:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8E60102F1CA4;
	Mon,  6 Oct 2025 10:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BMKr0dKlfdzq6WqcUolT3o92qtmWhrwHW5NyLRuda1w=;
	b=Nb6twOmQRuV0vPRe3oXmP9FaPVEMJXTxE2UA/TTOw/eQEAHkl+7EPRpla1Y6a0fBvge1FH
	D+kmKCKJ7EciwzrsedE9NVuYBMlxeL0INCDCvaL6VE2Ppx9ydbXMxMf/xnVvL3dWq/NMWm
	LtJfmsJgzoRrkAwuTpu+MrcznOMeJlcOlNO8qiaFfMgUMSOX7fDoi4NamKuQsxkiezglVb
	ZC0JKTkX7ERa0uHlUnoaGZETdPZstVDrJfoEOiEv7lqEFxAUy3XJvrrYMb8sriyEhJAYCo
	KqxnXERdfn+0tin9mLvJiK+94asBI6od0KW+B101KQVaJ+GGJ2k5hLmfWQtirQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 10:09:00 +0200
Message-Id: <DDB33XIHXWRI.20CEW2ICDI1GC@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>
Subject: Re: [OE-core] [PATCH v5 1/2] wic: add --extra-partition-space
 option to set unused space
Cc: <openembedded-core@lists.openembedded.org>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
 <DD8SAYMI039W.2BNRYZDREQTNO@bootlin.com>
 <DD8SELHX4UAB.MPYI46KKMURF@bootlin.com>
 <CAMSfU+7H8SKAo3U2H5YOfNCx089xAP+L+NqYFriCbHpyGD0ajQ@mail.gmail.com>
 <CAHT-cZvgX7D37PHEvt+S3zAwwX35AOSD9UgUy0AP_V7kvYD1Vw@mail.gmail.com>
In-Reply-To: <CAHT-cZvgX7D37PHEvt+S3zAwwX35AOSD9UgUy0AP_V7kvYD1Vw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224465

On Mon Oct 6, 2025 at 9:18 AM CEST, Pierre-loup GOSSE via lists.openembedde=
d.org wrote:
> Hi Mathieu,
>
> Sorry for the inconvenience, I=E2=80=99ll pay more attention next time. T=
hanks
> Yoann for the quick fix.
>
> Pierre-Loup,
>
> On Fri, Oct 3, 2025 at 11:22=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>

Hi Pierre-Loup,

No problem, these errors are not so easy to catch, as they depend on
what is installed on the host. That's also why it took a bit of time
before it was seen on the autobuilder.

I confirm the fix from Yoann seems to fix it.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



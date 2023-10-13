Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC0CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:07:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.50161.1697231251812558146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QENscVbv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50D3520002;
	Fri, 13 Oct 2023 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697231249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlIoOb2y1ZvJuQFJr5WSO+MWAomO8JV97CFtufgUKRs=;
	b=QENscVbvTonNAoXPSwBpYKvYn8nuQvXz5ct3ZFNdJ0U2NRtdp7fEzcwb1o6keS45eVgxsE
	xCg3mol59AeeVZO46Z96msUDrb63Ub4piZg2KzOttez2sESngJB5BVTxFSdhe1nIrHDsdL
	LyLXhL6Q1ci5DFEUvKfJR6nNzwzT+U4L7HUkbXfy7TpuqYCWnpAgXOvJyZc4fj/ZlYLd8B
	Foq14f12ZaFFGOwGn4WrbAmkKsyg3S1D9mfeG5QyDTzPIahL6GYMGbK63uvmroeQSFrR89
	BNV2uXhg2TWUUxugNiypA/3R0SeLfaHtsJtcXtVlI1K/o0ThZ0uxEHRvELYNng==
Date: Fri, 13 Oct 2023 23:07:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "=?UTF-8?Q?J=C3=B6rg?= Sommer via lists.openembedded.org"
 <joerg.sommer=navimatix.de@lists.openembedded.org>
Cc: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Message-ID: <20231013230724.17bd6301@booty>
In-Reply-To: <8cdb84d612c601fcca552024d58358ad80128faa.1697128475.git.joerg.sommer@navimatix.de>
References: <8cdb84d612c601fcca552024d58358ad80128faa.1697128475.git.joerg.sommer@navimatix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189076

Hello J=C3=B6rg,

On Thu, 12 Oct 2023 18:34:35 +0200
J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> If the ipv6 feature for the distribution is not set, the package should n=
ot
> contain settings for ipv6. This makes rpcbind doesn't try to bind to a IP=
v6
> socket, and complain that this fails.
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

...

> @@ -20,6 +21,11 @@ inherit autotools pkgconfig
> =20
>  EXTRA_OECONF =3D "--disable-gssapi"

Your patch does not apply due to a recent commit which modified this
context line. Can you please rebase on current master and send v4?

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


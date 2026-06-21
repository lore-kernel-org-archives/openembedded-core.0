Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6E1CD98F2
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 10:36:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21882.1782038182057521679
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 03:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z7+fSiPV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97044C6344C
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 10:36:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB645601BB;
	Sun, 21 Jun 2026 10:36:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B70E106C8173;
	Sun, 21 Jun 2026 12:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782038179; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z9K0YdcMy0X06JxYqSAeKNZ5IXx98spttshDeJc4KgI=;
	b=z7+fSiPVDkaeqWakeXh9SVIvf0DVkTFg8zGwm/B3tZPDuxYRRwfvQLSZJ1t0a5B9fvnxVM
	+lfZu1YXzVWldYXs4EN5+D1duQ2mGewuG3k0DIuQN9J/2zzdKI6CekaKzlyFpdNHUmgCsV
	4YSVi72TM8/paaEueNUaOytclZKhOaYcJ6x+nz9Q2EnaDxGSKeVfkDOILHpABeNM/l9K3k
	b2lx8OFsps3G8I8xq5NQtKKt6elpmXgPJlqaPPiAB8/wt8N3sor0ZAlNSru8KlqvG+7xr1
	vmNLZptG2o8ZMeAHhBIBiU+34bq2I9kReollysCB/esQ+McI6/TJIBXkmd4cOA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Joao Costa <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [scarthgap] SPDX3, lz4 and avahi: Patches status
Date: Sun, 21 Jun 2026 12:36:17 +0200
Message-ID: <zK8JX8rORNaU3GkqPYS24w@bootlin.com>
In-Reply-To: <DJD5ZEXDH14I.2NULXG8ZSG3H5@smile.fr>
References: 
 <Mj30OkfVRxGpGbLR46KjAA@bootlin.com> <hcX_7KWCTw2Sqh-NXl1vRw@bootlin.com>
 <DJD5ZEXDH14I.2NULXG8ZSG3H5@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 10:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239260

Hello,

On Friday, June 19, 2026 at 6:25=E2=80=AFPM, Yoann Congal wrote:
> On Sun Jun 14, 2026 at 12:37 PM CEST, Benjamin Robin wrote:
> > Hello Yoann,
> >
> > On Monday, May 18, 2026 at 2:26=E2=80=AFPM, Yoann Congal wrote:
> >> On Fri May 8, 2026 at 2:57 PM CEST, Benjamin Robin wrote:
> >> > Hello Yoann,
> >> >
> >> > Today I checked the status on patchwork of all the patches that I se=
nt.
> >> > I noticed that 3 patches, which I forgot to monitor, are currently s=
tuck in
> >> > the following state: Awaiting Upstream.
> >> >
> >> > Do you have any information about it?
> >>=20
> >> Hello,
> >>=20
> >> When I received them, I couldn't use these patches because they where
> >> missing for whinlatter (This is why I use the "Awaiting Upstream" stat=
us
> >> for).
> >>=20
> >> I must admit that I have lost track of those since then, but following
> >> this mail I've added them to my branch under review. You can expect th=
em
> >> in the next patch review series.
> >
> > I noticed that these fixes still hadn't been merged.
> > Did I miss something?
>=20
> Hello,
>=20
> Those patch should be merged now:
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D99706716626324605c049a9130f705f2090a9f91
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D22e8bc2bcfe762c83c00b73a33384e63548e82c0
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D128af716be75ec76203f1d34a8448741e6573d9e
> The last 2 were merged this week.

Thanks :)


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





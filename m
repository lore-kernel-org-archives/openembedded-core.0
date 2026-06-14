Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F973CD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 10:37:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.106658.1781433436342514877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 03:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hRAGP5tN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A1FEDC2BB23
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 10:37:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02A4360014;
	Sun, 14 Jun 2026 10:37:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C185106C8EB3;
	Sun, 14 Jun 2026 12:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781433433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j1MNAt0RtjXgYaOSPoP2CBwEx43Ci3sqdWcSR1MRAB8=;
	b=hRAGP5tNz8MXPjDHcmQicUlXIeQ8vnkP6BRtMuOYRMDoBoJAx5bqRD6zmMezeWMVKTQmlR
	Z1+9ir+pzqf7cyVPH4A69hZudPRrQHl3uiK/bGBXD2dzl4wGaivMJPAWcOnabydWQMBqhM
	cKMuwtrT07xt6MiKwk9iQuqQ8qiY9mxUGPrczd0MSj/yeT2P6ea81zPPp8wQOgUA7DHRbS
	Sum1zn4MZ92mL3QqBiHO9L4fIYjKPLrEnJbpZxXZ/AcqzGLPA09DDRMPb9Rbo33aXJ3tlV
	1Mzd/o8+zBtLU/DbmstRenkzM58zTh3qiFWLEgdS6CexVRNk9SrtKsdmh2T8uA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Joao Costa <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [scarthgap] SPDX3, lz4 and avahi: Patches status
Date: Sun, 14 Jun 2026 12:37:11 +0200
Message-ID: <hcX_7KWCTw2Sqh-NXl1vRw@bootlin.com>
In-Reply-To: <DILSUWH1SPZX.1OX8ZCTTGJJ7X@smile.fr>
References: 
 <Mj30OkfVRxGpGbLR46KjAA@bootlin.com> <DILSUWH1SPZX.1OX8ZCTTGJJ7X@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 10:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238797

Hello Yoann,

On Monday, May 18, 2026 at 2:26=E2=80=AFPM, Yoann Congal wrote:
> On Fri May 8, 2026 at 2:57 PM CEST, Benjamin Robin wrote:
> > Hello Yoann,
> >
> > Today I checked the status on patchwork of all the patches that I sent.
> > I noticed that 3 patches, which I forgot to monitor, are currently stuc=
k in
> > the following state: Awaiting Upstream.
> >
> > Do you have any information about it?
>=20
> Hello,
>=20
> When I received them, I couldn't use these patches because they where
> missing for whinlatter (This is why I use the "Awaiting Upstream" status
> for).
>=20
> I must admit that I have lost track of those since then, but following
> this mail I've added them to my branch under review. You can expect them
> in the next patch review series.

I noticed that these fixes still hadn't been merged.
Did I miss something?

> > meta: fix generation of kernel CONFIG_ in SPDX3
> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-ba=
ckport-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com/
> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-3-2=
dc803f921a9@bootlin.com/

This patch is only in Wrynose since the following commit was never backport=
ed
to others Yocto branches:
"kernel.bbclass: Add task to export kernel configuration to SPDX".

So this patch cannot be backported to whinlatter.

> > lz4: Remove a reference to the rejected CVE-2025-62813
> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-ba=
ckport-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com/
> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-2-2=
dc803f921a9@bootlin.com/

This patch is in whinlatter: 958ec6a496b4652a774e7bef58c052ebe40c704a

> > avahi: Remove a reference to the rejected CVE-2021-36217
> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-ba=
ckport-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com/
> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-1-2=
dc803f921a9@bootlin.com/

This patch is in whinlatter: d6d36ee66aa69440e83f037863a4e747bf9693d1


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





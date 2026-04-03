Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B25FE7E343
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:34:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7311.1775205234546011140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q7ZCREgG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A20341A311B;
	Fri,  3 Apr 2026 08:33:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 726FC603C1;
	Fri,  3 Apr 2026 08:33:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 494251045141A;
	Fri,  3 Apr 2026 10:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775205231; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U9sMJrwjduIj3hc2a73MVXwb0+izhYXqqx0GfiNSrw8=;
	b=Q7ZCREgGsNiMVaLLo98TZk4CKtSoWX+gsTqiNL/q8hFuAF4PYAnKXNZGUMxzMRkI4FTqHT
	6Vr1Rs4yHbDvjRHUF8bvm8sa3eu7hkzi4zoEizozb4pxErCYLjUd5ySJjUtC0JqBOZ79HL
	2z4afw8VqXDhr/imaNjRO01L4JJJ6NeV2aWoDrFYa2vig5RozdniD2eFidaZFVCJzsdxf3
	fFSC01nngXyleodpUSH7WM3eyBUloBbuh9/by5TxsndQCw5a0HUsHtFMP+1pgc5y/HoZ7Z
	OyZyfNlsyYTmhwLaOnJ7Y9lTw+A+DlXhsO1LILhlhuEjVpDYcs4vyU0y1vBaDA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org,
 Antonin Godard <antonin.godard@bootlin.com>
Subject: 
 Re: [OE-core] [RFC PATCH 1/3] sbom-cve-check: refactor do_sbom_cve_check
Date: Fri, 03 Apr 2026 10:33:50 +0200
Message-ID: <2314615.72vocr9iq0@brobin-bootlin>
In-Reply-To: <DHJDKO2Y1ZO9.10477FJ3PZOPQ@bootlin.com>
References: 
 <20260402162510.1945892-1-ross.burton@arm.com>
 <DHJDKO2Y1ZO9.10477FJ3PZOPQ@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234566

On Friday, April 3, 2026 at 10:26=E2=80=AFAM, Antonin Godard wrote:
> Hi,
>=20
> On Thu Apr 2, 2026 at 6:25 PM CEST, Ross Burton via lists.openembedded.or=
g wrote:
> [...]
> > +
> > +
> > +python do_sbom_cve_check() {
>=20
> I'd suggest renaming it to do_sbom_cve_check_image so you'll have
> do_sbom_cve_check_image and do_sbom_cve_check_recipe in the third patch a=
nd
> there's less confusion?
>=20
> Antonin
>=20

I fully agree with this proposal.
And we should do this change as soon as possible, since we are renaming
a "public" interface.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





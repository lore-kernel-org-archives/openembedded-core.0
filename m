Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6C9EEF31C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:29:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39735.1772699369306002195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Tweu7SbS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 325361A2CBF;
	Thu,  5 Mar 2026 08:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 075D35FDEB;
	Thu,  5 Mar 2026 08:29:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A40E610369535;
	Thu,  5 Mar 2026 09:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772699366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0zaxHX0rDKsoUKfLjrZc3Sp+Hury9J80VAfNKqORbus=;
	b=Tweu7SbSgA6vvCSQMw3z14gjnjMZWq78movRDRXXZagXPIrWM3ro/xsjeDkf5OQv8UJaSx
	lay1oXLuuq/XtD1y2CNoa0WKJACZAR+uiNh6PgNebutY+/EmyrcpKbG3W/1Betmh5s6KCi
	fEFTO9OgdivuCSutHl3G0I5IyRd12JOPkygDPzlUejRE8F5c1kjUX8m2bSmUUQqjFk9RX5
	gO2zwuR7gETm/8VVnEEgumplmEOEDEy9Wr2VOE+5CspZf76s9laisTBQtl8JmtmUc61+W+
	fLvejI/4YpTLmJ5K/9Jtq0k5GBeRNaq4ffeV1TtlL8c6wgFJMVlPw72quCd2Vg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org,
 JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, pascal.eberhard@se.com,
 Ross Burton <ross.burton@arm.com>,
 David =?UTF-8?B?TnlzdHLDtm0=?= <david.nystrom@est.tech>,
 kamel.bouhara@bootlin.com
Subject: 
 Re: [OE-core] [PATCH scarthgap 0/3] meta: Backport rejected CVEs and SPDX3
 fixes
Date: Thu, 05 Mar 2026 09:29:23 +0100
Message-ID: <8651428.T7Z3S40VBb@brobin-bootlin>
In-Reply-To: <DGU8KF6C5AC8.3PXRYKVMHQIBZ@smile.fr>
References: 
 <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
 <DGU8KF6C5AC8.3PXRYKVMHQIBZ@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232451

On Wednesday, March 4, 2026 at 8:14=E2=80=AFPM, Yoann Congal wrote:
> On Tue Mar 3, 2026 at 5:46 PM CET, Benjamin Robin via lists.openembedded.=
org wrote:
> > This series backports three patches from `master` to `Scarthgap`.
> >
> > Removed references to rejected CVEs:
> >  - Removed references to `CVE-2025-62813` and `CVE-2021-3502` in patch
> >    files, as these CVEs have been rejected.
> >  - This change prevents rejected CVE references from appearing in the
> >    generated SBOM.
> >
> > Fixed kernel `CONFIG_` generation in SPDX3:
> >  - Backported a fix for the generation of kernel `CONFIG_` values in
> >    SPDX3 output.
> >  - This is a important fix, as the generated SBOM file might otherwise
> >    randomly omit kernel `CONFIG_` values.
>=20
> Hello,
>=20
> Can you please send the equivalent series for whinlatter?

Hello Yoann,

I can send an "equivalent" series for whinlatter but only with the CVE
"fixes".
The generation of kernel `CONFIG_` values in SPDX3 output was not
backported in whinlatter: It is only in master and Scarthgap.

Let me know what I need to do in this case?

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





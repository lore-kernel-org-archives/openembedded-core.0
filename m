Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34097C88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:50:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18177.1789458640240674596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y/wb4/Oa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C07EFC5CD4E;
	Tue, 15 Sep 2026 07:51:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B45060498;
	Tue, 15 Sep 2026 07:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EC2D11C7AFC3;
	Tue, 15 Sep 2026 09:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789458637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yodg4aNiOmRrK73n3YGuBOqd4XbYfVXRuIjZCGNrEJk=;
	b=y/wb4/OaNRhDCInMb8leDqTgFIzJQWts88JLmT/+Q4O3MJpkKHKk0hIJj2l0Rkj0TT747h
	53WUe9M8qOkuPFJPa64jBDSf/onpiLSZ22BrMgXzazPUWfpgOLpJ927YA7h2xFNCcUNgV2
	V37zmd0KnI1m+8jdCJcEAQk4ae6MOYg/XAcQ44bloVMVLx7aE12wARR0BKZXQ6GTVmMAew
	jPrqDGV6h3czv+2ADqcHNRPHAIj1bB7FS4cxtxx22cMb2Oj7YVbkFshVx21aWumGdJKo97
	d0/xFkmPwjSr8jiyjZAoKJ1dJrkk5rHmxly05Uhe5oIBxjilLSqxXGCu3/DaNQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: ross.burton@arm.com, Peter.Marko@siemens.com,
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [OE-core] [PATCH] python3-sbom-cve-check: update to version 1.3.5
Date: Tue, 15 Sep 2026 09:50:35 +0200
Message-ID: <NiwxLlkfT2KtnDpvdCslFQ@bootlin.com>
In-Reply-To: <DLF8PKQZWT9D.QFDCJVVGNT03@smile.fr>
References: 
 <20260914-sbom-cve-check-update-1-3-5-v1-1-5d2d69902368@bootlin.com>
 <DLF8PKQZWT9D.QFDCJVVGNT03@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245823

On Monday, September 14, 2026 at 8:10=E2=80=AFPM, Yoann Congal wrote:
> On Mon Sep 14, 2026 at 6:49 PM CEST, Benjamin Robin via lists.openembedde=
d.org wrote:
> > For details on this new release, see:
> > https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5
> >
> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boot=
lin.com>
> > ---
> >  ...{python3-sbom-cve-check_1.3.4.bb =3D> python3-sbom-cve-check_1.3.5.=
bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Hello,
>=20
> Should I plan to upgrade to 1.3.5 on wrynose as well?

Hello Yoann,

Yes you should. Thank you.
I was waiting for the Peter series to be merged.

>=20
> For reference, the changelog is:
> | ## v1.3.5
> |=20
> | ### Added or Changed
> |=20
> | - Reduced peak memory usage while building database indexes.
> | - Cached compiled-source path validation results to avoid repeated vali=
dation
> |   and duplicate warnings about missing important files in Linux kernel =
builds.
> | - Added the `--rich-logging` command line option.
> |=20
> | ### Fixed
> |=20
> | - Prevented redundant database updates when multiple `sbom-cve-check`
> |   processes initialize the same database concurrently. Database initial=
ization
> |   and indexing are now serialized across processes, allowing waiting pr=
ocesses
> |   to continue once initialization is complete, thereby substantially im=
proving
> |   the parallel execution of multiple `sbom-cve-check` instances when a =
database
> |   update is needed.
>=20
> Regards,
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





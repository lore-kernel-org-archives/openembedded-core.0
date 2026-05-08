Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0C6CD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 09:57:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10273.1778234244384857845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 02:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JVBKQyFH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B9E3C5DC6F
	for <openembedded-core@lists.openembedded.org>; Fri,  8 May 2026 09:58:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBF836072E;
	Fri,  8 May 2026 09:57:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D72E1081977E;
	Fri,  8 May 2026 11:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778234241; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hog/iRBQQk4yqxowHXi9Nu9SyPIUbGkXfy9lShdIkAM=;
	b=JVBKQyFHNKWJ3L3O9aUS9XI/MDTgTfClzsuMkUH9r871VyL8H6kY+/Vmjll1eMMyXeK9Mx
	uqOp6LGiSM+8KSRLrgS5sk+FroSA29EEm6WcS5Hmq55eUQ1a/DA3ELH6Is1wfKQ5KA5y36
	h0SLX9zRFjynqTSbKFd0qwXmiKgyjxpQ0ys14htelfsrJ2Snin6Mdg2OfgBFssS9wtq2Gx
	g61WwECKBihaErcO5po6QADJznR4Vf1QJyib5+xeUogbjeEVxRCUxHajDjh6Y/cLYZ1qYT
	n5Uf/rgliQfLxBgF7mjwUC6a+mZKEEJLWxmB/Zwx8tHpw4z4ZJJ7oikoemg2BA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Subject: 
 Re: [PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and update CVE
 databases
Date: Fri, 08 May 2026 11:57:20 +0200
Message-ID: <H3MMgCKgRSazwPvqyxH6DQ@bootlin.com>
In-Reply-To: 
 <AS1PR10MB56978E2A173EF807CBAADF31FD3C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
 <AS1PR10MB56978E2A173EF807CBAADF31FD3C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 09:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236701

Hello Peter,

On Thursday, May 7, 2026 at 6:57=E2=80=AFPM, Marko, Peter wrote:
> > Subject: [PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and update=
 CVE
> > databases
> >=20
> > This series updates:
> >  - sbom-cve-check to version 1.3.1 which mainly fix a potential dead lo=
ck.
>=20
> Thanks a lot for this update!
> I wouldn't say "potential" as our pipelines were getting stuck on sbom-cv=
e-check-recipe tasks daily.
>=20
> Peter

Really don't hesitate to send an email, or to contact me on IRC if you find
any issues with sbom-cve-check. Or you could also create an issue on GitHub.

Sorry about that bug... The bug has existed since the first release of
sbom-cve-check. In the past, I have tested to run multiple instances of
sbom-cve-check in parallel, but you really need to launch most of them at
the exact same time to trigger this issue.

> >  - sbom-cve-check-update-* recipes to the latest revision
> >=20
> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boot=
lin.com>
> > ---
> > Benjamin Robin (Schneider Electric) (3):
> >       python3-sbom-cve-check: Update to version 1.3.1
> >       sbom-cve-check-update-cvelist-native: Update source revision
> >       sbom-cve-check-update-nvd-native: Update source revision
> >=20
> >  ...ython3-sbom-cve-check_1.3.0.bb =3D> python3-sbom-cve-check_1.3.1.bb=
} | 4 ++--
> >  .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            =
| 4 ++--
> >  .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                =
| 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





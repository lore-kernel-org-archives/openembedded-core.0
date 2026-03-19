Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C6F107528B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:48:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7466.1773913709196966316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oqD0+b0m;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D5161A2EE3;
	Thu, 19 Mar 2026 09:48:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CFD815FDEB;
	Thu, 19 Mar 2026 09:48:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A22410450994;
	Thu, 19 Mar 2026 10:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773913705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Td6HDkHVvfRCK+W/HttAzPiVHlHB1rthA+D9yHCoNMU=;
	b=oqD0+b0mUC3aKqHGcvZPT/JPTcd8yf/19WlYa1c3hkeFGHYo6VOeiTXAP2g4MfTP6SQnRa
	fDsGpyUO0dm637aY3bAPlOkP7btDFxMXMq6wM+o5KM8TuoQq1tGkG3ivwsFzlz7x6FK2b3
	CtyHBaVGL/OO8lMr/yteRot0ymF9S3MlZk6fhyNBYnzpssDtCihSd/q6ARmLu7G8bJBvww
	BkttqVgVwl+TpHOPWkhvFSZQjSrQUIFDgi9DxXnNtsIqri+iT3jJF36M0UldHwlXH4V90a
	srOb9JcQWlv9IiEquxf+s5+PW1G39CHakywEKn+8tJ1G7Q18TmCTryWSGVH/sw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com,
 peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com,
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Thu, 19 Mar 2026 10:48:21 +0100
Message-ID: <2750263.Lt9SDvczpP@brobin-bootlin>
In-Reply-To: 
 <CAApg2=SHFU13o9EwuAe+NepU1CqEy2zO-xnBYoSmn2YaktXfxQ@mail.gmail.com>
References: 
 <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <8711656.T7Z3S40VBb@brobin-bootlin>
 <CAApg2=SHFU13o9EwuAe+NepU1CqEy2zO-xnBYoSmn2YaktXfxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233473

Hello Marta,

On Thursday, March 19, 2026 at 9:58=E2=80=AFAM, Marta Rybczynska wrote:
> On Thu, Mar 19, 2026 at 9:45=E2=80=AFAM Benjamin Robin via lists.openembe=
dded.org
> <benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:

> > I have just a slight implementation "detail" if we are using BitBake
> > fetcher. What is the license that we should use for the sources?
> > How to declare that in the recipes?
> >
> > Because the license of the repositories:
> >  - https://github.com/CVEProject/cvelistV5 : Their is none
> >  - https://github.com/fkie-cad/nvd-json-data-feeds/tree/main/LICENSES
> >    It looks like custom license.

> The CVE project repo does not have a licence included, but it is covered =
by
> https://www.cve.org/legal/termsofuse (the usage part). It is basically MI=
T.
>=20
> NVD has the specific,  licence, the one that is in the repo. A warning on
> the
> needed disclosure sentence in all documentation.

So for you, it is fine to declare that the CVE databases are MIT?

> > cve-update-db-native.bb is specifying MIT but this is kind of a lie.
> > I have done the same on my recipes for now...
> >
> > > The existing approach was only done as it was a sqlite database and we
> > > didn't have fetcher support for such a thing.
> >
> > The recipes used to download the CVE databases for the cve-check class
> > are downloading tarballs. Yes these recipes are going to create a sqlite
> > database from that. But these recipes implements there own fetcher to
> > simply download a tarball.
> > That is why I thought I could implement my own fetcher, which is way
> > simpler than the update_db_file() in cve-update-db-native.bb which is
> > quite complex.
> >
>=20
> They implement the fetcher to feed into sqlite. Which was an error to use,
> in my opinion.

Well, I understand why they did that. It makes a lot of sense. But it has
a lot of limitation, that is why we developed sbom-cve-check.


> AUTOREV isn't great here because it will re-fetch for each build. So if
> you're
> building multiple images or platforms (in CI or so), you will get
> potentially different
> results. cve-check has a set of variable to handle such use cases. You pin
> to one specific release and do the whole checking with one single common
> version.

Yes, that is why I initially pushed to use my custom fetcher that is
doing a git pull / shallow clone. With this fetcher I have a full control
on the update period.

But if we want to use BitBake fetcher, an user could pin to a specific
version instead of using AUTOREV. But the user needs to to that manually.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





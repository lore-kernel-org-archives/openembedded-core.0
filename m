Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF60CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:06:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.17531.1761217575050677663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=V7tr/j5B;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 90F3A4E4129A;
	Thu, 23 Oct 2025 11:06:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 587596062C;
	Thu, 23 Oct 2025 11:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3090102F1EE3;
	Thu, 23 Oct 2025 13:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761217572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7O00mQ4ShYtzlsoMF7rTSXnuS4uNeaBHtDPxfZYKmA8=;
	b=V7tr/j5BQavwXG9JV5PUo38vLqaG7iQsJ+d2twiQM6T9897KLXoWA8OchgGawIJIxP/Z4E
	BpAnRyRgy6+od72JOiJ5+L36tmsqQfL5T8tYf1ZukqofxOny4tWpFvPd1/YoUKvIEUMcsy
	xBoXvPW3p3Fjdqlrpnv+iWHuTDeNbPmRv3hk5ILQITkuV8L1QGiiMwual9VNbSp8F4cuhj
	u7kM16UEM7ltHh9s0E9S7ssHwMCCbQDTfxELit2Txh5cv0gfQV8pVtJ6fdHKReiTAe+kPB
	jGZ9iCQZBjDo7hRhuFm3jT11Bq7h4WW0mxd0KThrJk51YyUdmZKWKubzMJd5sQ==
Date: Thu, 23 Oct 2025 13:06:07 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: peter.marko@siemens.com
Cc: JPEWhacker@gmail.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Message-ID: <4xlc4uxrm6j2yqjgkeo2tdkmzrhvfuwpa6urojrhhnuk3hopon@mrbcen3lmdsw>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
 <AS1PR10MB5697986A426B5C628C2930F7FDF3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <cfzugo6hqsd2u4qnkoruql7hzg5zexrjnpyx3dex3zx3y7oxic@5yek6wcaxixx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cfzugo6hqsd2u4qnkoruql7hzg5zexrjnpyx3dex3zx3y7oxic@5yek6wcaxixx>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225234

On Thu, Oct 23, 2025 at 11:00:37AM +0200, Kamel Bouhara wrote:
> On Wed, Oct 22, 2025 at 12:43:22PM +0000, Peter Marko via lists.openemb=
edded.org wrote:
> > Hello,
> >
>
> Hello Peter,
>
> > I have tried this patch serias and I see ton of "missing or unknown C=
VE status" warnings.
> > Example for curl recipe:
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-11053 - miss=
ing or unknown CVE status
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-7264 - missi=
ng or unknown CVE status
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-8096 - missi=
ng or unknown CVE status
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2025-0167 - missi=
ng or unknown CVE status
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-6197 - missi=
ng or unknown CVE status
> > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-9681 - missi=
ng or unknown CVE status
> > Looks like it is generated for every CVE patch in every recipe built.
> >
> > What I did is cherry-picking this series and adding following to my d=
istro config and building my image:
> > INHERIT_DISTRO:remove =3D "create-spdx"
> > INHERIT_DISTRO:append =3D " create-spdx-3.0"
> > When trying with pure poky, I added following to local.conf:
> > INHERIT:remove =3D "create-spdx"
> > INHERIT:append =3D " create-spdx-3.0"
> >
>
> Thanks for testing and for the detailed feedback.
>
> I haven=E2=80=99t yet tested this backport series with a pure Poky setu=
p, so
> I=E2=80=99ll start there to reproduce the warnings you=E2=80=99re seein=
g.
> Once I confirm how the CVE decoding behaves in that environment,
> I=E2=80=99ll follow up with a fix or updated guidance.
>
> Thanks again for pointing this out.

Actually, I didn=E2=80=99t notice these warnings in my own tests on OE-Co=
re
Scarthgap, but they are there too.

They=E2=80=99re related to Marta=E2=80=99s cve-check changes (fb3f440b7d8=
), which added
richer CVE metadata and product/vendor matching through
decode_cve_status() and has_cve_product_match().

Since those updates aren=E2=80=99t fully backported in Scarthgap, some CV=
Es show
as unknown during SPDX generation.

@Joshua: would you suggest we suppress these warnings in Scarthgap, or
should we handle this case differently to better align with the upstream
behavior?

>
> Kamel
>
> > Inheriting cve-check did not help.
> > When building oe-core master, I don't experience such warnings.
> > So it looks like something is missing in this backport series.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Kamel Bouhara via
> > > lists.openembedded.org
> > > Sent: Monday, October 20, 2025 9:10
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: JPEWhacker@gmail.com; thomas.petazzoni@bootlin.com; Miquel Rayn=
al
> > > <miquel.raynal@bootlin.com>; mathieu.dubois-briand@bootlin.com;
> > > antonin.godard@bootlin.com; Pascal Eberhard <pascal.eberhard@se.com=
>;
> > > Kamel Bouhara <kamel.bouhara@bootlin.com>
> > > Subject: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support =
to Scarthgap
> > >
> > > Hello,
> > >
> > > This v2 series backports SPDX 3.0 support from the upstream Walnasc=
ar
> > > branch to Scarthgap (Yocto Project 5.0 LTS), including the correspo=
nding
> > > test suite and fixes for integration issues found during testing.
> > >
> > > The motivation remains the same as in v1, to bring complete SPDX 3.=
0
> > > support to the latest LTS release, ensuring that long-term supporte=
d
> > > builds benefit SBOM generation capabilities. Scarthgap is under
> > > maintenance until 2028, and SPDX 3.0 is now an essential part of
> > > compliance workflows.
> > >
> > > Kamel
> > >
> > > Hongxu Jia (1):
> > >   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> > >
> > > Joshua Watt (7):
> > >   classes-global/license: Move functions to library code
> > >   lib/license: Move package license skip to library
> > >   lib: oe: license: Add missing import
> > >   classes-recipe/image: Add image file manifest
> > >   selftest: spdx: Add SPDX 3.0 test cases
> > >   lib: oeqa: spdx: Add tests for extra options
> > >   spdx 3.0: Rework how SPDX aliases are linked
> > >
> > > Kamel Bouhara (Schneider Electric) (3):
> > >   backport: SPDX 3.0 fixes and tasks from upstream version Walnasca=
r
> > >   spdx30_tasks: fix FetchData attribute in add_download_files
> > >   spdx30_tasks: adapt CVE handling to new cve-check API
> > >
> > >  meta/classes-global/base.bbclass              |   41 +-
> > >  meta/classes-global/license.bbclass           |  165 -
> > >  .../create-spdx-image-3.0.bbclass             |   85 +
> > >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> > >  meta/classes-recipe/image.bbclass             |   58 +
> > >  meta/classes-recipe/license_image.bbclass     |   14 +-
> > >  meta/classes-recipe/nospdx.bbclass            |   13 +
> > >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> > >  meta/classes/spdx-common.bbclass              |   99 +
> > >  meta/lib/oe/__init__.py                       |    2 +-
> > >  meta/lib/oe/license.py                        |  203 +
> > >  meta/lib/oe/sbom30.py                         | 1096 ++++
> > >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++=
++++
> > >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> > >  meta/lib/oe/spdx_common.py                    |  244 +
> > >  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
> > >  16 files changed, 9262 insertions(+), 216 deletions(-)
> > >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbcla=
ss
> > >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> > >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> > >  create mode 100644 meta/classes/spdx-common.bbclass
> > >  create mode 100644 meta/lib/oe/sbom30.py
> > >  create mode 100644 meta/lib/oe/spdx30.py
> > >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> > >  create mode 100644 meta/lib/oe/spdx_common.py
> > >
> > > --
> > > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#225190): https://lists.openembedded.org/g/openemb=
edded-core/message/225190
> > Mute This Topic: https://lists.openembedded.org/mt/115849813/5236779
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [kamel.bouhara@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


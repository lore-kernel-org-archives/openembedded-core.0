Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128F0CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:00:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.15763.1761210040115807955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UWORB/OW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 20ACC4E4129D
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 09:00:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E245F6062C;
	Thu, 23 Oct 2025 09:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E976F102F2460;
	Thu, 23 Oct 2025 11:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761210036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ehWE5Tr6OyDj1SqTTaVhoDHD9oJQ9v0AFczThznCXOs=;
	b=UWORB/OWGjlxuTH6IBg2gwEiA3ZNpMoGvjzBHl8EPLCaoA1jH3q3d61J+9IpTOPrYRH3tz
	Ri+tbDWvUhDMnL/n0wJYp3w4/fCbUDRPxhwL59VOGh0FIoboZj1dqfWFZnR47MvhXSeqlj
	zyN6lC8YvCJKxBM9WgndX4dzA8R6huipw6NNfIBnc7EeJyeU4VldT7b2M4b2ARnITv8jd+
	TBAfyK1fBO6P5lQh6pUovOdlunqcn+rra1HvtNwxQGfBmuepAQC7lye7Ni1BCAZklHuguK
	rE1mAoOR8yZRW0JZKLBqJuwDp+6yoOcHUfrQ5egR35lLbmyM9F3ZWR1X/8ScJw==
Date: Thu, 23 Oct 2025 11:00:30 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Message-ID: <cfzugo6hqsd2u4qnkoruql7hzg5zexrjnpyx3dex3zx3y7oxic@5yek6wcaxixx>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
 <AS1PR10MB5697986A426B5C628C2930F7FDF3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS1PR10MB5697986A426B5C628C2930F7FDF3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 09:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225226

On Wed, Oct 22, 2025 at 12:43:22PM +0000, Peter Marko via lists.openembed=
ded.org wrote:
> Hello,
>

Hello Peter,

> I have tried this patch serias and I see ton of "missing or unknown CVE=
 status" warnings.
> Example for curl recipe:
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-11053 - missin=
g or unknown CVE status
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-7264 - missing=
 or unknown CVE status
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-8096 - missing=
 or unknown CVE status
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2025-0167 - missing=
 or unknown CVE status
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-6197 - missing=
 or unknown CVE status
> WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-9681 - missing=
 or unknown CVE status
> Looks like it is generated for every CVE patch in every recipe built.
>
> What I did is cherry-picking this series and adding following to my dis=
tro config and building my image:
> INHERIT_DISTRO:remove =3D "create-spdx"
> INHERIT_DISTRO:append =3D " create-spdx-3.0"
> When trying with pure poky, I added following to local.conf:
> INHERIT:remove =3D "create-spdx"
> INHERIT:append =3D " create-spdx-3.0"
>

Thanks for testing and for the detailed feedback.

I haven=E2=80=99t yet tested this backport series with a pure Poky setup,=
 so
I=E2=80=99ll start there to reproduce the warnings you=E2=80=99re seeing.
Once I confirm how the CVE decoding behaves in that environment,
I=E2=80=99ll follow up with a fix or updated guidance.

Thanks again for pointing this out.

Kamel

> Inheriting cve-check did not help.
> When building oe-core master, I don't experience such warnings.
> So it looks like something is missing in this backport series.
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Kamel Bouhara via
> > lists.openembedded.org
> > Sent: Monday, October 20, 2025 9:10
> > To: openembedded-core@lists.openembedded.org
> > Cc: JPEWhacker@gmail.com; thomas.petazzoni@bootlin.com; Miquel Raynal
> > <miquel.raynal@bootlin.com>; mathieu.dubois-briand@bootlin.com;
> > antonin.godard@bootlin.com; Pascal Eberhard <pascal.eberhard@se.com>;
> > Kamel Bouhara <kamel.bouhara@bootlin.com>
> > Subject: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to=
 Scarthgap
> >
> > Hello,
> >
> > This v2 series backports SPDX 3.0 support from the upstream Walnascar
> > branch to Scarthgap (Yocto Project 5.0 LTS), including the correspond=
ing
> > test suite and fixes for integration issues found during testing.
> >
> > The motivation remains the same as in v1, to bring complete SPDX 3.0
> > support to the latest LTS release, ensuring that long-term supported
> > builds benefit SBOM generation capabilities. Scarthgap is under
> > maintenance until 2028, and SPDX 3.0 is now an essential part of
> > compliance workflows.
> >
> > Kamel
> >
> > Hongxu Jia (1):
> >   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> >
> > Joshua Watt (7):
> >   classes-global/license: Move functions to library code
> >   lib/license: Move package license skip to library
> >   lib: oe: license: Add missing import
> >   classes-recipe/image: Add image file manifest
> >   selftest: spdx: Add SPDX 3.0 test cases
> >   lib: oeqa: spdx: Add tests for extra options
> >   spdx 3.0: Rework how SPDX aliases are linked
> >
> > Kamel Bouhara (Schneider Electric) (3):
> >   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
> >   spdx30_tasks: fix FetchData attribute in add_download_files
> >   spdx30_tasks: adapt CVE handling to new cve-check API
> >
> >  meta/classes-global/base.bbclass              |   41 +-
> >  meta/classes-global/license.bbclass           |  165 -
> >  .../create-spdx-image-3.0.bbclass             |   85 +
> >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> >  meta/classes-recipe/image.bbclass             |   58 +
> >  meta/classes-recipe/license_image.bbclass     |   14 +-
> >  meta/classes-recipe/nospdx.bbclass            |   13 +
> >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> >  meta/classes/spdx-common.bbclass              |   99 +
> >  meta/lib/oe/__init__.py                       |    2 +-
> >  meta/lib/oe/license.py                        |  203 +
> >  meta/lib/oe/sbom30.py                         | 1096 ++++
> >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++=
++
> >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> >  meta/lib/oe/spdx_common.py                    |  244 +
> >  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
> >  16 files changed, 9262 insertions(+), 216 deletions(-)
> >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
> >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> >  create mode 100644 meta/classes/spdx-common.bbclass
> >  create mode 100644 meta/lib/oe/sbom30.py
> >  create mode 100644 meta/lib/oe/spdx30.py
> >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> >  create mode 100644 meta/lib/oe/spdx_common.py
> >
> > --
> > 2.43.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225190): https://lists.openembedded.org/g/openembed=
ded-core/message/225190
> Mute This Topic: https://lists.openembedded.org/mt/115849813/5236779
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
kamel.bouhara@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


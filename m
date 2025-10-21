Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6A0CCD1AA
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 12:16:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.10160.1761048974765957669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 05:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=BDuL00x+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA8031A1586;
	Tue, 21 Oct 2025 12:16:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B131D60680;
	Tue, 21 Oct 2025 12:16:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60AF102F23E9;
	Tue, 21 Oct 2025 14:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761048972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vkw/cxi7ah52VqZYZqeXkfNkdDHp+eDGh6Gfg8bXevM=;
	b=BDuL00x+c9e7f3gIUOqau/HvzqMiR69O8rmvJMOATDY0RURDLOVZiHvEh1O5r2UowrNlMP
	RcIjAfBwyZ3Rsmh6/rF7XaXX5rWVioTn71yVS/SNmdGbSyjxWVpzDUb/mE8yIOtR5IAIse
	+u3MgwVKNvpzkzTJCcpQoxZgBRz1Cdm4FGh38yLIlgbRSWENpnO30M53uFtV7MK3cZ22XT
	//YQubKX+LV50ZYNxcO1mVn9EPrE4QPbYsInlYdG2B6QMtG50Zj/z8C8ElKksCjqGQHjLH
	mmuKpJFq/fDRRE3bOfOJPJDVvP5srSnpWYevbklABUT3l5mSsDv5mR/jtFNiOQ==
Date: Tue, 21 Oct 2025 14:16:06 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Message-ID: <kyonw7fq4s56zp6nmgkp6ydx6khmxglrkbyx2n3so2ffweby7b@negpkudab4lf>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
 <CAOSpxdYubmiWhhSS5U21jiUMUu-ubprkYDm7oKfcCgMszmqe4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOSpxdYubmiWhhSS5U21jiUMUu-ubprkYDm7oKfcCgMszmqe4w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 12:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225148

On Mon, Oct 20, 2025 at 01:02:41PM -0700, Steve Sakoman wrote:
> Testing this series on the autobuilder shows oeselftest failing with a
> number of spdx related issues.
>

Hi Steve,

> See:
>
> https://errors.yoctoproject.org/Errors/Details/885530/
>

Thanks for the report.

I=E2=80=99ve been able to reproduce the same issues locally.

I forgot to run `oe-selftest` before sending v2 of the series.

I=E2=80=99m preparing an update to fix these and will send a v3 shortly.

Thanks again for catching this!
Kamel

> Thanks,
>
> Steve
>
> On Mon, Oct 20, 2025 at 12:10=E2=80=AFAM Kamel Bouhara via
> lists.openembedded.org
> <kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
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
> >
> >
> >
> >

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225132): https://lists.openembedded.org/g/openembed=
ded-core/message/225132
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


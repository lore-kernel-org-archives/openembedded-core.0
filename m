Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926F1CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 12:36:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4526.1762605409675826457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 04:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2Ksk6vow;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 924054E415C3;
	Sat,  8 Nov 2025 12:36:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6133A60710;
	Sat,  8 Nov 2025 12:36:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8464611852EFF;
	Sat,  8 Nov 2025 13:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762605406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YKiYoYEhVkZ0z0U+uxMjGPLowxq0rA8NG+LpbMgG2zE=;
	b=2Ksk6vow1B3k4LLD1odCGX9rHHqayZckHLhA6dLL1m819l8lH74V+NbyZzsWlxYyJjBvsi
	L66QsF0uls0IozRUKSg8b8ziOmiRe2DJvssbSYegmG+zQUHzX/71RsKL/0DbEINljlCC6k
	poaCZ+DsuimtHv2bELDRjbJdD6kiaxgnejId5gYEfh5Oxgpf6OnyRLimVA5MwAHtLanGxa
	qVGfjY1oe0JnVNHOiPl0fmTI5y49sXPWOD5SmcL5px8yVeTrPsP/7J5YDhIAtBtSUiH7Ty
	efJoqRvfeyFXRQnNjS1Z0AjhBvJUDMQhSl7JiaUh4X59UyljzE/uhlFZXem54A==
Date: Sat, 8 Nov 2025 13:36:42 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [OE-core] [scarthgap v4 00/17] backport: SPDX 3.0 support to
 Scarthgap
Message-ID: <mxhfpdnossxourfkjnv3phfbhxarl7k3vjciic2d2bknmjk3ig@sfn3miher27i>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
 <CAOSpxdb+gEFgEHnqoUmvzyiXy7+C7DcTgK54EEgc-BsSzv5VJw@mail.gmail.com>
 <CAJdd5GYt08qYeQrBAWYx3_OT5LGCaDgc53p+2hvJSXQ76XwPYA@mail.gmail.com>
 <CAOSpxdb_zgoFN6qhCbA1Hy=_ueze+A+3aBokjTAi4hj6OXQCQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOSpxdb_zgoFN6qhCbA1Hy=_ueze+A+3aBokjTAi4hj6OXQCQQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 12:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226078

On Fri, Nov 07, 2025 at 02:26:55PM -0800, Steve Sakoman wrote:
> On Fri, Nov 7, 2025 at 1:22=E2=80=AFPM Joshua Watt <jpewhacker@gmail.co=
m> wrote:
> >
> > On Fri, Nov 7, 2025 at 2:16=E2=80=AFPM Steve Sakoman <steve@sakoman.c=
om> wrote:
> > >
> > > Unfortunately I'm still getting autobuilder errors on the oeeselfte=
st
> > > runs, example below:
> > >
> > > https://errors.yoctoproject.org/Errors/Details/887588/
> >
> > Is this the correct link? I looked at it an the failure is in devtool=
 with:
> >
> > Unable to resolve 'mbedtls-2.28' in upstream git repository in git
> > ls-remote output for github.com/ARMmbed/mbedtls.git
> >
> > Which I don't _think_ should be related to the SPDX changes.....
> > perhaps an unrelated transient error?
>
> This is the right link, and you are correct, this does appear to be an
> unrelated transient issue!
>
> Sorry for the false alarm, this series was the only addition to a
> previously passing patch set so I jumped to a bad conclusion :-(
>

Thanks Steve, no worries, glad to hear it was just a transient issue!

Kamel

> Steve
>
> > > On Fri, Nov 7, 2025 at 5:15=E2=80=AFAM Kamel Bouhara via
> > > lists.openembedded.org
> > > <kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
> > > >
> > > > Hello,
> > > >
> > > > This is the v4 series to backport SPDX 3.0 support from upstream
> > > > Walnascar to Scarthgap (Yocto Project 5.0 LTS).
> > > >
> > > > Changes since v2:
> > > > -----------------
> > > > Cherry-picked commits:
> > > >
> > > >     c5b5136bf8: Exclude do_create_spdx from automatic sysroot ext=
ension.
> > > >
> > > >     03c6ace6c6: Fix SPDX_VERSION handling in selftests.
> > > >
> > > >     7be5a6e699: Add tar test for SPDX 2.2.
> > > >
> > > > Local fix:
> > > >
> > > >     7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass =
with
> > > >        ${SPDX_VERSION} layout, restoring successful SPDX 2.2 self=
tests.
> > > >
> > > > Changes since v3:
> > > > -----------------
> > > > Cherry-picked commits:
> > > >
> > > >      29d3f8ad4: classes/create-spdx-2.2: Handle empty packages
> > > >
> > > > Greetings,
> > > > Kamel
> > > >
> > > > Hongxu Jia (1):
> > > >   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> > > >
> > > > Joshua Watt (11):
> > > >   classes-global/license: Move functions to library code
> > > >   classes-global/staging: Exclude do_create_spdx from automatic s=
ysroot
> > > >     extension
> > > >   lib/license: Move package license skip to library
> > > >   lib: oe: license: Add missing import
> > > >   classes-recipe/image: Add image file manifest
> > > >   classes-recipe/baremetal-image: Add image file manifest
> > > >   selftest: spdx: Add SPDX 3.0 test cases
> > > >   lib: oeqa: spdx: Add tests for extra options
> > > >   spdx 3.0: Rework how SPDX aliases are linked
> > > >   oeqa: spdx: Add tar test for SPDX 2.2
> > > >   classes/create-spdx-2.2: Handle empty packages
> > > >
> > > > Kamel Bouhara (Schneider Electric) (4):
> > > >   backport: SPDX 3.0 fixes and tasks from upstream version Walnas=
car
> > > >   spdx30_tasks: fix FetchData attribute in add_download_files
> > > >   classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSIO=
N
> > > >     layout
> > > >   spdx30_tasks: adapt CVE handling to new cve-check API
> > > >
> > > > Richard Purdie (1):
> > > >   selftest/spdx: Fix for SPDX_VERSION addition
> > > >
> > > >  meta/classes-global/base.bbclass              |   41 +-
> > > >  meta/classes-global/license.bbclass           |  165 -
> > > >  meta/classes-global/staging.bbclass           |    9 +-
> > > >  meta/classes-recipe/baremetal-image.bbclass   |   32 +-
> > > >  .../create-spdx-image-3.0.bbclass             |   85 +
> > > >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> > > >  meta/classes-recipe/image.bbclass             |   58 +
> > > >  meta/classes-recipe/license_image.bbclass     |   14 +-
> > > >  meta/classes-recipe/nospdx.bbclass            |   13 +
> > > >  meta/classes/create-spdx-2.2.bbclass          |   85 +-
> > > >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> > > >  meta/classes/spdx-common.bbclass              |   99 +
> > > >  meta/lib/oe/__init__.py                       |    2 +-
> > > >  meta/lib/oe/license.py                        |  203 +
> > > >  meta/lib/oe/sbom30.py                         | 1096 ++++
> > > >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++=
++++++
> > > >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> > > >  meta/lib/oe/spdx_common.py                    |  244 +
> > > >  meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
> > > >  19 files changed, 9348 insertions(+), 264 deletions(-)
> > > >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbc=
lass
> > > >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbcla=
ss
> > > >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> > > >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> > > >  create mode 100644 meta/classes/spdx-common.bbclass
> > > >  create mode 100644 meta/lib/oe/sbom30.py
> > > >  create mode 100644 meta/lib/oe/spdx30.py
> > > >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> > > >  create mode 100644 meta/lib/oe/spdx_common.py
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > > >
> > > >

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226066): https://lists.openembedded.org/g/openembed=
ded-core/message/226066
> Mute This Topic: https://lists.openembedded.org/mt/116169967/5236779
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
kamel.bouhara@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


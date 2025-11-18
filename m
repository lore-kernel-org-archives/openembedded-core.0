Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974C8CED63B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:28:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11378.1763468902840685860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=D6boBlSR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 121C54E4175B
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:28:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4A7A606FE;
	Tue, 18 Nov 2025 12:28:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E1C110371CEA;
	Tue, 18 Nov 2025 13:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763468900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sOMkT55E3DAmHvB9v7SgGPaCOG8outjBooeKvGJl1PE=;
	b=D6boBlSRzXHZARWswZrfcf4lo0A17To0JsQHfbDjjv88Tc/G8NjyVa52rhvNgJAZdXbZt6
	bceDxhsKUBHiaVFL26ERhpQ+Px2G/bNvxnJackIpYm5CQ+Vvgr223ptQ4+SPiQmphF9h2Z
	mICS9geCpmCyb5JgLSkCWaihql7viLYsjamABJQZRFJVEjAUZ2hjiNOsLMwcxh2er7fZZJ
	wEfxoI1wNKqM05UfVfeoAFOL0EpfvHz/amOQEu22/Ag/EdYW4VS9Lqcijf966gksODnLkG
	g/yGQyb1sEo5Of9qQ3jX6MQxM+ZOAclLG5vTrFFOMHwoTrwg2xkIGj4gOP/8RQ==
Date: Tue, 18 Nov 2025 13:28:17 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Message-ID: <xp6e2jv5vvmelcgbqmigypafyzc5fvsvufa2ebrwga4hms65ew@zuz4exmzhe7m>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
 <AS1PR10MB5697986A426B5C628C2930F7FDF3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <cfzugo6hqsd2u4qnkoruql7hzg5zexrjnpyx3dex3zx3y7oxic@5yek6wcaxixx>
 <4xlc4uxrm6j2yqjgkeo2tdkmzrhvfuwpa6urojrhhnuk3hopon@mrbcen3lmdsw>
 <AS1PR10MB5697E778508C4AE29CE5EE0CFDD6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS1PR10MB5697E778508C4AE29CE5EE0CFDD6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226524

On Tue, Nov 18, 2025 at 09:06:23AM +0000, Marko, Peter wrote:
>
>
> > -----Original Message-----
> > From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > Sent: Thursday, October 23, 2025 13:06
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: JPEWhacker@gmail.com; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 suppor=
t to
> > Scarthgap
> >
> > On Thu, Oct 23, 2025 at 11:00:37AM +0200, Kamel Bouhara wrote:
> > > On Wed, Oct 22, 2025 at 12:43:22PM +0000, Peter Marko via
> > lists.openembedded.org wrote:
> > > > Hello,
> > > >
> > >
> > > Hello Peter,
> > >
> > > > I have tried this patch serias and I see ton of "missing or unkno=
wn CVE status"
> > warnings.
> > > > Example for curl recipe:
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-11053 - =
missing
> > or unknown CVE status
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-7264 - m=
issing or
> > unknown CVE status
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-8096 - m=
issing or
> > unknown CVE status
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2025-0167 - m=
issing or
> > unknown CVE status
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-6197 - m=
issing or
> > unknown CVE status
> > > > WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-9681 - m=
issing or
> > unknown CVE status
> > > > Looks like it is generated for every CVE patch in every recipe bu=
ilt.
> > > >
> > > > What I did is cherry-picking this series and adding following to =
my distro
> > config and building my image:
> > > > INHERIT_DISTRO:remove =3D "create-spdx"
> > > > INHERIT_DISTRO:append =3D " create-spdx-3.0"
> > > > When trying with pure poky, I added following to local.conf:
> > > > INHERIT:remove =3D "create-spdx"
> > > > INHERIT:append =3D " create-spdx-3.0"
> > > >
> > >
> > > Thanks for testing and for the detailed feedback.
> > >
> > > I haven=E2=80=99t yet tested this backport series with a pure Poky =
setup, so
> > > I=E2=80=99ll start there to reproduce the warnings you=E2=80=99re s=
eeing.
> > > Once I confirm how the CVE decoding behaves in that environment,
> > > I=E2=80=99ll follow up with a fix or updated guidance.
> > >
> > > Thanks again for pointing this out.
> >
> > Actually, I didn=E2=80=99t notice these warnings in my own tests on O=
E-Core
> > Scarthgap, but they are there too.
> >
> > They=E2=80=99re related to Marta=E2=80=99s cve-check changes (fb3f440=
b7d8), which added
> > richer CVE metadata and product/vendor matching through
> > decode_cve_status() and has_cve_product_match().
> >
> > Since those updates aren=E2=80=99t fully backported in Scarthgap, som=
e CVEs show
> > as unknown during SPDX generation.
>
> I think the problem is elsewhere - in commit "spdx30_tasks: adapt CVE h=
andling to new cve-check API".
> It does not handle patches in SRC_URI properly as they are not known to=
 function decode_cve_status.
>
> Also, it's not "some CVEs", but "all patched CVEs", which makes the VEX=
 information in my opinion unusable.

I see your point. My current SPDX3 patch treats all CVEs from get_patched=
_cves() the same,
which includes those from SRC_URI and leads to losing VEX information.

>
> I'll try to send a patch this week.

Ok thanks.

>
> Peter
>
> >
> > @Joshua: would you suggest we suppress these warnings in Scarthgap, o=
r
> > should we handle this case differently to better align with the upstr=
eam
> > behavior?
> >
> > >
> > > Kamel
> > >
> > > > Inheriting cve-check did not help.
> > > > When building oe-core master, I don't experience such warnings.
> > > > So it looks like something is missing in this backport series.
> > > >
> > > > Peter
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > core@lists.openembedded.org> On Behalf Of Kamel Bouhara via
> > > > > lists.openembedded.org
> > > > > Sent: Monday, October 20, 2025 9:10
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Cc: JPEWhacker@gmail.com; thomas.petazzoni@bootlin.com; Miquel
> > Raynal
> > > > > <miquel.raynal@bootlin.com>; mathieu.dubois-briand@bootlin.com;
> > > > > antonin.godard@bootlin.com; Pascal Eberhard <pascal.eberhard@se=
.com>;
> > > > > Kamel Bouhara <kamel.bouhara@bootlin.com>
> > > > > Subject: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 supp=
ort to
> > Scarthgap
> > > > >
> > > > > Hello,
> > > > >
> > > > > This v2 series backports SPDX 3.0 support from the upstream Wal=
nascar
> > > > > branch to Scarthgap (Yocto Project 5.0 LTS), including the corr=
esponding
> > > > > test suite and fixes for integration issues found during testin=
g.
> > > > >
> > > > > The motivation remains the same as in v1, to bring complete SPD=
X 3.0
> > > > > support to the latest LTS release, ensuring that long-term supp=
orted
> > > > > builds benefit SBOM generation capabilities. Scarthgap is under
> > > > > maintenance until 2028, and SPDX 3.0 is now an essential part o=
f
> > > > > compliance workflows.
> > > > >
> > > > > Kamel
> > > > >
> > > > > Hongxu Jia (1):
> > > > >   oeqa/selftest: Add SPDX 3.0 include source case for work-shar=
e
> > > > >
> > > > > Joshua Watt (7):
> > > > >   classes-global/license: Move functions to library code
> > > > >   lib/license: Move package license skip to library
> > > > >   lib: oe: license: Add missing import
> > > > >   classes-recipe/image: Add image file manifest
> > > > >   selftest: spdx: Add SPDX 3.0 test cases
> > > > >   lib: oeqa: spdx: Add tests for extra options
> > > > >   spdx 3.0: Rework how SPDX aliases are linked
> > > > >
> > > > > Kamel Bouhara (Schneider Electric) (3):
> > > > >   backport: SPDX 3.0 fixes and tasks from upstream version Waln=
ascar
> > > > >   spdx30_tasks: fix FetchData attribute in add_download_files
> > > > >   spdx30_tasks: adapt CVE handling to new cve-check API
> > > > >
> > > > >  meta/classes-global/base.bbclass              |   41 +-
> > > > >  meta/classes-global/license.bbclass           |  165 -
> > > > >  .../create-spdx-image-3.0.bbclass             |   85 +
> > > > >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> > > > >  meta/classes-recipe/image.bbclass             |   58 +
> > > > >  meta/classes-recipe/license_image.bbclass     |   14 +-
> > > > >  meta/classes-recipe/nospdx.bbclass            |   13 +
> > > > >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> > > > >  meta/classes/spdx-common.bbclass              |   99 +
> > > > >  meta/lib/oe/__init__.py                       |    2 +-
> > > > >  meta/lib/oe/license.py                        |  203 +
> > > > >  meta/lib/oe/sbom30.py                         | 1096 ++++
> > > > >  meta/lib/oe/spdx30.py                         | 5593 +++++++++=
++++++++
> > > > >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> > > > >  meta/lib/oe/spdx_common.py                    |  244 +
> > > > >  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
> > > > >  16 files changed, 9262 insertions(+), 216 deletions(-)
> > > > >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.b=
bclass
> > > > >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbc=
lass
> > > > >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> > > > >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> > > > >  create mode 100644 meta/classes/spdx-common.bbclass
> > > > >  create mode 100644 meta/lib/oe/sbom30.py
> > > > >  create mode 100644 meta/lib/oe/spdx30.py
> > > > >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> > > > >  create mode 100644 meta/lib/oe/spdx_common.py
> > > > >
> > > > > --
> > > > > 2.43.0
> > > >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#225190):
> > https://lists.openembedded.org/g/openembedded-core/message/225190
> > > > Mute This Topic: https://lists.openembedded.org/mt/115849813/5236=
779
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub
> > [kamel.bouhara@bootlin.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Kamel Bouhara, Bootlin
> > > Embedded Linux and kernel engineering
> > > https://bootlin.com
> >
> > --
> > Kamel Bouhara, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


Return-Path: <Ishaan.Desai@ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F82C44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 16:35:07 +0000 (UTC)
Subject: Re: [PATCH] memory-control: add recipe and bbclass for cgroup v2 memory limiting
To: openembedded-core@lists.openembedded.org
From: "Ishaan Desai" <Ishaan.Desai@ibm.com>
X-Originating-Location: New York, US (129.41.86.2)
X-Originating-Platform: Mac Safari 26.5
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 09:35:06 -0700
References: <20260713185154.4171585-1-Ishaan.Desai@ibm.com> <CANNYZj_HBsupBnzMvb_z1OxE3f38MAf+7x9N1FSPGKQKVumqJw@mail.gmail.com>
In-Reply-To: <CANNYZj_HBsupBnzMvb_z1OxE3f38MAf+7x9N1FSPGKQKVumqJw@mail.gmail.com>
Message-ID: <777420.1784046906500517885@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AyL4ESOcSNx21YF5LYS4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 16:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240900

--AyL4ESOcSNx21YF5LYS4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

The bbclass is intentional. The main use case is for other recipes to inher=
it it and set a memory limit for their own service at build time. An .inc f=
ile would require an explicit require and manual wiring of the do_install p=
ostfunc in every recipe that uses the memory-control tool. The bbclass enca=
psulates that cleanly and follows the OE-Core pattern for cross-recipe func=
tionality. The memory-control recipe itself is just the runtime companion, =
which the bbclass pulls in as an RDEPEND.

The motivation comes from embedded/constrained platforms, specifically Open=
BMC, where per-service memory limits via cgroup v2 are a common requirement=
. Putting this in OE-Core makes it available to any layer without duplicati=
ng the implementation, and the pattern of baking systemd drop-ins at build =
time is broadly useful beyond any platform.

I'm committed to maintaining this recipe and bbclass going forward, and I'v=
e added myself to maintainers.inc. If the consensus is that this is too nic=
he for OE-Core and belongs in a more specific layer, I'm open to that feedb=
ack.

Thanks,
Ishaan Desai

**

--AyL4ESOcSNx21YF5LYS4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">Hi everyone,</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">The bbclass is intentional.=
 The main use case is for other recipes to inherit it and set a memory limi=
t for their own service at build time. An .inc file would require an explic=
it require and manual wiring of the do_install postfunc in every recipe tha=
t uses the memory-control tool. The bbclass encapsulates that cleanly and f=
ollows the OE-Core pattern for cross-recipe functionality. The memory-contr=
ol recipe itself is just the runtime companion, which the bbclass pulls in =
as an RDEPEND.</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">The motivation comes from e=
mbedded/constrained platforms, specifically OpenBMC, where per-service memo=
ry limits via cgroup v2 are a common requirement. Putting this in OE-Core m=
akes it available to any layer without duplicating the implementation, and =
the pattern of baking systemd drop-ins at build time is broadly useful beyo=
nd any platform.</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">I'm committed to maintainin=
g this recipe and bbclass going forward, and I've added myself to maintaine=
rs.inc. If the consensus is that this is too niche for OE-Core and belongs =
in a more specific layer, I'm open to that feedback.</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">Thanks,</span><span style=
=3D"font-size: 11pt; font-family: 'Times New Roman', serif; color: #000000;=
 background-color: transparent; font-weight: 400; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-variant-alternat=
es: normal; font-variant-numeric: normal; font-variant-east-asian: normal; =
font-variant-position: normal; text-decoration: none; vertical-align: basel=
ine; white-space: pre-wrap;"><br /></span><span style=3D"font-size: 11pt; f=
ont-family: 'Times New Roman', serif; color: #000000; background-color: tra=
nsparent; font-weight: 400; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-variant-alternates: normal; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; text-decoration: none; vertical-align: baseline; white-space: pre-=
wrap;">Ishaan Desai</span></p>
<strong id=3D"docs-internal-guid-61f0e573-7fff-2baa-ef99-b71e64ccb2b5" styl=
e=3D"font-style: normal; font-variant-caps: normal; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration-line: none; text-decoration-thickness: auto; text-deco=
ration-style: solid; caret-color: #000000; color: #000000; font-weight: nor=
mal;"></strong></div>

--AyL4ESOcSNx21YF5LYS4--


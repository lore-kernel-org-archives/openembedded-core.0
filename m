Return-Path: <Ishaan.Desai@ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501C3C44507
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 18:33:39 +0000 (UTC)
Subject: Re: [PATCH] memory-control: add recipe and bbclass for cgroup v2 memory limiting
To: openembedded-core@lists.openembedded.org
From: "Ishaan Desai" <Ishaan.Desai@ibm.com>
X-Originating-Location: New York, US (129.41.86.2)
X-Originating-Platform: Mac Safari 26.5
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 11:33:33 -0700
References: <20260713185154.4171585-1-Ishaan.Desai@ibm.com> <CANNYZj_HBsupBnzMvb_z1OxE3f38MAf+7x9N1FSPGKQKVumqJw@mail.gmail.com> <777420.1784046906500517885@lists.openembedded.org> <CANNYZj-iVhChLSJxraiwHo3f5Unvu-N6MyQo1KcHSuNKRG2EzA@mail.gmail.com>
In-Reply-To: <CANNYZj-iVhChLSJxraiwHo3f5Unvu-N6MyQo1KcHSuNKRG2EzA@mail.gmail.com>
Message-ID: <783427.1784054013995242828@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IpP1Do6dnXGVE3ts0z83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 18:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240907

--IpP1Do6dnXGVE3ts0z83
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Thanks for the feedback. I'll move this out of OE-Core. Is there an existin=
g small layer this would fit into, or would you expect this to warrant a ne=
w dedicated layer? I'll also add tests and usage examples before resubmitti=
ng. I'll drop the bbclass and implement a memory-control-config recipe that=
 installs the needed systemd configuration without touching the recipes tha=
t provide the actual services.

I hadn't fully considered the licensing implications there. I'll rewrite th=
e control logic to avoid a bash dependency by extending the existing system=
d tooling directly rather than shipping a separate CLI. I'll put together a=
 revised version along these lines and send it out for another look. Thanks=
 again for the advice.

Thanks,
Ishaan Desai

**

--IpP1Do6dnXGVE3ts0z83
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">Hi Alexander,</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">Thanks for the feedback. I'=
ll move this out of OE-Core. </span><span style=3D"font-size: 12pt; font-fa=
mily: 'Times New Roman', serif; color: #000000; background-color: transpare=
nt; font-weight: 400; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-variant-alternates: normal; font-variant-num=
eric: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"=
>Is there an existing small layer this would fit into, or would you expect =
this to warrant a new dedicated layer? </span><span style=3D"font-size: 11p=
t; font-family: 'Times New Roman', serif; color: #000000; background-color:=
 transparent; font-weight: 400; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-variant-alternates: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; text-decoration: none; vertical-align: baseline; white-space: =
pre-wrap;">I'll also add tests and usage examples before resubmitting. I'll=
 drop the bbclass and implement a memory-control-config recipe that install=
s the needed systemd configuration without touching the recipes that provid=
e the actual services.</span></p>
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 12pt; margin-bottom:=
 12pt;"><span style=3D"font-size: 11pt; font-family: 'Times New Roman', ser=
if; color: #000000; background-color: transparent; font-weight: 400; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-variant-alternates: normal; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: none; ve=
rtical-align: baseline; white-space: pre-wrap;">I hadn't fully considered t=
he licensing implications there. I'll rewrite the control logic to avoid a =
bash dependency by extending the existing systemd tooling directly rather t=
han shipping a separate CLI. I'll put together a revised version along thes=
e lines and send it out for another look. Thanks again for the advice.</spa=
n></p>
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
<strong id=3D"docs-internal-guid-6e6142e0-7fff-b641-ee17-efe277436302" styl=
e=3D"font-style: normal; font-variant-caps: normal; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration-line: none; text-decoration-thickness: auto; text-deco=
ration-style: solid; caret-color: #000000; color: #000000; font-weight: nor=
mal;"></strong></div>

--IpP1Do6dnXGVE3ts0z83--


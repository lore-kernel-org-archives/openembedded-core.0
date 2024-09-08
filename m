Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED3FE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:10:17 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/3] expat: fix CVE-2024-45490
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: IN (157.32.45.152)
X-Originating-Platform: Linux Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 08 Sep 2024 10:10:10 -0700
References: <DM8PR11MB5703827BA5786C86CCC33DC184982@DM8PR11MB5703.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5703827BA5786C86CCC33DC184982@DM8PR11MB5703.namprd11.prod.outlook.com>
Message-ID: <15381.1725815410384497152@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qYVB9yrhr2HG8I3DlLiX"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 17:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204305

--qYVB9yrhr2HG8I3DlLiX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> expat/tests/basic_tests.c is not present in recipe version, will add thes=
e
> changes to runtests.c and will send V2.
>=20
>=20

- Yes, expat/tests/basic_tests.c seperated out from runtests.c from version=
 2.6.0.

- Afaik, the patch will apply directly to runtests.c as not major change ex=
cept seperation was done in expat.

Thank-you for your work :) and sending V2 :)

BR,
Siddharth

--qYVB9yrhr2HG8I3DlLiX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div><span style=3D"color: #000000; font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;">expat/test=
s/basic_tests.c is not present in recipe version, will add these changes to=
 runtests.c and will send V2.</span></div>
<div>&nbsp;</div>
</blockquote>
<div>- Yes, <span style=3D"color: #000000; font-family: Aptos, Aptos_Embedd=
edFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16p=
x; font-style: normal; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; white-space: normal; background-color: #fff=
fff; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial; display: inline !important; float: none;">exp=
at/tests/basic_tests.c seperated out from runtests.c from version 2.6.0.&nb=
sp;<br /></span></div>
<div><span style=3D"color: #000000; font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;">- Afaik, t=
he patch will apply directly to runtests.c as not major change except seper=
ation was done in expat.<br /><br />Thank-you for your work :) and sending =
V2 :)&nbsp;<br /><br />BR,</span></div>
<div><span style=3D"color: #000000; font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;">Siddharth<=
/span></div>

--qYVB9yrhr2HG8I3DlLiX--


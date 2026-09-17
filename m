Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36804C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:06:26 +0000 (UTC)
Subject: Re: [wrynose][PATCH 4/6] curl: Security Fix for CVE-2026-80255
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: Rajkot, Gujarat, IN (157.32.46.29)
X-Originating-Platform: Linux Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 16 Sep 2026 22:06:25 -0700
References: <20260909203324.765094-1-sdoshi@mvista.com> <20260909203324.765094-4-sdoshi@mvista.com> <DLGQFVSIEIYJ.3FPJ3GOIMT0C4@smile.fr>
In-Reply-To: <DLGQFVSIEIYJ.3FPJ3GOIMT0C4@smile.fr>
Message-ID: <681846.1789621585890910870@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Eqx8VOmmLI8I2VXSogVG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246009

--Eqx8VOmmLI8I2VXSogVG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> Failed ptests:
> {'curl': ['1105_-_HTTP_with_cookie_parser_and_header_recording_-_output']=
}
>=20
>=20
>=20

Intresting !! the same test ran successfully for me

>=20
> I could reproduce this locally with
> bitbake core-image-ptest-curl && bitbake core-image-ptest-curl -c
> testimage
>=20

I will run a fresh build and check it again.

--Eqx8VOmmLI8I2VXSogVG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">Failed ptests:</span><br style=3D"box-sizing: border-box; ov=
erflow-wrap: break-word !important; color: #333333; font-family: system-ui,=
 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Aria=
l, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'N=
oto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatur=
es: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none=
; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space=
: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;" /><span st=
yle=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helveti=
ca Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color E=
moji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: =
16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps=
: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align:=
 start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color:=
 #ffffff; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial; display: inline !important; float: none;=
">{'curl': ['1105_-_HTTP_with_cookie_parser_and_header_recording_-_output']=
}<br /></span></div>
</blockquote>
<div>Intresting !! the same test ran successfully for me</div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">I could reproduce this locally with </span><br sty=
le=3D"box-sizing: border-box; overflow-wrap: break-word !important; color: =
#333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Not=
o Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe =
UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-sty=
le: normal; font-variant-ligatures: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-i=
ndent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial;" /><span style=3D"color: #333333; font-family: system-=
ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', A=
rial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',=
 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initia=
l; text-decoration-style: initial; text-decoration-color: initial; display:=
 inline !important; float: none;">bitbake core-image-ptest-curl &amp;&amp; =
bitbake core-image-ptest-curl -c testimage</span></span></div>
</blockquote>
<div>I will run a fresh build and check it again.&nbsp;<br /><br /></div>

--Eqx8VOmmLI8I2VXSogVG--


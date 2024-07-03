Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE0C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:43:55 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] OpenSSL: Security fix for CVE-2024-5535
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: IN (157.32.45.92)
X-Originating-Platform: Linux Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 03 Jul 2024 02:43:52 -0700
References: <f05f0749-f99e-16b5-f497-becd828beb3c@windriver.com>
In-Reply-To: <f05f0749-f99e-16b5-f497-becd828beb3c@windriver.com>
Message-ID: <13008.1719999832883308371@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6WvCkoUUP8LTAWflFXlY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201462

--6WvCkoUUP8LTAWflFXlY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> You're backporting the first 10. Are the remaining 6 needed?
>=20

- Essentially all 16 commits mentioned in https://github.com/openssl/openss=
l/pull/24717 are needed to solve the issue though 15 and 16th commit are ju=
st whitespace nit changes.

- However, when Matt merged all those 16 commits mentioned in above link, i=
n the openssl stable branches, he kind of incorporated the last 6 patches i=
n the main 10 patches as they were being applied in the same files of first=
 10 patches which somewhere down the line makes sense.
- So, the 10 patches i committed has content of all 16 patches (even the la=
st 6) and i committed it in the same fashion as of openssl stable branches.

Regards,

Siddharth

--6WvCkoUUP8LTAWflFXlY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote><span style=3D"color: #333333; font-family: system-ui, 'Segoe U=
I', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-s=
erif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color=
 Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wra=
p; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;">You're backporting the first 10. Are the remaining 6 =
needed?<br /></span></blockquote>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">- Essentially all 16 commits mentioned in <a href=3D"https://g=
ithub.com/openssl/openssl/pull/24717" target=3D"_blank" rel=3D"noopener">ht=
tps://github.com/openssl/openssl/pull/24717</a> are needed to solve the iss=
ue though 15 and 16th commit are just whitespace nit changes.</span></p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">- However, when Matt merged all those 16 commits mentioned in =
above link, in the openssl stable branches, he kind of incorporated the las=
t 6 patches in the main 10 patches as they were being applied in the same f=
iles of first 10 patches which somewhere down the line makes sense.<br />- =
So, the 10 patches i committed has content of all 16 patches (even the last=
 6) and i committed it in the same fashion as of openssl stable branches.</=
span><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"></span></p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">Regards,</span></p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">Siddharth</span></p>

--6WvCkoUUP8LTAWflFXlY--


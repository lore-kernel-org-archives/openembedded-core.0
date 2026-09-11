Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04464C88E59
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 19:04:08 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 1/6] libxml2: Security Fix for CVE-2026-86137
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: Rajkot, Gujarat, IN (157.32.46.124)
X-Originating-Platform: Linux Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 12:04:05 -0700
References: <20260910200329.842463-1-sdoshi@mvista.com> <DLCIC1493YTD.2KR894JSU7SKE@smile.fr> <308852.1789133041123096150@lists.openembedded.org> <CAMSfU+7VRnqq7Tkjb1U0emGyND2vNEc6MEO5d4ObVyHDu7B-zg@mail.gmail.com>
In-Reply-To: <CAMSfU+7VRnqq7Tkjb1U0emGyND2vNEc6MEO5d4ObVyHDu7B-zg@mail.gmail.com>
Message-ID: <308852.1789153445932695814@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zGWnlT3luYXyTV25P3du"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 19:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245666

--zGWnlT3luYXyTV25P3du
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

I have sent the backported patch for wrynose -> https://lists.openembedded.=
org/g/openembedded-core/message/245665

>=20
> In this particular case, have you checked that the upgrade is ok for
> stable inclusion? I also seem to remember a recent libxml2 upgrade
> breaking systemd. Is it this one?
>=20

- To make sure this patch doesn't break systemd, I ran a clean build -> bit=
bake -c cleanall libxml2 libxml2-native glib-2.0 glib-2.0-native shared-mim=
e-info-native python3-lxml-native systemd && bitbake systemd.
- Everything compiles successfully without errors
- However, if it still throws error on autobuilder due to environment diffe=
rence, i would revert the upgrade and backport all the patches for libxml2-=
2.15.3.

Regards,
Siddharth

--zGWnlT3luYXyTV25P3du
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">Hello Yoann,<br /><br />I have sent the backported patch for w=
rynose -&gt; https://lists.openembedded.org/g/openembedded-core/message/245=
665</span></div>
<div>&nbsp;</div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">In this particular case, have you checked that the upgrade is =
ok for stable inclusion? I also seem to remember a recent libxml2 upgrade b=
reaking systemd. Is it this one?</span></div>
</blockquote>
<div>&nbsp;- To make sure this patch doesn't break systemd, I ran a clean b=
uild -&gt; bitbake -c cleanall libxml2 libxml2-native glib-2.0 glib-2.0-nat=
ive shared-mime-info-native python3-lxml-native systemd &amp;&amp; bitbake =
systemd.<br />- Everything compiles successfully without errors</div>
<div>- However, if it still throws error on autobuilder due to environment =
difference, i would revert the upgrade and backport all the patches for lib=
xml2-2.15.3.<br /><br />Regards,<br />Siddharth</div>

--zGWnlT3luYXyTV25P3du--


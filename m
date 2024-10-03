Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5042DCF34BB
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 16:56:18 +0000 (UTC)
Subject: Re: [PATCH] glibc: stable 2.40 branch updates
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.205.147.137)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Oct 2024 09:56:14 -0700
References: <CAMKF1soz6mBG3GiGkT9mRcvVu9+sXpU_gA-vm+zPnK9LEsKeKg@mail.gmail.com>
In-Reply-To: <CAMKF1soz6mBG3GiGkT9mRcvVu9+sXpU_gA-vm+zPnK9LEsKeKg@mail.gmail.com>
Message-ID: <26848.1727974574916875913@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="swPzX6AheAHtvuRsxrFG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 16:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205209

--swPzX6AheAHtvuRsxrFG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I analyzed the issue further by debugging it manually and observed that the=
 testcase "malloc/tst-free-errno.c" passed as expected. Hence, I ran the te=
stsuite again after the update and found that the issue was not reproduced =
anymore.
Please find the following results after the update:
*After update*
PASS - 4946
FAIL - 223
XPASS - 4
XFAIL - 16
UNSUPPORTED - 229

*Before update
* PASS - 4924
FAIL - 223
XPASS - 4
XFAIL - 16
UNSUPPORTED - 229

--swPzX6AheAHtvuRsxrFG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,</div>
<div>&nbsp;</div>
<div>
<div>I analyzed the issue further by debugging it manually and observed tha=
t the testcase "malloc/tst-free-errno.c" passed as expected. Hence, I ran t=
he testsuite again after the update and found that the issue was not reprod=
uced anymore.<br />Please find the following results after the update:<br /=
><strong>After update&nbsp;</strong><br />PASS - 4946<br />FAIL - 223<br />=
XPASS - 4<br />XFAIL - 16<br />UNSUPPORTED - 229</div>
<div><br /><strong style=3D"box-sizing: border-box; font-weight: bold; over=
flow-wrap: break-word !important; color: #333333; font-family: system-ui, '=
Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Not=
o Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; te=
xt-align: start; text-indent: 0px; text-transform: none; widows: 2; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background=
-color: #ffffff; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;"><span style=3D"box-sizing: borde=
r-box; overflow-wrap: break-word !important;">Before update<br style=3D"box=
-sizing: border-box; overflow-wrap: break-word !important;" /></span></stro=
ng><span style=3D"box-sizing: border-box; overflow-wrap: break-word !import=
ant; color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica=
 Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; white-space: normal; background-color: #ff=
ffff; text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial;">PASS - 4924<br style=3D"box-sizing: border-=
box; overflow-wrap: break-word !important;" /></span><span style=3D"box-siz=
ing: border-box; overflow-wrap: break-word !important; color: #333333; font=
-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Lib=
eration Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: normal; background-color: #ffffff; text-decoration-thi=
ckness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial;">FAIL - 223<br style=3D"box-sizing: border-box; overflow-wrap: break-=
word !important;" /></span><span style=3D"box-sizing: border-box; overflow-=
wrap: break-word !important; color: #333333; font-family: system-ui, 'Segoe=
 UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans=
-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Col=
or Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">XPASS - 4<br style=
=3D"box-sizing: border-box; overflow-wrap: break-word !important;" /></span=
><span style=3D"box-sizing: border-box; overflow-wrap: break-word !importan=
t; color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica N=
eue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji=
', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px=
; font-style: normal; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: sta=
rt; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; white-space: normal; background-color: #ffff=
ff; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial;">XFAIL - 16<br style=3D"box-sizing: border-box=
; overflow-wrap: break-word !important;" /></span><span style=3D"box-sizing=
: border-box; overflow-wrap: break-word !important; color: #333333; font-fa=
mily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Libera=
tion Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Sego=
e UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font=
-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text=
-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; white-space: normal; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l;">UNSUPPORTED - 229</span></div>
</div>

--swPzX6AheAHtvuRsxrFG--


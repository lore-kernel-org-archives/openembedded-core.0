Return-Path: <gemad@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EDDC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 10:40:53 +0000 (UTC)
Subject: busybox hard links instead of symbolic links 
To: openembedded-core@lists.openembedded.org
From: gemad@outlook.com
X-Originating-Location: =?UTF-8?B?R290aGVuYnVyZywgVsOkc3RyYSBHw7Z0YWxhbmQgQ291bnR5LCBTRQ==?= (192.157.8.235)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 21 Aug 2024 03:40:51 -0700
Message-ID: <pKbV.1724236851793158783.LHi6@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gMVpNXRENrheLgm6FAMQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 10:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203582

--gMVpNXRENrheLgm6FAMQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I am trying to generate *busybox* with *hardlinks* instead of symbolic =
links with but changing the " CONFIG_INSTALL_APPLET_HARDLINKS =3Dy " doesn'=
t do the trick, I see that busybox recipe do override the regular busybox i=
nstall with do_install using update-alternatives, but not checking for this=
 hard links option, is there a reason why it's not supported by default, or=
 a workaround to enable it ?

--gMVpNXRENrheLgm6FAMQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div class=3D"_textDetail_1iev9_13" style=3D"box-sizing: border-box; positi=
on: relative; color: #212529; font-family: -apple-system, BlinkMacSystemFon=
t, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans'=
, 'Helvetica Neue', sans-serif; font-size: 14px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: normal; background-color: #ffffff; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
">
<div class=3D"_rtfEditor_15a54_1 _textContent_1iev9_34 _highlight_1iev9_55"=
 style=3D"box-sizing: border-box; font-size: 14px; line-height: 18px; borde=
r-radius: 12px; padding: 10px 12px; background: #e2f0fe; white-space: pre-l=
ine;">
<p style=3D"box-sizing: border-box; margin: 0px; white-space: pre-wrap; wor=
d-break: break-word; overflow: hidden; color: #000000;">Hi, I am trying to =
generate <strong style=3D"box-sizing: border-box; font-weight: bold;">busyb=
ox </strong>with <strong style=3D"box-sizing: border-box; font-weight: bold=
;">hardlinks </strong>instead of symbolic links with but changing the "<spa=
n style=3D"box-sizing: border-box; color: #859900;">CONFIG_INSTALL_APPLET_H=
ARDLINKS</span><span style=3D"box-sizing: border-box; color: #657b83;">=3Dy=
</span>" doesn't do the trick, I see that busybox recipe do override the re=
gular busybox install with do_install using update-alternatives, but not ch=
ecking for this hard links option, is there a reason why it's not supported=
 by default, or a workaround to enable it ?</p>
</div>
</div>
<div class=3D"_options_1gl4q_146 _anchorContainer_1gl4q_201" style=3D"box-s=
izing: border-box; position: relative; color: #212529; font-family: -apple-=
system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, =
'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial;">
<div class=3D"_moreOptions_1qihp_1 _optionsContainer_1gl4q_146" style=3D"bo=
x-sizing: border-box; font-size: 14px; display: flex; align-items: flex-sta=
rt; list-style-type: none; margin: 5px 0px 0px 10px; padding-left: 0px; pos=
ition: relative; height: 0px; opacity: 1;" tabindex=3D"-1" role=3D"list" da=
ta-more-option=3D"true">
<div style=3D"box-sizing: border-box;">&nbsp;</div>
<div style=3D"box-sizing: border-box;">&nbsp;</div>
<div style=3D"box-sizing: border-box;">&nbsp;</div>
</div>
</div>
</div>

--gMVpNXRENrheLgm6FAMQ--


Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C32C27C44
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 12:39:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.57783.1717331967072581414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 05:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id ACBC9102DA
	for <openembedded-core@lists.openembedded.org>; Sun,  2 Jun 2024 14:38:43 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.41.208]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sDkTx-1cB1fc0; Sun, 2 Jun 2024 14:38:41 +0200
Date: Sun, 02 Jun 2024 14:39:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: xcb-util-errors
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-Id: <QTDGES.21EDCKYOMIWH1@t-online.de>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-SZcV7mRSp1Qbj1w4tczb"
X-TOI-EXPURGATEID: 150726::1717331921-A9331350-85B12C0D/0/0 CLEAN NORMAL
X-TOI-MSGID: faef33b9-360f-4aba-b204-c25b558294ed
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 12:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200207

--=-SZcV7mRSp1Qbj1w4tczb
Content-Type: text/plain; charset=us-ascii; format=flowed

xcb-util-errors is an optional dependency for wlroots and as of

<https://github.com/hyprwm/Hyprland/commit/a54ab301602e205f273969c093cf494d38ba4a98>

required for hyprland. It is missing in recipes-graphics/xorg-lib and I 
have therefore created the recipe like this:

xcb-util-errors_1.0.1.bb
require recipes-graphics/xorg-lib/xcb-util.inc

SUMMARY = "xcb-util-errors gives human readable names to error codes 
and event codes"

DEPENDS += "xcb-util python3 xorgproto"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=c90ee77011043c608617f5323a523726 
<file://copying;md5=c90ee77011043c608617f5323a523726/>"

SRC_URI[sha256sum] = 
"5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d820fb80f357"

Is there interest in having this recipe in oe-core or should I move it 
to meta-wayland?


--=-SZcV7mRSp1Qbj1w4tczb
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>xcb-util-errors is an optional dep=
endency for wlroots and as of</div><div><br></div><div><a href=3D"https://g=
ithub.com/hyprwm/Hyprland/commit/a54ab301602e205f273969c093cf494d38ba4a98">=
https://github.com/hyprwm/Hyprland/commit/a54ab301602e205f273969c093cf494d3=
8ba4a98</a></div><div><br></div><div>required for hyprland. It is missing i=
n recipes-graphics/xorg-lib and I have therefore created the recipe like th=
is:</div><div><br></div><div>xcb-util-errors_1.0.1.bb</div><div><div>requir=
e recipes-graphics/xorg-lib/xcb-util.inc</div><div><br></div><div>SUMMARY =
=3D "xcb-util-errors gives human readable names to error codes and event co=
des"</div><div><br></div><div>DEPENDS +=3D "xcb-util python3 xorgproto"</di=
v><div><br></div><div>LICENSE =3D "MIT"</div><div>LIC_FILES_CHKSUM =3D "<a =
href=3D"file://COPYING;md5=3Dc90ee77011043c608617f5323a523726">file://COPYI=
NG;md5=3Dc90ee77011043c608617f5323a523726</a>"</div><div><br></div><div>SRC=
_URI[sha256sum] =3D "5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d8=
20fb80f357"</div></div><div><br></div><div>Is there interest in having this=
 recipe in oe-core or should I move it to meta-wayland?</div></div>
--=-SZcV7mRSp1Qbj1w4tczb--



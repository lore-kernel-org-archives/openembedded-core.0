Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1208C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 12:40:46 +0000 (UTC)
Subject: [PATCH 2/3] [PATCH] [master} weston.init: enabled xwayland
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
X-Originating-Location: Ahrensbok, Schleswig-Holstein, DE (84.140.242.110)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jun 2022 05:40:41 -0700
Message-ID: <TujX.1655124041490205980.rmfs@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="uVhs1fWWIhQggzxRtng3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 12:40:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166840

--uVhs1fWWIhQggzxRtng3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

set xwayland support in weston.init file to true

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
meta/recipes-graphics/wayland/weston-init.bb | 4 ++++
1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-gr=
aphics/wayland/weston-init.bb
index 497d860203..77dda03cf5 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -50,6 +50,10 @@ do_install() {
sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${sysco=
nfdir}/xdg/weston/weston.ini
fi

+ if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" =
=3D "yes" ]; then
+ sed -i -e "/^\[core\]/a xwayland=3Dtrue" ${D}${sysconfdir}/xdg/weston/wes=
ton.ini
+ fi
+
if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no',=
 d)}" =3D "yes" ]; then
sed -i -e "/^\[core\]/a idle-time=3D0" ${D}${sysconfdir}/xdg/weston/weston.=
ini
fi
--
2.25.1

--uVhs1fWWIhQggzxRtng3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>set xwayland support in weston.init file to true</div>
<div>&nbsp;</div>
<div>Signed-off-by: ssuesens &lt;sebastian.suesens@baslerweb.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-graphics/wayland/weston-init.bb | 4 ++++</div>
<div>&nbsp;1 file changed, 4 insertions(+)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recip=
es-graphics/wayland/weston-init.bb</div>
<div>index 497d860203..77dda03cf5 100644</div>
<div>--- a/meta/recipes-graphics/wayland/weston-init.bb</div>
<div>+++ b/meta/recipes-graphics/wayland/weston-init.bb</div>
<div>@@ -50,6 +50,10 @@ do_install() {</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>sed -i -e "/^\[core\]/=
a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/west=
on.ini</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>fi</div>
<div>&nbsp;</div>
<div>+<span style=3D"white-space: pre;"> </span>if [ "${@bb.utils.contains(=
'DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" =3D "yes" ]; then</div>
<div>+<span style=3D"white-space: pre;"> </span>sed -i -e "/^\[core\]/a xwa=
yland=3Dtrue" ${D}${sysconfdir}/xdg/weston/weston.ini</div>
<div>+<span style=3D"white-space: pre;"> </span>fi</div>
<div>+</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>if [ "${@bb.utils.cont=
ains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" =3D "yes" ]; the=
n</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>sed -i -e "/^\[core\]/=
a idle-time=3D0" ${D}${sysconfdir}/xdg/weston/weston.ini</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>fi</div>
<div>--&nbsp;</div>
<div>2.25.1</div>

--uVhs1fWWIhQggzxRtng3--


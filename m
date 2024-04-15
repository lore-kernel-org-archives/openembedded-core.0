Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E05C04FFE
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 10:59:07 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.18235.1713178738509058548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 03:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id AE3CA52EBD
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:58:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.43.130]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwK33-2mYSn30; Mon, 15 Apr 2024 12:58:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCHv2 1/2] libei: import recipe from meta-oe
Date: Mon, 15 Apr 2024 12:59:10 +0200
Message-ID: <20240415105911.3528-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713178733-71F10D2B-B42A6A99/0/0 CLEAN NORMAL
X-TOI-MSGID: 677b48d0-076c-4195-bd24-332d73f14160
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 10:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198228

Libei has been the multi-year effort by Red Hat's Peter Hutterer on emula=
ted
input handling for Wayland. Libei consists of a client side library and E=
IS
as the "Emulated Input Server" for this Wayland-focused emulated input de=
vice
solution.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/wayland/libei_1.2.1.bb | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libei_1.2.1.bb

diff --git a/meta/recipes-graphics/wayland/libei_1.2.1.bb b/meta/recipes-=
graphics/wayland/libei_1.2.1.bb
new file mode 100644
index 0000000000..807dcea1ed
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libei_1.2.1.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "libei is a library for Emulated Input, primarily aimed at t=
he Wayland stack."
+HOMEPAGE =3D "https://gitlab.freedesktop.org/libinput/libei"
+SECTION =3D "graphics"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da98fa76460f96f41696611d6f07e8=
d49"
+
+DEPENDS =3D " \
+	libxkbcommon \
+	libevdev \
+	libxslt-native \
+	python3-attrs-native \
+	python3-jinja2-native \
+	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d=
)} \
+"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libei.git;protocol=3D=
https;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "08f1d41085a6ae4bac7bc52abe2955d3354342cb"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
+
--=20
2.44.0



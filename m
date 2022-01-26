Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21261C63697
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.10705.1643192915897749864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=w7Jg6DnH;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4EA7C82849;
	Wed, 26 Jan 2022 11:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192914;
	bh=Nusl0X+exvhtdZi9zm26yJiJlTSUJQUpYmi+/TrIJmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w7Jg6DnHMJOahm9QBKXri373EhJicpSqKzPWxJg1FTzn3SxI/dNRhkUit4dqQQfnt
	 Fy2f6c36/Mwrf8PaE9/uasXeWa4et5bfa0nMXdOnidPul9FCJSvM+5cYo6uoK7Lv+S
	 GCQUkfYvtzs3h+7q2BySgkCMpluN+R1HVX+R6T8f07JP9jZbFWomSobdkU1IYRqElz
	 k14lWYZCDLZFhDboTuUf98qKLbsxYKc0tfleLlu5e8clVnf1SyjcZM+FcBNfsrroMx
	 mkr8xElm5iA3knywPOjEW5ch+/P1yvSvLXZe0nmvrQBmyoem9chZS/XX+nlYV7cmgX
	 Vptd+vUniYLSQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 03/12] gstreamer1.0-plugins-good: 1.18.5 ->
 1.20.0
Date: Wed, 26 Jan 2022 11:28:05 +0100
Message-Id: <20220126102814.4173943-4-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160968

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...e-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch | 12 ++++++------
 ...1.18.5.bb =3D> gstreamer1.0-plugins-good_1.20.0.bb} |  9 ++++-----
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18=
.5.bb =3D> gstreamer1.0-plugins-good_1.20.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch b/meta/re=
cipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-=
qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
index 788d752058..11f0deba97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt=
-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt=
-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ext/qt/qtwindow.cc      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
-diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
+diff --git a/subprojects/gst-plugins-good/ext/qt/gstqsgtexture.cc b/subp=
rojects/gst-plugins-good/ext/qt/gstqsgtexture.cc
 index a05d26e..4cc9fc6 100644
---- a/ext/qt/gstqsgtexture.cc
-+++ b/ext/qt/gstqsgtexture.cc
+--- a/subprojects/gst-plugins-good/ext/qt/gstqsgtexture.cc
++++ b/subprojects/gst-plugins-good/ext/qt/gstqsgtexture.cc
 @@ -27,7 +27,7 @@
 =20
  #include <gst/video/video.h>
@@ -38,10 +38,10 @@ index a05d26e..4cc9fc6 100644
  #include "gstqsgtexture.h"
 =20
  #define GST_CAT_DEFAULT gst_qsg_texture_debug
-diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+diff --git a/subprojects/gst-plugins-good/ext/qt/qtwindow.cc b/subprojec=
ts/gst-plugins-good/ext/qt/qtwindow.cc
 index 9360c33..0dfd3f1 100644
---- a/ext/qt/qtwindow.cc
-+++ b/ext/qt/qtwindow.cc
+--- a/subprojects/gst-plugins-good/ext/qt/qtwindow.cc
++++ b/subprojects/gst-plugins-good/ext/qt/qtwindow.cc
 @@ -25,7 +25,7 @@
  #include <stdio.h>
 =20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.20.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
0.0.bb
index ade935df9e..baba628df4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.=
bb
@@ -4,13 +4,12 @@ DESCRIPTION =3D "'Good' GStreamer plugins"
 HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
 BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gst-plugins-goo=
d/-/issues"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-=
plugins-good-${PV}.tar.xz \
-           file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gst=
glf.patch \
-           "
+require gstreamer1.0-source.inc
=20
-SRC_URI[sha256sum] =3D "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9=
d00232cfd555796b"
+S =3D "${SRC_BASE}/subprojects/gst-plugins-good"
=20
-S =3D "${WORKDIR}/gst-plugins-good-${PV}"
+SRC_URI +=3D "file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-=
gstglf.patch;patchdir=3D${SRC_BASE} \
+           "
=20
 LICENSE =3D "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
--=20
2.34.1



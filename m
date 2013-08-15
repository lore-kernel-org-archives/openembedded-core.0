Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 83A6A6B8A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:54 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so185022eae.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=SsFcPLLZbsQ52bf+e9X7eJejeUSInMIzmaY/VOuUNpw=;
	b=ctxNJ6fZs4RV+EeqGLqoZ31POMRFGWYmsVixcUNg9KqY8FdgZwlrrlQpWptwVY0hfu
	Mwtbm7Sq9O4nnC/JJusTH7xyXXuwQVHrfAKkBa6f/ZMshg+RgL/fnMAydXFh3k8l2VGv
	yOq1WadHH5gF40xSYsd9HKRCcfY73SDkRD0963K+ErdDgz1flT+7jMx1MpKFgWhhwsa1
	jcbUiLVBtH9m877UxJrIzuJJ1Ypf8VjnH4EVWHJMuWyEztwT5dj0n8GAw6vE7w5ngf1w
	hoNH+VuSLjrrzp8sTmip3o8b9GlywP2pCrzOCQE3FS+LK8NmK4oMloddJmIDx24anALB
	HdwQ==
X-Received: by 10.14.212.6 with SMTP id x6mr1315332eeo.67.1376551374955;
	Thu, 15 Aug 2013 00:22:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm81972543eel.12.2013.08.15.00.22.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:12 +0200
Message-Id: <b789433aabcccb5f3d0bf88751d6f9fff6ba0206.1376551401.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 01/33] (lib)telepathy*: add missing dependency on libxslt-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:22:54 -0000

* do_configure fails without:
  | configure:13590: error: xsltproc (from the libxslt source package) is required

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb             | 2 +-
 meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb          | 3 +--
 meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb          | 3 +--
 .../telepathy/telepathy-mission-control_5.14.0.bb                     | 4 +---
 meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb       | 1 +
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index 7d0ef79..f13e709 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -4,7 +4,7 @@ communication, including instant messaging, voice calls and video calls.  It \
 abstracts differences between protocols to provide a unified interface for \
 applications."
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib"
+DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib libxslt-native"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
index a0c3103..85071c0 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Telepathy Framework glib-base helper library"
 DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
+DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
 LICENSE = "LGPLv2.1+"
-PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
index 02250ea..4edcb3b 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
@@ -1,11 +1,10 @@
 SUMMARY = "Telepathy IRC connection manager"
 DESCRIPTION = "Telepathy implementation of the Internet Relay Chat protocols."
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus telepathy-glib openssl"
+DEPENDS = "glib-2.0 dbus telepathy-glib openssl libxslt-native"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
-PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-svc-gtk-doc.h-target.patch"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
index b758dd9..23e4c97 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
@@ -4,12 +4,10 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://src/request.h;beginline=1;endline=21;md5=f80534d9af1c33291b3b79609f196eb2"
 SECTION = "libs"
-DEPENDS = "libtelepathy dbus-glib gconf"
+DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r0"
-
 inherit autotools pkgconfig pythonnative
 
 PACKAGES =+ " \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index f83bb2c..5a02d81 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -4,6 +4,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
 
+DEPENDS = "libxslt-native"
 RDEPENDS_${PN} += "python-dbus"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-- 
1.8.3.2



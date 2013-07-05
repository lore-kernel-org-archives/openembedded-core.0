Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id E7E016B011
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:28:56 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so1152688eak.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NzO+PyygBvypfZ03XNsq53sCMONHLPRt9aX0SZQ2yTY=;
	b=DqCr9GKkqkeazqFX/UqFEzGDZtjhVYffmsp546Ap4BHBQ3knIa+2ofdbiFhKPZKFi2
	JkWCEfPx6sw7V5MO8oVjXrWYm2jF1ntmTgwwwD2+HBQjb+VPpYM6oyDp04MkJKnjeUb9
	j+aoP1KYwCxst90IwGOvtOBE6RRprWFe4xq0v+FchA6/YNuH2GO8lQy4WIshHTnMjrVI
	phHuVMdfpsdoOMyNmiB+8vkJHYHdr4vniz/avEQiL+NlOYcqlH8Fgdug0IPBxZxC+iWU
	NQZxK1AGEwm6xGAD0akGTR6PctAK1crUmx+moQkNeZBvV2VM29rm6GjWfDYNQ8f+eiXi
	ZKuA==
X-Received: by 10.14.29.69 with SMTP id h45mr9344290eea.127.1372987737490;
	Thu, 04 Jul 2013 18:28:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm9577441eex.17.2013.07.04.18.28.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:28:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:53 +0200
Message-Id: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/8] (lib)telepathy*: add missing dependency on libxslt-native
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
X-List-Received-Date: Fri, 05 Jul 2013 01:28:57 -0000

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
1.8.2.1



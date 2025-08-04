Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ABCC87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5176.1754337163559404652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D92A1E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D46613F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] dbus-glib: remove no-examples.patch
Date: Mon,  4 Aug 2025 20:52:33 +0100
Message-ID: <20250804195237.149379-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804195237.149379-1-ross.burton@arm.com>
References: <20250804195237.149379-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221439

This patch has been in OpenEmbedded since 2006 with no explanation[1].

Possibly the intention was to reduce build time slightly or remove some
breakage, but it's useful to link the library we're building against a
test binary.

[1] oe-classic cc5c376f17 ("dbus: add 0.90, dbus-glib and dbus-python bin=
dings 0.70")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../dbus/dbus-glib/no-examples.patch          | 23 -------------------
 meta/recipes-core/dbus/dbus-glib_0.114.bb     |  4 +---
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib/no-examples.patch

diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch b/meta/re=
cipes-core/dbus/dbus-glib/no-examples.patch
deleted file mode 100644
index 3e2fa41c59d..00000000000
--- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 8bb06c2f0929a4b878fd9abdb63c177a7c308b9d Mon Sep 17 00:00:00 2001
-From: Kevin Tian <kevin.tian@intel.com>
-Date: Tue, 21 Nov 2006 14:20:37 +0000
-Subject: [PATCH] Disable compiling examples
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Kevin Tian <kevin.tian@intel.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
----
- dbus/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus/Makefile.am b/dbus/Makefile.am
-index 2e8cb27..a86df30 100644
---- a/dbus/Makefile.am
-+++ b/dbus/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS =3D . examples
-+SUBDIRS =3D .
-=20
- AM_CPPFLAGS =3D \
- 	-I$(top_srcdir)						\
diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-cor=
e/dbus/dbus-glib_0.114.bb
index 4a827b1cbf8..cc15cafe495 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -15,9 +15,7 @@ SECTION =3D "base"
 DEPENDS =3D "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS:class-native =3D "glib-2.0-native dbus-native"
=20
-SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$=
{PV}.tar.gz \
-           file://no-examples.patch \
-"
+SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$=
{PV}.tar.gz"
 SRC_URI[sha256sum] =3D "c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814=
d61b5e8fc2827a7c"
=20
 inherit autotools pkgconfig gettext bash-completion gtk-doc
--=20
2.43.0



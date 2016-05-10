Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF71B73216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:22:10 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gh9so1230983pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=C2xk5zOEx6NVnsMuAwc1aNGxR4vo59KZr84XvY1YVNA=;
	b=ru/3IKWyBVMbyxfCJCmua4teeVhReur8iuXlBNTdRD/noauBkDhBI6hWHzloJN8U2c
	6JoB5GPs30Hu8/u3xVIg1iZVrfysV4BlNdEv8b/tI7q3kY4JzvhJkfy3eP+rQjLcsLWX
	uSnxqluz4CKJ4uta0Mq5fcpPY4m2dGv09gKfw3SUBXZ4kdHyJQmBfBis8/5ifO941GiD
	uo5uOOwKM68/VxS5uAjOxr5xQXqiwVXesEFLIBeIWNeXU83ltCHSIpszVknxgFib4Ozp
	11zaz/QMp6zS8Tg89pqCwDQK/BWKOY+odYJFg29GAiqSqCEbyYM/t+HuloNKXixaNqJw
	Ya6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C2xk5zOEx6NVnsMuAwc1aNGxR4vo59KZr84XvY1YVNA=;
	b=ZxF3yzO6ilY84RmTOMcktvPkXE9uIRiEMc/GDroMh3vKQ4yIgnXtsGYkIfr+7u9Wy9
	hzyPEOQh43xZLmoBQC0lkY8Ypmf8p4CZHS6kkCZJt/sZKU2r9byQQfip1rmZKi0epTQm
	t3Q2ZhzfB1FgVc46rFUxwy/rDZTUrIyp4tNO+IYq6Xos8ZCF6nLkfyTIGA3A8XbbRDy4
	X8PH0Txta5TVUpZk4ccz/wfNjRATHIGQIC263pcOHextinccUK9LOKJX+4hCVxdoZBB9
	8AnUuU7nZbmPQpqBufm6OeWngPhbcY8LNOX1gznb6JgtgVf15amk2fvesuKKCf4zOvEt
	Zjlw==
X-Gm-Message-State: AOPr4FVjpduIOZvUKv3JsYwIf8p8eo/Hh5BFwy0xUli8kfFCr/tu0a/qV0UGhdtWrZuIig==
X-Received: by 10.66.148.2 with SMTP id to2mr59876217pab.72.1462897331411;
	Tue, 10 May 2016 09:22:11 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40])
	by smtp.gmail.com with ESMTPSA id z9sm5594172pfa.84.2016.05.10.09.22.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:22:10 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:22:09 -0600
Message-Id: <1462897329-21485-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [master][PATCH v2] pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
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
X-List-Received-Date: Tue, 10 May 2016 16:22:11 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

glib patch is backported from glib-2.0 upstream
eventually we will throw it away once pkgconfig
moves to newer glib

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Move-warning-pragma-outside-of-function.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  6 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
new file mode 100644
index 0000000..14c8293
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
@@ -0,0 +1,39 @@
+From 946d36266d8a30f04fe34d3183bf4929141934d2 Mon Sep 17 00:00:00 2001
+From: coypu <coypu@sdf.org>
+Date: Wed, 2 Mar 2016 19:38:48 +0200
+Subject: [PATCH] gdate: Move warning pragma outside of function
+
+Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
+older versions of GCC, which don't allow pragma inside functions.
+
+https://bugzilla.gnome.org/761550
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ glib/glib/gdate.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/glib/glib/gdate.c b/glib/glib/gdate.c
+index 1978cf7..20e6c4a 100644
+--- a/glib/glib/gdate.c
++++ b/glib/glib/gdate.c
+@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
+  *
+  * Returns: number of characters written to the buffer, or 0 the buffer was too small
+  */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
++
+ gsize     
+ g_date_strftime (gchar       *s, 
+                  gsize        slen, 
+@@ -2549,3 +2552,5 @@ g_date_strftime (gchar       *s,
+   return retval;
+ #endif
+ }
++
++#pragma GCC diagnostic pop
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d34f608..f654eee 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -12,12 +12,13 @@ DEPENDS = "glib-2.0"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-SRCREV = "5914edfe9604abfedd220103cbac382fc4d268bb"
-PV = "0.29+git${SRCPV}"
+SRCREV = "87152c05be88ca8be71a3a563f275b3686d32c28"
+PV = "0.29.1+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
+           file://0001-gdate-Move-warning-pragma-outside-of-function.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -27,6 +28,7 @@ inherit autotools
 EXTRA_OECONF = "--without-internal-glib"
 EXTRA_OECONF_class-native = "--with-internal-glib"
 EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
+CFLAGS_append_class-native = " -Wno-error=format-nonliteral"
 
 acpaths = "-I ."
 
-- 
2.8.2



Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id A3EE66D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:13:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c12so17888618wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rRDjcMjUfFJL9xfz0TyDD6O9fssl89rkliuA+BErqxk=;
	b=Xc3tZmZJ509sgT0Q0CqtkMg6RHryAP+8fi4U/DmcZp8nuMg7nW0JYO1Os+VmoZmygh
	vsUL7dCMQsRu/mKSCRrrzKWQ0ByYJYvema6k65ryJXtxRrzWgBndCxEiZLxLv8y4Eqfg
	QZzFp7DwCarEMuH2vqyJbcxiSzA0GtFehcNsp3DObZhaYFnTiIHouHAv8npKs/3tLa5y
	NQ5r72cbhHyW6KiekmKXb1rgegqrJUe1w2cbhPbu4LFgsMfXV00YHWnMEQY9mcEvHzYl
	mE58YT7ldzDzK1U29AX34CoMuWRXrN+JlL3AJoFBBkQticq9H2GNqCynO10ggDpbL0m6
	hwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rRDjcMjUfFJL9xfz0TyDD6O9fssl89rkliuA+BErqxk=;
	b=YftDD22787Vi1gfAA07q8+07P47vcwyvDCBZOkmo8s3WOOrnzSgX1RqFqgx3Ln/ihk
	kxnNLaEFrRN0MuWYaSfFEjeiRUF5FALeeQEw+8DnnI+0wXi0BSCd/CudFnoTrk2FPNwo
	gzKHPYXMTEsN1WG4MFejrjrK+GsBdryuiNTM8vsWZSWWeHXtUseaQr1r5+na19Fz24sO
	1MLDdsmhyGMQgH32fUXduta52au6yEAATMpXovLysREsR0hBF2nW7GphiABh1rrJ2tl0
	iF3AYQvQccprgPu9K8V3iE/QrCyJOhO9d8PI+9q6IcG1ZL3rdQgThzFwYbvnT7Mutw7P
	bcmQ==
X-Gm-Message-State: APjAAAU1iiv0Pm60r2LVoo778xb/A143ufIFNgEmxtgWv9e7H7FdC7tR
	963UiI3bOe4/4UvcRgST3t7NYd1z
X-Google-Smtp-Source: APXvYqzF2xikAneYk01T5s7Bam9un9KcY7k7AhvkJ60FT5wSIwWJUxBN9Db+YAE/mjO4hHOyf5F9Ug==
X-Received: by 2002:a5d:6542:: with SMTP id z2mr17529314wrv.217.1556097210022; 
	Wed, 24 Apr 2019 02:13:30 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D0346D2B854BA6962495.dip0.t-ipconnect.de.
	[2003:f0:7f06:d034:6d2b:854b:a696:2495])
	by smtp.gmail.com with ESMTPSA id
	a17sm9350435wrm.53.2019.04.24.02.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 02:13:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 11:13:18 +0200
Message-Id: <20190424091318.18154-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Wed, 24 Apr 2019 09:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* license: COPYING was replaced by COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
* prettify recipe a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

V1 -> V2: Fix build with musl

 ...EXITCODE-macro-for-non-glibc-systems.patch | 59 +++++++++++++++++++
 .../vte/{vte_0.52.2.bb => vte_0.56.1.bb}      | 19 ++++--
 2 files changed, 72 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
 rename meta/recipes-support/vte/{vte_0.52.2.bb => vte_0.56.1.bb} (75%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
new file mode 100644
index 0000000000..0ffd92b4ba
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -0,0 +1,59 @@
+From f78988d3bb5929c857e788a86c7919d6a4ffacc9 Mon Sep 17 00:00:00 2001
+From: Danilo Spinella <danyspin97@protonmail.com>
+Date: Thu, 21 Mar 2019 14:19:26 +0100
+Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
+
+Upstream-Status: Submitted [1]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
+[1] https://gitlab.gnome.org/GNOME/vte/issues/72
+
+---
+ src/missing.hh | 21 +++++++++++++++++++++
+ src/widget.cc  |  1 +
+ 2 files changed, 22 insertions(+)
+ create mode 100644 src/missing.hh
+
+diff --git a/src/missing.hh b/src/missing.hh
+new file mode 100644
+index 00000000..1baa993d
+--- /dev/null
++++ b/src/missing.hh
+@@ -0,0 +1,21 @@
++/* Copyright 2019 Danilo Spinella
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 3 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifndef W_EXITCODE
++#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
++#endif
++
+diff --git a/src/widget.cc b/src/widget.cc
+index 331ddba9..555a4adf 100644
+--- a/src/widget.cc
++++ b/src/widget.cc
+@@ -21,6 +21,7 @@
+ #include "widget.hh"
+ 
+ #include <sys/wait.h> // for W_EXITCODE
++#include "missing.hh" // for W_EXITCODE on non-glibc systems
+ 
+ #include <new>
+ #include <string>
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.56.1.bb
similarity index 75%
rename from meta/recipes-support/vte/vte_0.52.2.bb
rename to meta/recipes-support/vte/vte_0.56.1.bb
index 272ae66f13..02b84c38d9 100644
--- a/meta/recipes-support/vte/vte_0.52.2.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -1,9 +1,15 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPLv2.1+"
-DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
+LICENSE = "GPLv3 & LGPLv2.1+"
+LICENSE_libvte = "LGPLv2.1+"
+
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
+    file://COPYING.LGPL2;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24 \
+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
 
 inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 
@@ -11,9 +17,10 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
            file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
+           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
-SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
+SRC_URI[archive.md5sum] = "a8984cd5a101dbff0b0c875d1de3f692"
+SRC_URI[archive.sha256sum] = "02fa8ecc02a9332e47f486795494527b5687b3bd448e73e6b67285f2f326dc7c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -27,7 +34,7 @@ export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
 # Help g-ir-scanner find the .so for linking
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
 }
 
 # Package additional files
-- 
2.20.1



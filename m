Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3F97F870
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n9so3866809wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q0ilm579wQsw6Zy9J4fq42CDMGCImGR9jIf6kaXYP3Q=;
	b=qqVTQWDFDSH7DmflBjkRwl7Oy95qNS9r9H25p8ljgIHq3V49kt75bHyf6m577kl89W
	czdtwlxzaNEGlxEY5hPxDxpc4y2RdTxSz1K7Mm4rgA6LKQy5Lac76gAO54VkgSciGGiA
	zZPKQKUfyfCHz7plV+5YImHMl2apFIF8OWTb54g1LKysBRyT+tMyspcRBPCXj9zf1kB1
	QGUxXwvAU3A8zgFms7m6I3mmBMUW236L7RHOZeB5DgHwfDwJz2xiwl7NCOaF99Ofh+Gv
	5BJtmmjPiJCv4sTU/ZQ1DX6B+tGTX+BicJvvCVYBIqRyva1wXZbhQwL7SuqNzfWeQ8uV
	vaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q0ilm579wQsw6Zy9J4fq42CDMGCImGR9jIf6kaXYP3Q=;
	b=ltYRKhsXO5dDR0+GP9yS4rS1k47LixiCRgT13UH2yYmM5nZhFv4wdCMT4qQNmNe9Hg
	GkHwY2/RhUwEJZK7C9S5nMAi1T4XPwGh12jeFmlrlyVm80aAVUZSCTZh3hc+Pnn/nXVf
	RfVBEVjzwIJxtERJ9Oerdl3JD1kM6CM6hyuVZnrAtRM6LK9p5fj/mTlKzBVSBC6Q0UaL
	n0tkDnqWd92Fo6gwne+o8Jvppe667r7fK0Bj3Tz8g+8PEX+cx4hTGwopLJFgig08IAy2
	rehrW0CYrZUbXy361brJy9itgEFmIn4nujT5gBdTe0uRbW+8J7k/DeJmrzwBRbRa360X
	3DkQ==
X-Gm-Message-State: APjAAAXycUdCxHvwqTAqI5cs+2gvskIZLRQOWOTW6dZNr7s0+t1sSLdR
	qW/UGqc9MpRvzoXrn54FmB6oo3Sz
X-Google-Smtp-Source: APXvYqxzu/3V+S6Rxdk5yrtFJJTI+cbGVB1PcxNrKKIEG94ebbifNnFqJ6VpgAjLR9JALx9TLky3Ig==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr5990012wmo.13.1575560652468; 
	Thu, 05 Dec 2019 07:44:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:43 +0100
Message-Id: <20191205154357.121346-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/24] kbd: update to 2.2.0
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:12 -0000

Rebase set-proper-path-of-resources.patch

Add a patch to address a string format error; as it modifies
a .l file, add a dependency on flex which is processing that into
C source code.

License-Update: file with copyright statements was replaced with original GPLv2 text
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-analyze.l-add-missing-string-format.patch | 24 ++++++++
 .../kbd/set-proper-path-of-resources.patch    | 57 ++++++++++++-------
 .../kbd/{kbd_2.0.4.bb => kbd_2.2.0.bb}        | 11 ++--
 3 files changed, 66 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
 rename meta/recipes-core/kbd/{kbd_2.0.4.bb => kbd_2.2.0.bb} (86%)

diff --git a/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch b/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
new file mode 100644
index 00000000000..8916fd9f5ee
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0001-analyze.l-add-missing-string-format.patch
@@ -0,0 +1,24 @@
+From dc6bf2ae0835c6569b270e8e1f26a3173f3927d9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 4 Dec 2019 13:14:01 +0100
+Subject: [PATCH] analyze.l: add missing string format
+
+Upstream-Status: Submitted [https://github.com/legionus/kbd/pull/35]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/libkeymap/analyze.l | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libkeymap/analyze.l b/src/libkeymap/analyze.l
+index e32ace6..de62f46 100644
+--- a/src/libkeymap/analyze.l
++++ b/src/libkeymap/analyze.l
+@@ -463,7 +463,7 @@ To                      to|To|TO
+ 
+ 					strerror_r(errno, buf, sizeof(buf));
+ 
+-					ERR(yyextra, buf);
++					ERR(yyextra, "%s", buf);
+ 					return(ERROR);
+ 				}
+ 
diff --git a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
index a9a3ab8abfb..5872cef36b7 100644
--- a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
+++ b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
@@ -1,3 +1,8 @@
+From 7f953dd689155bc1224a3369205c310bb5b760a7 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 30 Sep 2016 16:49:55 +0800
+Subject: [PATCH] kbd: create ptest sub-package
+
 Upstream-Status: Inappropriate [embedded specific]
 
 kbd is out of source built, then the value of $(srcdir) is relative path of
@@ -13,38 +18,46 @@ run as expected.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
-Index: kbd-2.0.4/tests/Makefile.am
-===================================================================
---- kbd-2.0.4.orig/tests/Makefile.am
-+++ kbd-2.0.4/tests/Makefile.am
-@@ -1,7 +1,7 @@
- AM_CPPFLAGS = \
- 	-I$(srcdir)/../src/libkeymap \
+---
+ tests/Makefile.am           | 2 +-
+ tests/alt-is-meta.in        | 6 ++----
+ tests/dumpkeys-fulltable.in | 2 +-
+ 3 files changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f32b9aa..973cd26 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -7,7 +7,7 @@ AM_CPPFLAGS = \
  	-I$(builddir)/../src/libkeymap \
--	-DDATADIR=\"$(srcdir)\" -DBUILDDIR=\"$(builddir)\"
-+	-DDATADIR=\".\" -DBUILDDIR=\"$(builddir)\"
+ 	-I$(srcdir)/../src/libkbdfile \
+ 	-I$(builddir)/../src/libkbdfile \
+-	-DDATADIR=\"$(srcdir)\" \
++	-DDATADIR=\".\" \
+ 	-DABS_DATADIR=\"$(realpath $(srcdir))\" \
+ 	-DBUILDDIR=\"$(builddir)\"
  
- AM_CFLAGS = $(CHECK_CFLAGS)
- LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS) @INTLLIBS@
-Index: kbd-2.0.4/tests/alt-is-meta.in
-===================================================================
---- kbd-2.0.4.orig/tests/alt-is-meta.in
-+++ kbd-2.0.4/tests/alt-is-meta.in
-@@ -7,8 +7,8 @@ cd "$cwd"
+diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
+index 3a1441f..772fb51 100755
+--- a/tests/alt-is-meta.in
++++ b/tests/alt-is-meta.in
+@@ -7,10 +7,8 @@ cd "$cwd"
  rc=0
  temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
  
--./libkeymap-showmaps "@DATADIR@"/alt-is-meta.map > "$temp" || rc=$?
--cmp -s "@DATADIR@//alt-is-meta.output" "$temp" || rc=$?
+-datadir="@DATADIR@/data/alt-is-meta"
+-
+-./libkeymap-showmaps "$datadir"/alt-is-meta.map > "$temp" || rc=$?
+-cmp -s "$datadir/alt-is-meta.output" "$temp" || rc=$?
 +./libkeymap-showmaps ./alt-is-meta.map > "$temp" || rc=$?
 +cmp -s "./alt-is-meta.output" "$temp" || rc=$?
  
  if [ "$rc" != 0 ]; then
  	printf 'failed\n'
-Index: kbd-2.0.4/tests/dumpkeys-fulltable.in
-===================================================================
---- kbd-2.0.4.orig/tests/dumpkeys-fulltable.in
-+++ kbd-2.0.4/tests/dumpkeys-fulltable.in
+diff --git a/tests/dumpkeys-fulltable.in b/tests/dumpkeys-fulltable.in
+index a3a5ece..67a73ef 100755
+--- a/tests/dumpkeys-fulltable.in
++++ b/tests/dumpkeys-fulltable.in
 @@ -5,7 +5,7 @@ cwd="$(readlink -ev "${0%/*}")"
  cd "$cwd"
  
diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
similarity index 86%
rename from meta/recipes-core/kbd/kbd_2.0.4.bb
rename to meta/recipes-core/kbd/kbd_2.2.0.bb
index 4af3256fff0..9556302ab51 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -2,10 +2,12 @@ SUMMARY = "Keytable files and keyboard utilities"
 HOMEPAGE = "http://www.kbd-project.org/"
 # everything minus console-fonts is GPLv2+
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a5fcc36121d93e1f69d96a313078c8b5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 inherit autotools gettext ptest pkgconfig
 
+DEPENDS += "flex-native"
+
 RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
@@ -13,10 +15,11 @@ RCONFLICTS_${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
-          "
+           file://0001-analyze.l-add-missing-string-format.patch \
+           "
 
-SRC_URI[md5sum] = "c1635a5a83b63aca7f97a3eab39ebaa6"
-SRC_URI[sha256sum] = "5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88"
+SRC_URI[md5sum] = "d1d7ae0b5fb875dc082731e09cd0c8bc"
+SRC_URI[sha256sum] = "21a1bc5f6fb3b18ce9fdd717e4533368060a3182a39c7155eaf7ec0f5f83e9f7"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests','', d)} \
-- 
2.17.1



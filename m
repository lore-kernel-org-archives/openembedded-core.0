Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA60C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 14:06:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.36640.1752329213159606371
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 07:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1eorlGf;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45610582d07so378215e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752329211; x=1752934011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+qgmF78uARYF37RrZWewCviHFeo+qjdQ3SeHKWScck=;
        b=G1eorlGfty7hgsCli55xFsrt2sK43pDneOAdvhMF3xLqjYeWbLFtidfvzP1RWlqKNN
         N+fkaOeVn0rdZjKNv11BRE8ytV+5SN0N8LvHaQO96EAON9ejGo0VA1U04eg+I1SlZES4
         Z16DMtDmFssUU+gpO+0I3K/CudPAbnLjOqUB9GMJd6CRRedAlaBmAh0G9LRZ5rxKvsDv
         1xVgKRrzs9zzHnQpGYkxbThUYO/wMb+NsD4yBPLdxpsKh2lrONYiRX6DGNC9+kBRxTTO
         jTECVTYcP/Ar08pjlNRXonKJOmwNE2b9oNyA0wIMT57ovuntCxS6rzqQQ7hJJFrXEqDf
         4BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752329211; x=1752934011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+qgmF78uARYF37RrZWewCviHFeo+qjdQ3SeHKWScck=;
        b=iVer6I30G94+NUeDIL7Y/NRoQIFleBedjxw5cLulModk/ersSO5FBUfyzfScOrqv/v
         XMrajwqfcI1M7VbA6OKmWc1HvxKBXLn1UeT5oIvRzKDxqE42RO03BOFA3Hfko9VBONFL
         l3ZlUI9gLROtzWrpVYO/q9HeRCxEokUwh1f/KBz/+QChq1KA+rP93zQyWN1I4sdGJz4K
         k9aTlGPpPEy5AEJQnGjgCKrS65qeEcp6woUV7prNL4EU7WCMCWiflZkkF1OaxPKLSo/H
         wquXC7BPDViwWtKqf+u5Gv2EQ9xffcq5dJre1LRoE4FNYl6/3Ha9znhLmxek5k2XlfmQ
         vHsg==
X-Gm-Message-State: AOJu0YxiTEeKWh+W4DRBUxSxjU326VTZcZMc8fo9ISw7FvCdLPMAeZIB
	gFFynV3HSvmb921ekucHaT7LL4HtkBAktD/lf7GrmZzQWjnuFiJS0bQMvV/pbA==
X-Gm-Gg: ASbGncudJRgatgqJohFFBXSdvT6U9ea9DP40OfXAqaFyt9zxqd0u/EjeKexRjNgpR3I
	UmkppGGH6YGzS83FSav9WekqETwgekKjE7oGHS/MTMktqFwQjyiRqVckMQX7brbirwxcCVTkm9Q
	Y/G/HPCCVjacDy0edCa4mXsleNsJupUqZ6K9xKSlsF7XmC3t35ThF26hDxk3LLBYSORMy3snOiz
	+w/Y7rmF/7nx4y8PHvxLQ2QLN68DBVpx+NM8trVnOfWmcIqGCaKFRsw6RCUIOZB+FInLhbMaH6M
	FvdxpLNym1riENcioHowc6nHoA7rGyEjUxKh9JLDg8vAijr4gZUrSjNnOGmXuUVDeEMX0XFNZYf
	cwFG9cQo8c/oVku6cxKrLQr841TUlWp+TMdyrHvd7BDuf9/M=
X-Google-Smtp-Source: AGHT+IEPvuR0erRey6lwioiThmB4SM8Ec8mXnmGz/2GyW4Hk8XnXNRKg7+FmppC5R0pOlY0ENqyKKg==
X-Received: by 2002:a05:600c:1c29:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-454ec11fc7emr70611375e9.0.1752329210656;
        Sat, 12 Jul 2025 07:06:50 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1a15sm7265726f8f.6.2025.07.12.07.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 07:06:48 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
Date: Sat, 12 Jul 2025 14:06:38 +0000
Message-ID: <20250712140638.3099109-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 14:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220190

This update includes major change in how it is built.
Instead of autotools, autosetup is used.

Autosetup (https://msteveb.github.io/autosetup/) claims to be
* Replacement for autoconf in many situations
However it also claims NOT to
* Intended to replace all possible uses of autoconf
This means that some autoconf features are not available.

Recipe changes:
* stop inheriting autotools and define B, do_configure and do_install
* depend on zlib unconditionally, autoconf cannot be preconfigured in
  similar way as autotools
* update packageconfig options to match new syntax
* libedit is detected with ncurses linking options (as seen in
  do_configure log)
* backport rpaths fix
* define soname to avoid file-rdeps QA error due to wrong library name
* add hack to force cross-compilation in native case to link against
  zlib in sysroot and thus avoid crashes when sstate-cache from different
  distro is used
* clean B for do_configure as the new Makefiles do not seem to properly
  retrigger build if configuration changes

Kudos to Peter Marko for the initial work on upgrading SQLite

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 43 ++++++++++---
 ...rpath-configure-script-flag-to-addre.patch | 60 +++++++++++++++++++
 .../{sqlite3_3.48.0.bb => sqlite3_3.50.2.bb}  |  4 +-
 3 files changed, 98 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.2.bb} (53%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae..3251d310fb 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -14,34 +14,37 @@ def sqlite_download_version(d):
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
 S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
+B = "${WORKDIR}/build"
 
-UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
+UPSTREAM_CHECK_URI = "https://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit autotools pkgconfig siteinfo
+inherit pkgconfig siteinfo
+
+# zlib is autodetected and gets to sysroots as transitive dependency, make this deterministic
+DEPENDS = "zlib"
 
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
 PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
 
-PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
-PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
+PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${includedir}/readline/readline.h,--disable-readline,readline ncurses"
 PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
-PACKAGECONFIG[zlib] = ",,zlib"
-
-CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
+PACKAGECONFIG[dyn_ext] = "--enable-load-extension,--disable-load-extension"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
+    --disable-rpath \
     --disable-static-shell \
+    --soname=${PV} \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -65,4 +68,28 @@ FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 AUTO_LIBNAME_PKGS = "${MLPREFIX}lib${BPN}"
 
+do_configure() {
+    ${S}/configure \
+        --build=${BUILD_SYS} \
+        --host=${TARGET_SYS} \
+        --prefix=${prefix} \
+        --bindir=${bindir} \
+        --libdir=${libdir} \
+        --includedir=${includedir} \
+        --mandir=${mandir} \
+        ${EXTRA_OECONF} \
+        ${PACKAGECONFIG_CONFARGS}
+}
+do_configure[cleandirs] = "${B}"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+
+    # binaries are stripped during installation when not cross-compiling, take the unstripped ones instead
+    if [ "${BUILD_SYS}" = "${TARGET_SYS}" ]; then
+        install -m 0644 ${B}/sqlite3 ${D}${bindir}
+        install -m 0644 ${B}/libsqlite3.so ${D}${libdir}/libsqlite3.so.${PV}
+    fi
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
new file mode 100644
index 0000000000..9625b3045d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
@@ -0,0 +1,60 @@
+From 509f5574267c8353a10ff81e96d8393248810b80 Mon Sep 17 00:00:00 2001
+From: stephan <stephan@noemail.net>
+Date: Sun, 22 Jun 2025 22:48:11 +0000
+Subject: [PATCH] Add the --disable-rpath configure script flag to address
+ [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
+
+FossilOrigin-Name: a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912644b89366c5
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/87c807c6dd4df67328919fa28e89a06839e634fe]
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ autosetup/sqlite-config.tcl | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 85fe414382..8409dbdd81 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
++
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
+   # for which sqlite-env-is-unix-on-windows returns a non-empty
+   # string.
+ 
+-#  if {[proj-opt-truthy rpath]} {
+-#    proj-check-rpath
+-#  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
+-#  }
++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
++  if {[proj-opt-truthy rpath]} {
++    proj-check-rpath
++  } else {
++    msg-result "Disabling use of rpath."
++    define LDFLAGS_RPATH ""
++  }
+ }
+ 
+ ########################################################################
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.2.bb
similarity index 53%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.2.bb
index bd2ac6614d..abb54e839b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.2.bb
@@ -4,5 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "84a616ffd31738e4590b65babb3a9e1ef9370f3638e36db220ee0e73f8ad2156"
+
+SRC_URI += "file://0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch"
 
-- 
2.43.0



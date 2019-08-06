Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 123687F3D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 22:08:00 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x1so39449668wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 15:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OPmH91RRBVB1d3aK52uIiMJcuoAGYCKBdQ/AoAUcN5Q=;
	b=V6aXjzBWA7L+0cTzpkYGrxJx+AGFkJZs/6mci+qU5YLVgeSEGVHUW2esfOhazm8N15
	Ue+S2OUVyC0kjqtKXw6tmk1EQT+V0IVTT3J8A9pLgdRVvUURcb7tk58BwnZefFEYAGKj
	Difhxq4dR4ma+spHDv6Am2eTdAHDOrnfmzIDPqBiiIknBVthT9Yy8b2Tvda5szf0kLaT
	5P1apT27l5xDTECNLP85M8mgNj/rSvw16qElNWrTvk/Q+HjKiUJEEePiwh4A3qSkwUZv
	qj9Ykou5x/0fg7ftd4n8GaGv25Tx83GB4QL3kHy8Nsl9lBVZAnplWc557Yazdmhgp07I
	1W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OPmH91RRBVB1d3aK52uIiMJcuoAGYCKBdQ/AoAUcN5Q=;
	b=TzXtDw+QP7n7dOfip/oU4lENx20dOAkZglCOfsZQOJOHZ6w8/P6S1LUC4MmVgxMBHi
	xbyogyJ+Oqu9MztFSKGqGBhd9GLiaqebth8bzGpm0lzfXoeiyb9166t826oMCzmSRTRf
	Uy//DyZ0aefAHaF+IYZmwZIqVX0QLhiguSGcGyTS/RZ61oIogmO5HO0XQyxzvo96UFhC
	XJ4Y8JQqcBxU1F6yW/RaW2/edLFocy0x7N5ngDcoHaxCDX0fkqqg/BLt14OwuZxGlDnI
	Xgmf+sEFOWQF1Y6/lPap8hArFkbOUOT5sYYO8hQU4IQ73+13vcD4LjWwjPbQxhSeXbf9
	Z4fw==
X-Gm-Message-State: APjAAAVE70bCI0xClQvjMHuA1F5ksQL0JFJkyN6aQhJe/bYBTbhq9Ljo
	alTsL7j/Mw3mPJ8Eg91fFj9XodP+aXg=
X-Google-Smtp-Source: APXvYqw7APK/AW/5nGk2eImHk7+U0HyEMhWZlhb8QegvUnMbSqc7pt++DpK9xh7kpiJ/+eEq9b3h9g==
X-Received: by 2002:adf:b612:: with SMTP id f18mr6638739wre.97.1565129281368; 
	Tue, 06 Aug 2019 15:08:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm77443588wrw.2.2019.08.06.15.07.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 15:07:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 23:07:56 +0100
Message-Id: <20190806220756.30214-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libx11: replace libtool patch with upstreamed patch
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
X-List-Received-Date: Tue, 06 Aug 2019 22:08:01 -0000
Content-Transfer-Encoding: 8bit

After iterating with upstream, this is the patch that landed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc     |  2 +-
 .../xorg-lib/libx11/fix-libtool.patch         | 35 ---------------
 .../xorg-lib/libx11/no-host-libtool.patch     | 45 +++++++++++++++++++
 3 files changed, 46 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 994c33a8efc..cce0cb9929b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-            file://fix-libtool.patch \
+            file://no-host-libtool.patch \
             file://no-host-x.patch"
 
 SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
deleted file mode 100644
index 678b7aff445..00000000000
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Passing -all-static to libtool is done to avoid libtool wrappers on Windows, but
-it means that the build host needs to have libc.a installed.  This isn't the
-case for a lot of distributions out of the box, so revert this commit.
-
-Filed a bug upstream to get a proper fix: https://gitlab.freedesktop.org/xorg/lib/libx11/issues/100
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b9f74dc5e714115057a5a1789b4de202d6f58547 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 2 Aug 2019 00:39:39 +0100
-Subject: [PATCH 2/2] Revert "Avoid using libtool wrapper for makekeys"
-
-This reverts commit 4645e219133458781e3fb48eaea6a74cccb1b9aa.
----
- src/util/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util/Makefile.am b/src/util/Makefile.am
-index 37314370..a051567a 100644
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -10,7 +10,7 @@ AM_CPPFLAGS = \
- CC = @CC_FOR_BUILD@
- CPPFLAGS = @CPPFLAGS_FOR_BUILD@
- CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
- LIBS =
- EXEEXT = @EXEEXT_FOR_BUILD@
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch b/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch
new file mode 100644
index 00000000000..56d9983b13f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/merge_requests/22]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From edc7680ed5a03cedb5facf14693823455e12c29c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 6 Aug 2019 14:53:43 +0100
+Subject: [PATCH libX11] src/util/Makefile: explicitly reset LINK to not use
+ libtool
+
+Simply looking at libtool redefines LINK globally to use libtool, which when
+you're trying to cross-compile to Windows can cause complications.
+
+As in src/util/ we're simply building a small binary for the build host, reset
+LINK to the automake default so that the traditional compile/link steps occur
+without libtool.
+
+Also remove -all-static from LDFLAGS as that is a libtool-specific argument
+intended to solve this problem.
+
+Closes: #100
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/util/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am
+index 37314370..b7236530 100644
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -7,10 +7,11 @@ AM_CFLAGS = \
+ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/include
+ 
++LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ CC = @CC_FOR_BUILD@
+ CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+ CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
++LDFLAGS = @LDFLAGS_FOR_BUILD@
+ LIBS =
+ EXEEXT = @EXEEXT_FOR_BUILD@
+ 
+-- 
+2.20.1
+
-- 
2.20.1



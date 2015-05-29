Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4255B75775
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:32:22 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so20184937igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=q9JFjIOoMD1tjnL2e7fXksFSpnVqCaTDxE/JwMfdW/k=;
	b=D9FMm7tYDhAuIzn8VnuKRoRCduG0bF9gCl31XZhUVhWkAkdOW+dTOB1EgxpMovxUF/
	bND1RCY8SpOXDqqC+jACVCU6PF+r0kUlDeIneLswMyORr9xO1JwzGNjRA0UhM2IVOtAD
	t63Cni/Lroug/j0Y+um2QNHfu/6vvE/LlXvI0VO8X0r1D5p6WpvNsJgI9gJ0Bzphc5BT
	q6FAXSO3EjxFrR3Zkl8zWji1OGRKAT1tCpvtI0CAEw5NfiYUszuIwAlJtmEwJJnHAUmg
	VFfn1uDECBOKviGr0DPckuXf42iWO9lV2E4GBfzDbBdlfglTwq2KpuobLIwXasLcXD29
	N1oA==
X-Received: by 10.50.61.229 with SMTP id t5mr5481629igr.34.1432920743609;
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm4628876ion.5.2015.05.29.10.32.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:32:15 -0700
Message-Id: <a671cd0997d0269f054f9e2967b538a02c3373cc.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
References: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] gdb: Minor upgrade to 7.9.1
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
X-List-Received-Date: Fri, 29 May 2015 17:32:24 -0000

Drop backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-7.9.inc => gdb-7.9.1.inc}             |  4 +-
 ...canadian_7.9.bb => gdb-cross-canadian_7.9.1.bb} |  0
 .../gdb/{gdb-cross_7.9.bb => gdb-cross_7.9.1.bb}   |  0
 meta/recipes-devtools/gdb/gdb.inc                  |  1 -
 ...0001-make-man-install-relative-to-DESTDIR.patch |  2 +-
 .../gdb/gdb/0002-Change-order-of-CFLAGS.patch      |  2 +-
 ...d-support-for-Renesas-SH-sh4-architecture.patch |  2 +-
 .../gdb/0004-Change-comment-in-gdb-compile.patch   | 48 ----------------------
 .../gdb/{gdb_7.9.bb => gdb_7.9.1.bb}               |  0
 9 files changed, 5 insertions(+), 54 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.9.inc => gdb-7.9.1.inc} (68%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.9.bb => gdb-cross-canadian_7.9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.9.bb => gdb-cross_7.9.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
 rename meta/recipes-devtools/gdb/{gdb_7.9.bb => gdb_7.9.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.9.inc b/meta/recipes-devtools/gdb/gdb-7.9.1.inc
similarity index 68%
rename from meta/recipes-devtools/gdb/gdb-7.9.inc
rename to meta/recipes-devtools/gdb/gdb-7.9.1.inc
index 6d5eecb..1ca95af 100644
--- a/meta/recipes-devtools/gdb/gdb-7.9.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.9.1.inc
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
-SRC_URI[md5sum] = "8f8ced422fe462a00e0135a643544f17"
-SRC_URI[sha256sum] = "d282508cb7df0cb8b2cf659032ce1bede7b5725796e3ac90f3cd9d65844a65f2"
+SRC_URI[md5sum] = "f3b97de919a9dba84490b2e076ec4cb0"
+SRC_URI[sha256sum] = "4994ad986726ac4128a6f1bd8020cd672e9a92aa76b80736563ef992992764ef"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.9.bb b/meta/recipes-devtools/gdb/gdb-cross_7.9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.9.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.9.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index e65af4b..5466a7d 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -4,7 +4,6 @@ inherit gettext
 
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
-            file://0004-Change-comment-in-gdb-compile.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index e0221af..6996c18 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,4 +1,4 @@
-From d3ec939b82be23e7c9534cdc7502645f6c5856d1 Mon Sep 17 00:00:00 2001
+From 12b0506951460c3cc37d775478d024db3f95e9d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
 Subject: [PATCH 1/3] make man install relative to DESTDIR
diff --git a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
index 26a34d3..bccb45f 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 0dcb0a8b139b44ae84e8fd8ff8130cbbb52e444d Mon Sep 17 00:00:00 2001
+From 262ccc4fdb2a3df0f16c61a807046964ae7729c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:29:23 +0000
 Subject: [PATCH 2/3] Change order of CFLAGS
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
index d82d269..4a3e22c 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,4 +1,4 @@
-From 4e5507488068b3ea2ebf9c84c6c192c7bfd3be82 Mon Sep 17 00:00:00 2001
+From 407cb13cfb70697f45dfb761304e005e1ecbd0e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
 Subject: [PATCH 3/3] Add support for Renesas SH (sh4) architecture.
diff --git a/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch b/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
deleted file mode 100644
index 4df552c..0000000
--- a/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Backport
-
-From 09de64b93c2402e068daf0bce1c4a1dda833b646 Mon Sep 17 00:00:00 2001
-From: Jan Kratochvil <jan.kratochvil@redhat.com>
-Date: Thu, 26 Feb 2015 11:52:28 +0100
-Subject: [PATCH] Change // comment in gdb/compile/
-
-gdb/ChangeLog
-2015-02-26  Jan Kratochvil  <jan.kratochvil@redhat.com>
-
-	PR build/18033
-	* compile/compile-c-support.c (c_compute_program): Change // comment.
-	* compile/compile-object-load.c (setup_sections): Change // comment.
----
- gdb/ChangeLog                     | 6 ++++++
- gdb/compile/compile-c-support.c   | 2 +-
- gdb/compile/compile-object-load.c | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/compile/compile-c-support.c b/gdb/compile/compile-c-support.c
-index 8f1f45d..1711cda 100644
---- a/gdb/compile/compile-c-support.c
-+++ b/gdb/compile/compile-c-support.c
-@@ -351,7 +351,7 @@ c_compute_program (struct compile_instance *inst,
- 			" __gdb_intptr;\n",
- 			buf);
- 
--      // Iterate all log2 sizes in bytes supported by c_get_mode_for_size.
-+      /* Iterate all log2 sizes in bytes supported by c_get_mode_for_size.  */
-       for (i = 0; i < 4; ++i)
- 	{
- 	  const char *mode = c_get_mode_for_size (1 << i);
-diff --git a/gdb/compile/compile-object-load.c b/gdb/compile/compile-object-load.c
-index 5903f18..e187970 100644
---- a/gdb/compile/compile-object-load.c
-+++ b/gdb/compile/compile-object-load.c
-@@ -67,7 +67,7 @@ setup_sections (bfd *abfd, asection *sect, void *data_voidp)
-       if ((bfd_get_section_flags (abfd, sect) & SEC_ALLOC) == 0)
- 	return;
- 
--      // Make the memory always readable.
-+      /* Make the memory always readable.  */
-       prot = GDB_MMAP_PROT_READ;
-       if ((bfd_get_section_flags (abfd, sect) & SEC_READONLY) == 0)
- 	prot |= GDB_MMAP_PROT_WRITE;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/gdb/gdb_7.9.bb b/meta/recipes-devtools/gdb/gdb_7.9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.9.bb
rename to meta/recipes-devtools/gdb/gdb_7.9.1.bb
-- 
2.1.4



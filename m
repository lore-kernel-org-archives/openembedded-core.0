Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.871.1608060224705998741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 98BEE38C14CD
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libaio: upgrading to 0.3.112 SUCCEEDED
Message-ID: <MADEUP.1650FA4134B77BF3.26179@lists.openembedded.org>
X-Groupsio-MsgNum: 145688
Content-Type: multipart/mixed; boundary="===============1965008376056913940=="

--===============1965008376056913940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libaio* to *0.3.112* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libaio-upgrade-0.3.111-0.3.112.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1965008376056913940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libaio: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio: SRC_URI changed from "git://pagure.io/libaio.git;protocol=https file://00_arches.patch file://destdir.patch file://libaio_fix_for_mips_syscalls.patch file://system-linkage.patch" to "git://pagure.io/libaio.git;protocol=https file://00_arches.patch file://libaio_fix_for_mips_syscalls.patch file://system-linkage.patch"
packages/core2-32-poky-linux/libaio/libaio-dbg: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-dbg: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-dbg: PKGSIZE changed from 18312 to 21288 (+16%)
packages/core2-32-poky-linux/libaio/libaio-dev: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-dev: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-dev: PKGSIZE changed from 8980 to 8952 (-0%)
packages/core2-32-poky-linux/libaio/libaio-doc: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-doc: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-locale: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-locale: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-src: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-src: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-src: PKGSIZE changed from 21164 to 23817 (+13%)
packages/core2-32-poky-linux/libaio/libaio-staticdev: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio-staticdev: PV changed from "0.3.111" to "0.3.112"
packages/core2-32-poky-linux/libaio/libaio-staticdev: PKGSIZE changed from 38074 to 43636 (+15%)
packages/core2-32-poky-linux/libaio/libaio: PKGV changed from 0.3.111 [default] to 0.3.112 [default]
packages/core2-32-poky-linux/libaio/libaio: PV changed from "0.3.111" to "0.3.112"

--===============1965008376056913940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libaio/libaio-dbg: PKGSIZE changed from 18312 to 21288 (+16%)
packages/core2-32-poky-linux/libaio/libaio-src: PKGSIZE changed from 21164 to 23817 (+13%)
packages/core2-32-poky-linux/libaio/libaio-staticdev: PKGSIZE changed from 38074 to 43636 (+15%)

--===============1965008376056913940==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libaio-upgrade-0.3.111-0.3.112.patch"

From 110c6e034a8cb383ff59d1caed58b092949a063d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 08:40:54 +0000
Subject: [PATCH] libaio: upgrade 0.3.111 -> 0.3.112

---
 .../libaio/libaio/destdir.patch               | 17 -------------
 .../libaio/libaio/system-linkage.patch        | 24 +++++++------------
 .../{libaio_0.3.111.bb => libaio_0.3.112.bb}  |  3 +--
 3 files changed, 10 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/libaio/libaio/destdir.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.111.bb => libaio_0.3.112.bb} (88%)

diff --git a/meta/recipes-extended/libaio/libaio/destdir.patch b/meta/recipes-extended/libaio/libaio/destdir.patch
deleted file mode 100644
index 0f90406bee..0000000000
--- a/meta/recipes-extended/libaio/libaio/destdir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-from openembedded, added by Qing He <qing.he@intel.com>
-
-Index: libaio-0.3.110/Makefile
-===================================================================
---- libaio-0.3.110.orig/Makefile
-+++ libaio-0.3.110/Makefile
-@@ -15,7 +15,7 @@ all:
- 	@$(MAKE) -C src
- 
- install:
--	@$(MAKE) -C src install prefix=$(prefix) includedir=$(includedir) libdir=$(libdir)
-+	@$(MAKE) -C src install prefix=$(DESTDIR)$(prefix) includedir=$(DESTDIR)$(includedir) libdir=$(DESTDIR)$(libdir)
- 
- check:
- 	@$(MAKE) -C harness check
diff --git a/meta/recipes-extended/libaio/libaio/system-linkage.patch b/meta/recipes-extended/libaio/libaio/system-linkage.patch
index 0b1f475697..ff7b7a7544 100644
--- a/meta/recipes-extended/libaio/libaio/system-linkage.patch
+++ b/meta/recipes-extended/libaio/libaio/system-linkage.patch
@@ -1,8 +1,8 @@
-From 94bba6880b1f10c6b3bf33a17ac40935d65a81ae Mon Sep 17 00:00:00 2001
+From e97561152f0eb58466117b51170cfefb43eb174a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 6 Nov 2015 15:19:46 +0000
 Subject: [PATCH] Don't remove the system libraries and startup files from
- libaio, as in some build configurations these are required.  For example,
+ libaio, as in some build configurations these are required. For example,
  including conf/include/security_flags.inc on PPC results in:
 
 io_queue_init.os: In function `io_queue_init':
@@ -11,27 +11,21 @@ undefined reference to `__stack_chk_fail_local'
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index eadb336..56ab701 100644
+index 37ae219..22e0c9a 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -3,10 +3,10 @@ includedir=$(prefix)/include
- libdir=$(prefix)/lib
- 
- CFLAGS ?= -g -fomit-frame-pointer -O2
--CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
-+CFLAGS += -Wall -I. -fPIC
+@@ -6,7 +6,7 @@ CFLAGS ?= -g -fomit-frame-pointer -O2
+ CFLAGS += -Wall -I. -fPIC
  SO_CFLAGS=-shared $(CFLAGS)
  L_CFLAGS=$(CFLAGS)
 -LINK_FLAGS=
 +LINK_FLAGS=$(LDFLAGS)
  LINK_FLAGS+=$(LDFLAGS)
+ ENABLE_SHARED ?= 1
  
- soname=libaio.so.1
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.112.bb
similarity index 88%
rename from meta/recipes-extended/libaio/libaio_0.3.111.bb
rename to meta/recipes-extended/libaio/libaio_0.3.112.bb
index 8e1cd349a0..b3606474a5 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.112.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://pagure.io/libaio.git;protocol=https \
            file://00_arches.patch \
-           file://destdir.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
            "
-SRCREV = "f66be22ab0a59a39858900ab72a8c6a6e8b0b7ec"
+SRCREV = "d025927efa75a0d1b46ca3a5ef331caa2f46ee0e"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
-- 
2.17.1


--===============1965008376056913940==--

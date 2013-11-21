Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B9BDF6DBB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 15:00:03 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id r10so8373166pdi.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eliDPuFmiEYjPWLW/pki2JLZwraFVmMYXqpYcV14yUg=;
	b=QqD7H+2LBwQpBwfDoy1foZfvlNck+Ug/IKL1ZuuTK3tjAHHJzMBtIO+bKHgK3Y/2jm
	88kXMKeQ3e8xjD4KTuQFKEVP84Xb3GNfzuGVB/3d9ESdT44ITvx3lU7FIavBYuP1zuOI
	QDfN8/kr9kaMpE8q4N/gHBVoBCQq8a0axRbwiC12pLUbhmrvIX8U+ueFJKIyel0RFKhE
	jF2/Y1MYbKef+wQ5gxq6xhkKSrYMWLFY0enmGTcLk+syDOGiD+ReQOS08T0rX90oZe0V
	Uq72Nai30G1HSuqbaSqumtcgcnfw0JYnZstdbGPNl2vv//xVQ0FMePfI930yEj4IlNkA
	QWxg==
X-Received: by 10.68.41.69 with SMTP id d5mr1018678pbl.33.1385046003308;
	Thu, 21 Nov 2013 07:00:03 -0800 (PST)
Received: from haswell.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	qw8sm46401011pbb.27.2013.11.21.07.00.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 07:00:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 06:59:44 -0800
Message-Id: <1385045984-4895-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gcc: Upgrade to 4.8.2
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
X-List-Received-Date: Thu, 21 Nov 2013 15:00:04 -0000

The details for bug fixes between 4.8.1 and 4.8.2 is here

http://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=4.8.2

Remove the patches that were applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              | 19 ++---
 .../gcc/gcc-4.8/0036-PR-target-56102.patch         | 83 ----------------------
 2 files changed, 5 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 8d50bf7..8d1729b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -1,20 +1,12 @@
 require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
-# happens from this branch on gcc e.g. currently its 4.7.1
-# when 4.7.2 is releases and we bump SRCREV beyond the release
-# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
-# to reflect that change
 
-PV = "4.8.1"
+PV = "4.8.2"
 
-# BINV should be incremented after updating to a revision
-# after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
-# the value will be minor-release+1 e.g. if current minor release was
-# 4.7.1 then the value below will have 2 which will mean 4.7.2
-# which will be next minor release and so on.
+# BINV should be incremented to a revision after a minor gcc release
 
-BINV = "4.8.1"
+BINV = "4.8.2"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.8' ], d)}"
 
@@ -65,7 +57,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
 	   file://0035-wcast-qual-PR-55383.patch \
-	   file://0036-PR-target-56102.patch \
 	   file://0037-gcc-4.8-PR56797.patch \
 	   file://0038-gcc-4.8-build-args.patch \
 	   file://0039-gcc-4.8-PR57717.patch \
@@ -78,8 +69,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
 	  "
-SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
-SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
+SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
+SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
deleted file mode 100644
index a9498fc..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From fa049b3584a1cc36c250205e3d5841e6a40ff677 Mon Sep 17 00:00:00 2001
-From: amker <amker@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 27 Mar 2013 08:16:54 +0000
-Subject: [PATCH] PR target/56102
-
-* config/arm/arm.c (thumb1_rtx_costs, thumb1_size_rtx_costs): Fix rtx costs for SET/ASHIFT/ASHIFTRT/LSHIFTRT/ROTATERT patterns with mult-word mode.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@197155 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- gcc/config/arm/arm.c | 17 ++++++++++++++---
- 1 file changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
-index 460d333..edf850d 100644
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -7094,7 +7094,7 @@ static inline int
- thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
- {
-   enum machine_mode mode = GET_MODE (x);
--  int total;
-+  int total, words;
- 
-   switch (code)
-     {
-@@ -7102,6 +7102,8 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
-     case ASHIFTRT:
-     case LSHIFTRT:
-     case ROTATERT:
-+      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
-+
-     case PLUS:
-     case MINUS:
-     case COMPARE:
-@@ -7125,7 +7127,10 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
-       return COSTS_N_INSNS (1) + 16;
- 
-     case SET:
--      return (COSTS_N_INSNS (1)
-+      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
-+	 the mode.  */
-+      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
-+      return (COSTS_N_INSNS (words)
- 	      + 4 * ((MEM_P (SET_SRC (x)))
- 		     + MEM_P (SET_DEST (x))));
- 
-@@ -7822,6 +7827,7 @@ static inline int
- thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
- {
-   enum machine_mode mode = GET_MODE (x);
-+  int words;
- 
-   switch (code)
-     {
-@@ -7829,6 +7835,8 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
-     case ASHIFTRT:
-     case LSHIFTRT:
-     case ROTATERT:
-+      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
-+
-     case PLUS:
-     case MINUS:
-     case COMPARE:
-@@ -7847,7 +7855,10 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
-       return COSTS_N_INSNS (1);
- 
-     case SET:
--      return (COSTS_N_INSNS (1)
-+      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
-+	 the mode.  */
-+      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
-+      return (COSTS_N_INSNS (words)
-               + 4 * ((MEM_P (SET_SRC (x)))
-                      + MEM_P (SET_DEST (x))));
- 
--- 
-1.8.2.1
-
-- 
1.8.4.3



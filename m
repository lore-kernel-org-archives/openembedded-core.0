Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3965C6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:40:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; d="scan'208";a="17479037"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2018 04:40:52 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 771E15802D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 04:40:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 14:41:43 +0200
Message-Id: <1514896905-36107-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
References: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] libatomic-ops: upgrade to 7.6.2
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
X-List-Received-Date: Tue, 02 Jan 2018 12:40:51 -0000

7.6.0 -> 7.6.2

Remove unused patch:
        0001-Add-initial-nios2-architecture-support.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...01-Add-initial-nios2-architecture-support.patch | 70 ----------------------
 ...batomic-ops_7.6.0.bb => libatomic-ops_7.6.2.bb} |  6 +-
 2 files changed, 4 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.0.bb => libatomic-ops_7.6.2.bb} (68%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch b/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch
deleted file mode 100644
index c051075..0000000
--- a/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4b005ee56898309e8afba9b3c48cf94f0f5f78e4 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 15 Mar 2016 10:09:26 +0300
-Subject: [PATCH] Add initial nios2 architecture support
-
-* src/Makefile.am (nobase_private_HEADERS): Add nios2.h.
-* src/atomic_ops.h: Include nios2.h if __nios2__.
-* src/atomic_ops/sysdeps/gcc/nios2.h: New file.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport [ https://github.com/ivmai/libatomic_ops.git 4b005ee56898309e8afba9b3c48cf94f0f5f78e4 ]
----
- src/Makefile.am                    |  1 +
- src/atomic_ops.h                   |  3 +++
- src/atomic_ops/sysdeps/gcc/nios2.h | 17 +++++++++++++++++
- 3 files changed, 21 insertions(+)
- create mode 100644 src/atomic_ops/sysdeps/gcc/nios2.h
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index fc09b27..d463427 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -79,6 +79,7 @@ nobase_private_HEADERS = atomic_ops/ao_version.h \
-           atomic_ops/sysdeps/gcc/ia64.h \
-           atomic_ops/sysdeps/gcc/m68k.h \
-           atomic_ops/sysdeps/gcc/mips.h \
-+          atomic_ops/sysdeps/gcc/nios2.h \
-           atomic_ops/sysdeps/gcc/powerpc.h \
-           atomic_ops/sysdeps/gcc/s390.h \
-           atomic_ops/sysdeps/gcc/sh.h \
-diff --git a/src/atomic_ops.h b/src/atomic_ops.h
-index 33fe00e..ec02ba4 100644
---- a/src/atomic_ops.h
-+++ b/src/atomic_ops.h
-@@ -262,6 +262,9 @@
- # if defined(__m68k__)
- #   include "atomic_ops/sysdeps/gcc/m68k.h"
- # endif /* __m68k__ */
-+# if defined(__nios2__)
-+#   include "atomic_ops/sysdeps/gcc/nios2.h"
-+# endif /* __nios2__ */
- # if defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) \
-      || defined(__powerpc64__) || defined(__ppc64__)
- #   include "atomic_ops/sysdeps/gcc/powerpc.h"
-diff --git a/src/atomic_ops/sysdeps/gcc/nios2.h b/src/atomic_ops/sysdeps/gcc/nios2.h
-new file mode 100644
-index 0000000..f402cbb
---- /dev/null
-+++ b/src/atomic_ops/sysdeps/gcc/nios2.h
-@@ -0,0 +1,17 @@
-+/*
-+ * Copyright (C) 2016 Marek Vasut <marex@denx.de>
-+ *
-+ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
-+ * OR IMPLIED. ANY USE IS AT YOUR OWN RISK.
-+ *
-+ * Permission is hereby granted to use or copy this program
-+ * for any purpose, provided the above notices are retained on all copies.
-+ * Permission to modify the code and to distribute modified code is granted,
-+ * provided the above notices are retained, and a notice that the code was
-+ * modified is included with the above copyright notice.
-+ */
-+
-+#include "../test_and_set_t_is_ao_t.h"
-+#include "generic.h"
-+
-+#define AO_T_IS_INT
--- 
-2.7.0
-
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb
similarity index 68%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb
index 4463d86..fff8fe2 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.2.bb
@@ -7,9 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
 		   "
 PV .= "+git${SRCPV}"
+SRCBRANCH ?= "release-7_6"
+UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases/"
 
-SRCREV = "73c60c5ef1ed370111549ee5aab6d4020ba70ed4"
-SRC_URI = "git://github.com/ivmai/libatomic_ops"
+SRCREV = "5ae4b4aeea2baf13752d07e3038c47f70f06dcac"
+SRC_URI = "git://github.com/ivmai/libatomic_ops;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.4.0



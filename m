Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 838D2772CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480795"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:56 +0200
Message-Id: <d2e392c768cff3ad5f38850a688312a9971f2fb6.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/16] liburcu: update to 0.9.3
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:30 -0000

Drop 0002-Support-for-aarch64_be.patch, it's merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../liburcu/0001-Support-for-NIOS2-architecture.patch | 13 +++++++------
 .../liburcu/liburcu/0002-Support-for-aarch64_be.patch | 19 -------------------
 .../liburcu/{liburcu_0.9.2.bb => liburcu_0.9.3.bb}    | 12 +++++-------
 3 files changed, 12 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
 rename meta/recipes-support/liburcu/{liburcu_0.9.2.bb => liburcu_0.9.3.bb} (63%)

diff --git a/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch b/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
index 690872b..6296238 100644
--- a/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
+++ b/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
@@ -1,4 +1,4 @@
-From add566b913e1b5cd4974a2167157dc08d8245ab0 Mon Sep 17 00:00:00 2001
+From f37c5b56376d9bb506da68bb11d0d7463e6e563b Mon Sep 17 00:00:00 2001
 From: Marek Vasut <marex@denx.de>
 Date: Tue, 9 Feb 2016 01:52:26 +0100
 Subject: [PATCH] Support for NIOS2 architecture
@@ -9,6 +9,7 @@ trivial too, since the CPU does not support SMP at all.
 
 Signed-off-by: Marek Vasut <marex@denx.de>
 Upstream-Status: Backport [ http://git.lttng.org/?p=userspace-rcu.git;a=commit;h=859050b3088aa3f0cb59d7f51ce24b9a0f18faa5 ]
+
 ---
  LICENSE              |  1 +
  README.md            |  1 +
@@ -44,12 +45,12 @@ index f6b290f..6fe9c1e 100644
    - ia64
    - Sparcv9 32/64
 diff --git a/configure.ac b/configure.ac
-index 39a7777..71a7d71 100644
+index eebed56..8014e1d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -124,6 +124,7 @@ AS_CASE([$host_cpu],
+@@ -136,6 +136,7 @@ AS_CASE([$host_cpu],
  	[arm*], [ARCHTYPE="arm"],
- 	[aarch64], [ARCHTYPE="aarch64"],
+ 	[aarch64*], [ARCHTYPE="aarch64"],
  	[mips*], [ARCHTYPE="mips"],
 +	[nios2*], [ARCHTYPE="nios2"],
  	[tile*], [ARCHTYPE="tile"],
@@ -57,7 +58,7 @@ index 39a7777..71a7d71 100644
  	[ARCHTYPE="unknown"]
 diff --git a/urcu/arch/nios2.h b/urcu/arch/nios2.h
 new file mode 100644
-index 0000000..030d1bc
+index 0000000..b4f3e50
 --- /dev/null
 +++ b/urcu/arch/nios2.h
 @@ -0,0 +1,40 @@
@@ -140,5 +141,5 @@ index 0000000..5b3c303
 +
 +#endif /* _URCU_UATOMIC_ARCH_NIOS2_H */
 -- 
-2.7.0
+2.10.2
 
diff --git a/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch b/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
deleted file mode 100644
index a10ccd7..0000000
--- a/meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-liburcu: add support for aarch64_be
-
-Upstream-Status: Pending
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
-diff --git a/configure.ac b/configure.ac
-index 8ebfa8b..fe1c55d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -121,7 +121,7 @@ AS_CASE([$host_cpu],
- 	[alpha*], [ARCHTYPE="alpha"],
- 	[ia64], [ARCHTYPE="ia64"],
- 	[arm*], [ARCHTYPE="arm"],
--	[aarch64], [ARCHTYPE="aarch64"],
-+	[aarch64*], [ARCHTYPE="aarch64"],
- 	[mips*], [ARCHTYPE="mips"],
- 	[nios2*], [ARCHTYPE="nios2"],
- 	[tile*], [ARCHTYPE="tile"],
diff --git a/meta/recipes-support/liburcu/liburcu_0.9.2.bb b/meta/recipes-support/liburcu/liburcu_0.9.3.bb
similarity index 63%
rename from meta/recipes-support/liburcu/liburcu_0.9.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.9.3.bb
index 23fb8c4..4486e0a 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.3.bb
@@ -7,14 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
-SRC_URI = " \
-	http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-	file://0001-Support-for-NIOS2-architecture.patch \
-        file://0002-Support-for-aarch64_be.patch \
-	"
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://0001-Support-for-NIOS2-architecture.patch \
+           "
 
-SRC_URI[md5sum] = "49f86e68c1e2f41d303381a271b791d1"
-SRC_URI[sha256sum] = "8f7fa313b1e0a3f742cea24ce63a39c0efe63e615a769e2961e55bd2663ecaa3"
+SRC_URI[md5sum] = "920970e35a1a2066c8353eabfeab8730"
+SRC_URI[sha256sum] = "1bce32e6a6c967fef6d37adaadf33df19878d69673f9ef9d3f2470e0c6ed4006"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.10.2



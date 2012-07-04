Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@adamian-desktop>) id 1SmKEN-0004Pe-PK
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 09:42:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2012 00:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188276862"
Received: from adamian-desktop.rb.intel.com (HELO adamian-desktop)
	([10.237.105.143])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2012 00:30:26 -0700
Received: by adamian-desktop (Postfix, from userid 1000)
	id 8794D840568; Wed,  4 Jul 2012 10:31:20 +0300 (EEST)
From: alexandru.damian@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 10:31:17 +0300
Message-Id: <1341387078-25060-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] liburcu: upgrade to 0.7.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 07:42:36 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

The license changed with the addition of GPLv3 for one file.

* GPLv3 (or later)

The following build-related macro is under GPLv3 (or later):

m4/ax_tls.m4

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-support/liburcu/liburcu_0.6.7.bb |   24 ------------------------
 meta/recipes-support/liburcu/liburcu_0.7.3.bb |   24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu_0.6.7.bb
 create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.3.bb

diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
deleted file mode 100644
index be73856..0000000
--- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
-HOMEPAGE = "http://lttng.org/urcu"
-BUGTRACKER = "http://lttng.org/project/issues"
-
-LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
-                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
-
-PR = "r0"
-
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
-SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
-
-S = "${WORKDIR}/userspace-rcu-${PV}"
-CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-inherit autotools
-
-# liburcu, which is only used by lttng-ust, may not build on other
-# platforms, like MIPS.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-
diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
new file mode 100644
index 0000000..45c51bc
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
+HOMEPAGE = "http://lttng.org/urcu"
+BUGTRACKER = "http://lttng.org/project/issues"
+
+LICENSE = "LGPLv2.1+ & MIT-style & GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
+                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
+                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
+
+PR = "r0"
+
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
+SRC_URI[sha256sum] = "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
+
+S = "${WORKDIR}/userspace-rcu-${PV}"
+CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
+inherit autotools
+
+# liburcu, which is only used by lttng-ust, may not build on other
+# platforms, like MIPS.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
+
-- 
1.7.9.5




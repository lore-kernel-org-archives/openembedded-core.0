Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C23C76D8F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:57:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2013 06:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="437160361"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2013 06:57:51 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2013 17:03:15 +0200
Message-Id: <305ba751503a4087d778b14d18578d2eeb318feb.1384786750.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384786750.git.cristiana.voicu@intel.com>
References: <cover.1384786750.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1384786750.git.cristiana.voicu@intel.com>
References: <cover.1384786750.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/2] liburcu: upgrade to 0.8.1
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
X-List-Received-Date: Mon, 18 Nov 2013 14:57:50 -0000

One patch was removed because it was merged upstream; converted
"files" directory to "liburcu"

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-support/liburcu/files/fixCCflag.patch |   20 --------------------
 .../liburcu/{files => liburcu}/fixsepbuild.patch   |    0
 .../liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} |    7 +++----
 3 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 rename meta/recipes-support/liburcu/{files => liburcu}/fixsepbuild.patch (100%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} (75%)

diff --git a/meta/recipes-support/liburcu/files/fixCCflag.patch b/meta/recipes-support/liburcu/files/fixCCflag.patch
deleted file mode 100644
index 2e526d4..0000000
--- a/meta/recipes-support/liburcu/files/fixCCflag.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Use cross compiler for doc exemples too
-
-Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
-
-Index: userspace-rcu-0.8.0/doc/examples/Makefile.examples.template
-===================================================================
---- userspace-rcu-0.8.0.orig/doc/examples/Makefile.examples.template	2013-08-30 21:25:20.000000000 +0300
-+++ userspace-rcu-0.8.0/doc/examples/Makefile.examples.template	2013-10-23 13:34:30.405550556 +0300
-@@ -11,7 +11,9 @@
- #
- # This makefile is purposefully kept simple to support GNU and BSD make.
- 
-+ifndef CC
- CC = gcc
-+endif
- CFLAGS = -g -O2 -Wall
- 
- all: $(BINARY)
diff --git a/meta/recipes-support/liburcu/files/fixsepbuild.patch b/meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
similarity index 100%
rename from meta/recipes-support/liburcu/files/fixsepbuild.patch
rename to meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.0.bb b/meta/recipes-support/liburcu/liburcu_0.8.1.bb
similarity index 75%
rename from meta/recipes-support/liburcu/liburcu_0.8.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.1.bb
index 0bb4545..bcdd32a 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.1.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://fixsepbuild.patch \
-           file://fixCCflag.patch"
+           file://fixsepbuild.patch"
 
-SRC_URI[md5sum] = "ddf193131b9f172c8f540b60d9d339f4"
-SRC_URI[sha256sum] = "49fbe70af47945037f437931c9539bfb9cb03ba28b813649ea7394dbdca70658"
+SRC_URI[md5sum] = "c0c0613bcce3b6954a050faa6dec6f51"
+SRC_URI[sha256sum] = "8008f697b030d7d3043ebd3a72be63cefc9242ed2d50520d30211e3908a4e01e"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5



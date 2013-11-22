Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7546B3D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:41:37 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VjqzH-0006lA-Ok from Paul_Woegerer@mentor.com ;
	Fri, 22 Nov 2013 05:41:35 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 22 Nov 2013 05:41:34 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com ([172.30.72.162]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 22 Nov 2013 05:41:31 -0800
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Fri, 22 Nov 2013 14:41:23 +0100
Message-Id: <1385127683-9644-1-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <52851A4D.7090107@linux.intel.com>
References: <52851A4D.7090107@linux.intel.com>
X-OriginalArrivalTime: 22 Nov 2013 13:41:32.0072 (UTC)
	FILETIME=[8DCA0A80:01CEE788]
Subject: [PATCH] liburcu: Update to version 0.8.1
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
X-List-Received-Date: Fri, 22 Nov 2013 13:41:38 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 meta/recipes-support/liburcu/files/fixCCflag.patch   | 20 --------------------
 .../liburcu/{files => liburcu}/fixsepbuild.patch     |  0
 .../liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb}   |  7 +++----
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
1.8.4.2



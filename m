Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOV-0005aX-DU
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351252"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:14 -0800
Message-Id: <61eb2866b383ba5005b5ac92793b41a1307c40d0.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 32/33] qemu: Ensure an internal qemugl script uses bash as it has bashisms
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
X-List-Received-Date: Thu, 10 Nov 2011 07:50:03 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 +-
 .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |    2 +-
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.0.bb          |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index 03519ad..5a0cd55 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r3"
+PR = "r4"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.0.bb b/meta/recipes-devtools/qemu/qemu_0.15.0.bb
index baeb4e9..e2e1340 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r0"
+PR = "r1"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 59fc7f1..3b4369b 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 PV = "0.14.0"
-PR = "r1"
+PR = "r2"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"
-- 
1.7.6.4




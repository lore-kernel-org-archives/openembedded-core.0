Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F25E71489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 03:10:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G3B0VF027223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 20:11:00 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 20:11:00 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 23:10:57 -0400
Message-ID: <db304011c1b0a6d4cbcdce2d7ecc742941e9b760.1410836877.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410836877.git.wenzong.fan@windriver.com>
References: <cover.1410836877.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpam / xtests: remove bash dependency
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
X-List-Received-Date: Tue, 16 Sep 2014 03:11:01 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

There's not bash specific syntax in the xtests scripts:

  $ cd Linux-PAM-1.1.6/xtests
  # replace /bin/bash to /bin/sh and check the bashisms:
  $ checkbashisms *.sh
  No output

So the runtime dependency to bash could be removed.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libpam-xtests-remove-bash-dependency.patch     |  226 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +-
 2 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch

diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch b/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
new file mode 100644
index 0000000..680029a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
@@ -0,0 +1,226 @@
+From 555407ff6e2f742df64ae93859f14a0fc1397829 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Fri, 12 Sep 2014 05:35:05 -0400
+Subject: [PATCH] libpam/xtests: remove bash dependency
+
+There's not bash specific syntax in the xtest scripts:
+
+  # after below patches applied:
+  $ cd Linux-PAM-1.1.6/xtests
+  $ checkbashisms *.sh
+  No output
+
+Just remove the runtime dependency to bash.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ xtests/run-xtests.sh             |    2 +-
+ xtests/tst-pam_access1.sh        |    2 +-
+ xtests/tst-pam_access2.sh        |    2 +-
+ xtests/tst-pam_access3.sh        |    2 +-
+ xtests/tst-pam_access4.sh        |    2 +-
+ xtests/tst-pam_assemble_line1.sh |    2 +-
+ xtests/tst-pam_group1.sh         |    2 +-
+ xtests/tst-pam_limits1.sh        |    2 +-
+ xtests/tst-pam_pwhistory1.sh     |    2 +-
+ xtests/tst-pam_substack1.sh      |    2 +-
+ xtests/tst-pam_substack2.sh      |    2 +-
+ xtests/tst-pam_substack3.sh      |    2 +-
+ xtests/tst-pam_substack4.sh      |    2 +-
+ xtests/tst-pam_substack5.sh      |    2 +-
+ xtests/tst-pam_succeed_if1.sh    |    2 +-
+ xtests/tst-pam_unix1.sh          |    2 +-
+ xtests/tst-pam_unix2.sh          |    2 +-
+ xtests/tst-pam_unix3.sh          |    2 +-
+ xtests/tst-pam_unix4.sh          |    2 +-
+ 19 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/xtests/run-xtests.sh b/xtests/run-xtests.sh
+index 3a89057..1cf8684 100755
+--- a/xtests/run-xtests.sh
++++ b/xtests/run-xtests.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ SRCDIR=$1
+ shift 1
+diff --git a/xtests/tst-pam_access1.sh b/xtests/tst-pam_access1.sh
+index 180d256..70521d2 100755
+--- a/xtests/tst-pam_access1.sh
++++ b/xtests/tst-pam_access1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/groupadd tstpamaccess
+ /usr/sbin/useradd -G tstpamaccess -p '!!' tstpamaccess1
+diff --git a/xtests/tst-pam_access2.sh b/xtests/tst-pam_access2.sh
+index 0a30275..7e3e60f 100755
+--- a/xtests/tst-pam_access2.sh
++++ b/xtests/tst-pam_access2.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/groupadd tstpamaccess
+ /usr/sbin/useradd -p '!!' tstpamaccess2
+diff --git a/xtests/tst-pam_access3.sh b/xtests/tst-pam_access3.sh
+index 348e0c3..3630e2e 100755
+--- a/xtests/tst-pam_access3.sh
++++ b/xtests/tst-pam_access3.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd -p '!!' tstpamaccess3
+ ./tst-pam_access3
+diff --git a/xtests/tst-pam_access4.sh b/xtests/tst-pam_access4.sh
+index 61e7b44..4538df4 100755
+--- a/xtests/tst-pam_access4.sh
++++ b/xtests/tst-pam_access4.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd -p '!!' tstpamaccess4
+ ./tst-pam_access4
+diff --git a/xtests/tst-pam_assemble_line1.sh b/xtests/tst-pam_assemble_line1.sh
+index 248d47e..dc2a675 100755
+--- a/xtests/tst-pam_assemble_line1.sh
++++ b/xtests/tst-pam_assemble_line1.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authfail tst-pam_assemble_line1
+diff --git a/xtests/tst-pam_group1.sh b/xtests/tst-pam_group1.sh
+index b76377f..44faca9 100755
+--- a/xtests/tst-pam_group1.sh
++++ b/xtests/tst-pam_group1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/groupadd tstpamgrpg
+ /usr/sbin/useradd -p '!!' tstpamgrp
+diff --git a/xtests/tst-pam_limits1.sh b/xtests/tst-pam_limits1.sh
+index 4faa822..32c021d 100755
+--- a/xtests/tst-pam_limits1.sh
++++ b/xtests/tst-pam_limits1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd -p '!!' tstpamlimits
+ ./tst-pam_limits1
+diff --git a/xtests/tst-pam_pwhistory1.sh b/xtests/tst-pam_pwhistory1.sh
+index ddb3b8b..0f212e2 100644
+--- a/xtests/tst-pam_pwhistory1.sh
++++ b/xtests/tst-pam_pwhistory1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd tstpampwhistory
+ ./tst-pam_pwhistory1
+diff --git a/xtests/tst-pam_substack1.sh b/xtests/tst-pam_substack1.sh
+index 5260175..f1b72a7 100755
+--- a/xtests/tst-pam_substack1.sh
++++ b/xtests/tst-pam_substack1.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authfail tst-pam_substack1
+diff --git a/xtests/tst-pam_substack2.sh b/xtests/tst-pam_substack2.sh
+index c02f597..3804fa7 100755
+--- a/xtests/tst-pam_substack2.sh
++++ b/xtests/tst-pam_substack2.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authsucceed tst-pam_substack2
+diff --git a/xtests/tst-pam_substack3.sh b/xtests/tst-pam_substack3.sh
+index 0e572aa..aa48e8e 100755
+--- a/xtests/tst-pam_substack3.sh
++++ b/xtests/tst-pam_substack3.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authsucceed tst-pam_substack3
+diff --git a/xtests/tst-pam_substack4.sh b/xtests/tst-pam_substack4.sh
+index a3ef08a..958a07a 100755
+--- a/xtests/tst-pam_substack4.sh
++++ b/xtests/tst-pam_substack4.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authsucceed tst-pam_substack4
+diff --git a/xtests/tst-pam_substack5.sh b/xtests/tst-pam_substack5.sh
+index e2714fd..7e0da74 100755
+--- a/xtests/tst-pam_substack5.sh
++++ b/xtests/tst-pam_substack5.sh
+@@ -1,3 +1,3 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ exec ./tst-pam_authfail tst-pam_substack5
+diff --git a/xtests/tst-pam_succeed_if1.sh b/xtests/tst-pam_succeed_if1.sh
+index a643b2e..58e57b4 100755
+--- a/xtests/tst-pam_succeed_if1.sh
++++ b/xtests/tst-pam_succeed_if1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd -p '!!' tstpamtest
+ /usr/sbin/useradd -p '!!' pamtest
+diff --git a/xtests/tst-pam_unix1.sh b/xtests/tst-pam_unix1.sh
+index f75bd84..72deac0 100755
+--- a/xtests/tst-pam_unix1.sh
++++ b/xtests/tst-pam_unix1.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ /usr/sbin/useradd -p '!!' tstpamunix
+ ./tst-pam_unix1
+diff --git a/xtests/tst-pam_unix2.sh b/xtests/tst-pam_unix2.sh
+index 7093155..c04d6e6 100755
+--- a/xtests/tst-pam_unix2.sh
++++ b/xtests/tst-pam_unix2.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # pamunix0 = 0aXKZztA.d1KY
+ /usr/sbin/useradd -p 0aXKZztA.d1KY  tstpamunix
+diff --git a/xtests/tst-pam_unix3.sh b/xtests/tst-pam_unix3.sh
+index ef4a07c..b52db2b 100755
+--- a/xtests/tst-pam_unix3.sh
++++ b/xtests/tst-pam_unix3.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # pamunix01 = 0aXKZztA.d1KYIuFXArmd2jU
+ /usr/sbin/useradd -p 0aXKZztA.d1KYIuFXArmd2jU tstpamunix
+diff --git a/xtests/tst-pam_unix4.sh b/xtests/tst-pam_unix4.sh
+index 787c2f9..e7976fd 100755
+--- a/xtests/tst-pam_unix4.sh
++++ b/xtests/tst-pam_unix4.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # pamunix01 = 0aXKZztA.d1KYIuFXArmd2jU
+ /usr/sbin/useradd -p 0aXKZztA.d1KYIuFXArmd2jU tstpamunix
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3de7d09..a84e51e 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
            file://pam_timestamp-fix-potential-directory-traversal-issu.patch \
+           file://libpam-xtests-remove-bash-dependency.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
@@ -85,7 +86,7 @@ RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
-    coreutils bash"
+    coreutils"
 
 # FIXME: Native suffix breaks here, disable it for now
 RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
-- 
1.7.9.5



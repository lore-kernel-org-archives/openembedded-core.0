Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94D697123A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cisZ007788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:14 -0400
Message-ID: <0f0ec6c1d6411603d5757a037c79c49df646db52.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/18] kernel-yocto: remove KBRANCH_DEFAULT
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:44 -0000
Content-Type: text/plain

KBRANCH_DEFAULT is no longer used, so we can remove it from all
recipes (and it won't be missed).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  1 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  3 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  3 +--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 15 +++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 15 +++++++--------
 10 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 10f3d234ed25..595f72d5bb6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -23,7 +23,6 @@ python () {
 }
 
 KBRANCH = "standard/base"
-KBRANCH_DEFAULT = "${KBRANCH}"
 KMETA = "meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 65a74d3ec75d..80d8db082338 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -1,7 +1,7 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/preempt-rt/base"
-KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
+KBRANCH ?= "standard/preempt-rt/base"
+KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "c373b342af7bcbeda346df9598a5b1e9784d362f"
 SRCREV_machine_qemuppc ?= "767da5a30782cc1bc6522cef8aa5fd8130ecc06c"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 0c5767a49e5b..59918d77e1cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -1,7 +1,7 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/preempt-rt/base"
-KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
+KBRANCH ?= "standard/preempt-rt/base"
+KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "77d54dcdf1e078290d88e85adbbe3f90d41f4c9e"
 SRCREV_machine_qemuppc ?= "ba132753cc6688c1c22d7147b02e434a3441833c"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index e01ffeec7ab0..6929dfaec198 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -1,7 +1,7 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/preempt-rt/base"
-KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
+KBRANCH ?= "standard/preempt-rt/base"
+KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 LINUX_VERSION ?= "3.4.91"
 LINUX_KERNEL_TYPE = "preempt-rt"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index b70d7bc081ce..a751d541179a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -1,7 +1,6 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH_DEFAULT = "standard/tiny/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
+KBRANCH ?= "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 3e8c0bc67127..34341d7a016a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -1,6 +1,6 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/tiny/base"
+KBRANCH ?= "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index fd5c9f76967e..bad6b8f4eb9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -3,8 +3,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # We need lzma (as CONFIG_KERNEL_LZMA=y)
 DEPENDS += "xz-native"
 
-KBRANCH_DEFAULT = "standard/tiny/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
+KBRANCH ?= "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 57395b4ebb1b..f2904b62a132 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -1,15 +1,14 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH_DEFAULT = "standard/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
+KBRANCH = "standard/base"
 
 # board specific branches
-KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
-KBRANCH_qemumips = "standard/mti-malta32"
-KBRANCH_qemuppc  = "standard/qemuppc"
-KBRANCH_qemux86  = "standard/common-pc/base"
-KBRANCH_qemux86-64  = "standard/common-pc-64/base"
-KBRANCH_qemumips64 = "standard/mti-malta64"
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/common-pc/base"
+KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "db489eed7f5c86037358cc9d0fefa7b90dbbaa86"
 SRCREV_machine_qemumips ?= "780aac11b3f20ed2f5df3f173b0d02b28a6eb96b"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 8c3cceec7d8d..9f154b6775aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -1,14 +1,14 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/base"
+KBRANCH ?= "standard/base"
 
 # board specific branches
-KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
-KBRANCH_qemumips = "standard/mti-malta32"
-KBRANCH_qemuppc  = "standard/qemuppc"
-KBRANCH_qemux86  = "standard/common-pc/base"
-KBRANCH_qemux86-64  = "standard/common-pc-64/base"
-KBRANCH_qemumips64 = "standard/mti-malta64"
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/common-pc/base"
+KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "92de8060e113e4a13f16c6b4b5333f538e291c6d"
 SRCREV_machine_qemumips ?= "313647599dd3cd7f42374d918a9397f82eed36fb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 1eabf764ef6d..3538afcf9809 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -1,15 +1,14 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH_DEFAULT = "standard/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
+KBRANCH = "standard/base"
 
 # board specific branches
-KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
-KBRANCH_qemumips = "standard/mti-malta32"
-KBRANCH_qemuppc  = "standard/qemuppc"
-KBRANCH_qemux86  = "standard/common-pc/base"
-KBRANCH_qemux86-64  = "standard/common-pc-64/base"
-KBRANCH_qemumips64 = "standard/mti-malta64"
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/common-pc/base"
+KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "192b56b2f529af1be014ea85667c9f3fea0afd53"
 SRCREV_machine_qemumips  ?= "58fb8b8fb2f9911cac84cd840d63c8a58bada6ca"
-- 
1.8.1.2



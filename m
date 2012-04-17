Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SKGcX-0001x1-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3HM21PL020816;
	Tue, 17 Apr 2012 15:02:04 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 17 Apr 2012 18:01:46 -0400
Message-Id: <1495c8b23ab03c5c5f19c377f28dafa13727904b.1334699045.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334699045.git.bruce.ashfield@windriver.com>
References: <cover.1334699045.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334699045.git.bruce.ashfield@windriver.com>
References: <cover.1334699045.git.bruce.ashfield@windriver.com>
Cc: denys@ti.com, openembedded-core@lists.openembedded.org,
	yang.shi@windriver.com, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto/meta: remove kernel config audit warnings
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:34 -0000

Updating the meta SRCREVs to pickup the following meta change for the
3.0 and 3.2 kernels:

[
    meta: Clean up BSPs kernel config

    Clean up some QEMU and non-x86 BSPs kernel config, including

    qemuarm
    qemuppc
    qemux86
    beagleboard
    mpc8315e_rdb

    Only obsolete/invalid kernel configs are removed.

    Signed-off-by: Yang Shi <yang.shi@windriver.com>
]

With this commit, the configuration audit for the qemu and hardware
reference boards is (largely) warning free.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 10459f3..36dcb6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "cf280f1dc5877d4ca43d21307222326efa68bb27"
 SRCREV_machine_qemuppc ?= "afaa5baa6a9ca9c8a03a9a3eee2ba9fba089f416"
-SRCREV_meta ?= "bb4fff95b3d28c8ab87cd6905eaef86e1f46db6e"
+SRCREV_meta ?= "34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index aae4ce0..05674ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "32ecb53e9ff759bbd297a10712b62a6575daaf86"
 SRCREV_machine_qemuppc ?= "0d5625bb868cc2471d5dd49eb7abe7eb5fe1044b"
-SRCREV_meta ?= "ad5a00b6c5bcdd1740d8fa42be122fc8ff2c579f"
+SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 6c65707..4957e33 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ KCONFIG_MODE = "--allnoconfig"
 LINUX_VERSION ?= "3.2.11"
 
 SRCREV_machine ?= "ec236058dc254183dbfb3744bf21f110c37af30b"
-SRCREV_meta ?= "ad5a00b6c5bcdd1740d8fa42be122fc8ff2c579f"
+SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 0d98074..074b1ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "7528f1d06ef5665eed8c1498f62d5403b82bbbd6"
 SRCREV_machine_qemux86 ?= "f153b0eb8264dc1e69f59d4c9173619feb4d5bd9"
 SRCREV_machine_qemux86-64 ?= "aac580659dc0ce083f250fb05abf82e58d7f4531"
 SRCREV_machine ?= "da7c40006b08916ff3a3db104def82aaf9ac2716"
-SRCREV_meta ?= "bb4fff95b3d28c8ab87cd6905eaef86e1f46db6e"
+SRCREV_meta ?= "34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 54361a2..d81f6b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "92de4e2f3c6b397c8b363e079cc4d5e9bcadf877"
 SRCREV_machine_qemux86 ?= "8ada1bb97415fe959a57a08504be4eb8a656ed30"
 SRCREV_machine_qemux86-64 ?= "4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"
 SRCREV_machine ?= "01e948c2bdf7f5ad9f2b30047a8d3493a1a2880a"
-SRCREV_meta ?= "ad5a00b6c5bcdd1740d8fa42be122fc8ff2c579f"
+SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4




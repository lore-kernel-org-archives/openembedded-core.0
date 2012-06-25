Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjCog-0000V1-8E
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 19:11:10 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5PH09tJ017802;
	Mon, 25 Jun 2012 10:00:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 25 Jun 2012 12:59:46 -0400
Message-Id: <aff3985ae8bf5ef61b125c5607337b7842e1c7bb.1340643139.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/5] linux-yocto/3.4: update to v3.4.3
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
X-List-Received-Date: Mon, 25 Jun 2012 17:11:10 -0000

Bumping the linux-yocto 3.4 SRCREV to import the -stable update
to v3.4.3.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index bd6f222..fabbb97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -4,14 +4,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.4.1"
+LINUX_VERSION ?= "3.4.3"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "9dc5e97d144abb03deec411acb9c64883602cff9"
-SRCREV_machine_qemuppc ?= "241a41d6104df6916280f1273894bbd7fa7cdd71"
-SRCREV_meta ?= "0f6975b8d01ffba0cd5f3548812e763c8610965b"
+SRCREV_machine ?= "e1247309cd90fbdb17479f909a7172e4b0b622d0"
+SRCREV_machine_qemuppc ?= "10ba85000bd4e32ea9e5557bf6d9166b12651c02"
+SRCREV_meta ?= "ef03644fe33f7fd6f50a36b85701fdc6d73e2c96"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 0ff40be..d859c29 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,17 +10,17 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "1b83eb1b99e937b67dafa4dedba9440d596cbd9f"
-SRCREV_machine_qemumips ?= "c6104a63aae262ff4238b45905ab1c57145334bc"
-SRCREV_machine_qemuppc ?= "4988a7e34bccd531b511c57f93358de9fcc672a0"
-SRCREV_machine_qemux86 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
-SRCREV_machine_qemux86-64 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
-SRCREV_machine ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
-SRCREV_meta ?= "0f6975b8d01ffba0cd5f3548812e763c8610965b"
+SRCREV_machine_qemuarm ?= "5a282e8b7138174389b64846ea993240c8b1f869"
+SRCREV_machine_qemumips  ?= "7db36332a033ab89988dfcb7b563cbcd83b93663"
+SRCREV_machine_qemuppc ?= "74f0e62044042a7e7abdbac83c6bf160b0c12c58"
+SRCREV_machine_qemux86 ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
+SRCREV_machine_qemux86-64 ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
+SRCREV_machine ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
+SRCREV_meta ?= "ef03644fe33f7fd6f50a36b85701fdc6d73e2c96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.1"
+LINUX_VERSION ?= "3.4.3"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4




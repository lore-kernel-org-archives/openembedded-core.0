Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZV-0001h3-IJ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344526"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:13 -0700
Message-Id: <d96edf9c001d96c618d15554a100791a76c2d0ab.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/20] linux-yocto/3.4: update to v3.4.3
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:26 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
1.7.7.6




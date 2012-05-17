Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SUrNv-0001Ff-O9
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 05:28:16 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4H3I7J6025632;
	Wed, 16 May 2012 20:18:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 16 May 2012 23:17:51 -0400
Message-Id: <836af643307e342a632af1e63565d5b463d4d656.1337224240.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1337224240.git.bruce.ashfield@windriver.com>
References: <cover.1337224240.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1337224240.git.bruce.ashfield@windriver.com>
References: <cover.1337224240.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: policy cleanups
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
X-List-Received-Date: Thu, 17 May 2012 03:28:16 -0000

Updating the meta SRCREVs to pickup configuration policy cleanups:

  49f931b meta/fishriver: remove redundant features and options
  51a6d3f meta/emenlow: remove redundant features and options
  101dd7f meta/crownbay: remove redundant features and options
  4110ecd meta/sugarbay: remove redundant features and options
  0f1304a meta/jasperforest: remove redundant features and options
  0a56a3b meta/common-pc-64: factor out SCSI CDROM option
  b71938a meta/common-pc-64: use usb-mass-storage feature
  0724f40 meta: add scsi cdrom feature
  438bca8 meta/common-pc: use usb-mass-storage feature
  c970881 meta: factor out SCSI options from the usb-mass-storage feature
  4c8135e meta: add scsi disk feature
  6872a81 meta: add scsi feature
  e706ec5 meta/sugarbay: factor out policy-related options
  8b7fbc2 meta/jasperforest: factor out policy-related options
  fea1b0e meta/fishriver: factor out policy-related options
  13bf9ab meta/emenlow: factor out policy-related options
  4748d50 meta/crownbay: factor out policy-related options
  44f592f meta/common-pc-64: factor out policy-related options
  5a3f5c7 meta/common-pc: factor out policy-related options
  1f5a10b meta/common-pc-64: use usb features
  4b87723 meta/common-pc: use usb features
  594ba05 meta: add ROOT_HUB_TT config option to the usb/ehci-hcd feature

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 4a1101e..b275ad4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -18,7 +18,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "3ebf4d172cf4a41d2abf09e4036f0850e08064e7"
 SRCREV_machine_qemuppc ?= "7cebfe717987f4ffa9ae90558c28f45049847c1c"
-SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
+SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 5d6450e..f50e12e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ KCONFIG_MODE = "--allnoconfig"
 LINUX_VERSION ?= "3.2.11"
 
 SRCREV_machine ?= "61960ba8e910d54b5525d5e9b6a7469bc399c246"
-SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
+SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index cdd59f0..14de6f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "cf3e188cf2a18c48a0e6f9ca54c36e6ac39512ec"
 SRCREV_machine_qemux86 ?= "46f1007ad22b6790224c66a8dc4e80fdbd21eea1"
 SRCREV_machine_qemux86-64 ?= "00e5ec2393bada6723bd9a07ded3d001c02fa727"
 SRCREV_machine ?= "f4f8ba730e7783e09413872414d0a17c142c816d"
-SRCREV_meta ?= "1dfd60fa1250259eed38ae5b2840eb37e3758a1b"
+SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYeje-00088h-5t
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:38 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343H022189;
	Wed, 14 Nov 2012 07:03:05 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:02:57 -0500
Message-Id: <3f08f132bebb0e245e7ff773dfe59a7733eb4a54.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/3.4: nfsd, pci, fishriver and rangely config changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 15:18:38 -0000

Updating the 3.4 meta branch with the following configuration changes
and additions:

0541ba5 meta: Rangeley Machine Created
9e3bdb7 meta: Add nfsd kernel features
da9b37d CrystalForest: Enable PCI extended config space for CrystalForest Machine.
628cbe9 meta: Add a new feature for PCI devices.
9c3a2b3 meta: fishriver: remove meta-data

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 91dc54f..bbac322 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "5705c8037d2c47938034ead87c70ae3ebef552f7"
 SRCREV_machine_qemuppc ?= "c8b651aab5d2d5c0839cdedc0c0ec5dc09cf47c0"
-SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
+SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 60b877f..e1d349d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
+SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
 
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 3383147..904e79e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "7833f1549c3d44cce8aea38b65cd501229aad492"
 SRCREV_machine_qemux86 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
 SRCREV_machine_qemux86-64 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
 SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
-SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
+SRCREV_meta ?= "0541ba5f98f31419e9bdfec895c18029bf424e7c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4




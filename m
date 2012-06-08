Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sd0fO-0001vh-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:59:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153552654"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:48:23 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 17:48:17 +0300
Message-Id: <1339166898-11667-4-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] ethtool: upgrade to 3.2
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
X-List-Received-Date: Fri, 08 Jun 2012 14:59:58 -0000

Other changes:
	- the HOMEPAGE URL since project hosting chenged to kernel.org;
	- licence MD5 for ethtool.c has changed because a new copyright
	  line from Sun has been added: "Portions Copyright (C) Sun
	  Microsystems 2008"

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-extended/ethtool/ethtool_2.6.36.bb |   15 ---------------
 meta/recipes-extended/ethtool/ethtool_3.2.bb    |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool_2.6.36.bb
 create mode 100644 meta/recipes-extended/ethtool/ethtool_3.2.bb

diff --git a/meta/recipes-extended/ethtool/ethtool_2.6.36.bb b/meta/recipes-extended/ethtool/ethtool_2.6.36.bb
deleted file mode 100644
index 5824ce0..0000000
--- a/meta/recipes-extended/ethtool/ethtool_2.6.36.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Display or change ethernet card settings"
-DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
-HOMEPAGE = "http://sourceforge.net/projects/gkernel/"
-SECTION = "console/network"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://ethtool.c;firstline=4;endline=16;md5=6db6b005b8390ea76cb85a2c7bda8e6b"
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/ethtool-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3b2322695e9ee7bf447ebcdb85f93e83"
-SRC_URI[sha256sum] = "639622180fe48dc7bb117ffbf263395d7ae47aac9819b8d9f83ff053ecf17bdd"
-
-inherit autotools
diff --git a/meta/recipes-extended/ethtool/ethtool_3.2.bb b/meta/recipes-extended/ethtool/ethtool_3.2.bb
new file mode 100644
index 0000000..31163d6
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool_3.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Display or change ethernet card settings"
+DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
+HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://ethtool.c;firstline=4;endline=17;md5=594311a6703a653a992f367bd654f7c1"
+PR = "r0"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1c5ee419d4278569db1fca46981918a4"
+SRC_URI[sha256sum] = "c075ed390dddc99dfb4804f220214cb5e8eb7c0882694a36b05f6aaa883629d7"
+
+inherit autotools
-- 
1.7.9.5




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rksqs-00005n-J8
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 08:44:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 23:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96880543"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 23:36:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 23:36:28 -0800
Message-Id: <5e2d9bafa9edf374ba16b5296b3730078600a4ba.1326267271.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/5] Incremental rpm image generation(Add config sample)
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
X-List-Received-Date: Wed, 11 Jan 2012 07:44:06 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Add the config sample for incremental image generation to
meta-yocto/conf/local.conf.sample.extended

[YOCTO #1651]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 7c26572..b901c5b 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -123,3 +123,10 @@
 # The following is a list of classes to import to use in the generation of images
 # currently an example class is image_types_uboot
 # IMAGE_CLASSES = " image_types_uboot"
+
+# Incremental rpm image generation, the rootfs would be totally removed
+# and re-created in the second generation by default, but with
+# INC_RPM_IMAGE_GEN = "1", the rpm based rootfs would be kept, and will
+# do update(remove/add some pkgs) on it.  NOTE: This is not suggested
+# when you want to create a productive rootfs
+#INC_RPM_IMAGE_GEN = "1"
-- 
1.7.6.5




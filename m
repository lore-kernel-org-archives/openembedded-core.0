Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2275176FF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 16:33:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2016 08:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659798385"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2016 08:33:37 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:33:50 +0000
Message-Id: <7233d28ab634b718074e53cc52ae87a75e4d44c8.1456504395.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456504395.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456504395.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] eudev: Keep classic network interface naming scheme
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
X-List-Received-Date: Fri, 26 Feb 2016 16:33:38 -0000

Creates an empty udev rule, causing the system to use the classic network
interface naming scheme, e. g. eth0, eth1.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index 22021a0..4afcfdb 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -75,6 +75,9 @@ do_install_append(){
         rm -f ${D}${base_libdir}/udev/hid2hci
 
         echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+
+        # Use classic network interface naming scheme
+        touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
 }
 
 python () {
-- 
2.6.2



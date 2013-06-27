Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 60A5460780
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 22:43:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2013 15:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,955,1363158000"; d="scan'208";a="356926306"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2013 15:44:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 15:43:17 -0700
Message-Id: <1372372997-1604-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] packagegroup-core-boot: used udev-cache for sysvinit
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
X-List-Received-Date: Thu, 27 Jun 2013 22:43:18 -0000

Enabling this by default since it does improve boot time when using sysvinit udev

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index d69c41d..1e1ee8e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -43,6 +43,7 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
     ${VIRTUAL-RUNTIME_dev_manager} \
+    ${@base_contains("DISTRO_FEATURES", "systemd", "", "udev-cache", d)} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-- 
1.8.1.4



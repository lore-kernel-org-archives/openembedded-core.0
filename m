Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CD7386086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006794"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:19 +0300
Message-Id: <3a1633cb9b62f46e97f8b39498cd9f7b51a4a0a8.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/7] systemd: add udev-utils dependency for udev-hwdb
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
X-List-Received-Date: Thu, 23 May 2013 13:15:30 -0000

udev-hwdb needs udevadm tool to compile the hardware index.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index b1cc046..09e2171 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -212,6 +212,8 @@ RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 RRECOMMENDS_udev += "udev-hwdb"
 
+RDEPENDS_udev-hwdb += "udev-utils"
+
 FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/systemd/systemd-udevd \
                ${rootlibexecdir}/udev/accelerometer \
-- 
1.7.9.5



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7795078229
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 11:48:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 04:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="1008808174"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2017 04:48:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 14:45:24 +0300
Message-Id: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/3] pciutils: inherit pkgconfig so that libkmod can be found
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
X-List-Received-Date: Tue, 29 Aug 2017 11:48:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb
index 8382c84bb18..0051fd8767d 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
 SRC_URI[md5sum] = "238d9969cc0de8b9105d972007d9d546"
 SRC_URI[sha256sum] = "1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5"
 
-inherit multilib_header
+inherit multilib_header pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
-- 
2.14.1



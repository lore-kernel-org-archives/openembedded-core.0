Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7FDBF72F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:06:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 05:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="271270943"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2017 05:06:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4907E5800C1;
	Wed,  7 Jun 2017 05:06:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 15:05:36 +0300
Message-Id: <1496837136-24209-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] u-boot: enable dhcp for MPC8315 board
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
X-List-Received-Date: Wed, 07 Jun 2017 12:06:38 -0000

Getting ip address from DHCP server is much more convenient
than setting static ip. It allows to configure u-boot in
more generic way and to avoid hardcoding static ip in
u-boot configuration.

Enabled dhcp client functionality for Yocto reference
hardware MPC8315E-RDB.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
index df24c85..8ee1c32 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
@@ -9,6 +9,8 @@ PE = "1"
 # repo during parse
 SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
 
-SRC_URI = "git://git.denx.de/u-boot.git"
+SRC_URI = "git://git.denx.de/u-boot.git \
+    file://MPC8315ERDB-enable-DHCP.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.1.4



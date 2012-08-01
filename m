Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwXT6-0003XL-0p
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 13:52:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2012 04:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129196386"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2012 04:40:16 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 14:42:00 +0300
Message-Id: <1343821320-21727-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] liburcu: Upgrade to upstream 0.7.3
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
X-List-Received-Date: Wed, 01 Aug 2012 11:52:00 -0000

LICENSE file has data changed.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-support/liburcu/liburcu_0.7.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
index a28c3e6..86f29be 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
-- 
1.7.9.5




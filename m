Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCRwL-0008A8-6I
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:35:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2011 00:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,245,1301900400"; d="scan'208";a="912088345"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2011 00:32:45 -0700
Message-Id: <53f69f1b59d519a53541548a4a79928b95f1b4ad.1303284287.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1303284287.git.dexuan.cui@intel.com>
References: <cover.1303284287.git.dexuan.cui@intel.com>
Old-Date: Tue, 19 Apr 2011 16:54:46 +0800
Date: Wed, 20 Apr 2011 15:30:33 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 5/9] liburcu: upgrade from 0.5.2 to 0.5.4
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
X-List-Received-Date: Wed, 20 Apr 2011 07:35:10 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Add arm into COMPATIBLE_HOST since liburcu started to support
pre-ARMv7 from 0.5.3 on.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} (61%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.5.2.bb b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
similarity index 61%
rename from meta/recipes-support/liburcu/liburcu_0.5.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.5.4.bb
index fa9ddb3..8e17e5d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.5.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
@@ -11,17 +11,14 @@ PR = "r0"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a2978395806eed5d9a2de1e22efe70e0"
-SRC_URI[sha256sum] = "2f22966fe4b00ef547976a31c1c6a7c7bea3449ffa838806d9610e7424e184dd"
+SRC_URI[md5sum] = "04147d24749be75200173859839207f7"
+SRC_URI[sha256sum] = "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 
 inherit autotools
 
 # liburcu, which is only used by lttng-ust, may not build on other
-# platforms, e.g., on ARM, liburcu is only supported on ARMv7l while poky
-# only supports armv4/armv4t/armv5te. 1 more example: liburcu doesn't support
-# MIPS now.
-# So here let us first suppport x86/powerpc platforms now.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*)-linux'
+# platforms, like MIPS.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
 
-- 
1.7.2




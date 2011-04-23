Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO2-0005Br-0n
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967539"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:29:07 -0700
Message-Id: <6cb6ee13374cf7ef6c110e278d7c4efa1b4a0253.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:54:46 +0800
Date: Fri, 22 Apr 2011 23:29:06 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 14/37] liburcu: upgrade from 0.5.2 to 0.5.4
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:10 -0000

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
1.7.1.1




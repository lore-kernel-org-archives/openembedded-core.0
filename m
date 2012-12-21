Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tm2RL-0004wI-P5
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:15:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2012 04:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="237501092"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2012 04:59:11 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:02:20 +0200
Message-Id: <1356094940-22690-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] nasm: upgraded to 2.10.06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 13:15:06 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/nasm/{nasm_2.10.05.bb => nasm_2.10.06.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.10.05.bb => nasm_2.10.06.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.10.05.bb b/meta/recipes-devtools/nasm/nasm_2.10.06.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.10.05.bb
rename to meta/recipes-devtools/nasm/nasm_2.10.06.bb
index d430b1e..cb12a22 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.06.bb
@@ -7,8 +7,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 PR = "r0"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "d3c50875fd923b782749f883294336ed"
-SRC_URI[sha256sum] = "de5af263ce344d3a89711c61802e3ad8a4e14a61d539f521f7554cdbbe04ed0f"
+SRC_URI[md5sum] = "875c4217b2e581dbae0bf96d45a6067a"
+SRC_URI[sha256sum] = "ac84dd0d7e4ad6282061ce36b68a72db591db55cf0902b53d4297c743b0944a6"
 
 inherit autotools
 
-- 
1.7.10.4




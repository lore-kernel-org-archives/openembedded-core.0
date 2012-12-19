Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TlRHU-0001Ul-M2
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 22:34:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2012 13:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="259836477"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2012 13:19:36 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 15:19:40 -0600
Message-Id: <a1684001db2530ed66bbfd94ce8b075bba3737f5.1355951741.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1355951741.git.tom.zanussi@intel.com>
References: <cover.1355951741.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] cmake-native: add checksums
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
X-List-Received-Date: Wed, 19 Dec 2012 21:34:24 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

commit 771d08 (cmake: Update to 2.8.10.2) removed the checksums from
cmake.inc, and added them to cmake, but forgot to add them to
cmake-native - this adds them.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../cmake/cmake-native_2.8.10.2.bb                 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
index ca81810..01860a7 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
@@ -2,3 +2,6 @@ require cmake.inc
 inherit native
 
 PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "097278785da7182ec0aea8769d06860c"
+SRC_URI[sha256sum] = "ce524fb39da06ee6d47534bbcec6e0b50422e18b62abc4781a4ba72ea2910eb1"
-- 
1.7.4.1




Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F13DE65D35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596793"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:52 +0300
Message-Id: <a014d007732080ba7f68040e14e1ed7235f7b56d.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 10/12] nasm: upgrade to 2.11.02
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:19 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../nasm/{nasm_2.11.bb => nasm_2.11.02.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.11.bb => nasm_2.11.02.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.bb b/meta/recipes-devtools/nasm/nasm_2.11.02.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.11.bb
rename to meta/recipes-devtools/nasm/nasm_2.11.02.bb
index 5f4b953..db84ec5 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.11.02.bb
@@ -6,8 +6,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "4cd558047ea5ed51fc2c7c94e249c7b8"
-SRC_URI[sha256sum] = "1ce7e897c67255a195367a60c739a90a0b33a4a73f058f7cda3253bcf975642b"
+SRC_URI[md5sum] = "3bbc8ed83115b8caf7931f35ec3bc5e0"
+SRC_URI[sha256sum] = "ece26b5ef565f94d19a72756d05965e424d2e5ca55f88b949852da70dd62f0e0"
 
 inherit autotools-brokensep
 
-- 
1.7.9.5



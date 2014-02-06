Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F41916E93E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785134"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:38 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:20 +0200
Message-Id: <9c22d64bb213755002ebfb997d4b851b1ad20b31.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/13] nasm: upgrade to 2.11
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
X-List-Received-Date: Thu, 06 Feb 2014 15:29:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../nasm/{nasm_2.10.09.bb => nasm_2.11.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.10.09.bb => nasm_2.11.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.10.09.bb b/meta/recipes-devtools/nasm/nasm_2.11.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.10.09.bb
rename to meta/recipes-devtools/nasm/nasm_2.11.bb
index bfba5dc..859cd21 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.09.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.11.bb
@@ -6,8 +6,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "0e45ca0d3d7ff36d503777eaa673e2ae"
-SRC_URI[sha256sum] = "7141180d3874b5967c6a60191e8d45fba9cc86bd60a4803ad80b6b6b3eac36b9"
+SRC_URI[md5sum] = "4cd558047ea5ed51fc2c7c94e249c7b8"
+SRC_URI[sha256sum] = "1ce7e897c67255a195367a60c739a90a0b33a4a73f058f7cda3253bcf975642b"
 
 inherit autotools
 
-- 
1.7.9.5



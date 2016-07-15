Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 225D870101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:20:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="846866817"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 05:20:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:20:02 +0300
Message-Id: <f38ab662fbf8f8d43d30fceac389e5266ee5a3c1.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
References: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468584725.git.jussi.kukkonen@intel.com>
References: <cover.1468584725.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/5] sato-screenshot: Upgrade 0.2 -> 0.3
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
X-List-Received-Date: Fri, 15 Jul 2016 12:20:37 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{sato-screenshot_0.2.bb => sato-screenshot_0.3.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/sato-screenshot/{sato-screenshot_0.2.bb => sato-screenshot_0.3.bb} (91%)

diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
similarity index 91%
rename from meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
rename to meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index 92f0ee1..5519a34 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "matchbox-panel-2 gtk+3"
 
-# SRCREV tagged 0.2
-SRCREV = "5db2672fb857b2c80b949d8fce92e0f0029cc947"
+# SRCREV tagged 0.3
+SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
 SRC_URI = "git://git.yoctoproject.org/screenshot"
 
 S = "${WORKDIR}/git"
-- 
2.1.4



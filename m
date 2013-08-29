Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 179216BC98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 13:37:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2013 06:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,983,1367996400"; d="scan'208";a="395384523"
Received: from unknown (HELO localhost) ([10.255.15.104])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2013 06:37:03 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 08:37:01 -0500
Message-Id: <adf271c181c7618690d25cd694af75e8183575ed.1377782855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1377782855.git.tom.zanussi@linux.intel.com>
References: <cover.1377782855.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/2] lttng-tools: Update to version 2.2.3
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
X-List-Received-Date: Thu, 29 Aug 2013 13:37:03 -0000

Update lttng-tools to version 2.2.3 to correspond to the LTTng 2.2
"Cuda" - Tracer toolchain stable release.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lttng/{lttng-tools_2.2.0.bb => lttng-tools_2.2.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.2.0.bb => lttng-tools_2.2.3.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
index e664d85..9872170 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt lttng-ust"
 
-SRCREV = "eff0b2c38d24092c41bbb51926ac4e3b8c6acb83"
-PV = "v2.2.0"
+SRCREV = "b1ebf16ce065a35149c39bc4f56ace3671706860"
+PV = "v2.2.3"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
 
-- 
1.7.11.4



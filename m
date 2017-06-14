Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF4517835C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709666"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:23 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:43 +0300
Message-Id: <1497439848-29967-3-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v4 2/7] cross.bbclass: merged /usr support
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:23 -0000

Use ${root_prefix} instead of ${base_prefix} while setting
${target_base_prefix}, otherwise we might loose the root prefix configuration
change in case of 'usrmerge' distro feature is enabled.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/cross.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8757303..4887317 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -50,7 +50,7 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
-target_base_prefix := "${base_prefix}"
+target_base_prefix := "${root_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
 target_base_libdir = "${target_base_prefix}/${baselib}"
-- 
2.7.4



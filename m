Return-Path: <amarnath.valluri@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2A116FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:29:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 06:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="98916094"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2017 06:29:32 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 16:27:35 +0300
Message-Id: <1497360455-27909-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <6c245347ca324b9ea7b88bcaf920e35f@XBOX02.axis.com>
References: <6c245347ca324b9ea7b88bcaf920e35f@XBOX02.axis.com>
Subject: [PATCH v4 2/8] cross.bbclass: merged /usr support
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
X-List-Received-Date: Tue, 13 Jun 2017 13:29:35 -0000

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



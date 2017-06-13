Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D4331782DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:56:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 23:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,337,1493708400"; d="scan'208";a="980108466"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 12 Jun 2017 23:56:10 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:52:34 +0300
Message-Id: <1497336760-36835-3-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v3 2/8] cross.bbclass: merged /usr support
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
X-List-Received-Date: Tue, 13 Jun 2017 06:56:10 -0000

To be align with base configuration change, use ${root_prefix} while preparing
${target_base_libdir}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/cross.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8757303..7720185 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -50,10 +50,10 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
-target_base_prefix := "${base_prefix}"
+target_root_prefix := "${root_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
-target_base_libdir = "${target_base_prefix}/${baselib}"
+target_base_libdir = "${target_root_prefix}/${baselib}"
 target_libdir = "${target_exec_prefix}/${baselib}"
 target_includedir := "${includedir}"
 
-- 
2.7.4



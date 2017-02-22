Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E13DE7305D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114017956"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:33 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:27:00 +0200
Message-Id: <1487752042-19804-29-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 03/25] cross.bbclass: merged /usr support
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:33 -0000

When 'usrmerge' distro feature enabled match target_base_libdir to ${target_libdir}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/cross.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 2602153..c8ef3a5 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -48,8 +48,8 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 target_base_prefix := "${base_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
-target_base_libdir = "${target_base_prefix}/${baselib}"
 target_libdir = "${target_exec_prefix}/${baselib}"
+target_base_libdir = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${target_libdir}', '${target_base_prefix}/${baselib}', d)}"
 target_includedir := "${includedir}"
 
 # Overrides for paths
-- 
2.7.4



Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EB3EF6B2C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:58:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2013 08:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="367399786"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 08:58:17 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 19:05:37 +0300
Message-Id: <c2854b30933cd987aebc314393317a1d1196a114.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v2 09/11] lttng-modules: Append _git to recipe name and add GIT revision to PV variable
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
X-List-Received-Date: Thu, 18 Jul 2013 15:58:18 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_git.bb
index dd35396..3a92879 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/kernel"
 inherit module
 
 SRCREV = "1b26381c19dd2d9fa41f52d8dc13b15b8dd32c7c"
-PV = "2.2.0"
+PV = "2.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.7.9.5



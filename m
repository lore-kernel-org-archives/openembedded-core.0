Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B63276E671
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 18:14:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 11:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,421,1496127600"; d="scan'208";a="1156103497"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2017 11:14:07 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 11:14:06 -0700
Message-Id: <20170727181406.22872-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.4
Cc: saul.wold@intel.com
Subject: [PATCH] module.bbclass: move make scripts earlier
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
X-List-Received-Date: Thu, 27 Jul 2017 18:14:06 -0000

Some out of tree modules require the scripts for configuration. For
example, backport-iwlwifi.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/module.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 391776d..78d1b21 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,6 @@
 inherit module-base kernel-module-split pkgconfig
 
-addtask make_scripts after do_prepare_recipe_sysroot before do_compile
+addtask make_scripts after do_prepare_recipe_sysroot before do_configure
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
-- 
2.9.4



Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5031D77203
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710357"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:43 -0800
Message-Id: <67b2849c33bfe09ddf35d0980b3464dc05878d0a.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 3/5] populate_sdk_ext: Don't set sdk_update_targets in the config
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

sdk_update_targets isn't used by any code, so there is no reason to set
it.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index da7fdfb..ba30023 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -99,7 +99,6 @@ python copy_buildsystem () {
     config.set('General', 'core_meta_subdir', core_meta_subdir)
     config.add_section('SDK')
     config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
-    config.set('SDK', 'sdk_update_targets', d.getVar('SDK_INSTALL_TARGETS', True))
     updateurl = d.getVar('SDK_UPDATE_URL', True)
     if updateurl:
         config.set('SDK', 'updateserver', updateurl)
-- 
2.5.0



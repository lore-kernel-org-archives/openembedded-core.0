Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 814D472E10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192627"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:45 -0800
Message-Id: <1423161588-6867-8-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 07/10] update-rc.d: Allow to use different initscripts provider
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:16 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* until now all recipes were respecting VIRTUAL-RUNTIME_initscripts
  variable but commit bba835fed88c3bd5bb5bd58962034aef57c408d8
  hardcoded "initscripts" runtime dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e8debdf..2553afa 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,7 +1,8 @@
 UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
-DEPENDS_append_class-target = " initscripts"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
-- 
2.1.0



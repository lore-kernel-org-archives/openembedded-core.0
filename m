Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UB5C0-0002cr-Ml
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 16:14:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Feb 2013 06:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="262648298"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2013 06:58:20 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 17:01:42 +0200
Message-Id: <1362063702-18452-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lttng: updated lttng-ust and lttng-modules to 2.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 15:14:59 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../lttng/{lttng-modules_2.1.0.bb => lttng-modules_2.1.1.bb}       |    4 ++--
 .../lttng/{lttng-ust_2.1.0.bb => lttng-ust_2.1.1.bb}               |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.1.0.bb => lttng-modules_2.1.1.bb} (93%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.1.0.bb => lttng-ust_2.1.1.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
index b3a25f9..1be0fc1 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "b945d6c4083ce287f390f54dff4b5e0b73a9f845"
-PV = "2.1.0"
+SRCREV = "b374c356eb4827b68754d68adc0f1c94b5de9faa"
+PV = "2.1.1"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
index 20c8b3d..71cc976 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
@@ -17,8 +17,8 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
-PV = "2.1.0"
+SRCREV = "05356aa2a4dca0bc9bfd716d2d6723e3941851dc"
+PV = "2.1.1"
 PR = "r0"
 PE = "2"
 
-- 
1.7.10.4




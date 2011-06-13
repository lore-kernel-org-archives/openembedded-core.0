Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R3-0004ya-Q2
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2011 08:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="13895983"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2011 08:48:50 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:29 +0800
Message-Id: <98c35aecb51b755603df47a10e72e3ad8cae3b72.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 04/13] startup-notification: upgrade from 0.10 to the latest version 0.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2011 15:52:18 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...cation_0.10.bb => startup-notification_0.12.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/startup-notification/{startup-notification_0.10.bb => startup-notification_0.12.bb} (87%)

diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.10.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
similarity index 87%
rename from meta/recipes-graphics/startup-notification/startup-notification_0.10.bb
rename to meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 70afb73..d85df6b 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.10.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -22,5 +22,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bca0ed1c74bc4e483ea2ed12a5717354"
-SRC_URI[sha256sum] = "64bbeb5c28619721fc19d6920ad2b8bf6c0dc3a0e96a1b0bc26f480fbc525459"
+SRC_URI[md5sum] = "2cd77326d4dcaed9a5a23a1232fb38e9"
+SRC_URI[sha256sum] = "3c391f7e930c583095045cd2d10eb73a64f085c7fde9d260f2652c7cb3cfbe4a"
-- 
1.7.1




Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd7-0001K5-IJ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283960"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:37 -0700
Message-Id: <2bbb042e0389323b7bf9d9a8bc36710bcff98e4e.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/51] startup-notification: upgrade from 0.10 to the latest version 0.12
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:46 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.3.4




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyq-0007o4-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328342"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:56 +0300
Message-Id: <1343108218-7108-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 3/5] telepathy-mission-control: upgrade to ver. 5.13
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
X-List-Received-Date: Tue, 24 Jul 2012 05:48:24 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...12.0.bb => telepathy-mission-control_5.13.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.12.0.bb => telepathy-mission-control_5.13.0.bb} (92%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
similarity index 92%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
index 65b5d89..f1f4c1e 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "f39dcfef785a37dc21efa9af06be2e61"
-SRC_URI[sha256sum] = "660aeb65543e1b029dfde6a895934cb20b766644bae2a68c0030052aa6645e77"
+SRC_URI[md5sum] = "8b0c82136467d1188d4fa7f032cd3beb"
+SRC_URI[sha256sum] = "b546da6bd1a1ac16f8a1db67b7673673e007ecaf9844da405c50acbcef0118eb"
-- 
1.7.9.5




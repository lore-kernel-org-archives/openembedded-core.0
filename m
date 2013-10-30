Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8561D6D4F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:22:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Oct 2013 08:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314791933"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 08:22:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 17:24:51 +0200
Message-Id: <eb8ac1708cd2c6a7bbe27cd4b856096df7235830.1383146648.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] telepathy-mission-control: upgrade to 5.16.0
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
X-List-Received-Date: Wed, 30 Oct 2013 15:22:44 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...-mission-control_5.15.0.bb => telepathy-mission-control_5.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.15.0.bb => telepathy-mission-control_5.16.0.bb} (93%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
similarity index 93%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
index f1a1320..bdab9c1 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz \
 	file://tmc-Makefile-fix-race.patch \
 	"
-SRC_URI[md5sum] = "0efd7d9043f6e189e8ed8111d043b52c"
-SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4a7e1b5"
+SRC_URI[md5sum] = "736ae9d71028d8e6d95017433c07fa06"
+SRC_URI[sha256sum] = "edc3c7265c291343d5d7d47c20add4d426e894068c66c79696795502a4e1c1d0"
 
 inherit autotools pkgconfig pythonnative
 
-- 
1.8.1.2



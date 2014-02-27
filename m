Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 13A736F3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:05:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 08:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="463509435"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 08:04:43 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 18:07:33 +0200
Message-Id: <1664f6f8f35d9e5b87e1aa12fa146f07a8be111f.1393517205.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
Subject: [PATCH 4/4] telepathy-mission-control: upgrade to 5.16.1
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
X-List-Received-Date: Thu, 27 Feb 2014 16:05:40 -0000

- Switched to {BP} variable.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...n-control_5.16.0.bb => telepathy-mission-control_5.16.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.16.0.bb => telepathy-mission-control_5.16.1.bb} (89%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
similarity index 89%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
index fbd8ba2..b242f1a 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 SECTION = "libs"
 DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz \
-	file://tmc-Makefile-fix-race.patch \
-	"
-SRC_URI[md5sum] = "736ae9d71028d8e6d95017433c07fa06"
-SRC_URI[sha256sum] = "edc3c7265c291343d5d7d47c20add4d426e894068c66c79696795502a4e1c1d0"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz \
+           file://tmc-Makefile-fix-race.patch \
+          "
+SRC_URI[md5sum] = "421115a35b9e427807326877f86e7f43"
+SRC_URI[sha256sum] = "14ceb7d53535b43d44b8271ad11319d1d0fe6d193d154636b9e62b42799b9723"
 
 inherit autotools pkgconfig pythonnative
 
-- 
1.8.3.2



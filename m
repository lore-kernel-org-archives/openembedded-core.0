Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 36F516B522
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219339"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:20 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:51 +0300
Message-Id: <e884741062a185755959b34d1fc7b1c052c2d8ee.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 2/7] telepathy-idle: upgrade to v0.1.16
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:20 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-svc-gtk-doc.h-target.patch                                   | 0
 .../telepathy/{telepathy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} | 5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.14 => telepathy-idle-0.1.16}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.14/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gtk-doc.h-target.patch
similarity index 100%
rename from meta/recipes-connectivity/telepathy/telepathy-idle-0.1.14/fix-svc-gtk-doc.h-target.patch
rename to meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gtk-doc.h-target.patch
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
index 4edcb3b..279e8f1 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-svc-gtk-doc.h-target.patch"
-
-SRC_URI[md5sum] = "c292c54aa08f61544ab53fda880d861c"
-SRC_URI[sha256sum] = "df344e7959d99ab4ee4c0bcde82e6fc652cc48dc93ce11fcd024fa2383068fec"
+SRC_URI[md5sum] = "afabda908a798aac3a427f4564af113a"
+SRC_URI[sha256sum] = "739614e2d526d82bdd2fd94026ca70a46670563556ff15537a2a08bf17172875"
 
 inherit autotools pkgconfig pythonnative
 
-- 
1.8.1.2



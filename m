Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E7AB06B1A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 19:58:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2013 11:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,709,1378882800"; d="scan'208";a="428452444"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2013 11:58:59 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 22:01:13 +0200
Message-Id: <837a7c0e891212fce3ce837e3ab50b04235a5dc3.1384545568.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384545568.git.cristian.iorga@intel.com>
References: <cover.1384545568.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1384545568.git.cristian.iorga@intel.com>
References: <cover.1384545568.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] telepathy-idle: upgrade to 0.2.0
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
X-List-Received-Date: Fri, 15 Nov 2013 19:58:58 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-svc-gtk-doc.h-target.patch                                    | 0
 .../telepathy/{telepathy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb}   | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.16 => telepathy-idle-0.2.0}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.2.0/fix-svc-gtk-doc.h-target.patch
similarity index 100%
rename from meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gtk-doc.h-target.patch
rename to meta/recipes-connectivity/telepathy/telepathy-idle-0.2.0/fix-svc-gtk-doc.h-target.patch
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
index 279e8f1..ca09f6d 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-svc-gtk-doc.h-target.patch"
-SRC_URI[md5sum] = "afabda908a798aac3a427f4564af113a"
-SRC_URI[sha256sum] = "739614e2d526d82bdd2fd94026ca70a46670563556ff15537a2a08bf17172875"
+SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
+SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
 
 inherit autotools pkgconfig pythonnative
 
-- 
1.8.1.2



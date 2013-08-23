Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 36D826AF21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:40:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 06:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385466306"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 06:40:34 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 16:42:18 +0300
Message-Id: <82ee88fb8b3cf9464e18c7106e9a1b8df69ce8e9.1377264698.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
Subject: [PATCH v3 3/4] packagegroup-self-hosted: changing the icon theme to sato
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
X-List-Received-Date: Fri, 23 Aug 2013 13:40:49 -0000

Hicolor icon theme does not properly displays icons for
folders in Build Appliance.
Sato icon theme is working correctly.
Also, settings-daemon needs to be added to image in order to
properly display folder icons.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 2d35c16..429ade9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -123,7 +123,9 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     grep \
     groff \
     gzip \
+    settings-daemon \
     hicolor-icon-theme \
+    sato-icon-theme \
     libaio \
     libusb1 \
     libxml2 \
-- 
1.8.1.2



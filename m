Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E87F56B882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:04:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 09:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389202979"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 09:03:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 19:05:35 +0300
Message-Id: <29dc9b54d198d73cae3070ddf9c79a5baf5e72e9.1377014441.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] build-appliance-image: changing the icon theme to sato
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
X-List-Received-Date: Tue, 20 Aug 2013 16:04:34 -0000

Hicolor icon theme does not properly displays icons for folders.
Sato icon theme is working correctly.
Also, settings-daemon needs to be added to image in order to
properly display folder icons.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index b58d238..c1e2951 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -124,7 +124,8 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     grep \
     groff \
     gzip \
-    hicolor-icon-theme \
+    settings-daemon \
+    sato-icon-theme \
     libaio \
     libusb1 \
     libxml2 \
-- 
1.8.1.2



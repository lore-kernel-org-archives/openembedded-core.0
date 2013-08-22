Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E382860842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385034929"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 10:21:28 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:23:08 +0300
Message-Id: <0bc1b765cb761d38cd6d0ff0802b803480877d9c.1377191890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
Subject: [PATCH v2 3/4] build-appliance-image: changing the icon theme to sato
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:28 -0000

Hicolor icon theme does not properly displays icons for folders.
Sato icon theme is working correctly.
Also, settings-daemon needs to be added to image in order to
properly display folder icons.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 2d35c16..17dc980 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -123,7 +123,8 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
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



Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B5727772E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:52:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2016 06:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="1082696785"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2016 06:52:49 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 08:54:04 -0600
Message-Id: <1481900044-24933-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] pcmanfm: upgrading to 1.2.5
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
X-List-Received-Date: Fri, 16 Dec 2016 14:52:49 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>


Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-sato/pcmanfm/{pcmanfm_1.2.4.bb => pcmanfm_1.2.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.2.4.bb => pcmanfm_1.2.5.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
index a6bf213..aab7911 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "19764c2f59653724c8713e0064fa6829"
-SRC_URI[sha256sum] = "38cdbb5f01d24483b41b8e6846e4aa66a5751bb3982a8618899e88a853dbe313"
+SRC_URI[md5sum] = "b4d1f8ce08d87e4f27805a246fc51ac2"
+SRC_URI[sha256sum] = "0c86cac028b705ff314c7464d814c2cf7ff604c17491c20aa204b1ef1a80ad67"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.1.4



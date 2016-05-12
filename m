Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CACB771951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144645"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:54 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:31 +0300
Message-Id: <c5432080e7ec902162d90bad5eadcaaa956a4b06.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/13] libdrm: Upgrade 2.4.67 -> 2.4.68
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
X-List-Received-Date: Thu, 12 May 2016 07:21:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.67.bb => libdrm_2.4.68.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.67.bb => libdrm_2.4.68.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.67.bb b/meta/recipes-graphics/drm/libdrm_2.4.68.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.67.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.68.bb
index ddd697f..758f801 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.67.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.68.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://fix_O_CLOEXEC_undeclared.patch \
           "
 
-SRC_URI[md5sum] = "b844c6af34e613ebf52f80b3cd8d7055"
-SRC_URI[sha256sum] = "ee5b71e1113be37544d0752681c12f040c01f782e2933df7d7bc21fd0d10cebe"
+SRC_URI[md5sum] = "bcc96848d969cecf28223f668eeff354"
+SRC_URI[sha256sum] = "5b4bd9a5922929bc716411cb74061fbf31b06ba36feb89bc1358a91a8d0ca9df"
 
 inherit autotools pkgconfig
 
-- 
2.1.4



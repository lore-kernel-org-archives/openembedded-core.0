Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F338078511
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402292"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:52 +0200
Message-Id: <20171114145754.9643-25-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/27] libxslt: update to 1.1.32
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libxslt/{libxslt_1.1.31.bb => libxslt_1.1.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.31.bb => libxslt_1.1.32.bb} (90%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.31.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
similarity index 90%
rename from meta/recipes-support/libxslt/libxslt_1.1.31.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.32.bb
index 77b8b768eb6..e8b1409d79b 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.31.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -12,8 +12,8 @@ SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            "
 
-SRC_URI[md5sum] = "14e9842a70fda476065f2eefcbc29af0"
-SRC_URI[sha256sum] = "db25e96b6b801144277e67c05b10560ac09dfff82ccd53a154ce86e43622f3ab"
+SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
+SRC_URI[sha256sum] = "526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.15.0



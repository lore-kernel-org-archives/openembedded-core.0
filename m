Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A58C676FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539723"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:17 +0300
Message-Id: <719ab96d071e433464dafa9b72816e94a6e8b4a5.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/12] python-smmap: update to 0.9.0
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/{python-smmap_0.8.2.bb => python-smmap_0.9.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-smmap_0.8.2.bb => python-smmap_0.9.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python-smmap_0.8.2.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python-smmap_0.8.2.bb
rename to meta/recipes-devtools/python/python-smmap_0.9.0.bb
index 64f812d..b658be8 100644
--- a/meta/recipes-devtools/python/python-smmap_0.8.2.bb
+++ b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
 SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
-SRC_URI[md5sum] = "f5426b7626ddcf5e447253fae0396b0c"
-SRC_URI[sha256sum] = "dea2955cc045ec5527da6b762f7e95a5be7f645c683b54ccce52d56b4d7e2d6f"
+SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
+SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
 S = "${WORKDIR}/smmap-${PV}"
 
-- 
2.1.4



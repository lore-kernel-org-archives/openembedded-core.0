Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2F57646B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407404"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:30:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:30 +0300
Message-Id: <0c7f8aaf4b04cf1bb866dae6af21509af051fbe6.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/26] libproxy: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

Google Code is shutting down soon, so libproxy tarball is now fetched
from Debian mirrors

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 9d388d6..06d0b9b 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "gconf glib-2.0"
 
-SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
+SRC_URI = "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-test-Include-sys-select.h-for-select.patch \
           "
-
-SRC_URI[md5sum] = "06be230b8b612e64997f8f15af6373aa"
-SRC_URI[sha256sum] = "3175abcb49c0b37fd82c697927783bf7d53de3884a8559bc594e59caa09bdb04"
+SRC_URI[md5sum] = "3cd1ae2a4abecf44b3f24d6639d2cd84"
+SRC_URI[sha256sum] = "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ecaad3cbfe4821864b"
 
 inherit cmake pkgconfig
 
-- 
2.1.4



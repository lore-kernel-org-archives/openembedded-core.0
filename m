Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3180060420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405592"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:20 -0700
Message-Id: <71e07a0626113cb155a76f34051a236eee053c65.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] desktop-file-utils: Update to 0.21
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

COPYING had formating and Address changes

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-utils-native_0.15.bb => desktop-file-utils-native_0.21.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.15.bb => desktop-file-utils-native_0.21.bb} (57%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb
similarity index 57%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb
index b971c7e..13f1db6 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
 LICENSE = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0-native"
 
-SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz"
+SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fda5c312c9fb3b8d818fb54f2c34db82"
+SRC_URI[sha256sum] = "b6c9b860538ef1cffbcdfbc9cb578f85a080ad8c1207c8b3a39e9fd183f9782b"
 
 inherit autotools native
 
 S = "${WORKDIR}/desktop-file-utils-${PV}"
-
-SRC_URI[md5sum] = "2fe8ebe222fc33cd4a959415495b7eed"
-SRC_URI[sha256sum] = "c463d851fb057acd53800cfc4f8ae39dcbcad7f03b4bd547288e95b6de53b022" 
-- 
1.8.1.4



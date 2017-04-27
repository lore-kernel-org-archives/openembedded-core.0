Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0C077D67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884568"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:04 +0300
Message-Id: <1ab3b6b856ac22eb605afc347f2aea7a8aaa75f4.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/13] mklibs-native: remove native python dependency
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:28 -0000

It's not actually required; host python is fine.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
index b9c6c6f3266..a16147657ca 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://launchpad.net/mklibs"
 SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-DEPENDS = "python-native"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20161123T152011Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
 	file://ac_init_fix.patch\
@@ -20,6 +19,6 @@ SRC_URI[sha256sum] = "6f0cf24ade13fff76e943c003413d85c3e497c984c95c1ecea1c9731ca
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
 
-inherit autotools gettext native pythonnative
+inherit autotools gettext native
 
 S = "${WORKDIR}/mklibs"
-- 
2.11.0



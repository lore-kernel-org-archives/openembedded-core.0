Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E3D9B731C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:04:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 06:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1024872173"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jul 2016 06:03:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F293C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:39 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:57 +0300
Message-Id: <1469624577-24972-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 9/9] cmake: upgrade to 3.6.1
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
X-List-Received-Date: Wed, 27 Jul 2016 13:04:03 -0000

3.5.2 -> 3.6.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../cmake/{cmake-native_3.5.2.bb => cmake-native_3.6.1.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.5.2.bb => cmake_3.6.1.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.5.2.bb => cmake-native_3.6.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.5.2.bb => cmake_3.6.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4c1a4c7..1a1896f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,8 +16,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://qt4-fail-silent.patch \
            "
 
-SRC_URI[md5sum] = "701386a1b5ec95f8d1075ecf96383e02"
-SRC_URI[sha256sum] = "92d8410d3d981bb881dfff2aed466da55a58d34c7390d50449aa59b32bb5e62a"
+SRC_URI[md5sum] = "d6dd661380adacdb12f41b926ec99545"
+SRC_URI[sha256sum] = "28ee98ec40427d41a45673847db7a905b59ce9243bb866eaf59dce0f58aaef11"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.5.2.bb b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.5.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.6.1.bb
-- 
2.4.0



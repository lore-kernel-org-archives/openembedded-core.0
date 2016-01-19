Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14BC573204
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546165"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:29 +0000
Message-Id: <a938616ac3118dd57ed06c67c684cfadb150e82e.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 6/9] python-scons: upgrade to 2.4.1
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:50 -0000

Updates runtime dependencies, python-scon now depends on python-io and python-fcntl.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...python-scons-native_2.3.6.bb => python-scons-native_2.4.1.bb} | 0
 .../python/{python-scons_2.3.6.bb => python-scons_2.4.1.bb}      | 9 +++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.6.bb => python-scons-native_2.4.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.6.bb => python-scons_2.4.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.6.bb b/meta/recipes-devtools/python/python-scons-native_2.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.3.6.bb
rename to meta/recipes-devtools/python/python-scons-native_2.4.1.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.3.6.bb b/meta/recipes-devtools/python/python-scons_2.4.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python-scons_2.3.6.bb
rename to meta/recipes-devtools/python/python-scons_2.4.1.bb
index cb90294..096cf5c 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.6.bb
+++ b/meta/recipes-devtools/python/python-scons_2.4.1.bb
@@ -6,8 +6,8 @@ SRCNAME = "scons"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9c6a1c3c716cbe5f16515f163c91d928"
-SRC_URI[sha256sum] = "98adaa351d8f4e4068a5bf1894bdd7f85b390c8c3f80d437cf8bb266012404df"
+SRC_URI[md5sum] = "9a0ddf33d9839f04380e0fae87cc4b40"
+SRC_URI[sha256sum] = "8fc4f42928c69bcbb33e1be94b646f2c700b659693fabc778c192d4d22f753a7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/scons/files/scons/"
 UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
@@ -15,3 +15,8 @@ UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
+
+RDEPENDS_${PN} = "\
+  python-fcntl \
+  python-io \
+  "
-- 
1.8.4.5



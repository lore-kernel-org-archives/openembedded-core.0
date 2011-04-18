Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QBhCJ-00085G-Gl
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 07:40:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2011 22:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="680437152"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2011 22:38:09 -0700
Message-Id: <1f55cb61f117508250ece18d8a0035bcbd8b825a.1303105369.git.ke.yu@intel.com>
In-Reply-To: <cover.1303105369.git.ke.yu@intel.com>
References: <cover.1303105369.git.ke.yu@intel.com>
Old-Date: Sat, 16 Apr 2011 13:34:33 +0800
Date: Mon, 18 Apr 2011 13:45:40 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/3] mesa 7.10.2: add python-native dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2011 05:40:32 -0000

From: Yu Ke <ke.yu@intel.com>

As Tom point out, mesa 7.10 has introduce some python script
(e.g. src/mesa/main/es_generator.py), so should add python-native
dependency

Signed-off-by: Yu Ke <ke.yu@intel.com>
CC: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
index 99d6066..28f9f27 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
@@ -6,7 +6,7 @@ PROTO_DEPS = "xf86driproto glproto dri2proto"
 LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat \
             libxml2-native"
 
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
+DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 
 PR = "r0"
 
-- 
1.7.0.4




Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 994A5737AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:19:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 25 Jun 2015 04:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,675,1427785200"; d="scan'208";a="514055699"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 04:19:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:20:01 +0300
Message-Id: <7334bed178a16addccb10982ff9c198baed8d699.1435228589.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
References: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1435228589.git.jussi.kukkonen@intel.com>
References: <cover.1435228589.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] mesa: Upgrade 10.5.6 -> 10.5.8
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
X-List-Received-Date: Thu, 25 Jun 2015 11:19:52 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb} | 0
 meta/recipes-graphics/mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb} (77%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.6.bb b/meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.5.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa_10.5.6.bb b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_10.5.6.bb
rename to meta/recipes-graphics/mesa/mesa_10.5.8.bb
index 70cc8aa..7cfef0c 100644
--- a/meta/recipes-graphics/mesa/mesa_10.5.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7a845c50fc8aaae4c9373e795c1f491d"
-SRC_URI[sha256sum] = "66017853bde5f7a6647db3eede30512a091a3491daa1708e0ad8027c328ba595"
+SRC_URI[md5sum] = "5332a3576c5e3a0c3947ee6668dd4157"
+SRC_URI[sha256sum] = "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663da2b54"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.1.4



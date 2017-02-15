Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7806E71BA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 20:02:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 12:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,166,1484035200"; d="scan'208";a="934321007"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.40])
	by orsmga003.jf.intel.com with ESMTP; 15 Feb 2017 12:01:49 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 14:03:35 -0600
Message-Id: <1487189015-26055-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] swig: upgrade to 3.0.12
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
X-List-Received-Date: Wed, 15 Feb 2017 20:02:09 -0000

Minimal update for swig

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.11.bb => swig_3.0.12.bb} (58%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.11.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
similarity index 58%
rename from meta/recipes-devtools/swig/swig_3.0.11.bb
rename to meta/recipes-devtools/swig/swig_3.0.12.bb
index 44c8e75..d5caa67 100644
--- a/meta/recipes-devtools/swig/swig_3.0.11.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.12.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
-SRC_URI[md5sum] = "13732eb0f1ab2123d180db8425c1edea"
-SRC_URI[sha256sum] = "d9031d531d7418829a54d0d51c4ed9007016b213657ec70be44031951810566e"
+SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
+SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
 
-- 
2.1.4



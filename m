Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7CC71C24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 17:05:57 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 12 Jan 2017 09:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208";a="53114586"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.47])
	by fmsmga006.fm.intel.com with ESMTP; 12 Jan 2017 09:05:58 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 11:07:28 -0600
Message-Id: <1484240848-792-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] swig: upgrade to 3.0.11
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
X-List-Received-Date: Thu, 12 Jan 2017 17:05:58 -0000

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/swig/{swig_3.0.10.bb => swig_3.0.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.10.bb => swig_3.0.11.bb} (58%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.10.bb b/meta/recipes-devtools/swig/swig_3.0.11.bb
similarity index 58%
rename from meta/recipes-devtools/swig/swig_3.0.10.bb
rename to meta/recipes-devtools/swig/swig_3.0.11.bb
index 44c26c4..44c8e75 100644
--- a/meta/recipes-devtools/swig/swig_3.0.10.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.11.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
-SRC_URI[md5sum] = "bb4ab8047159469add7d00910e203124"
-SRC_URI[sha256sum] = "2939aae39dec06095462f1b95ce1c958ac80d07b926e48871046d17c0094f44c"
+SRC_URI[md5sum] = "13732eb0f1ab2123d180db8425c1edea"
+SRC_URI[sha256sum] = "d9031d531d7418829a54d0d51c4ed9007016b213657ec70be44031951810566e"
 
-- 
2.1.4



Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9162731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546170"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:31 +0000
Message-Id: <37e7dd8cf6c3cb6ce1120797e18d4c6ebb915b83.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 8/9] swig: upgrade to 3.0.8
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

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/swig/{swig_3.0.6.bb => swig_3.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_3.0.6.bb => swig_3.0.8.bb} (58%)

diff --git a/meta/recipes-devtools/swig/swig_3.0.6.bb b/meta/recipes-devtools/swig/swig_3.0.8.bb
similarity index 58%
rename from meta/recipes-devtools/swig/swig_3.0.6.bb
rename to meta/recipes-devtools/swig/swig_3.0.8.bb
index 2a0917e..c1b820e 100644
--- a/meta/recipes-devtools/swig/swig_3.0.6.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.8.bb
@@ -3,6 +3,6 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
            "
-SRC_URI[md5sum] = "df43ae271642bcfa61c1e59f970f9963"
-SRC_URI[sha256sum] = "c67f63ea11956106e4cda66416d5020330dc4ce2ee45057d39a9494ce33eca05"
+SRC_URI[md5sum] = "c96a1d5ecb13d38604d7e92148c73c97"
+SRC_URI[sha256sum] = "58a475dbbd4a4d7075e5fe86d4e54c9edde39847cdb96a3053d87cb64a23a453"
 
-- 
1.8.4.5



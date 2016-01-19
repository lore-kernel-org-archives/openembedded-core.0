Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 201B9731BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546161"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:26 +0000
Message-Id: <e410fa32323188f62ab6ce0fbd535d97b130b10c.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/9] python-mako: upgrade to 1.0.3
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:48 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python-mako_1.0.1.bb => python-mako_1.0.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-mako_1.0.1.bb => python-mako_1.0.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python-mako_1.0.1.bb b/meta/recipes-devtools/python/python-mako_1.0.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python-mako_1.0.1.bb
rename to meta/recipes-devtools/python/python-mako_1.0.3.bb
index 647c2d1..9efd700 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=deb3ff8e4c17aaf7b80889b6b2bf4c83"
 
 SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9f0aafd177b039ef67b90ea350497a54"
-SRC_URI[sha256sum] = "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"
+SRC_URI[md5sum] = "a78f20f6366a8a0659ce5532f8614e53"
+SRC_URI[sha256sum] = "7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
 UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
-- 
1.8.4.5



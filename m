Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3A54F6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 23:54:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2013 16:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,731,1367996400"; d="scan'208";a="335789706"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 16:53:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 16:53:56 -0700
Message-Id: <4fb5e15cdf474155898bd229a3c2e0fce74aaefc.1374622196.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
In-Reply-To: <cover.1374622196.git.sgw@linux.intel.com>
References: <cover.1374622196.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] mklibs-native: Update to 0.1.38
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
X-List-Received-Date: Tue, 23 Jul 2013 23:54:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mklibs/{mklibs-native_0.1.37.bb => mklibs-native_0.1.38.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.37.bb => mklibs-native_0.1.38.bb} (80%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
similarity index 80%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
index c37ea87..e424052 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.g
 	file://fix_STT_GNU_IFUNC.patch\
 "
 
-SRC_URI[md5sum] = "099cc99d51f09ea51e58a56e62a46af7"
-SRC_URI[sha256sum] = "9b2ef35618b1c2def1ca7a0a92c2b3029ef7f2080d894b6d1dbb3f313684d3a3"
+SRC_URI[md5sum] = "e597b01548204874feef396403615d9f"
+SRC_URI[sha256sum] = "e7fe79db2673bb26c98c63fd8b40dcb44b9b94c4bc52a8c4c8112a5cbaf29bf4"
 
 inherit autotools gettext native pythonnative
 
-- 
1.8.1.4



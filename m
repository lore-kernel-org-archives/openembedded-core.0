Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Seix4-0005R0-0n
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 10:29:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2012 01:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="156961062"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2012 01:18:40 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 11:20:10 +0300
Message-Id: <1339575610-21995-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: gcc-configure-common: Use build time sysroot for target gcc
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
X-List-Received-Date: Wed, 13 Jun 2012 08:29:18 -0000

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Otherwise it assumes / as sysroot on build host and starts
searching for directories in there.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
index 1ee7504..5bca2b7 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
@@ -1,4 +1,6 @@
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = " \
+    --with-sysroot \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
     --with-gxx-include-dir=${includedir}/c++/"
--
cgit v0.9.0.2-39-g756e



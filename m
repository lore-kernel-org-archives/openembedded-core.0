Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0G-0000H5-06
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 06:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81325200"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 06:12:34 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:29 +0800
Message-Id: <685dc1375188fc90c1b3f8fd3b38442ec9bafddc.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 3/8] lzo: upgrade from 2.05 to the latest version 2.06
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
X-List-Received-Date: Wed, 30 Nov 2011 14:19:16 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../lzo/{lzo-2.05 => lzo-2.06}/acinclude.m4        |    0
 .../lzo/{lzo-2.05 => lzo-2.06}/autoconf.patch      |    9 ++++++++-
 .../lzo/{lzo_2.05.bb => lzo_2.06.bb}               |    4 ++--
 3 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-support/lzo/{lzo-2.05 => lzo-2.06}/acinclude.m4 (100%)
 rename meta/recipes-support/lzo/{lzo-2.05 => lzo-2.06}/autoconf.patch (79%)
 rename meta/recipes-support/lzo/{lzo_2.05.bb => lzo_2.06.bb} (81%)

diff --git a/meta/recipes-support/lzo/lzo-2.05/acinclude.m4 b/meta/recipes-support/lzo/lzo-2.06/acinclude.m4
similarity index 100%
rename from meta/recipes-support/lzo/lzo-2.05/acinclude.m4
rename to meta/recipes-support/lzo/lzo-2.06/acinclude.m4
diff --git a/meta/recipes-support/lzo/lzo-2.05/autoconf.patch b/meta/recipes-support/lzo/lzo-2.06/autoconf.patch
similarity index 79%
rename from meta/recipes-support/lzo/lzo-2.05/autoconf.patch
rename to meta/recipes-support/lzo/lzo-2.06/autoconf.patch
index dbd2072..63c1d2d 100644
--- a/meta/recipes-support/lzo/lzo-2.05/autoconf.patch
+++ b/meta/recipes-support/lzo/lzo-2.06/autoconf.patch
@@ -5,6 +5,13 @@ to pass build
 Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Qing He <qing.he@intel.com>
+
+
+
+Wed Nov 30 14:42:01 CST 2011
+Rebase to lzo-2.06.
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
 ---
 diff --git a/configure.ac b/configure.ac
 index 650749a..2a78845 100644
@@ -16,6 +23,6 @@ index 650749a..2a78845 100644
  
 -AC_PREREQ(2.67)
 +AC_PREREQ(2.65)
- AC_INIT([LZO],[2.05],[markus@oberhumer.com],[lzo],[http://www.oberhumer.com/opensource/lzo/])
+ AC_INIT([LZO],[2.06],[markus@oberhumer.com],[lzo],[http://www.oberhumer.com/opensource/lzo/])
  AC_MSG_NOTICE([Configuring LZO $PACKAGE_VERSION])
  AC_CONFIG_SRCDIR(src/lzo_init.c)
diff --git a/meta/recipes-support/lzo/lzo_2.05.bb b/meta/recipes-support/lzo/lzo_2.06.bb
similarity index 81%
rename from meta/recipes-support/lzo/lzo_2.05.bb
rename to meta/recipes-support/lzo/lzo_2.06.bb
index c49e94a..b2cc171 100644
--- a/meta/recipes-support/lzo/lzo_2.05.bb
+++ b/meta/recipes-support/lzo/lzo_2.06.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://acinclude.m4 \
            "
 
-SRC_URI[md5sum] = "c67cda5fa191bab761c7cb06fe091e36"
-SRC_URI[sha256sum] = "449f98186d76ba252cd17ff1241ca2a96b7f62e0d3e4766f88730dab0ea5f333"
+SRC_URI[md5sum] = "95380bd4081f85ef08c5209f4107e9f8"
+SRC_URI[sha256sum] = "ff79e6f836d62d3f86ef6ce893ed65d07e638ef4d3cb952963471b4234d43e73"
 
 inherit autotools
 
-- 
1.7.6




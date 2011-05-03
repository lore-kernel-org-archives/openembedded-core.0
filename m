Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJP-0001r0-KN
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="637467177"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2011 16:44:45 -0700
Message-Id: <ef3103b1740cd7fff896a8890904165e168dd85f.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 16:14:19 +0800
Date: Tue, 03 May 2011 16:44:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 18/33] lzo: upgrade to version 2.05
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
X-List-Received-Date: Tue, 03 May 2011 23:47:28 -0000

From: Qing He <qing.he@intel.com>

from 2.04

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../lzo/{lzo-2.04 => lzo-2.05}/acinclude.m4        |    0
 .../lzo/{lzo-2.04 => lzo-2.05}/autoconf.patch      |    4 +++-
 .../lzo/{lzo_2.04.bb => lzo_2.05.bb}               |    8 ++++----
 3 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-support/lzo/{lzo-2.04 => lzo-2.05}/acinclude.m4 (100%)
 rename meta/recipes-support/lzo/{lzo-2.04 => lzo-2.05}/autoconf.patch (84%)
 rename meta/recipes-support/lzo/{lzo_2.04.bb => lzo_2.05.bb} (59%)

diff --git a/meta/recipes-support/lzo/lzo-2.04/acinclude.m4 b/meta/recipes-support/lzo/lzo-2.05/acinclude.m4
similarity index 100%
rename from meta/recipes-support/lzo/lzo-2.04/acinclude.m4
rename to meta/recipes-support/lzo/lzo-2.05/acinclude.m4
diff --git a/meta/recipes-support/lzo/lzo-2.04/autoconf.patch b/meta/recipes-support/lzo/lzo-2.05/autoconf.patch
similarity index 84%
rename from meta/recipes-support/lzo/lzo-2.04/autoconf.patch
rename to meta/recipes-support/lzo/lzo-2.05/autoconf.patch
index c342387..dbd2072 100644
--- a/meta/recipes-support/lzo/lzo-2.04/autoconf.patch
+++ b/meta/recipes-support/lzo/lzo-2.05/autoconf.patch
@@ -2,6 +2,8 @@ Date: 12/31/2010
 Didn't find 2.67 specific features, so lower the requirement
 to pass build
 
+Upstream-Status: Inappropriate [workaround]
+
 Signed-off-by: Qing He <qing.he@intel.com>
 ---
 diff --git a/configure.ac b/configure.ac
@@ -14,6 +16,6 @@ index 650749a..2a78845 100644
  
 -AC_PREREQ(2.67)
 +AC_PREREQ(2.65)
- AC_INIT([LZO],[2.04],[markus@oberhumer.com],[lzo],[http://www.oberhumer.com/opensource/lzo/])
+ AC_INIT([LZO],[2.05],[markus@oberhumer.com],[lzo],[http://www.oberhumer.com/opensource/lzo/])
  AC_MSG_NOTICE([Configuring LZO $PACKAGE_VERSION])
  AC_CONFIG_SRCDIR(src/lzo_init.c)
diff --git a/meta/recipes-support/lzo/lzo_2.04.bb b/meta/recipes-support/lzo/lzo_2.05.bb
similarity index 59%
rename from meta/recipes-support/lzo/lzo_2.04.bb
rename to meta/recipes-support/lzo/lzo_2.05.bb
index f8c8aba..411b744 100644
--- a/meta/recipes-support/lzo/lzo_2.04.bb
+++ b/meta/recipes-support/lzo/lzo_2.05.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8cad52263e636e25377bc18420118101 \
-                    file://src/lzo_init.c;beginline=5;endline=36;md5=454f781644dfe945e3634a9b699e91f3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/lzo_init.c;beginline=23;endline=40;md5=924a0f71f5394f6d404be3b458474769"
 PR = "r0"
 
 SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
@@ -12,8 +12,8 @@ SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://acinclude.m4 \
            "
 
-SRC_URI[md5sum] = "a383c7055a310e2a71b9ecd19cfea238"
-SRC_URI[sha256sum] = "4ee3a040facf39561f13e4ef2ab99a886fd68251a35d612486ed0625cc6ab428"
+SRC_URI[md5sum] = "c67cda5fa191bab761c7cb06fe091e36"
+SRC_URI[sha256sum] = "449f98186d76ba252cd17ff1241ca2a96b7f62e0d3e4766f88730dab0ea5f333"
 
 inherit autotools
 
-- 
1.7.4.1




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TwAX0-0001jf-Ng
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 12:54:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2013 03:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="275442364"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2013 03:39:20 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:39:30 +0200
Message-Id: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] alsa-lib: upgrade to 1.0.26
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 11:54:52 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{alsa-lib-1.0.25 => alsa-lib}/fix-tstamp-declaration.patch  |    0
 .../obsolete_automake_macros.patch                              |    0
 .../alsa/{alsa-lib-1.0.25 => alsa-lib}/unbreak_plugindir.patch  |    0
 .../alsa/{alsa-lib_1.0.25.bb => alsa-lib_1.0.26.bb}             |    7 +++----
 4 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.25 => alsa-lib}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.25.bb => alsa-lib_1.0.26.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch b/meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch
rename to meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/obsolete_automake_macros.patch b/meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.25/obsolete_automake_macros.patch
rename to meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch b/meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch
rename to meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
index d0cb0b0..49f4486 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
@@ -14,15 +14,14 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch \
            file://obsolete_automake_macros.patch \
           "
-
-SRC_URI[md5sum] = "06fe5819020c6684b991dcffc5471304"
-SRC_URI[sha256sum] = "5a1a805cf04106316d549ec650116ce6711a162e107ba8b3c551866680e286e6"
+SRC_URI[md5sum] = "2dfa35d28471d721e592b616beedf965"
+SRC_URI[sha256sum] = "8c9f8161603cc3db640619650401292c3e110da63429ab6938aac763319f6e7d"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4




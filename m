Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEJ-0000rY-9p
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Mar 2012 17:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119574690"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:32:26 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:05 +0800
Message-Id: <8619f1fd586c395795bbeaa3c2ebec0614cb850b.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 08/60] alsa-lib: upgrade to 1.0.25
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:15 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../fix-tstamp-declaration.patch                   |    0
 .../unbreak_plugindir.patch                        |    0
 .../{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb}   |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb} (92%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
similarity index 92%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index 83e663d..90b0cba 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -14,13 +14,13 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
 
-SRC_URI[md5sum] = "7cc05f25e1d5b65da8fb3fdcd540f226"
-SRC_URI[sha256sum] = "a32f7c21015b6c71f9a80ff70a2b6a50e4ff4d5c77c744ff0793dea7ba7a2517"
+SRC_URI[md5sum] = "06fe5819020c6684b991dcffc5471304"
+SRC_URI[sha256sum] = "5a1a805cf04106316d549ec650116ce6711a162e107ba8b3c551866680e286e6"
 
 inherit autotools pkgconfig
 
-- 
1.7.6




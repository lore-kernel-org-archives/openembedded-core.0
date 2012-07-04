Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SmO0y-0008OU-Dy
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 13:45:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2012 04:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166822229"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2012 04:33:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 14:34:01 +0300
Message-Id: <1341401643-4395-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 3/5] netbase: update to ver. 5.0
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
X-List-Received-Date: Wed, 04 Jul 2012 11:45:01 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...{netbase_4.47.bbappend => netbase_5.0.bbappend} |    0
 .../netbase/{netbase-4.47 => netbase-5.0}/hosts    |    0
 .../netbase/{netbase-4.47 => netbase-5.0}/init     |    0
 .../{netbase-4.47 => netbase-5.0}/interfaces       |    0
 .../netbase/{netbase-4.47 => netbase-5.0}/nfsroot  |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemumips/interfaces                            |    0
 .../qemumips64/interfaces                          |    0
 .../qemuppc/interfaces                             |    0
 .../qemush4/interfaces                             |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../netbase/{netbase_4.47.bb => netbase_5.0.bb}    |    6 +++---
 15 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-yocto/recipes-core/netbase/{netbase_4.47.bbappend => netbase_5.0.bbappend} (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemumips/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemumips64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuppc/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemush4/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.47.bb => netbase_5.0.bb} (91%)

diff --git a/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend b/meta-yocto/recipes-core/netbase/netbase_5.0.bbappend
similarity index 100%
rename from meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
rename to meta-yocto/recipes-core/netbase/netbase_5.0.bbappend
diff --git a/meta/recipes-core/netbase/netbase-4.47/hosts b/meta/recipes-core/netbase/netbase-5.0/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/hosts
rename to meta/recipes-core/netbase/netbase-5.0/hosts
diff --git a/meta/recipes-core/netbase/netbase-4.47/init b/meta/recipes-core/netbase/netbase-5.0/init
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/init
rename to meta/recipes-core/netbase/netbase-5.0/init
diff --git a/meta/recipes-core/netbase/netbase-4.47/interfaces b/meta/recipes-core/netbase/netbase-5.0/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/nfsroot b/meta/recipes-core/netbase/netbase-5.0/nfsroot
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/nfsroot
rename to meta/recipes-core/netbase/netbase-5.0/nfsroot
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
rename to meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_5.0.bb
similarity index 91%
rename from meta/recipes-core/netbase/netbase_4.47.bb
rename to meta/recipes-core/netbase/netbase_5.0.bb
index 634560a..3aea874 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r3"
+PR = "r0"
 
 inherit update-rc.d
 
@@ -17,8 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://interfaces \
            file://nfsroot"
 
-SRC_URI[md5sum] = "fcd87a62f177592724a8066e3774ae97"
-SRC_URI[sha256sum] = "a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989387726"
+SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
+SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
-- 
1.7.9.5




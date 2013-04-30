Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UX7Je-000857-O5
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:57:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Apr 2013 02:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,580,1363158000"; d="scan'208";a="305502862"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2013 02:39:50 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 12:40:37 +0300
Message-Id: <1367314837-25731-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] netbase: upgrade to 5.1
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
X-List-Received-Date: Tue, 30 Apr 2013 09:57:55 -0000

netbase dir has generic content, hence the name change;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/netbase/{netbase-5.0 => netbase}/hosts     |    0
 meta/recipes-core/netbase/{netbase_5.0.bb => netbase_5.1.bb} |    5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/netbase/{netbase-5.0 => netbase}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase_5.0.bb => netbase_5.1.bb} (83%)

diff --git a/meta/recipes-core/netbase/netbase-5.0/hosts b/meta/recipes-core/netbase/netbase/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-5.0/hosts
rename to meta/recipes-core/netbase/netbase/hosts
diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.1.bb
similarity index 83%
rename from meta/recipes-core/netbase/netbase_5.0.bb
rename to meta/recipes-core/netbase/netbase_5.1.bb
index 03fdc38..2b1df07 100644
--- a/meta/recipes-core/netbase/netbase_5.0.bb
+++ b/meta/recipes-core/netbase/netbase_5.1.bb
@@ -4,14 +4,13 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://hosts"
 
-SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
-SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
+SRC_URI[md5sum] = "d9ba76be063eb9b31fc60e14ad8a1206"
+SRC_URI[sha256sum] = "0d291fa48e3f6490601b8e8ad62804c530cc937665a79e5c69510cd3c5ec889e"
 
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
-- 
1.7.10.4




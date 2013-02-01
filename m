Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U1ITk-0008WS-NI
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 16:24:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2013 07:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="197746572"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2013 07:08:50 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 17:09:05 +0200
Message-Id: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] net-tools: upgrade to v1.60-24.2
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
X-List-Received-Date: Fri, 01 Feb 2013 15:24:55 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../net-tools-config.h                                           |    0
 .../net-tools-config.make                                        |    0
 .../net-tools/{net-tools_1.60-23.bb => net-tools_1.60-24.2.bb}   |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-23 => net-tools-1.60-24.2}/net-tools-config.h (100%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-23 => net-tools-1.60-24.2}/net-tools-config.make (100%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-23.bb => net-tools_1.60-24.2.bb} (94%)

diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
similarity index 100%
rename from meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
rename to meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.make b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.make
similarity index 100%
rename from meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.make
rename to meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.make
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
similarity index 94%
rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb
rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
index bc61d21..4040e1a 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
@@ -17,8 +17,8 @@ S = "${WORKDIR}/net-tools-1.60"
 SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
 SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
 
-SRC_URI[patch.md5sum] = "2412e55c20308d5fbd28bfadd18c075f"
-SRC_URI[patch.sha256sum] = "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcca00c88bfd73b"
+SRC_URI[patch.md5sum] = "524658bb8df5ff92c4a991f5edcaf240"
+SRC_URI[patch.sha256sum] = "170cc024fcb34329f4c25fd88b5f160a06be5d6d3eaf0bc976650fd1b1a6235d"
 
 inherit gettext
 
-- 
1.7.10.4




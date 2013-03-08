Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UDzkI-0003Uq-QM
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 17:02:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Mar 2013 07:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="297823482"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2013 07:45:35 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id D2E36560D8D; Fri,  8 Mar 2013 17:45:34 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 17:45:27 +0200
Message-Id: <1362757528-9240-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/2] dpkg depends on ncurses
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
X-List-Received-Date: Fri, 08 Mar 2013 16:02:12 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Dpkg compilation depends on the ncurses, so add
this dependency.
---
 meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 0bc1ae8..cdecd19 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -7,7 +7,7 @@ INC_PR = "r19"
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
            file://ignore_extra_fields.patch"
 
-DEPENDS = "zlib bzip2 perl"
+DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
 RDEPENDS_${PN}_class-native = ""
-- 
1.7.10.4




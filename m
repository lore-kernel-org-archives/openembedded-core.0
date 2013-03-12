Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UFMCV-0004Vb-9O
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 11:12:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2013 02:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,829,1355126400"; d="scan'208";a="213262150"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2013 02:55:57 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id EE49756085D; Tue, 12 Mar 2013 11:56:07 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 11:56:01 +0200
Message-Id: <1363082162-22911-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
References: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [Patch V3] dpkg depends on ncurses
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
X-List-Received-Date: Tue, 12 Mar 2013 10:12:57 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Dpkg compilation depends on the ncurses, so add
this dependency.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
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




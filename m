Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TsDLO-0005fW-Ed
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:06:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 05:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="188481718"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 05:51:14 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 15:51:22 +0200
Message-Id: <1357566682-7595-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libtelepathy: python-native is used during build
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
X-List-Received-Date: Mon, 07 Jan 2013 14:06:30 -0000

python-native was not used during the build.
This could lead to problems.

Fixes [YOCTO #3679]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index ee131ee..7d0ef79 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-$
 SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
 SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig pythonnative
 
 FILES_${PN} += "${datadir}/telepathy \
 		${datadir}/dbus-1"
-- 
1.7.10.4




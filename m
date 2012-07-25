Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StvTv-00012Q-8T
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 08:54:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2012 23:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="177175995"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2012 23:42:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 09:42:39 +0300
Message-Id: <1343198559-3548-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libpcre: upgrade to ver. 8.31
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
X-List-Received-Date: Wed, 25 Jul 2012 06:54:03 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libpcre/{libpcre_8.30.bb => libpcre_8.31.bb}   |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.30.bb => libpcre_8.31.bb} (93%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.30.bb b/meta/recipes-support/libpcre/libpcre_8.31.bb
similarity index 93%
rename from meta/recipes-support/libpcre/libpcre_8.30.bb
rename to meta/recipes-support/libpcre/libpcre_8.31.bb
index 4c6dfae..e1dad8b 100644
--- a/meta/recipes-support/libpcre/libpcre_8.30.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.31.bb
@@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r2"
+PR = "r0"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "98e8928cccc945d04279581e778fbdff"
-SRC_URI[sha256sum] = "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb797804937c965f4ac"
+SRC_URI[md5sum] = "1c9a276af932b5599157f96e945391f0"
+SRC_URI[sha256sum] = "5778a02535473c7ee7838ea598c19f451e63cf5eec0bf0307a688301c9078c3c"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.7.9.5




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Se4Hu-0006re-BD
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:04:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jun 2012 05:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154727312"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by azsmga001.ch.intel.com with ESMTP; 11 Jun 2012 05:53:30 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 15:55:29 +0300
Message-Id: <1339419329-26688-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libpcre: updated to version 8.30
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
X-List-Received-Date: Mon, 11 Jun 2012 13:04:06 -0000

Tested by compiling lighttpd. The license file changed because the
copyright notice was updated to cover 2012.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../libpcre/{libpcre_8.21.bb => libpcre_8.30.bb}   |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.21.bb => libpcre_8.30.bb} (86%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.30.bb
similarity index 86%
rename from meta/recipes-support/libpcre/libpcre_8.21.bb
rename to meta/recipes-support/libpcre/libpcre_8.30.bb
index f5fa4ef..83831e7 100644
--- a/meta/recipes-support/libpcre/libpcre_8.21.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.30.bb
@@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r1"
+PR = "r0"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=2f00d186a775c8002422a5315079d96b"
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
+LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "0a7b592bea64b7aa7f4011fc7171a730"
-SRC_URI[sha256sum] = "a4b8509d11fc2764fb4e1415b764ad2c214459edc011ce48aeeb6bbe1ac599e3"
+SRC_URI[md5sum] = "98e8928cccc945d04279581e778fbdff"
+SRC_URI[sha256sum] = "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb797804937c965f4ac"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.7.9.5




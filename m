Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFrl-0005c9-CM
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 12:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153727"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:06 -0700
Message-Id: <43708fcc53f160498d9f88308953eab0df6b4999.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 02/17] libpcre: updated to version 8.30
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
X-List-Received-Date: Thu, 14 Jun 2012 19:38:01 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Tested by compiling lighttpd. The license file changed because the
copyright notice was updated to cover 2012.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../libpcre/{libpcre_8.21.bb => libpcre_8.30.bb}   |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
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
1.7.7.6




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h7-0002Mz-5S
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223567"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:31 -0700
Message-Id: <8a790577c6cce584a29d2ecfdf82300f595cdbba.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 09/19] libpcre: upgrade from 8.10 to 8.12
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
X-List-Received-Date: Wed, 25 May 2011 08:43:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libpcre/{libpcre_8.10.bb => libpcre_8.12.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.10.bb => libpcre_8.12.bb} (94%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.10.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
similarity index 94%
rename from meta/recipes-support/libpcre/libpcre_8.10.bb
rename to meta/recipes-support/libpcre/libpcre_8.12.bb
index 2e17493..0301ddb 100644
--- a/meta/recipes-support/libpcre/libpcre_8.10.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r6"
+PR = "r0"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=77f9b14fe707d0376d89bc162e6c54ff"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch;patch=1 \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
-SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
+SRC_URI[md5sum] = "f14a9fef3c92f3fc6c5ac92d7a2c7eb3"
+SRC_URI[sha256sum] = "c63070d461edc451ec9457f2324e152a531e907d5c5d2d8f8121e725acd1aeec"
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES = "pcre"
-- 
1.7.3.4




Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsO-00085l-DX
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6498070"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:24 -0700
Message-Id: <9f49240ad6ba0b2e6b4e88c1d67220f4921335f3.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
References: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: [UPGRADES 2/5] libpcre: upgrade from 8.10 to 8.12
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
X-List-Received-Date: Tue, 24 May 2011 00:53:36 -0000

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
1.7.3.5




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXPN6-0000bW-4J
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:09:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 20:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147726310"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 20:59:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 20:59:41 -0700
Message-Id: <43dee3069251520cad17c5e1ae5d7d910c94a5ae.1337831668.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337831668.git.sgw@linux.intel.com>
References: <cover.1337831668.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337831668.git.sgw@linux.intel.com>
References: <cover.1337831668.git.sgw@linux.intel.com>
Subject: [RFC v2 1/2] pm-utils: Clean up file ordering
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
X-List-Received-Date: Thu, 24 May 2012 04:09:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 92d65c1..6c41c05 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -7,18 +7,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
 PR = "r1"
-RDEPENDS_${PN} = "grep"
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
+SRC_URI[md5sum] = "1742a556089c36c3a89eb1b957da5a60"
+SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
+
 inherit pkgconfig autotools
 
-FILES_${PN}-dbg += "${libdir}/pm-utils/bin/.debug \
-		    ${datadir}/doc/pm-utils/README.debugging"
+RDEPENDS_${PN} = "grep"
 
 do_configure_prepend () {
 	autoreconf -f -i -s
 }
 
-SRC_URI[md5sum] = "1742a556089c36c3a89eb1b957da5a60"
-SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
+FILES_${PN}-dbg += "${libdir}/pm-utils/bin/.debug \
+		    ${datadir}/doc/pm-utils/README.debugging"
-- 
1.7.7.6




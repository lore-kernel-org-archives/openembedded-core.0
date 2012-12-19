Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tl8U7-0002Rn-QD
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 02:30:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 17:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,313,1355126400"; d="scan'208";a="236153372"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.14.45])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2012 17:15:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:15:27 -0800
Message-Id: <1355879727-506-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] neon: added --disable-gssapi
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
X-List-Received-Date: Wed, 19 Dec 2012 01:30:12 -0000

This is to ensure determinism as it checks the host for krb5
and can change if a host has krb5, this disables the check

[YOCTO #3499]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/neon/neon_0.29.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.29.6.bb
index 42d5e52..157f711 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_class-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r2"
+PR = "r3"
 
 BBCLASSEXTEND = "native"
 
@@ -20,3 +20,4 @@ SRC_URI[sha256sum] = "9c640b728d6dc80ef1e48f83181166ab6bc95309cece5537e01ffdd01b
 inherit autotools binconfig lib_package pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
+EXTRA_OECONF += "--without-gssapi"
-- 
1.8.0.2




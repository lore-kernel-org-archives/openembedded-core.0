Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TgDYb-0007Iz-MO
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 12:54:29 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qB5Be1FE019575;
	Wed, 5 Dec 2012 05:40:03 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 16:40:06 +0500
Message-Id: <1354707606-7374-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] libaio: Remove QA warning: No GNU_HASH in the elf binary
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
X-List-Received-Date: Wed, 05 Dec 2012 11:54:29 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Update the LINK_FLAGS in the Makefile to remove warning:
QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-extended/libaio/libaio_0.3.109.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
index 161b712..0712d04 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 
+do_configure () {
+    sed -i 's#LINK_FLAGS=.*#LINK_FLAGS=$(LDFLAGS)#' src/Makefile
+}
+
 do_install () {
     oe_runmake install DESTDIR=${D}
 }
-- 
1.7.9.5




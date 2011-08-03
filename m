Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/FUhw1imBu5y+TDrGnjxdBZACykatGusQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QodEg-0008Dt-5v
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:19:54 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73FFWh2017192
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 10:15:32 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 10:15:32 -0500
Message-Id: <1312384532-11310-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] libnss-mdns: dont use hard coded /lib path
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
X-List-Received-Date: Wed, 03 Aug 2011 15:19:54 -0000

As libdir might not be /lib (could be /lib64) use ${libdir} instead of
hard coded "/lib" in configure options set in EXTRA_OECONF.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../libnss-mdns/libnss-mdns_0.10.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index f5df005..00f2c56 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -21,7 +21,7 @@ inherit autotools
 LEAD_SONAME = "libnss_mdns.so"
 DEBIANNAME_${PN} = "libnss-mdns"
 
-EXTRA_OECONF = "--libdir=/lib --disable-lynx --enable-avahi"
+EXTRA_OECONF = "--libdir=${libdir} --disable-lynx --enable-avahi"
 
 # TODO: pattern based configuration update
 pkg_postinst_${PN} () {
-- 
1.7.3.4




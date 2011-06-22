Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREs-0007yw-Cr
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPeYm026819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:22 -0500
Message-ID: <f8cb3c560c69519b816c14c27a80a2c5886ef559.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 28/40] libproxy: Add missing debug files
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:18 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
index 2e18065..e6ef8ff 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
@@ -14,14 +14,14 @@ SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
 SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
 
-PR = "r0"
+PR = "r1"
 
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
 	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no"
 
-FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/"
+FILES_${PN}-dbg += " ${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
 
 do_configure_prepend() {
 	export HOST_SYS=${HOST_SYS}
-- 
1.7.3.4




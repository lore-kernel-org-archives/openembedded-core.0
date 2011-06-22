Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREg-0007os-Bc
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPVpN026769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:31 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:16 -0500
Message-ID: <87525294d6583fd79135ffd05701c72b51717c82.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 22/40] gamin: Add missing debug files to -dbg
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:06 -0000
Content-Type: text/plain

Add the missing files to the base -dbg package, remove the libPN-dbg as it is
non-standard.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/gamin/gamin_0.1.10.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index b6394d2..b0531ad 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=412a9be54757a155d0b997b52b519f62"
 
 DEPENDS = "glib-2.0"
 PROVIDES = "fam"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
            file://no-abstract-sockets.patch"
@@ -20,13 +20,12 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--without-python"
 
-PACKAGES += "lib${PN} lib${PN}-dev lib${PN}-dbg"
+PACKAGES += " lib${PN} lib${PN}-dev"
 FILES_${PN} = "${libexecdir}"
-FILES_${PN}-dbg = "${libexecdir}/.debug"
+FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_lib${PN} = "${libdir}/lib*.so.*"
 FILES_lib${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
                       ${libdir}/lib*.a ${libdir}/lib*.so"
-FILES_lib${PN}-dbg = "${libdir}/.debug/"
 
 RDEPENDS_lib${PN} = "${PN}"
 
-- 
1.7.3.4




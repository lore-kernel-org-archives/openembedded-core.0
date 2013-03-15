Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGSs5-0007ZM-VK
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 12:32:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2F84B0m029312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 01:04:11 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 15 Mar 2013 01:04:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 16:04:02 +0800
Message-ID: <7ec48222d505db49d5a1a9f721e9dcdcb6494476.1363333753.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1363333753.git.jackie.huang@windriver.com>
References: <cover.1363333753.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 3/4] ttf-fonts: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 11:32:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ttf-fonts/liberation-fonts_1.04.bb             |    6 +++---
 .../ttf-fonts/liberation-fonts_1.06.bb             |    6 +++---
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index 67e36e2..a34825a 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -9,7 +9,7 @@ SECTION = "x11/fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RDEPENDS_${PN} = "fontconfig-utils"
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 inherit allarch fontcache
@@ -31,8 +31,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/fonts/conf.d/
 	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 
-	install -d ${D}${prefix}/share/doc/${PN}/
-	install -m 0644 License.txt ${D}${datadir}/doc/${PN}/
+	install -d ${D}${prefix}/share/doc/${BPN}/
+	install -m 0644 License.txt ${D}${datadir}/doc/${BPN}/
 }
 
 PACKAGES = "${PN}"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
index 0ac4deb..6391f51 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 RDEPENDS_${PN} = "fontconfig-utils"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 FONTREV = "0.20100721"
 SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.tar.gz \
@@ -29,8 +29,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/fonts/conf.d/
 	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 
-	install -d ${D}${prefix}/share/doc/${PN}/
-	install -m 0644 License.txt ${D}${datadir}/doc/${PN}/
+	install -d ${D}${prefix}/share/doc/${BPN}/
+	install -m 0644 License.txt ${D}${datadir}/doc/${BPN}/
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 6214c16..71e85e4 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -7,7 +7,7 @@ but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
 LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
-PR = "r6"
+PR = "r7"
 RDEPENDS_${PN} = "fontconfig-utils"
 
 inherit allarch
@@ -25,9 +25,9 @@ do_install () {
         #install -m 644 local.conf ${D}${sysconfdir}/fonts/local.conf 
 
 
-        install -d ${D}${prefix}/share/doc/${PN}/ 
+        install -d ${D}${prefix}/share/doc/${BPN}/
         for i in *.TXT; do 
-                install -m 644 $i ${D}${prefix}/share/doc/${PN}/$i 
+                install -m 644 $i ${D}${prefix}/share/doc/${BPN}/$i
         done 
 } 
 
-- 
1.7.4.1




Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB0837318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2IYhV012199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:23 +0800
Message-ID: <1472436999-27335-6-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/21] html-parser-perl: add new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 02:18:34 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe html-parser-perl as libwww-perl-perl
  rdepends on html-parser-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-devtools/perl/html-parser-perl_3.72.bb | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/html-parser-perl_3.72.bb

diff --git a/meta/recipes-devtools/perl/html-parser-perl_3.72.bb b/meta/recipes-devtools/perl/html-parser-perl_3.72.bb
new file mode 100644
index 0000000..9495e76
--- /dev/null
+++ b/meta/recipes-devtools/perl/html-parser-perl_3.72.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Objects of the "HTML::Parser" class will recognize markup and separate it \
+from plain text (alias data content) in HTML documents. As different kinds \
+of markup and text are recognized, the corresponding event handlers are \
+invoked."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/HTML-Parser"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eb7505e5f626913350df9dd4a03d54a8"
+SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
+RDEPENDS_${PN} += "html-tagset-perl"
+RRECOMMENDS_${PN} += "http-message-perl"
+
+S = "${WORKDIR}/HTML-Parser-${PV}"
+
+inherit cpan
+
+do_compile() {
+       export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+       cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



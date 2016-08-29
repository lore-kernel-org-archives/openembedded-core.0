Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D00AD731DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7T2IoOk018349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:50 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:33 +0800
Message-ID: <1472436999-27335-16-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/21] io-html-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe io-html-perl as http-message-perl
  rdepends on io-html-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/perl/io-html-perl_1.001.bb | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/io-html-perl_1.001.bb

diff --git a/meta/recipes-devtools/perl/io-html-perl_1.001.bb b/meta/recipes-devtools/perl/io-html-perl_1.001.bb
new file mode 100644
index 0000000..d384389
--- /dev/null
+++ b/meta/recipes-devtools/perl/io-html-perl_1.001.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "IO::HTML provides an easy way to open a file containing HTML while \
+automatically determining its encoding. It uses the HTML5 encoding \
+sniffing \
+algorithm specified in section 8.2.2.2 of the draft standard."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/IO-HTML"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/C/CJ/CJM/IO-HTML-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3f8958718844dc96b9f6946f21d70d22"
+SRC_URI[sha256sum] = "ea78d2d743794adc028bc9589538eb867174b4e165d7d8b5f63486e6b828e7e0"
+
+S = "${WORKDIR}/IO-HTML-${PV}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



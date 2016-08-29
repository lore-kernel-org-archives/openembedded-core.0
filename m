Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A633731DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2Ih2w003254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:42 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:28 +0800
Message-ID: <1472436999-27335-11-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/21] http-negotiate-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe http-negotiate-perl as libwww-perl-perl
  rdepends on http-negotiate-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/http-negotiate-perl_6.01.bb               | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/http-negotiate-perl_6.01.bb

diff --git a/meta/recipes-devtools/perl/http-negotiate-perl_6.01.bb b/meta/recipes-devtools/perl/http-negotiate-perl_6.01.bb
new file mode 100644
index 0000000..9c71112
--- /dev/null
+++ b/meta/recipes-devtools/perl/http-negotiate-perl_6.01.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "This module provides a complete implementation of the HTTP content \
+negotiation algorithm specified in draft-ietf-http-v11-spec-00.ps \
+chapter \
+12. Content negotiation allows for the selection of a preferred content \
+representation based upon attributes of the negotiable variants and the \
+value of the various Accept* header fields in the request."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/HTTP-Negotiate"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1236195250e264d7436e7bb02031671b"
+SRC_URI[sha256sum] = "1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016"
+RDEPENDS_${PN} += "http-message-perl"
+
+S = "${WORKDIR}/HTTP-Negotiate-${PV}"
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



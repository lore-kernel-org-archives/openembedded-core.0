Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1007318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2Iqrm003281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:34 +0800
Message-ID: <1472436999-27335-17-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/21] io-compress-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:51 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe io-compress-perl as net-http-perl
  rdepends on io-compress-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/io-compress-perl_2.069.bb                 | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/io-compress-perl_2.069.bb

diff --git a/meta/recipes-devtools/perl/io-compress-perl_2.069.bb b/meta/recipes-devtools/perl/io-compress-perl_2.069.bb
new file mode 100644
index 0000000..43b51b4
--- /dev/null
+++ b/meta/recipes-devtools/perl/io-compress-perl_2.069.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This module provides a Perl interface that allows writing compressed \
+data to files or buffer as defined in RFC 1952."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b26925161e3f01919f60344d1bbb49c4"
+SRC_URI[sha256sum] = "e9d36d93e12874536ecbf6c1db80aae34236645798b3501b479c78e09da3f28c"
+RDEPENDS_${PN} += "compress-raw-bzip2-perl"
+RDEPENDS_${PN} += "compress-raw-zlib-perl"
+
+S = "${WORKDIR}/IO-Compress-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



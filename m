Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5085731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2Il6h003269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:46 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:31 +0800
Message-ID: <1472436999-27335-14-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/21] uri-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:46 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe uri-perl as libwww-perl-perl
  rdepends on uri-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/perl/uri-perl_1.71.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/uri-perl_1.71.bb

diff --git a/meta/recipes-devtools/perl/uri-perl_1.71.bb b/meta/recipes-devtools/perl/uri-perl_1.71.bb
new file mode 100644
index 0000000..dcc62eb
--- /dev/null
+++ b/meta/recipes-devtools/perl/uri-perl_1.71.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "This module implements the "URI" class. Objects of this class represent \
+"Uniform Resource Identifier references" as specified in RFC 2396 (and \
+updated by RFC 2732)."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/URI"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "247c3da29a794f72730e01aa5a715daf"
+SRC_URI[sha256sum] = "9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115"
+
+S = "${WORKDIR}/URI-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



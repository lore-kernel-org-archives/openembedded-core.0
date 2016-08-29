Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 835027318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2IrW0012211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:52 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:35 +0800
Message-ID: <1472436999-27335-18-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/21] io-socket-ssl-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:52 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe io-socket-ssl-perl as net-http-perl
  rdepends on io-socket-ssl-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/io-socket-ssl-perl_2.024.bb               | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/io-socket-ssl-perl_2.024.bb

diff --git a/meta/recipes-devtools/perl/io-socket-ssl-perl_2.024.bb b/meta/recipes-devtools/perl/io-socket-ssl-perl_2.024.bb
new file mode 100644
index 0000000..b24535f
--- /dev/null
+++ b/meta/recipes-devtools/perl/io-socket-ssl-perl_2.024.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "IO::Socket::SSL makes using SSL/TLS much easier by wrapping the necessary \
+functionality into the familiar IO::Socket interface and providing secure \
+defaults whenever possible. This way, existing applications can be made \
+SSL-aware without much effort, at least if you do blocking I/O and don't \
+use select or poll."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/IO-Socket-SSL"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "9d1be9159475fe67afa5f2e238808086"
+SRC_URI[sha256sum] = "dab3125b004b24ff8dfc003aa81c00c0f976a1bc34a75e1d8d9de9de837ce6c9"
+RDEPENDS_${PN} += "net-ssleay-perl"
+
+S = "${WORKDIR}/IO-Socket-SSL-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



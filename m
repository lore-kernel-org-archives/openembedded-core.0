Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20830700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2IU0U012196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:29 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:20 +0800
Message-ID: <1472436999-27335-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/21] libwww-perl-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:30 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe libwww-perl-perl as lftp rdepends
  on libwww-perl-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-devtools/perl/libwww-perl-perl_6.15.bb | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libwww-perl-perl_6.15.bb

diff --git a/meta/recipes-devtools/perl/libwww-perl-perl_6.15.bb b/meta/recipes-devtools/perl/libwww-perl-perl_6.15.bb
new file mode 100644
index 0000000..85db4d9
--- /dev/null
+++ b/meta/recipes-devtools/perl/libwww-perl-perl_6.15.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "The libwww-perl collection is a set of Perl modules which provides a simple \
+and consistent application programming interface (API) to the World-Wide \
+Web. The main focus of the library is to provide classes and functions that \
+allow you to write WWW clients. The library also contain modules that are \
+of more general use and even classes that help you implement simple HTTP \
+servers."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/libwww-perl"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/libwww-perl-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6888c9d8728cd6f3ea3c9754461c9f94"
+SRC_URI[sha256sum] = "6f349d45c21b1ec0501c4437dfcb70570940e6c3d5bff783bd91d4cddead8322"
+RDEPENDS_${PN} += "encode-locale-perl"
+RDEPENDS_${PN} += "file-listing-perl"
+RDEPENDS_${PN} += "html-parser-perl"
+RDEPENDS_${PN} += "http-cookies-perl"
+RDEPENDS_${PN} += "http-daemon-perl"
+RDEPENDS_${PN} += "http-date-perl"
+RDEPENDS_${PN} += "http-message-perl"
+RDEPENDS_${PN} += "http-negotiate-perl"
+RDEPENDS_${PN} += "lwp-mediatypes-perl"
+RDEPENDS_${PN} += "net-http-perl"
+RDEPENDS_${PN} += "uri-perl"
+RDEPENDS_${PN} += "www-robotrules-perl"
+
+S = "${WORKDIR}/libwww-perl-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



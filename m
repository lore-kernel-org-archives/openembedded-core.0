Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1DC73212
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7T2IfGr018343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:41 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:40 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:27 +0800
Message-ID: <1472436999-27335-10-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/21] http-message-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:40 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe http-message-perl as libwww-perl-perl
  rdepends on http-message-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/http-message-perl_6.11.bb                 | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/http-message-perl_6.11.bb

diff --git a/meta/recipes-devtools/perl/http-message-perl_6.11.bb b/meta/recipes-devtools/perl/http-message-perl_6.11.bb
new file mode 100644
index 0000000..f4ac587
--- /dev/null
+++ b/meta/recipes-devtools/perl/http-message-perl_6.11.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "An "HTTP::Message" object contains some headers and a content body. The \
+following methods are available:"
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/HTTP-Message"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/HTTP-Message-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4ed7add10daea3ab30abfeab6d03872f"
+SRC_URI[sha256sum] = "e7b368077ae6a188d99920411d8f52a8e5acfb39574d4f5c24f46fd22533d81b"
+RDEPENDS_${PN} += "encode-locale-perl"
+RDEPENDS_${PN} += "http-date-perl"
+RDEPENDS_${PN} += "io-compress-perl"
+RDEPENDS_${PN} += "io-html-perl"
+RDEPENDS_${PN} += "lwp-mediatypes-perl"
+RDEPENDS_${PN} += "uri-perl"
+
+S = "${WORKDIR}/HTTP-Message-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



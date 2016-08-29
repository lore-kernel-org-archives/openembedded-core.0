Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39508731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2InTW012208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:48 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:32 +0800
Message-ID: <1472436999-27335-15-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/21] www-robotrules-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:48 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe www-robotrules-perl as libwww-perl-perl
  rdepends on www-robotrules-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/www-robotrules-perl_6.02.bb               | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/www-robotrules-perl_6.02.bb

diff --git a/meta/recipes-devtools/perl/www-robotrules-perl_6.02.bb b/meta/recipes-devtools/perl/www-robotrules-perl_6.02.bb
new file mode 100644
index 0000000..e6acbc7
--- /dev/null
+++ b/meta/recipes-devtools/perl/www-robotrules-perl_6.02.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "This module parses /robots.txt files as specified in \"A Standard for \
+Robot Exclusion\", at <http://www.robotstxt.org/wc/norobots.html> \
+Webmasters can \
+use the /robots.txt file to forbid conforming robots from accessing \
+parts of \
+their web site."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/WWW-RobotRules"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/WWW-RobotRules-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b7186e8b8b3701e70c22abf430742403"
+SRC_URI[sha256sum] = "46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e"
+RDEPENDS_${PN} += "uri-perl"
+
+S = "${WORKDIR}/WWW-RobotRules-${PV}"
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



Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73C0C73243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2IiXU012205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:43 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:29 +0800
Message-ID: <1472436999-27335-12-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/21] lwp-mediatypes-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:43 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe lwp-mediatypes-perl as libwww-perl-perl
  rdepends on lwp-mediatypes-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/lwp-mediatypes-perl_6.02.bb               | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/lwp-mediatypes-perl_6.02.bb

diff --git a/meta/recipes-devtools/perl/lwp-mediatypes-perl_6.02.bb b/meta/recipes-devtools/perl/lwp-mediatypes-perl_6.02.bb
new file mode 100644
index 0000000..513bac9
--- /dev/null
+++ b/meta/recipes-devtools/perl/lwp-mediatypes-perl_6.02.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "This module provides functions for handling media (also known as MIME) \
+types and encodings. The mapping from file extensions to media types is \
+defined by \
+the media.types file. If the ~/.media.types file exists it is used \
+instead. \
+For backwards compatibility we will also look for ~/.mime.types."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/LWP-MediaTypes"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/LWP-MediaTypes-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8c5f25fb64b974d22aff424476ba13c9"
+SRC_URI[sha256sum] = "18790b0cc5f0a51468495c3847b16738f785a2d460403595001e0b932e5db676"
+
+S = "${WORKDIR}/LWP-MediaTypes-${PV}"
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



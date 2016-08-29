Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC406FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7T2IV2C018335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:31 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:30 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:21 +0800
Message-ID: <1472436999-27335-4-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/21] encode-locale-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:31 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add encode-locale-perl recipe as libwww-perl-perl
  rdepends on encode-locale-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/encode-locale-perl_1.05.bb                | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/encode-locale-perl_1.05.bb

diff --git a/meta/recipes-devtools/perl/encode-locale-perl_1.05.bb b/meta/recipes-devtools/perl/encode-locale-perl_1.05.bb
new file mode 100644
index 0000000..8a7450d
--- /dev/null
+++ b/meta/recipes-devtools/perl/encode-locale-perl_1.05.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "In many applications it's wise to let Perl use Unicode for the strings \
+it processes. Most of the interfaces Perl has to the outside world are \
+still \
+byte based. Programs therefore need to decode byte strings that enter \
+the \
+program from the outside and encode them again on the way out."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/Encode-Locale"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "fcfdb8e4ee34bcf62aed429b4a23db27"
+SRC_URI[sha256sum] = "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
+
+S = "${WORKDIR}/Encode-Locale-${PV}"
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



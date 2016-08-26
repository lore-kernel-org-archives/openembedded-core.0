Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B05573289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 02:27:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7Q2RScT020205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 19:27:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 25 Aug 2016 19:27:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2016 10:25:48 +0800
Message-ID: <1472178349-32199-4-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] file-which-perl: add new recipe
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
X-List-Received-Date: Fri, 26 Aug 2016 02:27:27 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add file-which-perl recipe as file-homedir-perl
  rdepends on file-which-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/perl/file-which-perl_1.21.bb | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/file-which-perl_1.21.bb

diff --git a/meta/recipes-devtools/perl/file-which-perl_1.21.bb b/meta/recipes-devtools/perl/file-which-perl_1.21.bb
new file mode 100644
index 0000000..ac9c0e5
--- /dev/null
+++ b/meta/recipes-devtools/perl/file-which-perl_1.21.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "File::Which finds the full or relative paths to executable programs on the \
+system. This is normally the function of "which" utility. "which" is \
+typically implemented as either a program or a built in shell command. On \
+some platforms, such as Microsoft Windows it is not provided as part of the \
+core operating system. This module provides a consistent API to this \
+functionality regardless of the underlying platform."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/File-Which"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Which-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "115a6efe5d7e9621237fcb655c7a0980"
+SRC_URI[sha256sum] = "9def5f10316bfd944e56b7f8a2501be1d44c288325309462aa9345e340854bcc"
+
+S = "${WORKDIR}/File-Which-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.8.1



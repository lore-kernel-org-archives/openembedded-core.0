Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E513746D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 79C16183CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id iXrCXouyzV-M
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5A285183AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42FFF1E072
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BED1E070
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2B4DB25D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:03:54 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w33H3nx4023927
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2018 19:03:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w33H3ndY023926
	for openembedded-core@lists.openembedded.org;
	Tue, 3 Apr 2018 19:03:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 19:03:46 +0200
Message-Id: <20180403170346.23883-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] elfutils: Clean up comments
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
X-List-Received-Date: Tue, 03 Apr 2018 17:03:58 -0000

The list of patches in SRC_URI was restructured in 49aae1d7, and left
a comment about patches from Debian hanging without context. Move and
reword it to make it remain useful.

There was also a leftover comment that referred to two .h files and
do_configure_prepend() that were removed in f960c026.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.170.bb | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.170.bb b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
index 54d341d190..14ac22ee64 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.170.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
@@ -5,6 +5,8 @@ LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
+# The Debian patches below are from:
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
@@ -24,19 +26,10 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-Use-fallthrough-attribute.patch \
            file://0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch \
            "
+SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 SRC_URI[md5sum] = "03599aee98c9b726c7a732a2dd0245d5"
 SRC_URI[sha256sum] = "1f844775576b79bdc9f9c717a50058d08620323c1e935458223a12f249c9e066"
 
-SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
-
-# Pick patches from debian
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
-# Fix fallthrough with GCC7
-
-# The buildsystem wants to generate 2 .h files from source using a binary it just built,
-# which can not pass the cross compiling, so let's work around it by adding 2 .h files
-# along with the do_configure_prepend()
-
 inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
-- 
2.12.0



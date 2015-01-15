Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 06FA372858
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 16:09:01 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Jan 2015 17:08:55 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id B2C2C2800CB;
	Thu, 15 Jan 2015 17:08:55 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 17:08:47 +0100
Message-ID: <1421338127-1158-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [meta-oe][PATCH] fuse-exfat: upgrade to 1.1.0
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
X-List-Received-Date: Thu, 15 Jan 2015 16:09:09 -0000
Content-Type: text/plain

Bump to 1.1.0
1. Updated LICENSE from GPLv3 to GPLv2 or later
2. Misc. spelling fix

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../fuse-exfat/{fuse-exfat_1.0.1.bb => fuse-exfat_1.1.0.bb}  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.0.1.bb => fuse-exfat_1.1.0.bb} (60%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
similarity index 60%
rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
index f984c4b..6a83ab2 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "read and write exFAT driver for FUSE"
 DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
 extended file allocation table as a filesystem in userspace. A mounthelper \
-is provided unter the name mount.exfat-fuse. \
+is provided under the name mount.exfat-fuse. \
 "
 HOMEPAGE = "http://code.google.com/p/exfat/"
 SECTION = "universe/otherosfs"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
 "
 DEPENDS = "fuse virtual/libc"
@@ -14,11 +14,11 @@ RRECOMMENDS_${PN} = "util-linux-mount"
 
 inherit scons
 
-SRC_URI[md5sum] = "7988a5111841593231f20af22153362d"
-SRC_URI[sha256sum] = "12ac1ba1b7d4343bef64e7898176705a41cfe3b5a7a179e28549d242e2854758"
+SRC_URI[md5sum] = "b2a23c032661cb1c1da4514e7af33916"
+SRC_URI[sha256sum] = "198c520e417e955dc5c08687c278e63eefa56719da4452aa4a605be0327f953e"
 
 EXTRA_OESCONS = " \
-    DESTDIR=${D}/${base_sbindir} \
+    CCFLAGS='${CCFLAGS} -std=c99' DESTDIR=${D}/${base_sbindir} \
 "
 
 do_install_prepend() {
-- 
1.9.1



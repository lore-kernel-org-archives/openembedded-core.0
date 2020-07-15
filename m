Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.68.1594831407046483335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E161EE01E96; Wed, 15 Jul 2020 09:43:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ABE2E01E8C
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.1.2 SUCCEEDED
Message-Id: <20200715164326.E161EE01E96@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:26 -0700 (PDT)
X-Groupsio-MsgNum: 140653
Content-Type: multipart/mixed; boundary="===============7418018021477455187=="

--===============7418018021477455187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtd-utils* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.1.1-2.1.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7418018021477455187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtd-utils: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: FILELIST: added "/usr/sbin/.debug/ubihealthd"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6726996 to 6822452 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGSIZE changed from 169420 to 165324 (-2%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: FILELIST: directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/include/linux -> /usr/src/debug/mtd-utils/2.1.2-r0/git/include/linux, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/mtd-tests -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/mtd-tests, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/nand-utils -> /usr/src/debug/mtd-utils/2.1.2-r0/git/nand-utils, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/jffsX-utils -> /usr/src/debug/mtd-utils/2.1.2-r0/git/jffsX-utils, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/jittertest -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/jittertest, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/include -> /usr/src/debug/mtd-utils/2.1.2-r0/git/include, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/nor-utils -> /usr/src/debug/mtd-utils/2.1.2-r0/git/nor-utils, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/include/
 mtd -> /usr/src/debug/mtd-utils/2.1.2-r0/git/include/mtd, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/checkfs -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/checkfs, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/hashtable -> /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/hashtable, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/fs-tests/utils -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/fs-tests/utils, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/fs-tests/lib -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/fs-tests/lib, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/ubi-tests -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/ubi-tests, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/lib -> /usr/src/debug/mtd-utils/2.1.2-r0/git/lib, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/fs-tests/integrity -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/f
 s-tests/integrity, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/misc-utils -> /usr/src/debug/mtd-utils/2.1.2-r0/git/misc-utils, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/fs-tests/simple -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/fs-tests/simple, directory renamed /usr/src/debug/mtd-utils/2.1.1-r0/git/tests/fs-tests/stress/atoms -> /usr/src/debug/mtd-utils/2.1.2-r0/git/tests/fs-tests/stress/atoms, removed "/usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubirename.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubirmvol.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubinize.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/crypto.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/ubifs.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubimkvol.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubiformat.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubidetach.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ub
 iupdatevol.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubiblock.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/fscrypt.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubinfo.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/compr.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/crc16.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/devtable.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/key.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/compr.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/defs.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/lpt.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/mtdinfo.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubiattach.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubirsvol.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ub
 ifs/lpt.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c /usr/src/debug/mtd-utils/2.1.1-r0/git/ubifs-utils/mkfs.ubifs/crc16.h /usr/src/debug/mtd-utils/2.1.1-r0/git/ubi-utils/ubicrc32.c", added "/usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubinfo.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/sign.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubinize.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/crc16.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/ubifs.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubiupdatevol.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/mtdinfo.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubirsvol.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/compr.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/key.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubiattach.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubidetach.c /usr/src/de
 bug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/crypto.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/crc16.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubicrc32.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/lpt.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/defs.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubimkvol.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/devtable.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubiblock.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/fscrypt.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/compr.h /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubirmvol.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubifs-utils/mkfs.ubifs/lpt.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubihealthd.c /u
 sr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubirename.c /usr/src/debug/mtd-utils/2.1.2-r0/git/ubi-utils/ubiformat.c"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1390472 to 1405162 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: FILELIST: added "/usr/sbin/ubihealthd"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.1" to "2.1.2"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGSIZE changed from 555112 to 585192 (+5%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.1" to "2.1.2"

--===============7418018021477455187==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.1-2.1.2.patch"

From 00e2923c4aca96eb348b5aacce5acc539ba2052d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 05:50:15 +0000
Subject: [PATCH] mtd-utils: upgrade 2.1.1 -> 2.1.2

---
 ...-utils-Fix-return-value-of-ubiformat.patch | 62 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  7 +--
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
deleted file mode 100644
index d43f7e1a7a..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4d19bffcfd66e25d3ee74536ae2d2da7ad52e8e2 Mon Sep 17 00:00:00 2001
-From: Barry Grussling <barry@grussling.com>
-Date: Sun, 12 Jan 2020 12:33:32 -0800
-Subject: [PATCH] mtd-utils: Fix return value of ubiformat
-Organization: O.S. Systems Software LTDA.
-
-This changeset fixes a feature regression in ubiformat.  Older versions of
-ubiformat, when invoked with a flash-image, would return 0 in the case no error
-was encountered.  Upon upgrading to latest, it was discovered that ubiformat
-returned 255 even without encountering an error condition.
-
-This changeset corrects the above issue and causes ubiformat, when given an
-image file, to return 0 when no errors are detected.
-
-Tested by running through my loading scripts and verifying ubiformat returned
-0.
-
-Upstream-Status: Backport [2.1.2]
-
-Signed-off-by: Barry Grussling <barry@grussling.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- ubi-utils/ubiformat.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index a90627c..5377b12 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	struct ubi_vtbl_record *vtbl;
- 	int eb1 = -1, eb2 = -1;
- 	long long ec1 = -1, ec2 = -1;
-+	int ret = -1;
- 
- 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
- 	write_size /= mtd->subpage_size;
-@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	if (!args.quiet && !args.verbose)
- 		printf("\n");
- 
--	if (novtbl)
-+	if (novtbl) {
-+		ret = 0;
- 		goto out_free;
-+	}
- 
- 	if (eb1 == -1 || eb2 == -1) {
- 		errmsg("no eraseblocks for volume table");
-@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 
- out_free:
- 	free(hdr);
--	return -1;
-+	return ret;
- }
- 
- int main(int argc, char * const argv[])
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d1658a739b..9181413427 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -10,13 +10,12 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.1"
+PV = "2.1.2"
 
-SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
+SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://0001-mtd-utils-Fix-return-value-of-ubiformat.patch \
-"
+           "
 
 S = "${WORKDIR}/git/"
 
-- 
2.17.1


--===============7418018021477455187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: FILELIST: added "/usr/sbin/ubihealthd"

--===============7418018021477455187==--

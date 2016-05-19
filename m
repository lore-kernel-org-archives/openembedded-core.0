Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BCA74601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:44:41 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n129so224327082wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B4NpwaSARE48cLnyjKnXzXrnYCf0jmzreb4gvLQOwkc=;
	b=rsttIT36rvHZLtoO2TtxFLadyJ/S1cuPYCUf3Nvq+5Io2hfryCzxnUTb7+vmBSf2p3
	zM8x3NzDFo3wbdBjLHo7gXD0fdwuVIeXfhoIxmW96fqw8JCl+mgAYEiIgtNmDmsAW7Kd
	Q6Jy4/Lcwgst7FDzvUr3aAGVkuMvRP918LEhDoDEHgdr+KAvv/NKtaT8sgArx1ZwLQ1U
	JwycI3eUbMMmTY2AuEt9SxEbWMUL7X1ueawAHm2boAdBSg3ZG8CE4xpSqxGLtJt7DAHu
	tZZispZU6qmodbFDoAiSSmSkrqBBxh1S3VAlPhQstwMVMu9BAkNWadxUgiHzzUvkX4Mq
	ZBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B4NpwaSARE48cLnyjKnXzXrnYCf0jmzreb4gvLQOwkc=;
	b=RkLWBXk1FfkV+nk9GBvZYZZ1AXf6zip/YuKGPGze/7r043zQU7QW++cwjT20dlkCJt
	kRfPKMeHEHonqnkzLElXhUgNZgiFjJK71X4G5R/gA/iMF0go3aaRwWw1m5EDmZN7iud8
	RIi/2JGgbKai6pm+oKdf82OsBLyy/yxS4kTpW77elvBhcp2d9DRV3zvvFsj5WZAYMNl6
	ABbgbqPnY45dWXjBpbcEe3CYeDCKIN3DpUGvhn3VqJcQBudMCJSMnth2+BSn046sstAK
	YV7y/7fUqzx11uDUAdUsPOM9kpPRbfxKNzoC9f2GKnmUUPhLhd/7ciyyyoizqBLq/6Zh
	3J0w==
X-Gm-Message-State: AOPr4FW5XZ9WFiatJXFMFyUT/QU/kvvaUIEMEOnpGVc+XcsA8dy2cHg4MTuagnqDuD0yPVGn
X-Received: by 10.28.187.85 with SMTP id l82mr13431940wmf.2.1463654681919;
	Thu, 19 May 2016 03:44:41 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	iv1sm13646234wjb.34.2016.05.19.03.44.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 May 2016 03:44:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 11:43:18 +0100
Message-Id: <1463654598-28971-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1463654598-28971-1-git-send-email-ross.burton@intel.com>
References: <1463654598-28971-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] zip: update SRC_URI
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
X-List-Received-Date: Thu, 19 May 2016 10:44:42 -0000

The infozip FTP server appears to have been taken down, so change the SRC_URI to
point at their SourceForge project.

Also as the SRC_URI can't be generated from the version and there is no other
user of the .inc, merge the .bb and .inc together.

[ YOCTO #9655 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/zip/zip.inc    | 27 ------------------------
 meta/recipes-extended/zip/zip_3.0.bb | 40 ++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/zip/zip.inc

diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
deleted file mode 100644
index 21985a4..0000000
--- a/meta/recipes-extended/zip/zip.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Compressor/archiver for creating and modifying .zip files"
-HOMEPAGE = "http://www.info-zip.org"
-SECTION = "console/utils"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
-
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz \
-            file://fix-security-format.patch"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
-		'CFLAGS=-I. -DUNIX ${CFLAGS}' 'INSTALL=install' \
-		'BINFLAGS=0755' 'INSTALL_D=install -d'"
-
-do_compile() {
-	oe_runmake -f unix/Makefile flags IZ_BZIP2=no_such_directory
-	sed -i 's#LFLAGS1=""#LFLAGS1="${LDFLAGS}"#' flags
-	oe_runmake -f unix/Makefile generic IZ_BZIP2=no_such_directory
-}
-
-do_install() {
-	oe_runmake -f unix/Makefile prefix=${D}${prefix} \
-		   BINDIR=${D}${bindir} MANDIR=${D}${mandir}/man1 \
-		   install
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 383da4b..087423a 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -1,18 +1,42 @@
-require zip.inc
+SUMMARY = "Compressor/archiver for creating and modifying .zip files"
+HOMEPAGE = "http://www.info-zip.org"
+SECTION = "console/utils"
 
-PR="r2"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
+
+PR = "r2"
 
-# zip-2.32 still uses directory name of zip-2.30
 S = "${WORKDIR}/zip30"
 
+SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
+           file://fix-security-format.patch"
+
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
-# exclude version 2.3.2 which triggers a false positive
-UPSTREAM_CHECK_REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
-
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-#
-EXTRA_OEMAKE_append = " 'CFLAGS_NOOPT=-I. -DUNIX ${CFLAGS}'"
+EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
+		'CFLAGS=-I. -DUNIX ${CFLAGS}' \
+		'CFLAGS_NOOPT=-I. -DUNIX ${CFLAGS}' \
+		'INSTALL=install' 'INSTALL_D=install -d' \
+		'BINFLAGS=0755'"
+
+do_compile() {
+	oe_runmake -f unix/Makefile flags IZ_BZIP2=no_such_directory
+	sed -i 's#LFLAGS1=""#LFLAGS1="${LDFLAGS}"#' flags
+	oe_runmake -f unix/Makefile generic IZ_BZIP2=no_such_directory
+}
+
+do_install() {
+	oe_runmake -f unix/Makefile prefix=${D}${prefix} \
+		   BINDIR=${D}${bindir} MANDIR=${D}${mandir}/man1 \
+		   install
+}
+
+BBCLASSEXTEND = "native"
+
+# exclude version 2.3.2 which triggers a false positive
+UPSTREAM_CHECK_REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
-- 
2.8.0.rc3



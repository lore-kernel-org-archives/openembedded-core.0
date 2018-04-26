Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id D0FDE60685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:49:47 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id p10so16469018pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=R/AoKCypdoyrFwmWfMqPMLAWvbJlOqGIfOgSqfbm7Gg=;
	b=rBON7RgnohX/zEG2fX06ZA4u4McTtv+0rBybT0rkiSx+R7ioVg5XXGm1AOuxJFWACZ
	vtey1fLmvk78QB4Y661J65uHD7WYyWarzM6dnbMpb0h5p7S1QYpqYeYo2n38K3uMq/64
	8dESQnLlHqJxW1BrTWOBBqBMtQkJV99jBK1w4ixlJ3Tza7j3sVlfCUpBI+QQtPQ1KF8O
	MP7RapfAFsQJ5sA4UyzxGpoFGYOj5iVwT+uJd2Zx5smTUyG8qziDeBiMsnfx+DGQOW3L
	VRRC69QC4aAGbJHz14OK06P6RMbwNuVTnqllFSvQGWjZWRWrwigM3Cr8nzu2SybCyM9L
	mNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R/AoKCypdoyrFwmWfMqPMLAWvbJlOqGIfOgSqfbm7Gg=;
	b=I737NbD68YTMXWvyDvTLf4lBXJ2Nh30T5T90VdqJcUgHdizSSEat+m65/g7Lbwqh5J
	4yKNtPSWxYq/hEf3BMEGgoHev/LP/vsP3dx79S/o+rTsDdi/8SDji8qEW42rNXRvAF26
	1fYBB7lurqER19WnNNlxVqSimKGPDYzpcdzL4NkIJpnAZ7YPV2mKSxL0zIj3Z4YG97ur
	Qcrcne2t1WrvRagLwD4R4Pg+aciEOd7aEx8JHPUYAZiHopO0ROz+pRws+2BqFCY7UesD
	5OIcIBq1h/BFrZiVPiGjZDZ9TZ7anZU6WZWXIICKVLlFz0rGMSwwjP3jtJGQKoM5gSBC
	/bSA==
X-Gm-Message-State: ALQs6tBHTJZ5yNs7oflZIDcJT3Z4f1sQEoaHYIQ6h/8FhktNvLtXsxop
	RYw0b0bIv8Gd5D2cL+j06YvNNw==
X-Google-Smtp-Source: AIpwx4+SPc6NzmHZgdoNYGhYqI/i8TzAAmrrf1dC6s9o8YbgyTBKpdcDohboR8e7jjUvDPZZgZFMJQ==
X-Received: by 10.98.103.154 with SMTP id t26mr33763696pfj.24.1524764988087;
	Thu, 26 Apr 2018 10:49:48 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	l3sm41884698pfg.49.2018.04.26.10.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Apr 2018 10:49:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:49:40 -0700
Message-Id: <1524764981-2774-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] tar: merge tar.inc into tar recipe
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
X-List-Received-Date: Thu, 26 Apr 2018 17:49:48 -0000

There's only one user of tar.inc (meta-gplv2 has its own copy), so
merge the .inc file into the tar recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/tar/tar.inc     | 52 --------------------------
 meta/recipes-extended/tar/tar_1.30.bb | 70 ++++++++++++++++++++++++++++++-----
 2 files changed, 60 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar.inc

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
deleted file mode 100644
index 93e4da1..0000000
--- a/meta/recipes-extended/tar/tar.inc
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY = "GNU file archiving program"
-DESCRIPTION = "GNU tar saves many files together into a single tape \
-or disk archive, and can restore individual files from the archive."
-HOMEPAGE = "http://www.gnu.org/software/tar/"
-SECTION = "base"
-
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
-
-inherit autotools gettext texinfo
-
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
-
-# Let aclocal use the relative path for the m4 file rather than the
-# absolute since tar has a lot of m4 files, otherwise there might
-# be an "Argument list too long" error when it is built in a long/deep
-# directory.
-acpaths = "-I ./m4"
-
-do_install () {
-    autotools_do_install
-    ln -s tar ${D}${bindir}/gtar
-}
-
-do_install_append_class-target() {
-    if [ "${base_bindir}" != "${bindir}" ]; then
-        install -d ${D}${base_bindir}
-        mv ${D}${bindir}/tar ${D}${base_bindir}/tar
-        mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
-        rmdir ${D}${bindir}/
-    fi
-}
-
-PACKAGES =+ "${PN}-rmt"
-
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-
-ALTERNATIVE_${PN} = "tar"
-ALTERNATIVE_${PN}-rmt = "rmt"
-ALTERNATIVE_${PN}_class-nativesdk = ""
-ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
-
-ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
-
-PROVIDES_append_class-native = " tar-replacement-native"
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.30.bb
index e743a6d..3f31622 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -1,18 +1,68 @@
-require tar.inc
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[acl] = "--with-posix-acls, --without-posix-acls, acl,"
-
+SUMMARY = "GNU file archiving program"
+DESCRIPTION = "GNU tar saves many files together into a single tape \
+or disk archive, and can restore individual files from the archive."
+HOMEPAGE = "http://www.gnu.org/software/tar/"
+SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI += "file://remove-gets.patch \
-            file://musl_dirent.patch \
-           "
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://remove-gets.patch \
+           file://musl_dirent.patch \
+"
+
 SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
 SRC_URI[sha256sum] = "87592b86cb037c554375f5868bdd3cc57748aef38d6cb741c81065f0beac63b7"
 
+inherit autotools gettext texinfo
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
+
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+
+# Let aclocal use the relative path for the m4 file rather than the
+# absolute since tar has a lot of m4 files, otherwise there might
+# be an "Argument list too long" error when it is built in a long/deep
+# directory.
+acpaths = "-I ./m4"
+
+do_install () {
+    autotools_do_install
+    ln -s tar ${D}${bindir}/gtar
+}
+
+do_install_append_class-target() {
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        install -d ${D}${base_bindir}
+        mv ${D}${bindir}/tar ${D}${base_bindir}/tar
+        mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
+        rmdir ${D}${bindir}/
+    fi
+}
+
 do_install_append_libc-musl() {
-	rm -f ${D}${libdir}/charset.alias
-	rmdir ${D}${libdir}
+    rm -f ${D}${libdir}/charset.alias
+    rmdir ${D}${libdir}
 }
+
+PACKAGES =+ "${PN}-rmt"
+
+FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "tar"
+ALTERNATIVE_${PN}-rmt = "rmt"
+ALTERNATIVE_${PN}_class-nativesdk = ""
+ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
+
+ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
+ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+
+PROVIDES_append_class-native = " tar-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1



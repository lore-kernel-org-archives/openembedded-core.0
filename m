Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB2D179551
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:47 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id k14-v6so8444062edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=azYBVctx/YQmLIIDs5d6ZyiRqY5fJh+TqSk2So+Rr5E=;
	b=Jco0dKpfBKSWeAKkNHBqqDdGvc4BXdJhvIVQ1p9S+BRMalJsE5B4e+UTkBjtgTLJ+B
	gwVBb/XaG1EizrnuSRPdo3A9GgghOL1r6YEUul9JHgtMJgBNHyMrF7nq8NOkpBvL7Ldd
	tnu+bOjinDr4/K8KBoLwAzfesZMTjRFqYGe6w1hdBZ3Dz0/udpyLY2xAAhrQAjsMhrW9
	eFonmYXLS5BoPR8rTyPOknAtUCLVS8vura+WMnAWrRZB5UVKao+8UVau3qvo86YXeW5y
	wjCpyV05BonQzd1/2I6QSImsjOMoc4cmgnPBHLKfUpm9aHbwdZeWELxcSENHvX0Z+9Wj
	j0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=azYBVctx/YQmLIIDs5d6ZyiRqY5fJh+TqSk2So+Rr5E=;
	b=YnSomnGYjk3KbTjXTNrPiU+j2Ek6ZtDeZd4xY92w7G3xEZ0xwaT78N/VY3LNwlMYi2
	QX5GPrfajyqvZoYAnGyr03Ndvb0eCMOxPfbxf2KSg1WZik+iH36E7hJSLAYG59nsUaKS
	kMnM9oSaw81A1oStuNKgivmygI1HUQhMa+UfYWpz13vtZkVnlvWZ7H9LoZL0k5aMSrDM
	c1N+OzcqU9/uM1MkjyXMgh2ZCDstpboY/2audOfJiPI6iEflFDmnTu0dcSbMIkBAy/Tf
	zyd49kxbzHD6d7Ki97IvyXi7BMcm4M7UcwNMaWLSFQIWaZs8mN1uu6s4m4aIfg60kUb0
	+AfQ==
X-Gm-Message-State: APzg51DZ9IV4GumhpM1CYmxjqQ2w75mviDLJO4jJsOAoCKdJ728CtJ+1
	A5Vbz5iWWOmKmv4KEl4eFYR9+DbuMAM=
X-Google-Smtp-Source: ANB0VdZCxN/QGaB5WeFKMg6f+0j0sv6K8moie5vNa5t6vJSFoYIP+8kGskWTEdKZZbbixwjCsPPixw==
X-Received: by 2002:a50:a5e8:: with SMTP id
	b37-v6mr2815201edc.268.1536229788160; 
	Thu, 06 Sep 2018 03:29:48 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:18 +0200
Message-Id: <1536229770-29600-9-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 09/21] btrfs-tools: update to 4.17.1
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/btrfs-tools_4.17.1.bb              | 44 ++++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.17.bb                | 44 ----------------------
 2 files changed, 44 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
new file mode 100644
index 0000000..6b53fbcd
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Checksumming Copy on Write Filesystem utilities"
+DESCRIPTION = "Btrfs is a new copy on write filesystem for Linux aimed at \
+implementing advanced features while focusing on fault tolerance, repair and \
+easy administration. \
+This package contains utilities (mkfs, fsck, btrfsctl) used to work with \
+btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
+
+HOMEPAGE = "https://btrfs.wiki.kernel.org"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
+SECTION = "base"
+DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
+DEPENDS_append_class-target = " udev"
+RDEPENDS_${PN} = "libgcc"
+
+SRCREV = "7faaca0d9f78f7162ae603231f693dd8e1af2a41"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+           file://0001-Makefile-build-mktables-using-native-gcc.patch \
+           file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
+           file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           "
+
+inherit autotools-brokensep pkgconfig manpages distutils3-base
+
+CLEANBROKEN = "1"
+
+PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+EXTRA_OECONF = " --disable-zstd"
+EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
+
+do_configure_prepend() {
+	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
+	mkdir -p ${S}/config
+	cp -f $(automake --print-libdir)/install-sh ${S}/config/
+}
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+    oe_runmake 'DESTDIR=${D}' 'PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}' install_python
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
deleted file mode 100644
index a3690d6..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Checksumming Copy on Write Filesystem utilities"
-DESCRIPTION = "Btrfs is a new copy on write filesystem for Linux aimed at \
-implementing advanced features while focusing on fault tolerance, repair and \
-easy administration. \
-This package contains utilities (mkfs, fsck, btrfsctl) used to work with \
-btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
-
-HOMEPAGE = "https://btrfs.wiki.kernel.org"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
-SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
-DEPENDS_append_class-target = " udev"
-RDEPENDS_${PN} = "libgcc"
-
-SRCREV = "33d16ffc0d176ff4a217a0491378d20ad34e0a90"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
-           file://0001-Makefile-build-mktables-using-native-gcc.patch \
-           file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
-           file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           "
-
-inherit autotools-brokensep pkgconfig manpages distutils3-base
-
-CLEANBROKEN = "1"
-
-PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
-EXTRA_OECONF = " --disable-zstd"
-EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
-
-do_configure_prepend() {
-	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
-	mkdir -p ${S}/config
-	cp -f $(automake --print-libdir)/install-sh ${S}/config/
-}
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-    oe_runmake 'DESTDIR=${D}' 'PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}' install_python
-}
-
-BBCLASSEXTEND = "native"
-- 
2.7.4



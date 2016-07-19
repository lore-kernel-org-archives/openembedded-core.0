Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5267360589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 04:43:13 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so577273pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 21:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8U1eZrvx+vxL7F+NhRrp+4qxR+8res1bV2FopKLhslc=;
	b=D6ayvLzSmBvkhQ5WRwVZetDzVk4krxr/SyAdK+Y+oVJlKu56+Fqzw5izjNTuWjb407
	QkxmQ28c6FdHc90n2fOmXJNbrXT95VCVIQ/O1GiMsmyEnyoWaV7F1zXJhuL6t9SsU9Fc
	gzoeG0UuCBWUCMGelilgXLD+B38z5G0KcA7NrzZYQo72m3DY6If7W/lhh3+ZtZmLlk2Z
	Q/Hy6pbqSfjQNhXcfa3/qAkoky2kpRLC4xpavblKK8N02A2Akb726BjUoK5Gihv1FDc+
	HaT9yWh38uhihygIhVdtOlnP0b55oRL77RRoUqXZv8nSRCLLnO/qkwgW71U7XNiK17JE
	W3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8U1eZrvx+vxL7F+NhRrp+4qxR+8res1bV2FopKLhslc=;
	b=a4K8u8g6yWsruUmDG39PWKGqJWNjtgPkNVlOieY/BmcQBGHDxXH/Dr7aKaC1MBVMxa
	frSz6SHTkSRAi4MjDyhl8nRY66DqetkWJ6KIH4MFAlIaImgDXnYQMlNBvIFc378z6G8l
	MNwEvLUEmTxKFa0tFVsPQIvXQnFYwmmsKoi1kfOWrfeU5pMo8XZP2x1eE0nKKKzWxqcY
	/5ris6l8OZLedvPP2Xd5EQLXce2luSmjGgovv5lfj1PqgKJsGWks0bUwYvelB7Zx1oEc
	3dg+FmjSPxX9MGi3wQekMRdyGvJPjHOxdGFEVkYMZjnZlfYCx5LFlMrrgjxodf5uy/iG
	YZnQ==
X-Gm-Message-State: ALyK8tKCizOO0DukmyZgfMEgFuU0/orkjRWHLjaep7xHKuQopGcEEJzeeaC7r4e1VIhjew==
X-Received: by 10.98.87.138 with SMTP id i10mr47622113pfj.16.1468903394327;
	Mon, 18 Jul 2016 21:43:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i137sm775514pfe.64.2016.07.18.21.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 21:43:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 21:43:07 -0700
Message-Id: <20160719044307.16219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] glibc: Update to 2.24 after hard-freeze
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
X-List-Received-Date: Tue, 19 Jul 2016 04:43:18 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.24.bb           |  2 +-
 meta/recipes-core/glibc/glibc/elf-meta.patch       | 32 ----------------------
 meta/recipes-core/glibc/glibc_2.24.bb              |  3 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/elf-meta.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index 104e38b..650c6c3 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
+SRCREV_glibc ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc/elf-meta.patch b/meta/recipes-core/glibc/glibc/elf-meta.patch
deleted file mode 100644
index fab66d7..0000000
--- a/meta/recipes-core/glibc/glibc/elf-meta.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From a495656665cd4a4f97744741a4741eafa621d65b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 11 Jul 2016 16:57:38 +0100
-Subject: [PATCH] elf.h: add relocations for Imagination META
-
-Adding EM_METAG but not the relocations means the kernel doesn't compile as it
-guards its own declarations on the presence of EM_METAG.
----
- elf/elf.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/elf/elf.h b/elf/elf.h
-index b6112d9..69e85a7 100644
---- a/elf/elf.h
-+++ b/elf/elf.h
-@@ -3677,6 +3677,10 @@ enum
- 
- #define R_TILEGX_NUM		130
- 
-+/* Imagination META relocs */
-+#define R_METAG_ADDR32		2
-+#define R_METAG_NONE		3
-+
- /* BPF specific declarations.  */
- 
- #define R_BPF_NONE		0	/* No reloc */
--- 
-2.8.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 456f206..03773c7 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
+SRCREV ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
@@ -37,7 +37,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://elf-meta.patch \
 "
 
 SRC_URI += "\
-- 
2.9.0



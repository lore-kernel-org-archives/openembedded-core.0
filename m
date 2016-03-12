Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 69A40605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:28:05 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y89so120953730qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nc6YTFbMJZUjHvJ8rRvZlfejRFPpOThfPH3VGv2E2EA=;
	b=p92HIWSRy9acJUr5AY5IPB6dNcfL25GtfeZmt1SrRhLLOxZjUoUUBBwICU/ZMh4tgV
	CU/8P72UaYlllPwEVGbkCHG4o5G1NT2NCa3QeUyIcXEGpXXSNj2X5X2GvZ1CrO6D2Td2
	M0w1P9NtAVbIRC79eorlBu/NFUP9iX0DiwkLrmrI18msQ8w+vgqQpkwnE5nwITpFPRDp
	Db40V4SiHbfdcJYemTUVtqF734TdEfI2jelngxzrQlKjRToCtInUhqAxZpJU0w02TTZK
	nYZsIGSzbRz+GMav4McMawd9mhKK5L2dH+wm1kwpJo0n775d3LIKQZF5LGO7Q95bXgLo
	GQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nc6YTFbMJZUjHvJ8rRvZlfejRFPpOThfPH3VGv2E2EA=;
	b=bcF22Qx3olWeI2IvUGCP3JE6iuhGAIjZ7+Hznp8X2BxL5dNpIo+71JWv4rYRiuOkfV
	5LSmC38GrXEWTTjrqC9DkhwCdNMjonGSOuaDx5k8Xi4CUtldmvbL2VMKBcT3JRmOFJXR
	fuzV7zdqN1rV/+1o192LGpDBqzco2a9Ag/fD67JL0V5mAIeFIFm6Qs2Z7XEMv9p8NZRt
	S2yQQ2AHAZwODUYDTSHcHCDBVJ1v0cBEjEwfxm7C/84OZfMcE8nFfytFrtw1hdAtoRZx
	dQQwYq+oEdcPIxThlUs9YWlZtrx4YqVzteC66XK6E+6z9ABvS8yHpK2P/1upaTVD2hvF
	NFzA==
X-Gm-Message-State: AD7BkJL5z27OfxIpF1gL2dBTJhprpojCjYmMxbHlWQUgp+uEFmFO3EJpLWeonTzrK7j18w==
X-Received: by 10.140.35.115 with SMTP id m106mr18546956qgm.13.1457792885743; 
	Sat, 12 Mar 2016 06:28:05 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	z132sm6237491qka.14.2016.03.12.06.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Mar 2016 06:28:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2016 14:27:59 +0000
Message-Id: <1457792879-9598-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] busybox: Drop -r passthrough patch
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
X-List-Received-Date: Sat, 12 Mar 2016 14:28:06 -0000

This was added to help clang compile busybox but since then
the option has been added to llvm and now we have upgraded clang
to 3.8 which has this option available

Fix git recipe to build with mdev feature and update to tip when here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/0002-Passthrough-r-to-linker.patch     | 32 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 -
 meta/recipes-core/busybox/busybox_git.bb           | 11 ++++++--
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch

diff --git a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
deleted file mode 100644
index de286fb..0000000
--- a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From df2cc76cdebc4773361477f3db203790f6986e3b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Aug 2015 23:42:40 -0700
-Subject: [PATCH 2/2] Passthrough -r to linker
-
-clang does not have -r switch and it does not pass it down to linker
-either, LDFLAGS_RELOCATABLE is used when CC is used for LD, so this
-should not cause side effects
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9da02cb..10dd4a9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -309,7 +309,7 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise $(C
- MODFLAGS	= -DMODULE
- CFLAGS_MODULE   = $(MODFLAGS)
- AFLAGS_MODULE   = $(MODFLAGS)
--LDFLAGS_RELOCATABLE = -r -nostdlib
-+LDFLAGS_RELOCATABLE = -Xlinker -r -nostdlib
- LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
- CFLAGS_KERNEL	=
- AFLAGS_KERNEL	=
--- 
-2.1.4
-
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 174ca47..bdaa5a5 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://0002-Passthrough-r-to-linker.patch \
            file://busybox-1.24.1-unzip.patch \
            file://busybox-1.24.1-unzip-regression.patch \
            file://busybox-1.24.1-truncate-open-mode.patch \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ae16b59..e314b97 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-SRCREV = "966423d4034067f52b419570a1016d1dfc4aeacd"
+SRCREV = "1b7c17391de66502dd7a97c866e0a33681edbb1f"
 # Lookout for PV bump too when SRCREV is changed
 PV = "1.25.0+git${SRCPV}"
 
@@ -35,13 +35,18 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://0002-Passthrough-r-to-linker.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
+           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
+           file://inittab \
+           file://rcS \
+           file://rcK \
+           file://runlevel \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-DEFAULT_PREFERENCE = "-1"
+#DEFAULT_PREFERENCE = "-1"
-- 
1.9.1



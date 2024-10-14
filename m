Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C830CFC525
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 09:12:35 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.50722.1728897145633795909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 02:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Ut5HVi8H;
 spf=pass (domain: snapchat.com, ip: 209.85.167.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e1543ab8so3599522e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1728897143; x=1729501943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgxOAIA+tu8ZaNhO5eVkRuGjgd/iEyPEPkQHZTMETMU=;
        b=Ut5HVi8HuWKxRTs9qLhDIfMlTJcmjVR/q2qmixHxDRNnJLwzcuMF4QpQIT2RsIksDC
         cPHGEmVLFLr7c88ihEz0VVTfnp1nOXrSsAxBlyvlcCYkvEjEC7VHajvyH1W+wx8YDCzh
         bupWD/BSNqEQqsuozKXJb5qOYL+JVluc2CcAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728897143; x=1729501943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgxOAIA+tu8ZaNhO5eVkRuGjgd/iEyPEPkQHZTMETMU=;
        b=Y99lDhu6BwVHRQAdowPROOWzPv1hzl4up9w16JNpiWBNuAc740P1728dC8Vl5hYNSb
         g/wV9M/PEpanMJdYwmtTMLJW0O+1stB7V5Ayfifv7sn8TUxCw4T9mxSqhS6s8VQp0Y0o
         Vn6LHx7+sijgn++evgpWuU0Oew0QqMHv1RjKFnGrcY9AXUp3ApFBpeJKH1N8b/a21b3a
         f94s6STQQyTKnlTbGdL2Q9K1EJfG5sOTenmlzNG4LgndM4HS3mseTNazbz5XeUUCOxhs
         4YFbWnrQkIkqY7U+SRPbP18wzdLzLkjGYQJHtZIeZBvcBhOOLJlALEN+OIDgDY0YaYfM
         uajA==
X-Gm-Message-State: AOJu0YwyPUh5jo7SDWYBEsB9e7rZ/8V92gHYhvC10tVpZUOSYrZFV8ky
	CPUSi/YfSGN//VxYiy+FkKo4RQg1HwVbDhhPItp2Q/HTOGxsYI0YnGt7XnTM0NygwK7qTNLc3eL
	dXuA=
X-Google-Smtp-Source: AGHT+IH4eK0pRRLeuguqiNCC2OMb0WtNAz6DpHqjdeh/r2tGbotCkGG3Ipw5kzTM3wULUo/HHPkjyw==
X-Received: by 2002:a05:6512:39c7:b0:531:8f2f:8ae7 with SMTP id 2adb3069b0e04-539e550179cmr3568122e87.25.1728897142747;
        Mon, 14 Oct 2024 02:12:22 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a1769f539sm53547766b.162.2024.10.14.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:12:22 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
Date: Mon, 14 Oct 2024 11:11:18 +0200
Message-ID: <20241014091117.2953622-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205734

From: Etienne Cordonnier <ecordonnier@snap.com>

The kdump script from kexec-tools does not work without makedumpfile (see https://git.yoctoproject.org/poky/tree/meta/recipes-kernel/kexec/kexec-tools/kdump#n14 ).
Thus, let's import makedumpfile from meta-openembedded/meta-oe/recipes-kernel/makedumpfile and make kexec-tools RDEPENDS on makedumpfile.

makedumpfile is the utility which reads /proc/vmcore after a kernel panic and creates a kdump file under /var/crash/.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../kexec/kexec-tools_2.0.29.bb               |   1 +
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 139 ++++++++++++++++++
 .../makedumpfile/makedumpfile_1.7.5.bb        |  62 ++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b529786214..ad2544741f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -490,6 +490,7 @@ RECIPE_MAINTAINER:pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-make = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-makedepend = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-makedumpfile = "Etienne Cordonnier <ecordonnier@snap.com>"
 RECIPE_MAINTAINER:pn-make-mod-scripts = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index 2c2901f19e..be24d064bb 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09 \
                     "
 DEPENDS = "zlib xz"
+RDEPENDS:${PN} = "makedumpfile"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
            file://kdump \
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
new file mode 100644
index 0000000000..96a996f616
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -0,0 +1,139 @@
+From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 24 Apr 2022 17:25:33 +0800
+Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
+
+* Create alias for target such as powerpc as powerpc32
+* Remove hardcode CFLAGS
+* Add CFLAGS_COMMON to instead of CFLAGS so can flexibly
+  customize CFLAGS and not hardcode the CFLAGS as previously
+* Forcibly to link dynamic library as the poky build
+  system doesn't build static library by default
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+[2021-11-18] Patch updated to use CFLAGS_COMMON for zstd
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Rebase to 1.7.1
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile | 40 +++++++++++++++++++++-------------------
+ 1 file changed, 21 insertions(+), 19 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 71d8548..22acdd5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
+ CC	= gcc
+ endif
+ 
+-CFLAGS_BASE := $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
+-		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-CFLAGS      := $(CFLAGS_BASE) -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
+-CFLAGS_ARCH := $(CFLAGS_BASE)
+-# LDFLAGS = -L/usr/local/lib -I/usr/local/include
+-
+ HOST_ARCH := $(shell uname -m)
+ # Use TARGET as the target architecture if specified.
+ # Defaults to uname -m
+@@ -24,26 +18,34 @@ endif
+ ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
+ 			       -e s/arm.*/arm/ -e s/sa110/arm/ \
+ 			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
+-			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
++			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \
++			       -e s/_powerpc_/_powerpc32_/)
+ 
+ CROSS :=
+ ifneq ($(TARGET), $(HOST_ARCH))
+ CROSS := -U__$(HOST_ARCH)__
+ endif
+ 
+-CFLAGS += -D__$(ARCH)__ $(CROSS)
+ CFLAGS_ARCH += -D__$(ARCH)__ $(CROSS)
+ 
+-ifeq ($(ARCH), powerpc64)
+-CFLAGS += -m64
++ifeq ($(ARCH), __powerpc64__)
+ CFLAGS_ARCH += -m64
+ endif
+ 
+-ifeq ($(ARCH), powerpc32)
+-CFLAGS += -m32
++ifeq ($(ARCH), __powerpc32__)
+ CFLAGS_ARCH += -m32
+ endif
+ 
++CFLAGS_ARCH += $(CFLAGS) \
++              -D_FILE_OFFSET_BITS=64 \
++              -D_LARGEFILE_SOURCE \
++              -D_LARGEFILE64_SOURCE
++
++CFLAGS_COMMON = $(CFLAGS_ARCH) \
++              -DVERSION='"$(VERSION)"' \
++              -DRELEASE_DATE='"$(DATE)"'
++
++
+ SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
+ SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c printk.c detect_cycle.c
+ OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
+@@ -52,12 +54,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+ 
+ LIBS = -ldw -lbz2 -ldl -lelf -lz
+ ifneq ($(LINKTYPE), dynamic)
+-LIBS := -static $(LIBS) -llzma
++LIBS := $(LIBS) -llzma
+ endif
+ 
+ ifeq ($(USELZO), on)
+ LIBS := -llzo2 $(LIBS)
+-CFLAGS += -DUSELZO
++CFLAGS_COMMON += -DUSELZO
+ endif
+ 
+ ifeq ($(USESNAPPY), on)
+@@ -65,12 +67,12 @@ LIBS := -lsnappy $(LIBS)
+ ifneq ($(LINKTYPE), dynamic)
+ LIBS := $(LIBS) -lstdc++
+ endif
+-CFLAGS += -DUSESNAPPY
++CFLAGS_COMMON += -DUSESNAPPY
+ endif
+ 
+ ifeq ($(USEZSTD), on)
+ LIBS := -lzstd $(LIBS)
+-CFLAGS += -DUSEZSTD
++CFLAGS_COMMON += -DUSEZSTD
+ endif
+ 
+ ifeq ($(DEBUG), on)
+@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
+ all: makedumpfile
+ 
+ $(OBJ_PART): $(SRC_PART)
+-	$(CC) $(CFLAGS) -c -o ./$@ $(VPATH)$(@:.o=.c)
++	$(CC) $(CFLAGS_COMMON) -c -o ./$@ $(VPATH)$(@:.o=.c)
+ 
+ $(OBJ_ARCH): $(SRC_ARCH)
+ 	@mkdir -p $(@D)
+ 	$(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=.c)
+ 
+ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+-	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
++	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
+ 	@sed -e "s/@DATE@/$(DATE)/" \
+ 	     -e "s/@VERSION@/$(VERSION)/" \
+ 	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
+@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+ 	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
+ 
+ eppic_makedumpfile.so: extension_eppic.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
++	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
+ 
+ clean:
+ 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8 makedumpfile.conf.5
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
new file mode 100644
index 0000000000..85b44c4941
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
@@ -0,0 +1,62 @@
+SUMMARY = "VMcore extraction tool"
+DESCRIPTION = "\
+    This program is used to extract a subset of the memory available either \
+    via /dev/mem or /proc/vmcore (for crashdumps). It is used to get memory \
+    images without extra uneeded information (zero pages, userspace programs, \
+    etc). \
+"
+HOMEPAGE = "https://github.com/makedumpfile/makedumpfile"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPL-2.0-only"
+
+SRCBRANCH ?= "master"
+SRCREV = "c266469347d49287be38059d45e7aaa454db9cb2"
+
+DEPENDS = "bzip2 zlib elfutils xz"
+RDEPENDS:${PN}-tools = "perl ${PN}"
+
+# mips/rv32 would not compile.
+COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+
+PACKAGES =+ "${PN}-tools"
+FILES:${PN}-tools = "${bindir}/*.pl"
+
+SRC_URI = "\
+    git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
+    file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+"
+
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
+SECTION = "base"
+
+# If we do not specify TARGET, makedumpfile will build for the host but use the
+# target gcc.
+#
+
+MAKEDUMPFILE_TARGET ?= "${TARGET_ARCH}"
+MAKEDUMPFILE_TARGET:powerpc = "ppc"
+
+EXTRA_OEMAKE = "\
+    LINKTYPE=static \
+    TARGET=${MAKEDUMPFILE_TARGET} \
+    ${PACKAGECONFIG_CONFARGS} \
+"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzo] = "USELZO=on,USELZO=off,lzo"
+PACKAGECONFIG[snappy] = "USESNAPPY=on,USESNAPPY=off,snappy"
+PACKAGECONFIG[zstd] = "USEZSTD=on,USEZSTD=off,zstd"
+
+do_install () {
+    mkdir -p ${D}/usr/bin
+    install -m 755 ${S}/makedumpfile ${D}/usr/bin
+    install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
+
+    mkdir -p ${D}/etc/
+    install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sample
+}
-- 
2.43.0



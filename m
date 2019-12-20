Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5EE7FCEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d139so9839464wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q9m3brsyKrUwviyC0J2lgXynCyUWACqTFdo25TuMBDw=;
	b=vhbmjTAW5TriocbGVn4V7zHosUSdoEe9gX+kUC8IWZrziRP2II98l8FibY3Nz2Q5lD
	w0FULmkL0ple9KI00asUDFZfKz9EXajTKp7gLIuzJ2Bw3O0yuEXxxgCJ30UCzhtYH7CX
	AeuvxRxSMdenBTuSaqZCCTLqPqci9xkVh2mJDptRyT/qRxIsah8w04lejZza+4K6Rak8
	+7lP6VAZoYUQnJLQsCA6Ri4/t8hwrFSH6M3ZmTelRZ0qH4n4fQuX5Bl2kFOen6KRNyyq
	F6+C8LuGJXSkcUbjyN9qukG4BQAN1jYiKDJSisTqv/fqNvrJE3sFD0lbojhbTouCWbLq
	X49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q9m3brsyKrUwviyC0J2lgXynCyUWACqTFdo25TuMBDw=;
	b=q9HmujCF9lGWscCS4gy9uLoy7jkMFeaJ0m/diuoQKj4bG17lbLKaR7plj6GwMCsZQ5
	IdDTgsDNko3giA3ECxANwG9hJA7wWEUP1BFQ/42dSoS2XX9O8bPPUqQ7JD4h3+FXiicC
	AS2tKFCGpHC3BcqI7qoieYrOuKMafQd/MlwOaWDZvh+MX/FxE9KEcsVr1lKajFOhV9bz
	V6hAhvacmg4y3FbEDafyhS114ZtNCqFXcvZl10d/iaw78vei86m3mgVfNSPjeitU8M66
	N5bWmF5HwJBYVEK8FeliXJ/ve04TwnPhqY2tHXgMLrgSTXWxDKgUGo0D5VBLZl1IKkDM
	0fBA==
X-Gm-Message-State: APjAAAX6D46pTlJqPmPGrSrAMYKf4qRS7vsIOau59HWwIwHIasEUGklc
	Kn1/N7KsELLYIHpsUieTurrjTHBgQjY=
X-Google-Smtp-Source: APXvYqwbFAM4rBaE3/6Jh8Dkjxl6NwZYpFM0vXNEZfJlECQVhh4J9YthOO1Mk6MaY2zdEr41t7dQeA==
X-Received: by 2002:a05:600c:224d:: with SMTP id
	a13mr17244882wmm.70.1576859045558; 
	Fri, 20 Dec 2019 08:24:05 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:51 +0100
Message-Id: <20191220162351.94498-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/11] kexec-tools: update to 2.0.20
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:05 -0000

Add a patch that restores missing declarations for 32 bit x86 builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xec-un-break-the-build-on-32-bit-x86.patch | 42 +++++++++++++++++++
 ...-tools_2.0.19.bb => kexec-tools_2.0.20.bb} | 27 ++++++------
 2 files changed, 56 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.19.bb => kexec-tools_2.0.20.bb} (78%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch b/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
new file mode 100644
index 00000000000..b91608e52b5
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
@@ -0,0 +1,42 @@
+From d294c5039753a36506949ba5dc782a4c0b307b74 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 17:21:08 +0100
+Subject: [PATCH] kexec: un-break the build on 32 bit x86
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ kexec/arch/i386/Makefile    | 1 +
+ kexec/arch/i386/kexec-x86.h | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/kexec/arch/i386/Makefile b/kexec/arch/i386/Makefile
+index 105cefd..25df57a 100644
+--- a/kexec/arch/i386/Makefile
++++ b/kexec/arch/i386/Makefile
+@@ -11,6 +11,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-nbi.c
+ i386_KEXEC_SRCS += kexec/arch/i386/x86-linux-setup.c
+ i386_KEXEC_SRCS += kexec/arch/i386/crashdump-x86.c
++i386_KEXEC_SRCS += kexec/arch/i386/kexec-mb2-x86.c
+ 
+ dist += kexec/arch/i386/Makefile $(i386_KEXEC_SRCS)			\
+ 	kexec/arch/i386/crashdump-x86.h					\
+diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
+index 1b58c3b..d6b10c0 100644
+--- a/kexec/arch/i386/kexec-x86.h
++++ b/kexec/arch/i386/kexec-x86.h
+@@ -56,9 +56,13 @@ struct arch_options_t {
+ };
+ 
+ int multiboot_x86_probe(const char *buf, off_t len);
++int multiboot2_x86_probe(const char *buf, off_t len);
+ int multiboot_x86_load(int argc, char **argv, const char *buf, off_t len,
+ 	struct kexec_info *info);
++int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
++	struct kexec_info *info);
+ void multiboot_x86_usage(void);
++void multiboot2_x86_usage(void);
+ 
+ int elf_x86_probe(const char *buf, off_t len);
+ int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
similarity index 78%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index c3f74359f13..871b36440ff 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -10,19 +10,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
 DEPENDS = "zlib xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-    file://kdump \
-    file://kdump.conf \
-    file://kdump.service \
-    file://0001-powerpc-change-the-memory-size-limit.patch \
-    file://0002-purgatory-Pass-r-directly-to-linker.patch \
-    file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
-    file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
-    file://0005-Disable-PIE-during-link.patch \
-    file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
-"
-
-SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
-SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
+           file://kdump \
+           file://kdump.conf \
+           file://kdump.service \
+           file://0001-powerpc-change-the-memory-size-limit.patch \
+           file://0002-purgatory-Pass-r-directly-to-linker.patch \
+           file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
+           file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
+           file://0005-Disable-PIE-during-link.patch \
+           file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
+           file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
+           "
+
+SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
+SRC_URI[sha256sum] = "cb16d79818e0c9de3bb3e33ede5677c34a1d28c646379c7ab44e0faa3eb57a16"
 
 inherit autotools update-rc.d systemd
 
-- 
2.17.1



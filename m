Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id C23BE7F349
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:46:02 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id r1so40940065pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QAD13wft68CdLW8qltHSw57qWrwX2MwvVJyqgTTWTls=;
	b=LvAX6s0qyaZfFJ9m489NHUVz12iENu0Ixj5NCzHHF1VrbDTKZBmaPvnW0VZ9LvZ2w6
	CdlJecjJZHZpKrit06UfP8g2cHOD5fCnIMObTzR5b39PV9tYHLVk8kvxaVGaCEM8FaAL
	TsoXkEPaodkPA/X4n6cLLRF0OdwO5qJldLjLqpMhnTjXgRjbVuKYkKfK/NLJle13t+/g
	pIl5ZKz1SmBaLqEv4jeu0ovsdUo0yKMP8jKadG2YcGBVPLAtLLb0t0FtOYPbmWuFL8PB
	UnKYQ2UlzIjViSfAl84VzAne+WtPXiwa0AfHGNXKeTYuwLHPq5oLG99hrnfIPsHWft5V
	B2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QAD13wft68CdLW8qltHSw57qWrwX2MwvVJyqgTTWTls=;
	b=c3ycZPgelmTz5P4tndb7/LHmmP7UnHTkYhB7TueffqQTikmhoerAcZZGr47fQZieRu
	/CdMUtUCicIB5NBfZTCshNI+o0tad/41PeNV+2UteuPd4R8Li+xWnbsea76oI2sY7L0E
	kT/LPQxdvYf0LNn86f/5HPgJLOTHOw2C0ZkCx3awk7uj1mPbNyhzTXQciMKGZUgV4cu/
	OFBb9iHH12h4H0AzM6SBYbC03Q3gtMjHBhneNSxHNehzmMltH1ayzjRq2FM2/bghauBn
	Eihp9j4Slr32RWjmWNuf//uKOpP0ObFaZ+hRaa777bWtm+gC9/uxLeE8QyY7VdiDZp1y
	Qdxg==
X-Gm-Message-State: APjAAAXDUX3XVyoDKWgneZm4cx7cFuB2kQYcj78s+CqwpUEEmrIvPPf4
	jIW3NOrFw83BfgNkyKmpTQ2TbZ2+GfU=
X-Google-Smtp-Source: APXvYqxnxEDxnN1QSzBxIP2sFSwAGtIT8i8RZC7Tsedx2+9+qtllIecqW2ElDWZv0XsywweDcwdMMw==
X-Received: by 2002:a63:c203:: with SMTP id b3mr1660905pgd.450.1565073963317; 
	Mon, 05 Aug 2019 23:46:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id x1sm17957104pjo.4.2019.08.05.23.46.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:46:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:45:47 -0700
Message-Id: <20190806064547.32044-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806064547.32044-1-raj.khem@gmail.com>
References: <20190806064547.32044-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] systemd-boot: Add option to specify cross objcopy and use it
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
X-List-Received-Date: Tue, 06 Aug 2019 06:46:02 -0000
Content-Transfer-Encoding: 8bit

This is needed when build host != x86 box

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_242.bb |  2 +
 ...fi-objcopy-option-to-specify-objcopy.patch | 48 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_242.bb b/meta/recipes-core/systemd/systemd-boot_242.bb
index 56e68a3d49..56a25c35ba 100644
--- a/meta/recipes-core/systemd/systemd-boot_242.bb
+++ b/meta/recipes-core/systemd/systemd-boot_242.bb
@@ -8,6 +8,7 @@ DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 SRC_URI += "file://0001-Revert-meson-use-an-array-option-for-efi-cc.patch \
             file://0001-Revert-meson-print-EFI-CC-configuration-nicely.patch \
             file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
+            file://0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch \
             "
 
 inherit meson pkgconfig gettext
@@ -22,6 +23,7 @@ EXTRA_OEMESON += "-Defi=true \
                   -Dman=false \
                   -Defi-cc='${EFI_CC}' \
                   -Defi-ld='${LD}' \
+                  -Defi-objcopy='${OBJCOPY}' \
                   "
 
 # install to the image as boot*.efi if its the EFI_PROVIDER,
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch b/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch
new file mode 100644
index 0000000000..7d764b4115
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch
@@ -0,0 +1,48 @@
+From 3f37ad5e083dcad51c21c1050b2829b70d240b52 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Aug 2019 03:10:20 +0000
+Subject: [PATCH] meson: Add -Defi-objcopy option to specify objcopy
+
+This helps in cross compiling for x86 target on a aarch64 host e.g.
+Fixes
+TOPDIR/build/tmp/hosttools/objcopy:src/boot/efi/systemd_boot.so: Invalid bfd target
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson_options.txt        | 2 ++
+ src/boot/efi/meson.build | 5 ++++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index d4ec37dda2..dc1c96e112 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -296,6 +296,8 @@ option('efi-cc', type : 'array',
+        description : 'the compiler to use for EFI modules')
+ option('efi-ld', type : 'string',
+        description : 'the linker to use for EFI modules')
++option('efi-objcopy', type : 'string',
++       description : 'the objcopy to use for EFI')
+ option('efi-libdir', type : 'string',
+        description : 'path to the EFI lib directory')
+ option('efi-ldsdir', type : 'string',
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 0ae3191635..5a7137bc84 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -88,7 +88,10 @@ if have_gnu_efi
+                 output : 'efi_config.h',
+                 configuration : efi_conf)
+ 
+-        objcopy = find_program('objcopy')
++        objcopy = get_option('efi-objcopy')
++        if objcopy == ''
++                objcopy = find_program('objcopy', required: true)
++        endif
+ 
+         efi_ldsdir = get_option('efi-ldsdir')
+         arch_lds = 'elf_@0@_efi.lds'.format(gnu_efi_path_arch)
+-- 
+2.17.1
+
-- 
2.22.0



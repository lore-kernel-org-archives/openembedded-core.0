Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB82579FD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 14:03:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s12so5109812wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8+7RFvBoYdElESWCGrRAHsH1H27HG+rhDlnNYBTFuk=;
	b=PqIdbr37o13VQbbDOzwSBxjIzmEUwJRiph9mmTfyGD8KiiQ3CKVkFC/wDVN6qCpbgl
	wI3fwme8iVWP/47tyH3srtHuBdD4kXgO71795Y+Ehuqz2O4W5OzZGxYeA+fM5sGFaB54
	wdi3bJOcVzffd8sG/YMByfZPip4d8CrErigRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8+7RFvBoYdElESWCGrRAHsH1H27HG+rhDlnNYBTFuk=;
	b=Qg4b0lJ5E/tWccz+JroBLxJBwe82QAR1JKDtUQHcYiR6zqlvgkclj4m+8r4Ut70mC2
	O4NZ0X/Xx/ylz0UCxGNBB5dsjFhZIXv5KKbVCRMQSds2yb/4OLaVVS+Uv4gRjArqKqlf
	cWm6zD4Rx6kez/YV1W2RY7FY3wxmFePfcEsEH55DTUCGldmAOpQUfT3+pLjIT6IYhqe0
	YZQcZXHkCsWDjqk137J4UL1sxTY33N9ajO5TaLY73UlUM9hP4xwewt9RILxSV8ySh1fx
	szemsS7MGbquvYMmpzp3ZO+G/OfoHv05Yk4WbjuPU8f2244e+AaBNXTNsAdC3Ls0FcMv
	R8MA==
X-Gm-Message-State: AA+aEWauaQZQeo6HxTqYEZXpNPg+duzdn+7i9Bfq6HSTyeb3iGBgkJmB
	rFRJ2B+bFQojFbFg9g9T+nl3OHWeI0SJJg==
X-Google-Smtp-Source: AFSGD/VMEQFArFRpSTpQ6dlWTz7j4x+R4kaEzejFpxG6X4QC7MyIiwv/xd6yf6Wyq4WMDQCttQTHGg==
X-Received: by 2002:adf:d089:: with SMTP id y9mr2834472wrh.22.1544796191878;
	Fri, 14 Dec 2018 06:03:11 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d4sm3290424wmb.25.2018.12.14.06.03.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 06:03:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 14:03:09 +0000
Message-Id: <20181214140310.1834-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] maintainers: Clarify/add several entries
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
X-List-Received-Date: Fri, 14 Dec 2018 14:03:11 -0000
Content-Transfer-Encoding: 8bit

Images were previously missing but are added, this also corrects the names
used for gcc/go/bintuils/gdb recipes and adds a few other misc missing ones
to ensure we have complete coverage of the recipes in OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 57 ++++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c66ad878c4a..222f56f7b02 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -64,9 +64,9 @@ RECIPE_MAINTAINER_pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER_pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-bind = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-binutils-cross = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-binutils-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-binutils-crosssdk = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-bjam-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
@@ -104,6 +104,25 @@ RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-connman-gnome = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-console-tools = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-core-image-base = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-minimal = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-minimal-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-minimal-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-minimal-mtdutils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-tiny-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-full-cmdline = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-kernel-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-sato = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-sato-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-lsb = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-lsb-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-testmaster-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-clutter = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-weston = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-sato-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-sato-sdk-ptest = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-coreutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-cpio = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-cracklib = "Armin Kuster <akuster808@gmail.com>"
@@ -167,20 +186,21 @@ RECIPE_MAINTAINER_pn-fribidi = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-fts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gawk = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-gcc = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-cross = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-cross-initial = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-crosssdk = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-crosssdk-initial = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-cross-initial-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-crosssdk-initial-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-7.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-8.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gccmakedep = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gdb-cross = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gdb-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gdbm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdk-pixbuf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-gettext = "Robert Yang <liezhi.yang@windriver.com>"
@@ -204,10 +224,13 @@ RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-gnupg = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-gnutls = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-go = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-go-cross = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-go-cross-${TUNE_PKGARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-go-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-go-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-go-dep = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-go-helloworld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-go-native = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-go-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gobject-introspection = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -378,6 +401,7 @@ RECIPE_MAINTAINER_pn-libxau = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcb = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcomposite = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcursor = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER_pn-libxcrypt = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libxdamage = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxdmcp = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxext = "Armin Kuster <akuster808@gmail.com>"
@@ -459,9 +483,10 @@ RECIPE_MAINTAINER_pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-meson = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-meta-environment = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-meta-environment-extsdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-meta-environment-extsdk-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-extsdk-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-meta-go-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-ide-support = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -486,9 +511,12 @@ RECIPE_MAINTAINER_pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mx-1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-nativesdk-meson = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-nativesdk-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-newlib = "Alejandro Hernandez <aehs29@gmail.com>"
 RECIPE_MAINTAINER_pn-ncurses = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-neard = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -636,6 +664,7 @@ RECIPE_MAINTAINER_pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <kamensky@cisco.com>"
+RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <kamensky@cisco.com>"
 RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <kamensky@cisco.com>"
 RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
-- 
2.19.1



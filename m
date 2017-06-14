Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02C0B783AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v14so477889pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KkksbstK3R9z6xXLsJJuSbZgh2+DVw25DiQWAlQfvMA=;
	b=PNLD3CSUtIQMAzfWBjZ2zYHV1B710iU6/CIOqh13u8+O2DUMn+u+VdAdZrwL65Hg0s
	bZvRbT3y8sOzu1DQIH3Fq/cyacVLUTNlZ82eSV3DbgctQMHx5uEUVaQILWXUkW+aOg0E
	IFu5cQoZ4LTCkHlBpmH+hl9enco0nD//VNtcS06vTZJRZlGrLLWGxwcpNQJYMuxWq7ht
	SydKjmbJp5SV2hlrwy/h1WdbYR+yeFwx2iGFwG0kuCLfCoEIOdjEhSFKbs/KB8XqaG3S
	JZwOQe2sBnY4S4mWg246LpLkpQp3KmXZpW0dotPZjPcyBZm1Kz8jS48zddCYMjwkawAw
	4igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KkksbstK3R9z6xXLsJJuSbZgh2+DVw25DiQWAlQfvMA=;
	b=PjJxT3RCN6R0p8gmDvy3wlHGF1+2jvSOCp4NKZ+B4vPWbtxpJc1ftwnI7KzyI7bWPX
	A6Ob8l1WRLiPlzjPcTl/BK7C+wPCOZpqWfebq7JBrnnWpPr917tn3OY8WYbw5iQQ2MaL
	if40Uiyn/ChY8K8cW1oU/7xxbAo0lHjMoH6Ww41pkFDcZqrXxG5cy7bAAadD+VQaHe3R
	mLDHSq7tvqObPdEIKm9+DCxZErguKsYmK9i28h+B64jOVy4cexbOEwXd64sVLkvmpOHK
	wR2zS4EFkH8v7eSenrq0CQ/N0jKmGg00haAJAY4zGMOE34WKpzR1h2scHRJp99+LW4Cy
	sivA==
X-Gm-Message-State: AKS2vOygeBM7eeBqNjeO1rkcRQKzepYF8RIsM46z7Cb3pJFzIYhhks/t
	XHrhUKF9QI93ig47
X-Received: by 10.84.209.238 with SMTP id y101mr675764plh.290.1497453821852;
	Wed, 14 Jun 2017 08:23:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:21 -0700
Message-Id: <80c14cbb1b41755ac3370626f36f7fc84f106f92.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:41 -0000

GCC is configured correctly to pass PIE cflags/ldflags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 83 ++++++++---------------------
 1 file changed, 22 insertions(+), 61 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index d3b7257240..f6bbf70655 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,4 +1,4 @@
-# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These 
+# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These
 # don't work universally, there are recipes which can't use one, the other
 # or both so a blacklist is maintained here. The idea would be over
 # time to reduce this list to nothing.
@@ -14,89 +14,45 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
-SECURITY_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+# Inject pie flags into compiler flags if not configured with gcc itself
+# especially useful with external toolchains
+SECURITY_PIE_CFLAGS ?= "${@'' if '${GCCPIE}' else '-pie -fPIE'}"
+
+SECURITY_NOPIE_CFLAGS ?= "-no-pie -fno-PIE"
+
+SECURITY_CFLAGS ?= "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify}"
-# Deal with ppc specific linker failures when using the cflags
-SECURITY_CFLAGS_pn-dbus_powerpc = ""
-SECURITY_CFLAGS_pn-dbus-ptest_powerpc = ""
-SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
+SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 # arm specific security flag issues
-SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
-SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = ""
-SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
 SECURITY_CFLAGS_pn-grub-efi-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
 SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
-SECURITY_CFLAGS_pn-gstreamer1.0-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libnewt-python = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python3-numpy = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python3-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python3-pygpgme = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-source-highlight = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-uclibc = ""
 SECURITY_CFLAGS_pn-uclibc-initial = ""
-SECURITY_CFLAGS_pn-valgrind = ""
-SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
+
+SECURITY_CFLAGS_pn-mkelfimage_x86 = ""
+
+SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS_pn-valgrind = ""
 
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
-SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
-TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
+TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
@@ -104,6 +60,8 @@ SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-mkelfimage_x86 = "-fstack-protector-strong"
+
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
@@ -112,4 +70,7 @@ SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
-TARGET_CC_ARCH_append_pn-binutils = " ${SECURITY_CFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.1



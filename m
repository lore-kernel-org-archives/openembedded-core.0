Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C80E277FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id z6so9590638pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7SQ1mMBoGpjyAOSoeXlIVNO3A25PR+wlrJ6UbwOSRYg=;
	b=TaUULPpJaLt5iZ51l0RqaIo1xEBYC64hX8I3zf163ftMip7T1NhKXj+WdFnoysAxE+
	duRs+3Ji2anv0bL9mIbsJzdo2t6eCW1rLXwGF01HcExXmViHKJotfVPKQArSa5AD3xrd
	di7trYPYmplgljzSSRlOBFY/uMTcTjR1BztXy8LGdQuW9pOB73YsqORcrEO5M5pqSmqL
	Nuq08dm3F+FFAoZ5mPEMeRCXirLj8YD9H70Y0a8zixLqYfyyWSYy8uhodbJ7nxR8pJ+D
	Hsifu9K73R8hMr3WXPbA4qsOQDe97EnWOSJFZAZve6jMqfu5qbq6uRs7+59uNjrG8I25
	1lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7SQ1mMBoGpjyAOSoeXlIVNO3A25PR+wlrJ6UbwOSRYg=;
	b=RNLu41oO0Iw1Prb4XX58xfDhzhknKqPYJ0lU72FwRaIA6g8b6A0+w42I7yJmbKAowe
	cSOcmooobfrgjMNszvjyYa5n2+IqznVgJK7+FoNM4zScCo8DXoPiy0QOm6twcIS1OF/k
	V+fXtod0+NFh5q4tgaSqu4OnAgWA9w1ElF7pZaou8H0rFzOXARYpm3FqEiwMGA51YO/T
	Zr9PX7L09FiQqRs2/+sO32A6CaKcgAnAKeK9/RC+aCmOgUC7XT5vkTbCMhSy6w86stks
	uTG1pJHP+ou7kxOLIDhblY9EEGP7i65w2h7NmS4Wwks3mKRUN7N1Co2NAbQTsbijSaFc
	5dAg==
X-Gm-Message-State: AKS2vOydmhBobc7ruyEKvI2+LoC2ywzmERom7PJgoBTt+AevH4EsR86q
	NBa6PPljrfjy/1xV
X-Received: by 10.84.130.98 with SMTP id 89mr12449369plc.222.1498665878663;
	Wed, 28 Jun 2017 09:04:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:15 -0700
Message-Id: <1255656a5626f4ceb33004ff520c33e38d293bf7.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:37 -0000

GCC is configured correctly to pass PIE cflags/ldflags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 81 +++++++----------------------
 1 file changed, 20 insertions(+), 61 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index f2eb224a77..64122d4ebe 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,4 +1,4 @@
-# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These 
+# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These
 # don't work universally, there are recipes which can't use one, the other
 # or both so a blacklist is maintained here. The idea would be over
 # time to reduce this list to nothing.
@@ -14,87 +14,43 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
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
@@ -108,4 +64,7 @@ SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
-TARGET_CC_ARCH_append_pn-binutils = " ${SECURITY_CFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.2



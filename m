Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8203A71C7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:36 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u36so464194pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UXgmUCBofunwR9lkagtgjwRHTyzR0jHdxWZ35GeKM5Y=;
	b=Kr8UKd/kGQBCMHnphB6wpPB873L5m0C2VcR1YiB3SPdEuF2TVJJ8SBVoVWoirH5mEt
	R8n9V6rJSrJ8Z2uwAZDLWanr4wb/Ofn6ASR//Oz/TY0pXnTsxkC8hTKLC79a3S/Dp/W4
	JQj+P56VT0RpaWrUdrVSjqOrBzI8PrqKForzcdVtQClvIx977VrCTlE/ZC9hpsAIycy5
	BkzSfHgnCbq7+IzCJbwRSA3noso2gAYXYOhfDku1IBmkenaohsxYIHiQBn3gCwm3P3DQ
	V8yY9ZlKjJU2NQDtddBr5znQq9+xdoSgz7dFokuytzyjyUpJbRFyt/9zMWCxp1toaa8b
	VUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UXgmUCBofunwR9lkagtgjwRHTyzR0jHdxWZ35GeKM5Y=;
	b=D5YtuXYLq1wFIk1c3z0HmIgJHn9fZg7l1ZakKOUo74noat3MSYxrzz2Iiu65owCcdV
	hrhOatfqwH3PjKUfZgkEcbIX5fQd5QAAyXVQSW5P4ewW4Q2a5N7IO3Zrb40yQcMTXLjs
	+fAsK+sH8OMg12rkkdHCgCCGIUQ/DIlAX6WTtBUv8UKlbZ8TvKHIcXnsLEC/ew69EpTv
	qzD8bqPzoQBJ2CnCFdtO2JXwMTo033vmOuXfJ/UcCK/h0P3a8BhX87ACjgcS0EPET1Jd
	6Y8O25jtqb/Pe2k1F5MM53LwdIkxQkUuEh7AwHam4oSDqUTSyU/xH7+uW4NLifIOAyxw
	Le7Q==
X-Gm-Message-State: AIVw112D3Dady2WwmisRKj/YLLO4SdXFLbIlCBIaPnJlB0nqj7oldq4L
	flCcBQ865pnTHQC3
X-Received: by 10.98.153.24 with SMTP id d24mr26640268pfe.223.1499351617353;
	Thu, 06 Jul 2017 07:33:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:03 -0700
Message-Id: <49061cd815f851a97428e2b7739056e2b256987c.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 02/22] security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:36 -0000

GCC is configured correctly to pass PIE cflags/ldflags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 83 ++++++++---------------------
 1 file changed, 22 insertions(+), 61 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index f2eb224a77..dd713b9818 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,4 +1,4 @@
-# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These 
+# Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These
 # don't work universally, there are recipes which can't use one, the other
 # or both so a blacklist is maintained here. The idea would be over
 # time to reduce this list to nothing.
@@ -14,87 +14,45 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
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
+SECURITY_CFLAGS_pn-sysklogd = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS_pn-sysklogd = ""
 
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
-SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
-TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
+TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
@@ -108,4 +66,7 @@ SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
-TARGET_CC_ARCH_append_pn-binutils = " ${SECURITY_CFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.2



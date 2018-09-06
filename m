Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0315795EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:51 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k14-v6so8444214edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vMPz8lL61eJ3EJa/THM4T0wK3Eint+6orWgJkhQmIsE=;
	b=jDipfzE0IxqVQUyDMeVZddnJ98HMRaXeLL662FVDfPdOzO0ccOER7LYKC/cr6CRG05
	skNRnM3anEzaFJIvuBNjbnSEanUzaZPTzZEiwMkrRmNc94H5SLaUwfU57T5G4d8pzdxo
	iRE/xM/W34xXXB+cwhiEZArHsWDQy3jhqQhbtf1coQqX2LBbenZ/JftHz8KjDBcxcbsT
	D/wh/wvJa9ob0MUAZV3V5icLroRJc3zjI3MRQZ3yT6bY3iC5Y0CVrsyZ2lfgGbZoOVBl
	j1OBAQ0xcMigyzpn0htOpV7NiXVRx9ZIvpnGDW3XP3n5f2BqqZN2mDCg18b/fOOeOsa8
	ayWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vMPz8lL61eJ3EJa/THM4T0wK3Eint+6orWgJkhQmIsE=;
	b=OtHxjPo+f+kDCzhfrohUjE+zTVyeJqoleb9DZ4m8GqmJcf+99I4LTbQsXCHuHZ8F+3
	cGaMHdiTiub1lbljfeeDskitp8Kh3Ym1MISgcusEalylAAecA/0g2RIvoQCZ5SddMXjT
	sdxBocknx/bRpN2b/1yMwyY9wrAR+4h80nJaqeoAc7duleJc0eptzap2hvXdtK1M6gTe
	Cp7TXP97jJPcRQFOiTXckshF8MYKSJeZVIjIu1NOAa/dWrG4R62OwtfIlAIyYRO9xvoH
	kbDM21JpoxRyqoq1MdqiM4sAJfyIpDYl9U38ZHTmPfXcWYTMh2D+KEOZiWY4+7ACO/Jc
	STBA==
X-Gm-Message-State: APzg51CB88dc/urXwhJP3WxD7c74H3hBPMVdSQ5NS4qkdAlpxqB8LINh
	owMhNyfujEsELya79YvDBgc9ESRvN6o=
X-Google-Smtp-Source: ANB0VdatkR0I/QIKvi+BEZstQfgXkWL7JT+QOynX2t+i+uW49l991A3t2LcsDTuhPLxHyIOXUcvnzg==
X-Received: by 2002:a50:9662:: with SMTP id
	y89-v6mr2836387eda.32.1536229792132; 
	Thu, 06 Sep 2018 03:29:52 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:22 +0200
Message-Id: <1536229770-29600-13-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 13/21] boost: update to 1.68.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/boost/bjam-native_1.67.0.bb   | 19 ------
 meta/recipes-support/boost/bjam-native_1.68.0.bb   | 19 ++++++
 meta/recipes-support/boost/boost-1.67.0.inc        | 21 ------
 meta/recipes-support/boost/boost-1.68.0.inc        | 21 ++++++
 ...ng-specific-branch-for-x86-DCAS-based-loa.patch | 76 ----------------------
 meta/recipes-support/boost/boost_1.67.0.bb         | 12 ----
 meta/recipes-support/boost/boost_1.68.0.bb         | 11 ++++
 7 files changed, 51 insertions(+), 128 deletions(-)
 delete mode 100644 meta/recipes-support/boost/bjam-native_1.67.0.bb
 create mode 100644 meta/recipes-support/boost/bjam-native_1.68.0.bb
 delete mode 100644 meta/recipes-support/boost/boost-1.67.0.inc
 create mode 100644 meta/recipes-support/boost/boost-1.68.0.inc
 delete mode 100644 meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
 delete mode 100644 meta/recipes-support/boost/boost_1.67.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.68.0.bb

diff --git a/meta/recipes-support/boost/bjam-native_1.67.0.bb b/meta/recipes-support/boost/bjam-native_1.67.0.bb
deleted file mode 100644
index 94f96e6..0000000
--- a/meta/recipes-support/boost/bjam-native_1.67.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require boost-${PV}.inc
-
-SUMMARY = "Portable Boost.Jam build tool for boost"
-SECTION = "devel"
-
-inherit native
-
-SRC_URI += "file://bjam-native-build-bjam.debug.patch \
-"
-
-do_compile() {
-    ./bootstrap.sh --with-toolset=gcc
-}
-
-do_install() {
-    install -d ${D}${bindir}/
-    # install unstripped version for bjam
-    install -c -m 755 bjam.debug ${D}${bindir}/bjam
-}
diff --git a/meta/recipes-support/boost/bjam-native_1.68.0.bb b/meta/recipes-support/boost/bjam-native_1.68.0.bb
new file mode 100644
index 0000000..94f96e6
--- /dev/null
+++ b/meta/recipes-support/boost/bjam-native_1.68.0.bb
@@ -0,0 +1,19 @@
+require boost-${PV}.inc
+
+SUMMARY = "Portable Boost.Jam build tool for boost"
+SECTION = "devel"
+
+inherit native
+
+SRC_URI += "file://bjam-native-build-bjam.debug.patch \
+"
+
+do_compile() {
+    ./bootstrap.sh --with-toolset=gcc
+}
+
+do_install() {
+    install -d ${D}${bindir}/
+    # install unstripped version for bjam
+    install -c -m 755 bjam.debug ${D}${bindir}/bjam
+}
diff --git a/meta/recipes-support/boost/boost-1.67.0.inc b/meta/recipes-support/boost/boost-1.67.0.inc
deleted file mode 100644
index 1c7f940..0000000
--- a/meta/recipes-support/boost/boost-1.67.0.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-# The Boost web site provides free peer-reviewed portable
-# C++ source libraries. The emphasis is on libraries which
-# work well with the C++ Standard Library. The libraries are
-# intended to be widely useful, and are in regular use by
-# thousands of programmers across a broad spectrum of applications.
-HOMEPAGE = "http://www.boost.org/"
-LICENSE = "BSL-1.0 & MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-
-BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
-BOOST_P = "boost_${BOOST_VER}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "ced776cb19428ab8488774e1415535ab"
-SRC_URI[sha256sum] = "2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba"
-
-UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
-
-S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost-1.68.0.inc b/meta/recipes-support/boost/boost-1.68.0.inc
new file mode 100644
index 0000000..b367a80
--- /dev/null
+++ b/meta/recipes-support/boost/boost-1.68.0.inc
@@ -0,0 +1,21 @@
+# The Boost web site provides free peer-reviewed portable
+# C++ source libraries. The emphasis is on libraries which
+# work well with the C++ Standard Library. The libraries are
+# intended to be widely useful, and are in regular use by
+# thousands of programmers across a broad spectrum of applications.
+HOMEPAGE = "http://www.boost.org/"
+LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
+BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
+BOOST_P = "boost_${BOOST_VER}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
+SRC_URI[md5sum] = "7fbd1890f571051f2a209681d57d486a"
+SRC_URI[sha256sum] = "7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7"
+
+UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
+UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
+
+S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch b/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
deleted file mode 100644
index 1826930..0000000
--- a/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 39b027171e0a619d49b9dd2e8471d10b6c41bc25 Mon Sep 17 00:00:00 2001
-From: Andrey Semashev <andrey.semashev@gmail.com>
-Date: Tue, 17 Jul 2018 12:37:29 +0300
-Subject: [PATCH] Removed clang-specific branch for x86 DCAS-based loads.
-
-The storage to load from is const-qualified and DCAS via compiler intrinsics
-require an unqualified pointer. Use asm implementation instead, which should be
-as efficient as intrinsics, if not better, in this case.
-
-Fixes https://github.com/boostorg/atomic/issues/15.
-
-Upstream-Status: Backport [https://github.com/boostorg/atomic/commit/6e14ca24dab50ad4c1fa8c27c7dd6f1cb791b534]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- boost/atomic/detail/ops_gcc_x86_dcas.hpp | 23 ++++++++++++-----------
- 1 file changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/boost/atomic/detail/ops_gcc_x86_dcas.hpp b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
-index 4dacc66f..b43ef23a 100644
---- a/boost/atomic/detail/ops_gcc_x86_dcas.hpp
-+++ b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
-@@ -158,11 +158,13 @@ struct gcc_dcas_x86
-         }
-         else
-         {
--#if defined(__clang__)
--            // Clang cannot allocate eax:edx register pairs but it has sync intrinsics
--            value = __sync_val_compare_and_swap(&storage, (storage_type)0, (storage_type)0);
--#elif defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
-+            // Note that despite const qualification cmpxchg8b below may issue a store to the storage. The storage value
-+            // will not change, but this prevents the storage to reside in read-only memory.
-+
-+#if defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
-+
-             uint32_t value_bits[2];
-+
-             // We don't care for comparison result here; the previous value will be stored into value anyway.
-             // Also we don't care for ebx and ecx values, they just have to be equal to eax and edx before cmpxchg8b.
-             __asm__ __volatile__
-@@ -175,7 +177,9 @@ struct gcc_dcas_x86
-                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "memory"
-             );
-             BOOST_ATOMIC_DETAIL_MEMCPY(&value, value_bits, sizeof(value));
-+
- #else // defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
-+
-             // We don't care for comparison result here; the previous value will be stored into value anyway.
-             // Also we don't care for ebx and ecx values, they just have to be equal to eax and edx before cmpxchg8b.
-             __asm__ __volatile__
-@@ -187,6 +191,7 @@ struct gcc_dcas_x86
-                 : [storage] "m" (storage)
-                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "memory"
-             );
-+
- #endif // defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
-         }
- 
-@@ -401,15 +406,11 @@ struct gcc_dcas_x86_64
- 
-     static BOOST_FORCEINLINE storage_type load(storage_type const volatile& storage, memory_order) BOOST_NOEXCEPT
-     {
--#if defined(__clang__)
-+        // Note that despite const qualification cmpxchg16b below may issue a store to the storage. The storage value
-+        // will not change, but this prevents the storage to reside in read-only memory.
- 
--        // Clang cannot allocate rax:rdx register pairs but it has sync intrinsics
--        storage_type value = storage_type();
--        return __sync_val_compare_and_swap(&storage, value, value);
--
--#elif defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
-+#if defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
- 
--        // Some compilers can't allocate rax:rdx register pair either and also don't support 128-bit __sync_val_compare_and_swap
-         uint64_t value_bits[2];
- 
-         // We don't care for comparison result here; the previous value will be stored into value anyway.
diff --git a/meta/recipes-support/boost/boost_1.67.0.bb b/meta/recipes-support/boost/boost_1.67.0.bb
deleted file mode 100644
index ef178ed..0000000
--- a/meta/recipes-support/boost/boost_1.67.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require boost-${PV}.inc
-require boost.inc
-
-SRC_URI += "\
-           file://arm-intrinsics.patch \
-           file://boost-CVE-2012-2677.patch \
-           file://boost-math-disable-pch-for-gcc.patch \
-           file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-           file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-           file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
-           file://0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch \
-           "
diff --git a/meta/recipes-support/boost/boost_1.68.0.bb b/meta/recipes-support/boost/boost_1.68.0.bb
new file mode 100644
index 0000000..c7958a4
--- /dev/null
+++ b/meta/recipes-support/boost/boost_1.68.0.bb
@@ -0,0 +1,11 @@
+require boost-${PV}.inc
+require boost.inc
+
+SRC_URI += "\
+           file://arm-intrinsics.patch \
+           file://boost-CVE-2012-2677.patch \
+           file://boost-math-disable-pch-for-gcc.patch \
+           file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
+           file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
+           "
-- 
2.7.4



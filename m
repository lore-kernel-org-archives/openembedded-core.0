Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id A956D795AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id h4-v6so8490895edi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GM+eMX5V4eHvqid2E3qJgRc2/l+5V6CzvrmcxbNOKkQ=;
	b=lu8BiJrgoqtemNjVZV5/HaqIrX0SVs7rKiEeGS2PjoR7lv5/weL0/QSj6XbSMnQNrI
	GcayAjqikWmxRQ4olJGvEt8tJYoX9xfXMKEdHm77U9APy+iE4nOi6ng2GLr3rxspXlcb
	lZW8PQ4SCFKOzXD5N/3CyIuBNU2CjmgN5YCWdDGY7M9xNIrTnVWmgeW/dg/yAgRHtCk9
	+oDGmFLdT93VAPJU9fCdysLCQffthnF2It5c4RYc7G9TrbX8dHDu/KUcLlrUD3Hg4pN5
	QKFooC+kq2gHQQn8uZn3PnWKoh38JGrDs9wLl9Q0YXcYs+DUXz8KUcd0j+4iTQNMSdHn
	0VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GM+eMX5V4eHvqid2E3qJgRc2/l+5V6CzvrmcxbNOKkQ=;
	b=DYjVnqcK3tKv4qMgsFWsTLoxhlpJxparyY2xCMbNM314u5vN+LpnD0YGmc7K9NdpEg
	rPUw24+SZV1+7+Q92xGt+mRks8QIGQmftFynwhW2krcrhhMQWaWAcrnK9q/vT+AtFasV
	CYrgVSGz8CJVuGqnu2Yjk6P9rz/AR04fAN76pUpjYTtCSxwfqwarOydvTT2avRgZCQOl
	VGxF/0A5aGk1AWxQq1IPnh6uIM4HpXuuR4BwUuFsnieeJcwlfEiRkFo7qTsh9/PiZdN8
	U7W5kVe3Mj5fNQmJpX4s5So7+N93t6Tr06pjB6IOLnNJhKaItj7iRsbPw+MIrQT0fqVE
	Eu0w==
X-Gm-Message-State: APzg51AWJwiVh5XL8dvKucut2PYW9gDhzP1nsPah6QBThWEqyX3w0dL2
	u/PuFwlZelsLYFKFmiAEnqIzWxk1bMc=
X-Google-Smtp-Source: ANB0VdbSL6LeLqZTzDBwK+sMkr/xKnxe6AG40qKxX/Jbl8Gna677GgIZoHGgfs0RjRlaGjC77vrPUA==
X-Received: by 2002:a50:f0c2:: with SMTP id a2-v6mr2903041edm.90.1536230451086;
	Thu, 06 Sep 2018 03:40:51 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:28 +0200
Message-Id: <1536230436-30342-13-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 13/21] boost: update to 1.68.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:51 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...bjam-native_1.67.0.bb => bjam-native_1.68.0.bb} |  0
 .../boost/{boost-1.67.0.inc => boost-1.68.0.inc}   |  4 +-
 ...ng-specific-branch-for-x86-DCAS-based-loa.patch | 76 ----------------------
 .../boost/{boost_1.67.0.bb => boost_1.68.0.bb}     |  1 -
 4 files changed, 2 insertions(+), 79 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.67.0.bb => bjam-native_1.68.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.67.0.inc => boost-1.68.0.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
 rename meta/recipes-support/boost/{boost_1.67.0.bb => boost_1.68.0.bb} (84%)

diff --git a/meta/recipes-support/boost/bjam-native_1.67.0.bb b/meta/recipes-support/boost/bjam-native_1.68.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.67.0.bb
rename to meta/recipes-support/boost/bjam-native_1.68.0.bb
diff --git a/meta/recipes-support/boost/boost-1.67.0.inc b/meta/recipes-support/boost/boost-1.68.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.67.0.inc
rename to meta/recipes-support/boost/boost-1.68.0.inc
index 1c7f940..b367a80 100644
--- a/meta/recipes-support/boost/boost-1.67.0.inc
+++ b/meta/recipes-support/boost/boost-1.68.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "ced776cb19428ab8488774e1415535ab"
-SRC_URI[sha256sum] = "2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba"
+SRC_URI[md5sum] = "7fbd1890f571051f2a209681d57d486a"
+SRC_URI[sha256sum] = "7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
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
diff --git a/meta/recipes-support/boost/boost_1.67.0.bb b/meta/recipes-support/boost/boost_1.68.0.bb
similarity index 84%
rename from meta/recipes-support/boost/boost_1.67.0.bb
rename to meta/recipes-support/boost/boost_1.68.0.bb
index ef178ed..c7958a4 100644
--- a/meta/recipes-support/boost/boost_1.67.0.bb
+++ b/meta/recipes-support/boost/boost_1.68.0.bb
@@ -8,5 +8,4 @@ SRC_URI += "\
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
-           file://0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch \
            "
-- 
2.7.4



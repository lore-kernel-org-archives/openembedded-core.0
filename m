Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeCvq-0005Tw-KD
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 23:13:23 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so6024491iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZDCQK1la2A/wGmhW6CTp1yqmmgdjl9XPhqsGzCVpU+k=;
	b=AwFZrT1cN3DPlQ5JIfpGQY9vD2j8QIicQBieVi1OevKbFFyf93ClwuBT/FXLKY3sxV
	a3Y2hjN7sZqfH8Iml9pMjyQfydwkuW95+/8SbrNPeZe8SSAkANDboQSTOKfVLTZUFitw
	wsORoCVuRvQ4hwwp9lB54ySHCi4dYOFrQGbD4=
Received: by 10.42.161.5 with SMTP id r5mr343762icx.13.1309900174690;
	Tue, 05 Jul 2011 14:09:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vn4sm7982300icb.7.2011.07.05.14.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 14:09:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:09:16 -0700
Message-Id: <0d0b8c6194782af2e2b26d95e022a96fcdb05a07.1309899985.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
References: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309899985.git.raj.khem@gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] uclibc_git: Move SRCREV past 0.9.32 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 21:13:23 -0000

Set DP = -1 since 0.9.32 should be preferred
Remove patches already merged upstream
Change PV to 0.9.32+git${SRCPV}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 ---
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 ---
 .../uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch    |   33 ---
 .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 -------
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   25 ---
 .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 ------
 .../uclibc/uclibc-git/orign_path.patch             |   42 ++--
 .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 --------
 .../uclibc-git/remove-sub-arch-variants.patch      |  215 --------------------
 .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 -------
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |   83 ++++----
 .../uclibc/uclibc-git/select-force-thumb.patch     |  172 ----------------
 .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 -------
 meta/recipes-core/uclibc/uclibc_git.bb             |   21 +--
 14 files changed, 70 insertions(+), 957 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
deleted file mode 100644
index da97d38..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 06cdcd2a9dd6b46b7fbb5b3ae0a62bdb7ee6c402 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 27 Jun 2011 17:48:18 -0700
-Subject: [PATCH] Config.in.arch: Free UCLIBC_HAS_FPU setting from depending on UCLIBC_HAS_FLOATS
-
-UCLIBC_HAS_FLOATS and UCLIBC_HAS_FPU are denoting two different aspects.
-UCLIBC_HAS_FLOATS covers the floating point operations which has nothing
-to do if you have FPU or not.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extra/Configs/Config.in.arch |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
-index 5f7a2b0..c1ca390 100644
---- a/extra/Configs/Config.in.arch
-+++ b/extra/Configs/Config.in.arch
-@@ -133,7 +133,6 @@ config UCLIBC_HAS_FLOATS
- 
- config UCLIBC_HAS_FPU
- 	bool "Target CPU has a floating point unit (FPU)"
--	depends on UCLIBC_HAS_FLOATS
- 	default y
- 	help
- 	  If your target CPU does not have a Floating Point Unit (FPU) or a
--- 
-1.7.0.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch b/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
deleted file mode 100644
index 6892ceb..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ecc7d34cbbaf83aae87b091555650ed33e27ed2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 30 Jun 2011 00:32:11 -0700
-Subject: [PATCH] mips/signalfd.h: SFD_NONBLOCK for mips is 0200 unlike 04000 commonly
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/sys/signalfd.h |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
-
-diff --git a/include/sys/signalfd.h b/include/sys/signalfd.h
-index 8cee17c..f1cb63a 100644
---- a/include/sys/signalfd.h
-+++ b/include/sys/signalfd.h
-@@ -64,6 +64,15 @@ enum
- # define SFD_NONBLOCK SFD_NONBLOCK
-   };
- 
-+#elif defined __mips__
-+enum
-+  {
-+    SFD_CLOEXEC = 02000000,
-+# define SFD_CLOEXEC SFD_CLOEXEC
-+    SFD_NONBLOCK = 0200
-+# define SFD_NONBLOCK SFD_NONBLOCK
-+  };
-+
- #else
- enum
-   {
--- 
-1.7.0.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch b/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
deleted file mode 100644
index edcb4e3..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-UCLIBC_EXTRA_CFLAGS is currently added before the OPTIMIZATION flags
-and OPTIMIZATION is chosen to be Os by default. But in OE we pass the optimisation
-flags through UCLIBC_EXTRA_CFLAGS but they are not effective since -Os is
-specified at last. So we need to change the order of these option flags
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-diff --git a/Rules.mak b/Rules.mak
-index 65fe47c..eca7f40 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -585,9 +574,6 @@ CFLAGS := -include $(top_srcdir)include/libc-symbols.h \
- 	-nostdinc -I$(top_builddir)include -I$(top_srcdir)include -I. \
- 	-I$(top_srcdir)libc/sysdeps/linux \
- 	-I$(top_srcdir)libc/sysdeps/linux/$(TARGET_ARCH)
--ifneq ($(strip $(UCLIBC_EXTRA_CFLAGS)),"")
--CFLAGS += $(call qstrip,$(UCLIBC_EXTRA_CFLAGS))
--endif
- 
- # We need this to be checked within libc-symbols.h
- ifneq ($(HAVE_SHARED),y)
-@@ -633,6 +619,9 @@ LDFLAGS += -Wl,-s
- else
- STRIPTOOL := true -Stripping_disabled
- endif
-+ifneq ($(strip $(UCLIBC_EXTRA_CFLAGS)),"")
-+CFLAGS += $(call qstrip,$(UCLIBC_EXTRA_CFLAGS))
-+endif
- 
- ifeq ($(DOMULTI),y)
- # we try to compile all sources at once into an object (IMA), but
diff --git a/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch b/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
deleted file mode 100644
index 43d19fc..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313307agb;
-        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
-Received: by 10.227.141.78 with SMTP id l14mr16920947wbu.128.1294533919168;
-        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id w30si33755908wbd.17.2011.01.08.16.45.18;
-        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClHDo; Sun, 09 Jan 2011 01:45:18 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 6/7] ARM: detect BX availibility at build time
-Date: Sun,  9 Jan 2011 01:45:09 +0100
-Message-Id: <1294533910-19305-7-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-The "use BX" option is now a suggestion that BX be used if available.
-Use a macro to detect if BX is available at build time. If so, and
-the user requested it be used, then use it. Otherwise, error out.
-
-Macro courtesy Khem RAJ:
-  http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.html
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- extra/Configs/Config.arm              |    4 +++-
- libc/sysdeps/linux/arm/bits/arm_asm.h |    9 ++++++++-
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
-index 227b90c..9aa9e56 100644
---- a/extra/Configs/Config.arm
-+++ b/extra/Configs/Config.arm
-@@ -33,4 +33,6 @@ config COMPILE_IN_THUMB_MODE
- config USE_BX
- 	bool "Use BX in function return"
- 	help
--	  Use BX instruction for THUMB aware architectures.
-+	  Say 'y' to use BX to return from functions on your thumb-aware
-+	  processor. Say 'y' if you need to use interworking. Say 'n' if not.
-+	  It is safe to say 'y' even if you're not doing interworking.
-diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
-index 1d87df6..921c9a3 100644
---- a/libc/sysdeps/linux/arm/bits/arm_asm.h
-+++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
-@@ -24,5 +24,12 @@
- #define THUMB1_ONLY 1
- #endif
- 
--#endif /* _ARM_ASM_H */
-+#if defined(__USE_BX__)
-+# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
-+      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
-+     )
-+#  error Use of BX was requested, but is not available on the target processor.
-+# endif /* ARCH level */
-+#endif /* __USE_BX__ */
- 
-+#endif /* _ARM_ASM_H */
--- 
-1.7.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch b/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
deleted file mode 100644
index bcd834d..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix a compile error due to last argument to syscall() not being memory addressable.
-
-Upstream-Status: Pending
-Signed-off-by: Phil Blundell <philb@gnu.org>
-
-diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
-index 85b0cfd..c034b2c 100644
---- a/libc/sysdeps/linux/common/epoll.c
-+++ b/libc/sysdeps/linux/common/epoll.c
-@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
- int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
- 						int timeout, const sigset_t *set)
- {
-+	int nsig = _NSIG / 8;
- 	if (SINGLE_THREAD_P)
--		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
-+		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
- # ifdef __UCLIBC_HAS_THREADS_NATIVE__
- 	else {
- 		int oldtype = LIBC_CANCEL_ASYNC ();
--		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
-+		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
- 		LIBC_CANCEL_RESET (oldtype);
- 		return result;
- 	}
diff --git a/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch b/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
deleted file mode 100644
index 55c312e..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313304agb;
-        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
-Received: by 10.227.155.75 with SMTP id r11mr17188266wbw.3.1294533918432;
-        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id k3si33753340wbx.29.2011.01.08.16.45.17;
-        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClHDf; Sun, 09 Jan 2011 01:45:17 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 5/7] ARM: #include <bits/arm_asm.h> where __USE_BX__ is used
-Date: Sun,  9 Jan 2011 01:45:08 +0100
-Message-Id: <1294533910-19305-6-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-The check for __USE_BX__ will be available in bits/arm_asm.h,
-so the latter must be included wherever the former is used.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- ldso/ldso/arm/dl-startup.h      |    1 +
- libc/sysdeps/linux/arm/sysdep.h |    1 +
- 2 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
-index a95389d..2dfdaff 100644
---- a/ldso/ldso/arm/dl-startup.h
-+++ b/ldso/ldso/arm/dl-startup.h
-@@ -7,6 +7,7 @@
-  */
- 
- #include <features.h>
-+#include <bits/arm_asm.h>
- 
- #if !defined(__thumb__)
- __asm__(
-diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
-index 013f88c..e498695 100644
---- a/libc/sysdeps/linux/arm/sysdep.h
-+++ b/libc/sysdeps/linux/arm/sysdep.h
-@@ -21,6 +21,7 @@
- #define _LINUX_ARM_SYSDEP_H 1
- 
- #include <common/sysdep.h>
-+#include <bits/arm_asm.h>
- 
- #include <sys/syscall.h>
- /* For Linux we can use the system call table in the header file
--- 
-1.7.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
index 631951e..b22be8c 100644
--- a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
@@ -3,11 +3,11 @@ http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
 
 Upstream-Status: Pending
 
-diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
-index 505247e..2b2d429 100644
---- a/ldso/ldso/dl-elf.c
-+++ b/ldso/ldso/dl-elf.c
-@@ -133,53 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
+Index: git/ldso/ldso/dl-elf.c
+===================================================================
+--- git.orig/ldso/ldso/dl-elf.c	2011-07-01 15:20:51.000000000 -0700
++++ git/ldso/ldso/dl-elf.c	2011-07-01 15:21:47.493578777 -0700
+@@ -133,53 +133,60 @@
   * in uClibc/ldso/util/ldd.c */
  static struct elf_resolve *
  search_for_named_library(const char *name, int secure, const char *path_list,
@@ -99,7 +99,7 @@ index 505247e..2b2d429 100644
  	return NULL;
  }
  
-@@ -231,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -231,7 +238,8 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
@@ -109,7 +109,7 @@ index 505247e..2b2d429 100644
  			return tpnt1;
  	}
  #endif
-@@ -239,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -239,7 +247,7 @@
  	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
  	if (_dl_library_path) {
  		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
@@ -118,7 +118,7 @@ index 505247e..2b2d429 100644
  		{
  			return tpnt1;
  		}
-@@ -253,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -253,7 +261,7 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
@@ -127,7 +127,7 @@ index 505247e..2b2d429 100644
  			return tpnt1;
  	}
  #endif
-@@ -287,7 +295,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -287,7 +295,7 @@
  	/* Look for libraries wherever the shared library loader
  	 * was installed */
  	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
@@ -136,7 +136,7 @@ index 505247e..2b2d429 100644
  	if (tpnt1 != NULL)
  		return tpnt1;
  
-@@ -300,7 +308,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -300,7 +308,7 @@
  #ifndef __LDSO_CACHE_SUPPORT__
  					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
  #endif
@@ -145,12 +145,12 @@ index 505247e..2b2d429 100644
  	if (tpnt1 != NULL)
  		return tpnt1;
  
-diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index 7ee9257..9423670 100644
---- a/ldso/ldso/ldso.c
-+++ b/ldso/ldso/ldso.c
-@@ -272,6 +272,20 @@ static void __attribute__ ((destructor)) __attribute_used__ _dl_fini(void)
- 	}
+Index: git/ldso/ldso/ldso.c
+===================================================================
+--- git.orig/ldso/ldso/ldso.c	2011-07-01 15:20:51.000000000 -0700
++++ git/ldso/ldso/ldso.c	2011-07-01 15:24:32.363820591 -0700
+@@ -370,6 +370,20 @@
+ 	return p - list;
  }
  
 +static void _dl_setup_progname(const char *argv0)
@@ -167,10 +167,10 @@ index 7ee9257..9423670 100644
 +	}
 +}
 +
- void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
- 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,
- 			  char **argv
-@@ -321,9 +335,7 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
+ 			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
+@@ -421,9 +435,7 @@
  	 * been fixed up by now.  Still no function calls outside of this
  	 * library, since the dynamic resolver is not yet ready.
  	 */
@@ -179,5 +179,5 @@ index 7ee9257..9423670 100644
 -	}
 +	_dl_setup_progname(argv[0]);
  
+ #ifndef __LDSO_STANDALONE_SUPPORT__
  	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
- 		_dl_dprintf(_dl_debug_file, "Standalone execution is not supported yet\n");
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch b/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
deleted file mode 100644
index 8f3464e..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313309agb;
-        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
-Received: by 10.216.173.7 with SMTP id u7mr612034wel.50.1294533919433;
-        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id e10si33752027wer.68.2011.01.08.16.45.19;
-        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClJDu; Sun, 09 Jan 2011 01:45:18 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 7/7] ARM: remove EABI/OABI selection
-Date: Sun,  9 Jan 2011 01:45:10 +0100
-Message-Id: <1294533910-19305-8-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-Rely on the compiler to be properly setup for the default ABI.
-
-When installing-headers, there are two cases:
-- NPTL: no issue, a cross-compiler is already expected
-- LinuxThreads: no issue, EABI/OABI has no impact on installed headers.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- extra/Configs/Config.arm               |   11 -----------
- libc/sysdeps/linux/arm/Makefile.arch   |    9 +++++++--
- libc/sysdeps/linux/arm/bits/huge_val.h |    4 ++--
- 3 files changed, 9 insertions(+), 15 deletions(-)
-
-Index: git/libc/sysdeps/linux/arm/Makefile.arch
-===================================================================
---- git.orig/libc/sysdeps/linux/arm/Makefile.arch
-+++ git/libc/sysdeps/linux/arm/Makefile.arch
-@@ -24,7 +24,12 @@ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
- CSRC += posix_fadvise.c posix_fadvise64.c
- endif
- 
--ifeq ($(CONFIG_ARM_EABI),y)
-+# Is our compiler set up for EABI ?
-+IS_EABI:=$(shell $(CC) $(CFLAGS) -x c - -E -dM </dev/null 2>/dev/null \
-+                 |sed -r -e '/^\#[[:space:]]*define[[:space:]]+__ARM_EABI__([[:space:]]+1)?$$/!d; s/.+/y/;' \
-+          )
-+
-+ifeq ($(IS_EABI),y)
- CSRC += aeabi_assert.c aeabi_atexit.c aeabi_errno_addr.c \
- 	aeabi_localeconv.c aeabi_memclr.c aeabi_memcpy.c \
- 	aeabi_memmove.c aeabi_memset.c find_exidx.c
-@@ -37,7 +42,7 @@ else
- CSRC += syscall.c
- endif
- 
--ifeq ($(CONFIG_ARM_EABI),y)
-+ifeq ($(IS_EABI),y)
- libc-static-y += $(ARCH_OUT)/aeabi_lcsts.o $(ARCH_OUT)/aeabi_math.o \
- 	$(ARCH_OUT)/aeabi_sighandlers.o
- libc-nonshared-y += $(ARCH_OUT)/aeabi_lcsts.os $(ARCH_OUT)/aeabi_math.os \
-Index: git/libc/sysdeps/linux/arm/bits/huge_val.h
-===================================================================
---- git.orig/libc/sysdeps/linux/arm/bits/huge_val.h
-+++ git/libc/sysdeps/linux/arm/bits/huge_val.h
-@@ -32,7 +32,7 @@
- # define HUGE_VAL (__extension__ 0x1.0p2047)
- #elif defined __GNUC__
- 
--#ifndef __CONFIG_ARM_EABI__
-+#ifndef __ARM_EABI__
- # define HUGE_VAL \
-   (__extension__							      \
-    ((union { unsigned __l __attribute__((__mode__(__DI__))); double __d; })   \
-@@ -50,7 +50,7 @@
- 
- typedef union { unsigned char __c[8]; double __d; } __huge_val_t;
- 
--#ifndef __CONFIG_ARM_EABI__
-+#ifndef __ARM_EABI__
- # if __BYTE_ORDER == __BIG_ENDIAN
- #  define __HUGE_VAL_bytes	{ 0, 0, 0, 0, 0x7f, 0xf0, 0, 0 }
- # endif
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch b/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
deleted file mode 100644
index 920a669..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313303agb;
-        Sat, 8 Jan 2011 16:45:18 -0800 (PST)
-Received: by 10.227.98.158 with SMTP id q30mr1255804wbn.151.1294533917314;
-        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id r3si33749838wbr.54.2011.01.08.16.45.16;
-        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClGDS; Sun, 09 Jan 2011 01:45:16 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 3/7] ARM: remove sub-arch/variants selection from menuconfig
-Date: Sun,  9 Jan 2011 01:45:06 +0100
-Message-Id: <1294533910-19305-4-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-Rely on the compiler to be correctly set up to generate
-appropriate code for the target variant.
-
-This exposes the Thumb option, as it is no longer auto-selected.
-The "Use BX" no longer depends on supported CPU to be selected,
-so it now defaults to 'n' as it shall work by default on CPUs
-that do not have BX.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- Rules.mak                |   19 -------
- extra/Configs/Config.arm |  125 ++--------------------------------------------
- 2 files changed, 5 insertions(+), 139 deletions(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index 2a16908..09741a6 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -332,25 +332,6 @@ ifeq ($(TARGET_ARCH),arm)
- 	OPTIMIZATION+=-fstrict-aliasing
- 	CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=-mlittle-endian
- 	CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=-mbig-endian
--	CPU_CFLAGS-$(CONFIG_GENERIC_ARM)+=
--	CPU_CFLAGS-$(CONFIG_ARM610)+=-mtune=arm610 -march=armv3
--	CPU_CFLAGS-$(CONFIG_ARM710)+=-mtune=arm710 -march=armv3
--	CPU_CFLAGS-$(CONFIG_ARM7TDMI)+=-mtune=arm7tdmi -march=armv4t
--	CPU_CFLAGS-$(CONFIG_ARM720T)+=-mtune=arm7tdmi -march=armv4t
--	CPU_CFLAGS-$(CONFIG_ARM920T)+=-mtune=arm9tdmi -march=armv4t
--	CPU_CFLAGS-$(CONFIG_ARM922T)+=-mtune=arm9tdmi -march=armv4t
--	CPU_CFLAGS-$(CONFIG_ARM926T)+=-mtune=arm9e -march=armv5te
--	CPU_CFLAGS-$(CONFIG_ARM10T)+=-mtune=arm10tdmi -march=armv5t
--	CPU_CFLAGS-$(CONFIG_ARM1136JF_S)+=-mtune=arm1136jf-s -march=armv6
--	CPU_CFLAGS-$(CONFIG_ARM1176JZ_S)+=-mtune=arm1176jz-s -march=armv6
--	CPU_CFLAGS-$(CONFIG_ARM1176JZF_S)+=-mtune=arm1176jzf-s -march=armv6
--	CPU_CFLAGS-$(CONFIG_ARM_SA110)+=-mtune=strongarm110 -march=armv4
--	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
--	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
--	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
--	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
--	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
--	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
- 	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
- endif
- 
-diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
-index c9c40d4..6c75a00 100644
---- a/extra/Configs/Config.arm
-+++ b/extra/Configs/Config.arm
-@@ -30,129 +30,14 @@ config CONFIG_ARM_EABI
- 
- endchoice
- 
--choice
--	prompt "Target Processor Type"
--	default CONFIG_GENERIC_ARM
--	help
--	  This is the processor type of your CPU. This information is used for
--	  optimizing purposes.  To build a library that will run on all ARMCPU
--	  types (albeit not optimally fast), you can specify "Generic Arm" here.
--	  If you pick anything other than "Generic Arm", there is no guarantee 
--	  that uClibc will even run on anything other than the selected
--	  processor type.
--
--	  Here are the settings recommended for greatest speed:
--	  - "Generic Arm" select this if your compiler is already setup to
--	    optimize things properly, or if you want to run on pretty much
--	    everything, or you just don't much care.
--	  - For anything else, pick the ARM core type that best matches the
--	    cpu you will be using on your device.
--
--	  If you don't know what to do, choose "Generic Arm".
--
--config CONFIG_GENERIC_ARM
--	bool "Generic Arm"
--
--config CONFIG_ARM610
--	bool "Arm 610"
--	select ARCH_HAS_MMU
--
--config CONFIG_ARM710
--	bool "Arm 710"
--	select ARCH_HAS_MMU
--
--config CONFIG_ARM7TDMI
--	bool "Arm 7TDMI"
--	select ARCH_HAS_NO_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM720T
--	bool "Arm 720T"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM920T
--	bool "Arm 920T"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM922T
--	bool "Arm 922T"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM926T
--	bool "Arm 926T"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM10T
--	bool "Arm 10T"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM1136JF_S
--	bool "Arm 1136JF-S"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM1176JZ_S
--	bool "Arm 1176JZ-S"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM1176JZF_S
--	bool "Arm 1176JZF-S"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM_CORTEX_M3
--	bool "Arm Cortex-M3"
--	select ARCH_HAS_NO_MMU
--	select FORCE_THUMB
--
--config CONFIG_ARM_CORTEX_M1
--	bool "Arm Cortex-M1"
--	select ARCH_HAS_NO_MMU
--	select FORCE_THUMB
--
--config CONFIG_ARM_SA110
--	bool "Intel StrongArm SA-110"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM_SA1100
--	bool "Intel StrongArm SA-1100"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM_XSCALE
--	bool "Intel Xscale"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--config CONFIG_ARM_IWMMXT
--	bool "Intel Xscale With WMMX PXA27x"
--	select ARCH_HAS_MMU
--	select HAS_THUMB
--
--endchoice
--
--config HAS_THUMB
--	bool
--
--config FORCE_THUMB
--	bool
--	select HAS_THUMB
--	select COMPILE_IN_THUMB_MODE
--	select USE_BX
--
- config COMPILE_IN_THUMB_MODE
--	bool
-+	bool "Build using Thumb mode"
-+	select USE_BX
-+	help
-+	  Say 'y' here to force building uClibc in thumb mode.
-+	  Say 'n' to use your compiler's default mode.
- 
- config USE_BX
- 	bool "Use BX in function return"
--	default y
--	depends on HAS_THUMB
- 	help
- 	  Use BX instruction for THUMB aware architectures.
--- 
-1.7.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch b/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
deleted file mode 100644
index d780b4c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313299agb;
-        Sat, 8 Jan 2011 16:45:16 -0800 (PST)
-Received: by 10.227.134.5 with SMTP id h5mr1312651wbt.75.1294533915992;
-        Sat, 08 Jan 2011 16:45:15 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id m42si33753731wej.65.2011.01.08.16.45.15;
-        Sat, 08 Jan 2011 16:45:15 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClEDA; Sun, 09 Jan 2011 01:45:15 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 1/7] ARM: reorder "Use BX" option
-Date: Sun,  9 Jan 2011 01:45:04 +0100
-Message-Id: <1294533910-19305-2-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-"Use BX" is not available on all CPUs, so the option depends on
-a correct CPU to be chosen . It is weird that e BX" then appears
-_above_ the CPU selection, not below.
-
-Move the "Use BX" after the CPU selection.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- extra/Configs/Config.arm |   14 +++++++-------
- 1 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
-index b060ace..3b90e67 100644
---- a/extra/Configs/Config.arm
-+++ b/extra/Configs/Config.arm
-@@ -30,13 +30,6 @@ config CONFIG_ARM_EABI
- 
- endchoice
- 
--config USE_BX
--	bool "Use BX in function return"
--	default y
--	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
--	help
--	  Use BX instruction for THUMB aware architectures.
--
- choice
- 	prompt "Target Processor Type"
- 	default CONFIG_GENERIC_ARM
-@@ -131,3 +124,10 @@ config CONFIG_ARM_IWMMXT
- 	select ARCH_HAS_MMU
- 
- endchoice
-+
-+config USE_BX
-+	bool "Use BX in function return"
-+	default y
-+	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
-+	help
-+	  Use BX instruction for THUMB aware architectures.
--- 
-1.7.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch b/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
index 30cb7f6..36fec65 100644
--- a/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
@@ -3,11 +3,11 @@ http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html
 
 Upstream-Status: Pending
 
-diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h
-index 7fbb373..7102351 100644
---- a/ldso/include/dl-elf.h
-+++ b/ldso/include/dl-elf.h
-@@ -25,16 +25,18 @@ static __inline__ void _dl_map_cache(void) { }
+Index: git/ldso/include/dl-elf.h
+===================================================================
+--- git.orig/ldso/include/dl-elf.h	2011-07-01 15:20:51.000000000 -0700
++++ git/ldso/include/dl-elf.h	2011-07-01 15:30:43.274364603 -0700
+@@ -26,16 +26,18 @@
  static __inline__ void _dl_unmap_cache(void) { }
  #endif
  
@@ -18,21 +18,21 @@ index 7fbb373..7102351 100644
  extern void _dl_parse_lazy_relocation_information(struct dyn_elf *rpnt,
  	unsigned long rel_addr, unsigned long rel_size);
  extern int _dl_parse_relocation_information(struct dyn_elf *rpnt,
- 	unsigned long rel_addr, unsigned long rel_size);
+ 	struct r_scope_elem *scope, unsigned long rel_addr, unsigned long rel_size);
 -extern struct elf_resolve * _dl_load_shared_library(int secure,
 +extern struct elf_resolve * _dl_load_shared_library(int resolve_flags,
  	struct dyn_elf **rpnt, struct elf_resolve *tpnt, char *full_libname,
  	int trace_loaded_objects);
 -extern struct elf_resolve * _dl_load_elf_shared_library(int secure,
 +extern struct elf_resolve * _dl_load_elf_shared_library(int resolve_flags,
- 	struct dyn_elf **rpnt, char *libname);
+ 	struct dyn_elf **rpnt, const char *libname);
  extern struct elf_resolve *_dl_check_if_named_library_is_loaded(const char *full_libname,
  	int trace_loaded_objects);
-diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
-index 2b2d429..6d35bf2 100644
---- a/ldso/ldso/dl-elf.c
-+++ b/ldso/ldso/dl-elf.c
-@@ -132,7 +132,7 @@ _dl_protect_relro (struct elf_resolve *l)
+Index: git/ldso/ldso/dl-elf.c
+===================================================================
+--- git.orig/ldso/ldso/dl-elf.c	2011-07-01 15:21:47.000000000 -0700
++++ git/ldso/ldso/dl-elf.c	2011-07-01 15:31:29.814432859 -0700
+@@ -132,7 +132,7 @@
  /* This function's behavior must exactly match that
   * in uClibc/ldso/util/ldd.c */
  static struct elf_resolve *
@@ -41,7 +41,7 @@ index 2b2d429..6d35bf2 100644
  	struct dyn_elf **rpnt, const char *origin)
  {
  	char *mylibname;
-@@ -162,7 +162,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+@@ -162,7 +162,7 @@
  
  		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
  			int olen;
@@ -50,7 +50,7 @@ index 2b2d429..6d35bf2 100644
  				continue;
  			if (origin == NULL)
  				continue;
-@@ -182,7 +182,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+@@ -182,7 +182,7 @@
  		_dl_strcat(mylibname, "/");
  		_dl_strcat(mylibname, name);
  
@@ -59,7 +59,7 @@ index 2b2d429..6d35bf2 100644
  		if (tpnt != NULL)
  			return tpnt;
  	}
-@@ -194,7 +194,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+@@ -194,7 +194,7 @@
  unsigned long _dl_error_number;
  unsigned long _dl_internal_error_number;
  
@@ -68,7 +68,7 @@ index 2b2d429..6d35bf2 100644
  	struct elf_resolve *tpnt, char *full_libname, int attribute_unused trace_loaded_objects)
  {
  	char *pnt;
-@@ -223,7 +223,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -223,7 +223,7 @@
  
  	if (libname != full_libname) {
  		_dl_if_debug_dprint("\ttrying file='%s'\n", full_libname);
@@ -77,7 +77,7 @@ index 2b2d429..6d35bf2 100644
  		if (tpnt1) {
  			return tpnt1;
  		}
-@@ -238,7 +238,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -238,7 +238,7 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
@@ -86,7 +86,7 @@ index 2b2d429..6d35bf2 100644
  						      tpnt->libname)) != NULL)
  			return tpnt1;
  	}
-@@ -247,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -247,7 +247,7 @@
  	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
  	if (_dl_library_path) {
  		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
@@ -95,7 +95,7 @@ index 2b2d429..6d35bf2 100644
  		{
  			return tpnt1;
  		}
-@@ -261,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -261,7 +261,7 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
@@ -104,7 +104,7 @@ index 2b2d429..6d35bf2 100644
  			return tpnt1;
  	}
  #endif
-@@ -284,7 +284,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -284,7 +284,7 @@
  			     || libent[i].flags == LIB_ELF_LIBC0
  			     ||	libent[i].flags == LIB_ELF_LIBC5)
  			 && _dl_strcmp(libname, strs + libent[i].sooffset) == 0
@@ -113,7 +113,7 @@ index 2b2d429..6d35bf2 100644
  			) {
  				return tpnt1;
  			}
-@@ -295,14 +295,14 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+@@ -295,14 +295,14 @@
  	/* Look for libraries wherever the shared library loader
  	 * was installed */
  	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
@@ -130,16 +130,16 @@ index 2b2d429..6d35bf2 100644
  					UCLIBC_RUNTIME_PREFIX "lib:"
  					UCLIBC_RUNTIME_PREFIX "usr/lib"
  #ifndef __LDSO_CACHE_SUPPORT__
-@@ -329,7 +329,7 @@ goof:
+@@ -444,7 +444,7 @@
   * are required.
   */
  
 -struct elf_resolve *_dl_load_elf_shared_library(int secure,
 +struct elf_resolve *_dl_load_elf_shared_library(int resolve_flags,
- 	struct dyn_elf **rpnt, char *libname)
+ 	struct dyn_elf **rpnt, const char *libname)
  {
  	ElfW(Ehdr) *epnt;
-@@ -368,7 +368,7 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
+@@ -483,7 +483,7 @@
  	}
  	/* If we are in secure mode (i.e. a setu/gid binary using LD_PRELOAD),
  	   we don't load the library if it isn't setuid. */
@@ -148,7 +148,7 @@ index 2b2d429..6d35bf2 100644
  		if (!(st.st_mode & S_ISUID)) {
  			_dl_close(infile);
  			return NULL;
-@@ -384,6 +384,10 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
+@@ -499,6 +499,10 @@
  			return tpnt;
  		}
  	}
@@ -159,11 +159,11 @@ index 2b2d429..6d35bf2 100644
  	header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ | PROT_WRITE,
  			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
  	if (_dl_mmap_check_error(header)) {
-diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index 9423670..b71af34 100644
---- a/ldso/ldso/ldso.c
-+++ b/ldso/ldso/ldso.c
-@@ -646,7 +646,9 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+Index: git/ldso/ldso/ldso.c
+===================================================================
+--- git.orig/ldso/ldso/ldso.c	2011-07-01 15:24:32.000000000 -0700
++++ git/ldso/ldso/ldso.c	2011-07-01 15:24:55.143854007 -0700
+@@ -854,7 +854,9 @@
  			if (!_dl_secure || _dl_strchr(str, '/') == NULL) {
  				_dl_if_debug_dprint("\tfile='%s';  needed by '%s'\n", str, _dl_progname);
  
@@ -173,12 +173,12 @@ index 9423670..b71af34 100644
 +					&rpnt, NULL, str, trace_loaded_objects);
  				if (!tpnt1) {
  #ifdef __LDSO_LDD_SUPPORT__
- 					if (trace_loaded_objects)
-diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
-index 68cd579..edf38d2 100644
---- a/ldso/libdl/libdl.c
-+++ b/ldso/libdl/libdl.c
-@@ -288,7 +288,7 @@ void *dlopen(const char *libname, int flag)
+ 					if (trace_loaded_objects || _dl_trace_prelink)
+Index: git/ldso/libdl/libdl.c
+===================================================================
+--- git.orig/ldso/libdl/libdl.c	2011-07-01 15:20:51.000000000 -0700
++++ git/ldso/libdl/libdl.c	2011-07-01 15:24:55.143854007 -0700
+@@ -305,7 +305,7 @@
  #endif
  
  	/* A bit of sanity checking... */
@@ -187,7 +187,7 @@ index 68cd579..edf38d2 100644
  		_dl_error_number = LD_BAD_HANDLE;
  		return NULL;
  	}
-@@ -358,8 +358,9 @@ void *dlopen(const char *libname, int flag)
+@@ -375,8 +375,9 @@
  	/* Try to load the specified library */
  	_dl_if_debug_print("Trying to dlopen '%s', RTLD_GLOBAL:%d RTLD_NOW:%d\n",
  			(char*)libname, (flag & RTLD_GLOBAL ? 1:0), (now_flag & RTLD_NOW ? 1:0));
@@ -198,10 +198,10 @@ index 68cd579..edf38d2 100644
  	if (tpnt == NULL) {
  		_dl_unmap_cache();
  		return NULL;
-diff --git a/libc/sysdeps/linux/common/bits/dlfcn.h b/libc/sysdeps/linux/common/bits/dlfcn.h
-index 4bfbbff..47b42ad 100644
---- a/libc/sysdeps/linux/common/bits/dlfcn.h
-+++ b/libc/sysdeps/linux/common/bits/dlfcn.h
+Index: git/libc/sysdeps/linux/common/bits/dlfcn.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/bits/dlfcn.h	2011-07-01 15:20:52.000000000 -0700
++++ git/libc/sysdeps/linux/common/bits/dlfcn.h	2011-07-01 15:24:55.143854007 -0700
 @@ -24,9 +24,9 @@
  /* The MODE argument to `dlopen' contains one of the following: */
  #define RTLD_LAZY	0x00001	/* Lazy function call binding.  */
@@ -213,3 +213,4 @@ index 4bfbbff..47b42ad 100644
 +#if 0 /* uClibc doesnt support these */
  #define RTLD_DEEPBIND	0x00008	/* Use deep binding.  */
  #endif
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch b/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
deleted file mode 100644
index b19408f..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313301agb;
-        Sat, 8 Jan 2011 16:45:17 -0800 (PST)
-Received: by 10.216.186.82 with SMTP id v60mr20017574wem.56.1294533916559;
-        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id o13si33755824wee.56.2011.01.08.16.45.16;
-        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClFDL; Sun, 09 Jan 2011 01:45:16 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 2/7] ARM: introduce blind options to select & force THUMB mode
-Date: Sun,  9 Jan 2011 01:45:05 +0100
-Message-Id: <1294533910-19305-3-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-Add three new blind options to set use of Thumb mode:
-- COMPILE_IN_THUMB_MODE
-  - if set, CFLAGS will contain -mthumb
-  - if unset, the compiler's default is used
-- HAS_THUMB
-  - CPUS with Thumb instruction set can select this
-  - use of BX depends on this
-- FORCE_THUMB
-  - CPUs that are Thumb-only must select this
-  - this selects: HAS_THUMB, COMPILE_IN_THUMB_MODE and USE_BX
-
-Also, remove leading space in Rules.mak.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- Rules.mak                |    7 ++++---
- extra/Configs/Config.arm |   31 ++++++++++++++++++++++++++++---
- 2 files changed, 32 insertions(+), 6 deletions(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index eecdc64..2a16908 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -348,9 +348,10 @@ ifeq ($(TARGET_ARCH),arm)
- 	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
- 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
- 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
-- 	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
-- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3 -mthumb
-- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1 -mthumb
-+	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
-+	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
-+	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
-+	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
- endif
- 
- ifeq ($(TARGET_ARCH),mips)
-diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
-index 3b90e67..c9c40d4 100644
---- a/extra/Configs/Config.arm
-+++ b/extra/Configs/Config.arm
-@@ -64,70 +64,95 @@ config CONFIG_ARM710
- config CONFIG_ARM7TDMI
- 	bool "Arm 7TDMI"
- 	select ARCH_HAS_NO_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM720T
- 	bool "Arm 720T"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM920T
- 	bool "Arm 920T"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM922T
- 	bool "Arm 922T"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM926T
- 	bool "Arm 926T"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM10T
- 	bool "Arm 10T"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM1136JF_S
- 	bool "Arm 1136JF-S"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM1176JZ_S
- 	bool "Arm 1176JZ-S"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM1176JZF_S
- 	bool "Arm 1176JZF-S"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM_CORTEX_M3
- 	bool "Arm Cortex-M3"
- 	select ARCH_HAS_NO_MMU
--	select USE_BX
-+	select FORCE_THUMB
- 
- config CONFIG_ARM_CORTEX_M1
- 	bool "Arm Cortex-M1"
- 	select ARCH_HAS_NO_MMU
--	select USE_BX
-+	select FORCE_THUMB
- 
- config CONFIG_ARM_SA110
- 	bool "Intel StrongArm SA-110"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM_SA1100
- 	bool "Intel StrongArm SA-1100"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM_XSCALE
- 	bool "Intel Xscale"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- config CONFIG_ARM_IWMMXT
- 	bool "Intel Xscale With WMMX PXA27x"
- 	select ARCH_HAS_MMU
-+	select HAS_THUMB
- 
- endchoice
- 
-+config HAS_THUMB
-+	bool
-+
-+config FORCE_THUMB
-+	bool
-+	select HAS_THUMB
-+	select COMPILE_IN_THUMB_MODE
-+	select USE_BX
-+
-+config COMPILE_IN_THUMB_MODE
-+	bool
-+
- config USE_BX
- 	bool "Use BX in function return"
- 	default y
--	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
-+	depends on HAS_THUMB
- 	help
- 	  Use BX instruction for THUMB aware architectures.
--- 
-1.7.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch b/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
deleted file mode 100644
index 82970ca..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.90.86.4 with SMTP id j4cs313305agb;
-        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
-Received: by 10.216.153.210 with SMTP id f60mr573848wek.114.1294533918335;
-        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
-Return-Path: <yann.morin.1998@anciens.enib.fr>
-Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
-        by mx.google.com with ESMTP id n4si33737071wej.152.2011.01.08.16.45.17;
-        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
-Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
-Received: from roazhon.bzh.lan ([90.32.245.227])
-	by mwinf5d24 with ME
-	id tClC1f0024v5z3u03ClGDX; Sun, 09 Jan 2011 01:45:17 +0100
-From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-To: uclibc@uclibc.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
-	Carmelo AMOROSO <carmelo.amoroso@st.com>
-Subject: [PATCH 4/7] ARM: transform the EABI/OABI choice into a boolean
-Date: Sun,  9 Jan 2011 01:45:07 +0100
-Message-Id: <1294533910-19305-5-git-send-email-yann.morin.1998@anciens.enib.fr>
-X-Mailer: git-send-email 1.7.1
-In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
-
-The CONFIG_ARM_OABI option is never used.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
----
- extra/Configs/Config.arm |   23 ++++++++---------------
- 1 files changed, 8 insertions(+), 15 deletions(-)
-
-Index: git/extra/Configs/Config.arm
-===================================================================
---- git.orig/extra/Configs/Config.arm
-+++ git/extra/Configs/Config.arm
-@@ -12,23 +12,16 @@ config FORCE_OPTIONS_FOR_ARCH
- 	default y
- 	select ARCH_ANY_ENDIAN
- 
--choice
--	prompt "Target ABI"
--	default CONFIG_ARM_EABI
-+config CONFIG_ARM_EABI
-+	bool "Build for EABI"
- 	help
--	  If you choose "EABI" here, functions and constants required by the
--	  ARM EABI will be built into the library.  You should choose "EABI"
-+	  If you say 'y' here, functions and constants required by the
-+	  ARM EABI will be built into the library.  You should say 'y'
- 	  if your compiler uses the ARM EABI, in which case you will also
--	  need a kernel supporting the EABI system call interface, or "OABI"
--	  for a compiler using the old Linux ABI.
--
--config CONFIG_ARM_OABI
--	bool "OABI"
--
--config CONFIG_ARM_EABI
--	bool "EABI"
-+	  need a kernel supporting the EABI system call interface.
- 
--endchoice
-+	  If you say 'n' here, then the library will be built for the
-+	  old Linux ABI.
- 
- config COMPILE_IN_THUMB_MODE
- 	bool "Build using Thumb mode"
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 0e43f9e..7d50997 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,8 +1,12 @@
-SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
+SRCREV="f87898ca4a7d4b7171779c06ff1f4848efeee431"
 
 require uclibc.inc
-PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.5"
+
+# We prefer a release version so DP -1 for this
+DEFAULT_PREFERENCE = "-1"
+
+PV = "0.9.32+gitr${SRCPV}"
+PR = "${INC_PR}.0"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
@@ -13,23 +17,12 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://uclibc-arm-ftruncate64.patch \
 	file://uclibc_enable_log2_test.patch \
 	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
-	file://reorder-use-BX.patch \
-	file://select-force-thumb.patch \
-	file://remove-sub-arch-variants.patch \
-	file://transform-eabi-oabi-choice.patch \
-	file://include-arm-asm.h.patch \
-	file://detect-bx-availibility.patch \
-	file://remove-eabi-oabi-selection.patch \
 	file://powerpc_copysignl.patch \
 	file://argp-support.patch \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
-	file://append_UCLIBC_EXTRA_CFLAGS.patch \
 	file://compile-arm-fork-with-O2.patch \
-	file://epoll-asm-fix.patch \
 	file://orign_path.patch \
 	file://rtld_no.patch \
-	file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch \
-	file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1




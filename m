Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuqQo-0006Un-6x
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 20:10:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2012 11:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="107429013"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2012 11:02:17 -0800
Message-ID: <4F317539.3030306@linux.intel.com>
Date: Tue, 07 Feb 2012 11:02:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c30ac7c104a3e52864b2bb11c7797dfceaabc76f.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <c30ac7c104a3e52864b2bb11c7797dfceaabc76f.1328510188.git.raj.khem@gmail.com>
Subject: Re: [PATCH 11/20] uclibc: Upgrade recipes from 0.9.32 -> 0.9.33
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
X-List-Received-Date: Tue, 07 Feb 2012 19:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2012 10:40 PM, Khem Raj wrote:
> Prefer 0.9.33 by default
> Delete recipes for 0.9.32
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>   ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 --
>   ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 --
>   .../uclibc-0.9.32/detect-bx-availibility.patch     |   75 ----
>   .../uclibc/uclibc-0.9.32/epoll-asm-fix.patch       |   25 --
>   .../uclibc/uclibc-0.9.32/include-arm-asm.h.patch   |   65 ---
>   .../uclibc/uclibc-0.9.32/mount.h-update.patch      |   85 ----
>   .../uclibc-0.9.32/remove-eabi-oabi-selection.patch |   91 ----
>   .../uclibc-0.9.32/remove-sub-arch-variants.patch   |  215 ---------
>   .../uclibc/uclibc-0.9.32/rtld_no.patch             |  215 ---------
>   .../uclibc/uclibc-0.9.32/select-force-thumb.patch  |  172 --------
>   .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   47 --
>   .../uclibc-0.9.32/transform-eabi-oabi-choice.patch |   71 ---
>   .../uclibc-0.9.32/uclibc-arm-ftruncate64.patch     |   13 -
>   .../uclibc-0.9.32/uclibc_scheduler_update.patch    |  455 --------------------
>   ...rr-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch |   32 ++
>   ...fstat-Use-64bit-version-of-syscall-if-ava.patch |  177 ++++++++
>   .../argp-headers.patch                             |    2 +
>   .../argp-support.patch                             |    3 +
>   .../compile-arm-fork-with-O2.patch                 |    2 +-
>   .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 ++
>   meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 ++
>   ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
>   .../libc_symbols_include_bits_uclibc_config.patch  |   19 +
>   .../mips/uClibc.machine                            |    0
>   .../orign_path.patch                               |   94 ++--
>   .../powerpc_copysignl.patch                        |    6 +
>   .../remove_attribute_optimize_Os.patch             |   17 +-
>   .../{uclibc-0.9.32 =>  uclibc-0.9.33}/uClibc.distro |    8 +-
>   .../uClibc.machine                                 |    0
>   .../uclibc-execvpe.patch                           |    3 +
>   .../uclibc_enable_log2_test.patch                  |    5 +
>   ...-initial_0.9.32.bb =>  uclibc-initial_0.9.33.bb} |    0
>   .../uclibc/{uclibc_0.9.32.bb =>  uclibc_0.9.33.bb}  |   26 +-
>   34 files changed, 386 insertions(+), 1669 deletions(-)
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch

Missing Upstream-Status in this patch

>rename meta/recipes-core/uclibc/{uclibc-0.9.32 => 
uclibc-0.9.33}/argp-headers.patch (99%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/argp-support.patch (99%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/compile-arm-fork-with-O2.patch (97%)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (86%)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch

Also missing Upstream-Status.


>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/mips/uClibc.machine (100%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/orign_path.patch (64%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/powerpc_copysignl.patch (96%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/remove_attribute_optimize_Os.patch (93%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/uClibc.distro (96%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/uClibc.machine (100%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/uclibc-execvpe.patch (99%)
>   rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>  uclibc-0.9.33}/uclibc_enable_log2_test.patch (81%)
>   rename meta/recipes-core/uclibc/{uclibc-initial_0.9.32.bb =>  uclibc-initial_0.9.33.bb} (100%)
>   rename meta/recipes-core/uclibc/{uclibc_0.9.32.bb =>  uclibc_0.9.33.bb} (45%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 5bb253e..b7c2160 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -20,7 +20,7 @@ GCCVERSION ?= "4.6%"
>   SDKGCCVERSION ?= "4.6%"
>   BINUVERSION ?= "2.22"
>   EGLIBCVERSION ?= "2.13"
> -UCLIBCVERSION ?= "0.9.32"
> +UCLIBCVERSION ?= "0.9.33"
>   LINUXLIBCVERSION ?= "3.1"
>
>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
> deleted file mode 100644
> index da97d38..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 06cdcd2a9dd6b46b7fbb5b3ae0a62bdb7ee6c402 Mon Sep 17 00:00:00 2001
> -From: Khem Raj<raj.khem@gmail.com>
> -Date: Mon, 27 Jun 2011 17:48:18 -0700
> -Subject: [PATCH] Config.in.arch: Free UCLIBC_HAS_FPU setting from depending on UCLIBC_HAS_FLOATS
> -
> -UCLIBC_HAS_FLOATS and UCLIBC_HAS_FPU are denoting two different aspects.
> -UCLIBC_HAS_FLOATS covers the floating point operations which has nothing
> -to do if you have FPU or not.
> -
> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ----
> - extra/Configs/Config.in.arch |    1 -
> - 1 files changed, 0 insertions(+), 1 deletions(-)
> -
> -diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
> -index 5f7a2b0..c1ca390 100644
> ---- a/extra/Configs/Config.in.arch
> -+++ b/extra/Configs/Config.in.arch
> -@@ -133,7 +133,6 @@ config UCLIBC_HAS_FLOATS
> -
> - config UCLIBC_HAS_FPU
> - 	bool "Target CPU has a floating point unit (FPU)"
> --	depends on UCLIBC_HAS_FLOATS
> - 	default y
> - 	help
> - 	  If your target CPU does not have a Floating Point Unit (FPU) or a
> ---
> -1.7.0.4
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
> deleted file mode 100644
> index 6892ceb..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From ecc7d34cbbaf83aae87b091555650ed33e27ed2e Mon Sep 17 00:00:00 2001
> -From: Khem Raj<raj.khem@gmail.com>
> -Date: Thu, 30 Jun 2011 00:32:11 -0700
> -Subject: [PATCH] mips/signalfd.h: SFD_NONBLOCK for mips is 0200 unlike 04000 commonly
> -
> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ----
> - include/sys/signalfd.h |    9 +++++++++
> - 1 files changed, 9 insertions(+), 0 deletions(-)
> -
> -diff --git a/include/sys/signalfd.h b/include/sys/signalfd.h
> -index 8cee17c..f1cb63a 100644
> ---- a/include/sys/signalfd.h
> -+++ b/include/sys/signalfd.h
> -@@ -64,6 +64,15 @@ enum
> - # define SFD_NONBLOCK SFD_NONBLOCK
> -   };
> -
> -+#elif defined __mips__
> -+enum
> -+  {
> -+    SFD_CLOEXEC = 02000000,
> -+# define SFD_CLOEXEC SFD_CLOEXEC
> -+    SFD_NONBLOCK = 0200
> -+# define SFD_NONBLOCK SFD_NONBLOCK
> -+  };
> -+
> - #else
> - enum
> -   {
> ---
> -1.7.0.4
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
> deleted file mode 100644
> index 43d19fc..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313307agb;
> -        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
> -Received: by 10.227.141.78 with SMTP id l14mr16920947wbu.128.1294533919168;
> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id w30si33755908wbd.17.2011.01.08.16.45.18;
> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClHDo; Sun, 09 Jan 2011 01:45:18 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 6/7] ARM: detect BX availibility at build time
> -Date: Sun,  9 Jan 2011 01:45:09 +0100
> -Message-Id:<1294533910-19305-7-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -The "use BX" option is now a suggestion that BX be used if available.
> -Use a macro to detect if BX is available at build time. If so, and
> -the user requested it be used, then use it. Otherwise, error out.
> -
> -Macro courtesy Khem RAJ:
> -  http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.html
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - extra/Configs/Config.arm              |    4 +++-
> - libc/sysdeps/linux/arm/bits/arm_asm.h |    9 ++++++++-
> - 2 files changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
> -index 227b90c..9aa9e56 100644
> ---- a/extra/Configs/Config.arm
> -+++ b/extra/Configs/Config.arm
> -@@ -33,4 +33,6 @@ config COMPILE_IN_THUMB_MODE
> - config USE_BX
> - 	bool "Use BX in function return"
> - 	help
> --	  Use BX instruction for THUMB aware architectures.
> -+	  Say 'y' to use BX to return from functions on your thumb-aware
> -+	  processor. Say 'y' if you need to use interworking. Say 'n' if not.
> -+	  It is safe to say 'y' even if you're not doing interworking.
> -diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
> -index 1d87df6..921c9a3 100644
> ---- a/libc/sysdeps/linux/arm/bits/arm_asm.h
> -+++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
> -@@ -24,5 +24,12 @@
> - #define THUMB1_ONLY 1
> - #endif
> -
> --#endif /* _ARM_ASM_H */
> -+#if defined(__USE_BX__)
> -+# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
> -+      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
> -+     )
> -+#  error Use of BX was requested, but is not available on the target processor.
> -+# endif /* ARCH level */
> -+#endif /* __USE_BX__ */
> -
> -+#endif /* _ARM_ASM_H */
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
> deleted file mode 100644
> index bcd834d..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Fix a compile error due to last argument to syscall() not being memory addressable.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Phil Blundell<philb@gnu.org>
> -
> -diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
> -index 85b0cfd..c034b2c 100644
> ---- a/libc/sysdeps/linux/common/epoll.c
> -+++ b/libc/sysdeps/linux/common/epoll.c
> -@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
> - int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
> - 						int timeout, const sigset_t *set)
> - {
> -+	int nsig = _NSIG / 8;
> - 	if (SINGLE_THREAD_P)
> --		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
> -+		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
> - # ifdef __UCLIBC_HAS_THREADS_NATIVE__
> - 	else {
> - 		int oldtype = LIBC_CANCEL_ASYNC ();
> --		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
> -+		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
> - 		LIBC_CANCEL_RESET (oldtype);
> - 		return result;
> - 	}
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
> deleted file mode 100644
> index 55c312e..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313304agb;
> -        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
> -Received: by 10.227.155.75 with SMTP id r11mr17188266wbw.3.1294533918432;
> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id k3si33753340wbx.29.2011.01.08.16.45.17;
> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClHDf; Sun, 09 Jan 2011 01:45:17 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 5/7] ARM: #include<bits/arm_asm.h>  where __USE_BX__ is used
> -Date: Sun,  9 Jan 2011 01:45:08 +0100
> -Message-Id:<1294533910-19305-6-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -The check for __USE_BX__ will be available in bits/arm_asm.h,
> -so the latter must be included wherever the former is used.
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - ldso/ldso/arm/dl-startup.h      |    1 +
> - libc/sysdeps/linux/arm/sysdep.h |    1 +
> - 2 files changed, 2 insertions(+), 0 deletions(-)
> -
> -diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
> -index a95389d..2dfdaff 100644
> ---- a/ldso/ldso/arm/dl-startup.h
> -+++ b/ldso/ldso/arm/dl-startup.h
> -@@ -7,6 +7,7 @@
> -  */
> -
> - #include<features.h>
> -+#include<bits/arm_asm.h>
> -
> - #if !defined(__thumb__)
> - __asm__(
> -diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
> -index 013f88c..e498695 100644
> ---- a/libc/sysdeps/linux/arm/sysdep.h
> -+++ b/libc/sysdeps/linux/arm/sysdep.h
> -@@ -21,6 +21,7 @@
> - #define _LINUX_ARM_SYSDEP_H 1
> -
> - #include<common/sysdep.h>
> -+#include<bits/arm_asm.h>
> -
> - #include<sys/syscall.h>
> - /* For Linux we can use the system call table in the header file
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
> deleted file mode 100644
> index 3508e0e..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -Sync mount.h from glibc this is needed to get missing defines
> -that some apps e.g. systemd are depending on
> -
> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: git/include/sys/mount.h
> -===================================================================
> ---- git.orig/include/sys/mount.h	2011-07-21 14:37:27.134255747 -0700
> -+++ git/include/sys/mount.h	2011-07-21 14:39:53.844470932 -0700
> -@@ -1,5 +1,5 @@
> - /* Header file for mounting/unmount Linux filesystems.
> --   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation, Inc.
> -+   Copyright (C) 1996-2000, 2004, 2010 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> -
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -47,23 +47,46 @@
> - #define MS_REMOUNT	MS_REMOUNT
> -   MS_MANDLOCK = 64,		/* Allow mandatory locks on an FS.  */
> - #define MS_MANDLOCK	MS_MANDLOCK
> --  S_WRITE = 128,		/* Write on file/directory/symlink.  */
> --#define S_WRITE		S_WRITE
> --  S_APPEND = 256,		/* Append-only file.  */
> --#define S_APPEND	S_APPEND
> --  S_IMMUTABLE = 512,		/* Immutable file.  */
> --#define S_IMMUTABLE	S_IMMUTABLE
> -+  MS_DIRSYNC = 128,		/* Directory modifications are synchronous.  */
> -+#define MS_DIRSYNC	MS_DIRSYNC
> -   MS_NOATIME = 1024,		/* Do not update access times.  */
> - #define MS_NOATIME	MS_NOATIME
> -   MS_NODIRATIME = 2048,		/* Do not update directory access times.  */
> - #define MS_NODIRATIME	MS_NODIRATIME
> -   MS_BIND = 4096,		/* Bind directory at different place.  */
> - #define MS_BIND		MS_BIND
> -+  MS_MOVE = 8192,
> -+#define MS_MOVE		MS_MOVE
> -+  MS_REC = 16384,
> -+#define MS_REC		MS_REC
> -+  MS_SILENT = 32768,
> -+#define MS_SILENT	MS_SILENT
> -+  MS_POSIXACL = 1<<  16,	/* VFS does not apply the umask.  */
> -+#define MS_POSIXACL	MS_POSIXACL
> -+  MS_UNBINDABLE = 1<<  17,	/* Change to unbindable.  */
> -+#define MS_UNBINDABLE	MS_UNBINDABLE
> -+  MS_PRIVATE = 1<<  18,		/* Change to private.  */
> -+#define MS_PRIVATE	MS_PRIVATE
> -+  MS_SLAVE = 1<<  19,		/* Change to slave.  */
> -+#define MS_SLAVE	MS_SLAVE
> -+  MS_SHARED = 1<<  20,		/* Change to shared.  */
> -+#define MS_SHARED	MS_SHARED
> -+  MS_RELATIME = 1<<  21,	/* Update atime relative to mtime/ctime.  */
> -+#define MS_RELATIME	MS_RELATIME
> -+  MS_KERNMOUNT = 1<<  22,	/* This is a kern_mount call.  */
> -+#define MS_KERNMOUNT	MS_KERNMOUNT
> -+  MS_I_VERSION =  1<<  23,	/* Update inode I_version field.  */
> -+#define MS_I_VERSION	MS_I_VERSION
> -+  MS_STRICTATIME = 1<<  24,	/* Always perform atime updates.  */
> -+#define MS_STRICTATIME	MS_STRICTATIME
> -+  MS_ACTIVE = 1<<  30,
> -+#define MS_ACTIVE	MS_ACTIVE
> -+  MS_NOUSER = 1<<  31
> -+#define MS_NOUSER	MS_NOUSER
> - };
> -
> - /* Flags that can be altered by MS_REMOUNT  */
> --#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
> --		     |MS_NODIRATIME)
> -+#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
> -
> -
> - /* Magic mount flag number. Has to be or-ed to the flag values.  */
> -@@ -100,8 +123,10 @@
> - #define MNT_FORCE MNT_FORCE
> -   MNT_DETACH = 2,		/* Just detach from the tree.  */
> - #define MNT_DETACH MNT_DETACH
> --  MNT_EXPIRE = 4		/* Mark for expiry.  */
> -+  MNT_EXPIRE = 4,		/* Mark for expiry.  */
> - #define MNT_EXPIRE MNT_EXPIRE
> -+  UMOUNT_NOFOLLOW = 8		/* Don't follow symlink on umount.  */
> -+#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
> - };
> -
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
> deleted file mode 100644
> index 8f3464e..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313309agb;
> -        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
> -Received: by 10.216.173.7 with SMTP id u7mr612034wel.50.1294533919433;
> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id e10si33752027wer.68.2011.01.08.16.45.19;
> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClJDu; Sun, 09 Jan 2011 01:45:18 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 7/7] ARM: remove EABI/OABI selection
> -Date: Sun,  9 Jan 2011 01:45:10 +0100
> -Message-Id:<1294533910-19305-8-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -Rely on the compiler to be properly setup for the default ABI.
> -
> -When installing-headers, there are two cases:
> -- NPTL: no issue, a cross-compiler is already expected
> -- LinuxThreads: no issue, EABI/OABI has no impact on installed headers.
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - extra/Configs/Config.arm               |   11 -----------
> - libc/sysdeps/linux/arm/Makefile.arch   |    9 +++++++--
> - libc/sysdeps/linux/arm/bits/huge_val.h |    4 ++--
> - 3 files changed, 9 insertions(+), 15 deletions(-)
> -
> -Index: git/libc/sysdeps/linux/arm/Makefile.arch
> -===================================================================
> ---- git.orig/libc/sysdeps/linux/arm/Makefile.arch
> -+++ git/libc/sysdeps/linux/arm/Makefile.arch
> -@@ -24,7 +24,12 @@ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
> - CSRC += posix_fadvise.c posix_fadvise64.c
> - endif
> -
> --ifeq ($(CONFIG_ARM_EABI),y)
> -+# Is our compiler set up for EABI ?
> -+IS_EABI:=$(shell $(CC) $(CFLAGS) -x c - -E -dM</dev/null 2>/dev/null \
> -+                 |sed -r -e '/^\#[[:space:]]*define[[:space:]]+__ARM_EABI__([[:space:]]+1)?$$/!d; s/.+/y/;' \
> -+          )
> -+
> -+ifeq ($(IS_EABI),y)
> - CSRC += aeabi_assert.c aeabi_atexit.c aeabi_errno_addr.c \
> - 	aeabi_localeconv.c aeabi_memclr.c aeabi_memcpy.c \
> - 	aeabi_memmove.c aeabi_memset.c find_exidx.c
> -@@ -37,7 +42,7 @@ else
> - CSRC += syscall.c
> - endif
> -
> --ifeq ($(CONFIG_ARM_EABI),y)
> -+ifeq ($(IS_EABI),y)
> - libc-static-y += $(ARCH_OUT)/aeabi_lcsts.o $(ARCH_OUT)/aeabi_math.o \
> - 	$(ARCH_OUT)/aeabi_sighandlers.o
> - libc-nonshared-y += $(ARCH_OUT)/aeabi_lcsts.os $(ARCH_OUT)/aeabi_math.os \
> -Index: git/libc/sysdeps/linux/arm/bits/huge_val.h
> -===================================================================
> ---- git.orig/libc/sysdeps/linux/arm/bits/huge_val.h
> -+++ git/libc/sysdeps/linux/arm/bits/huge_val.h
> -@@ -32,7 +32,7 @@
> - # define HUGE_VAL (__extension__ 0x1.0p2047)
> - #elif defined __GNUC__
> -
> --#ifndef __CONFIG_ARM_EABI__
> -+#ifndef __ARM_EABI__
> - # define HUGE_VAL \
> -   (__extension__							      \
> -    ((union { unsigned __l __attribute__((__mode__(__DI__))); double __d; })   \
> -@@ -50,7 +50,7 @@
> -
> - typedef union { unsigned char __c[8]; double __d; } __huge_val_t;
> -
> --#ifndef __CONFIG_ARM_EABI__
> -+#ifndef __ARM_EABI__
> - # if __BYTE_ORDER == __BIG_ENDIAN
> - #  define __HUGE_VAL_bytes	{ 0, 0, 0, 0, 0x7f, 0xf0, 0, 0 }
> - # endif
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
> deleted file mode 100644
> index 920a669..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
> +++ /dev/null
> @@ -1,215 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313303agb;
> -        Sat, 8 Jan 2011 16:45:18 -0800 (PST)
> -Received: by 10.227.98.158 with SMTP id q30mr1255804wbn.151.1294533917314;
> -        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id r3si33749838wbr.54.2011.01.08.16.45.16;
> -        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClGDS; Sun, 09 Jan 2011 01:45:16 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 3/7] ARM: remove sub-arch/variants selection from menuconfig
> -Date: Sun,  9 Jan 2011 01:45:06 +0100
> -Message-Id:<1294533910-19305-4-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -Rely on the compiler to be correctly set up to generate
> -appropriate code for the target variant.
> -
> -This exposes the Thumb option, as it is no longer auto-selected.
> -The "Use BX" no longer depends on supported CPU to be selected,
> -so it now defaults to 'n' as it shall work by default on CPUs
> -that do not have BX.
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - Rules.mak                |   19 -------
> - extra/Configs/Config.arm |  125 ++--------------------------------------------
> - 2 files changed, 5 insertions(+), 139 deletions(-)
> -
> -diff --git a/Rules.mak b/Rules.mak
> -index 2a16908..09741a6 100644
> ---- a/Rules.mak
> -+++ b/Rules.mak
> -@@ -332,25 +332,6 @@ ifeq ($(TARGET_ARCH),arm)
> - 	OPTIMIZATION+=-fstrict-aliasing
> - 	CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=-mlittle-endian
> - 	CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=-mbig-endian
> --	CPU_CFLAGS-$(CONFIG_GENERIC_ARM)+=
> --	CPU_CFLAGS-$(CONFIG_ARM610)+=-mtune=arm610 -march=armv3
> --	CPU_CFLAGS-$(CONFIG_ARM710)+=-mtune=arm710 -march=armv3
> --	CPU_CFLAGS-$(CONFIG_ARM7TDMI)+=-mtune=arm7tdmi -march=armv4t
> --	CPU_CFLAGS-$(CONFIG_ARM720T)+=-mtune=arm7tdmi -march=armv4t
> --	CPU_CFLAGS-$(CONFIG_ARM920T)+=-mtune=arm9tdmi -march=armv4t
> --	CPU_CFLAGS-$(CONFIG_ARM922T)+=-mtune=arm9tdmi -march=armv4t
> --	CPU_CFLAGS-$(CONFIG_ARM926T)+=-mtune=arm9e -march=armv5te
> --	CPU_CFLAGS-$(CONFIG_ARM10T)+=-mtune=arm10tdmi -march=armv5t
> --	CPU_CFLAGS-$(CONFIG_ARM1136JF_S)+=-mtune=arm1136jf-s -march=armv6
> --	CPU_CFLAGS-$(CONFIG_ARM1176JZ_S)+=-mtune=arm1176jz-s -march=armv6
> --	CPU_CFLAGS-$(CONFIG_ARM1176JZF_S)+=-mtune=arm1176jzf-s -march=armv6
> --	CPU_CFLAGS-$(CONFIG_ARM_SA110)+=-mtune=strongarm110 -march=armv4
> --	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
> --	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
> --	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
> --	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
> --	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
> --	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
> - 	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
> - endif
> -
> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
> -index c9c40d4..6c75a00 100644
> ---- a/extra/Configs/Config.arm
> -+++ b/extra/Configs/Config.arm
> -@@ -30,129 +30,14 @@ config CONFIG_ARM_EABI
> -
> - endchoice
> -
> --choice
> --	prompt "Target Processor Type"
> --	default CONFIG_GENERIC_ARM
> --	help
> --	  This is the processor type of your CPU. This information is used for
> --	  optimizing purposes.  To build a library that will run on all ARMCPU
> --	  types (albeit not optimally fast), you can specify "Generic Arm" here.
> --	  If you pick anything other than "Generic Arm", there is no guarantee
> --	  that uClibc will even run on anything other than the selected
> --	  processor type.
> --
> --	  Here are the settings recommended for greatest speed:
> --	  - "Generic Arm" select this if your compiler is already setup to
> --	    optimize things properly, or if you want to run on pretty much
> --	    everything, or you just don't much care.
> --	  - For anything else, pick the ARM core type that best matches the
> --	    cpu you will be using on your device.
> --
> --	  If you don't know what to do, choose "Generic Arm".
> --
> --config CONFIG_GENERIC_ARM
> --	bool "Generic Arm"
> --
> --config CONFIG_ARM610
> --	bool "Arm 610"
> --	select ARCH_HAS_MMU
> --
> --config CONFIG_ARM710
> --	bool "Arm 710"
> --	select ARCH_HAS_MMU
> --
> --config CONFIG_ARM7TDMI
> --	bool "Arm 7TDMI"
> --	select ARCH_HAS_NO_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM720T
> --	bool "Arm 720T"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM920T
> --	bool "Arm 920T"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM922T
> --	bool "Arm 922T"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM926T
> --	bool "Arm 926T"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM10T
> --	bool "Arm 10T"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM1136JF_S
> --	bool "Arm 1136JF-S"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM1176JZ_S
> --	bool "Arm 1176JZ-S"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM1176JZF_S
> --	bool "Arm 1176JZF-S"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM_CORTEX_M3
> --	bool "Arm Cortex-M3"
> --	select ARCH_HAS_NO_MMU
> --	select FORCE_THUMB
> --
> --config CONFIG_ARM_CORTEX_M1
> --	bool "Arm Cortex-M1"
> --	select ARCH_HAS_NO_MMU
> --	select FORCE_THUMB
> --
> --config CONFIG_ARM_SA110
> --	bool "Intel StrongArm SA-110"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM_SA1100
> --	bool "Intel StrongArm SA-1100"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM_XSCALE
> --	bool "Intel Xscale"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --config CONFIG_ARM_IWMMXT
> --	bool "Intel Xscale With WMMX PXA27x"
> --	select ARCH_HAS_MMU
> --	select HAS_THUMB
> --
> --endchoice
> --
> --config HAS_THUMB
> --	bool
> --
> --config FORCE_THUMB
> --	bool
> --	select HAS_THUMB
> --	select COMPILE_IN_THUMB_MODE
> --	select USE_BX
> --
> - config COMPILE_IN_THUMB_MODE
> --	bool
> -+	bool "Build using Thumb mode"
> -+	select USE_BX
> -+	help
> -+	  Say 'y' here to force building uClibc in thumb mode.
> -+	  Say 'n' to use your compiler's default mode.
> -
> - config USE_BX
> - 	bool "Use BX in function return"
> --	default y
> --	depends on HAS_THUMB
> - 	help
> - 	  Use BX instruction for THUMB aware architectures.
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
> deleted file mode 100644
> index 30cb7f6..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
> +++ /dev/null
> @@ -1,215 +0,0 @@
> -Patch is backported from
> -http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html
> -
> -Upstream-Status: Pending
> -
> -diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h
> -index 7fbb373..7102351 100644
> ---- a/ldso/include/dl-elf.h
> -+++ b/ldso/include/dl-elf.h
> -@@ -25,16 +25,18 @@ static __inline__ void _dl_map_cache(void) { }
> - static __inline__ void _dl_unmap_cache(void) { }
> - #endif
> -
> -+#define DL_RESOLVE_SECURE		0x0001
> -+#define DL_RESOLVE_NOLOAD		0x0002
> -
> - /* Function prototypes for non-static stuff in readelflib1.c */
> - extern void _dl_parse_lazy_relocation_information(struct dyn_elf *rpnt,
> - 	unsigned long rel_addr, unsigned long rel_size);
> - extern int _dl_parse_relocation_information(struct dyn_elf *rpnt,
> - 	unsigned long rel_addr, unsigned long rel_size);
> --extern struct elf_resolve * _dl_load_shared_library(int secure,
> -+extern struct elf_resolve * _dl_load_shared_library(int resolve_flags,
> - 	struct dyn_elf **rpnt, struct elf_resolve *tpnt, char *full_libname,
> - 	int trace_loaded_objects);
> --extern struct elf_resolve * _dl_load_elf_shared_library(int secure,
> -+extern struct elf_resolve * _dl_load_elf_shared_library(int resolve_flags,
> - 	struct dyn_elf **rpnt, char *libname);
> - extern struct elf_resolve *_dl_check_if_named_library_is_loaded(const char *full_libname,
> - 	int trace_loaded_objects);
> -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
> -index 2b2d429..6d35bf2 100644
> ---- a/ldso/ldso/dl-elf.c
> -+++ b/ldso/ldso/dl-elf.c
> -@@ -132,7 +132,7 @@ _dl_protect_relro (struct elf_resolve *l)
> - /* This function's behavior must exactly match that
> -  * in uClibc/ldso/util/ldd.c */
> - static struct elf_resolve *
> --search_for_named_library(const char *name, int secure, const char *path_list,
> -+search_for_named_library(const char *name, int resolve_flags, const char *path_list,
> - 	struct dyn_elf **rpnt, const char *origin)
> - {
> - 	char *mylibname;
> -@@ -162,7 +162,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
> -
> - 		if (plen>= 7&&  _dl_memcmp(p, "$ORIGIN", 7) == 0) {
> - 			int olen;
> --			if (secure&&  plen != 7)
> -+			if ((resolve_flags&  DL_RESOLVE_SECURE)&&  plen != 7)
> - 				continue;
> - 			if (origin == NULL)
> - 				continue;
> -@@ -182,7 +182,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
> - 		_dl_strcat(mylibname, "/");
> - 		_dl_strcat(mylibname, name);
> -
> --		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
> -+		tpnt = _dl_load_elf_shared_library(resolve_flags, rpnt, mylibname);
> - 		if (tpnt != NULL)
> - 			return tpnt;
> - 	}
> -@@ -194,7 +194,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
> - unsigned long _dl_error_number;
> - unsigned long _dl_internal_error_number;
> -
> --struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> -+struct elf_resolve *_dl_load_shared_library(int resolve_flags, struct dyn_elf **rpnt,
> - 	struct elf_resolve *tpnt, char *full_libname, int attribute_unused trace_loaded_objects)
> - {
> - 	char *pnt;
> -@@ -223,7 +223,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> -
> - 	if (libname != full_libname) {
> - 		_dl_if_debug_dprint("\ttrying file='%s'\n", full_libname);
> --		tpnt1 = _dl_load_elf_shared_library(secure, rpnt, full_libname);
> -+		tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, full_libname);
> - 		if (tpnt1) {
> - 			return tpnt1;
> - 		}
> -@@ -238,7 +238,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> - 	if (pnt) {
> - 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
> - 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
> --		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
> -+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt,
> - 						      tpnt->libname)) != NULL)
> - 			return tpnt1;
> - 	}
> -@@ -247,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> - 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
> - 	if (_dl_library_path) {
> - 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
> --		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
> -+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, _dl_library_path, rpnt, NULL)) != NULL)
> - 		{
> - 			return tpnt1;
> - 		}
> -@@ -261,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> - 	if (pnt) {
> - 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
> - 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
> --		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
> -+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt, NULL)) != NULL)
> - 			return tpnt1;
> - 	}
> - #endif
> -@@ -284,7 +284,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> - 			     || libent[i].flags == LIB_ELF_LIBC0
> - 			     ||	libent[i].flags == LIB_ELF_LIBC5)
> - 			&&  _dl_strcmp(libname, strs + libent[i].sooffset) == 0
> --			&&  (tpnt1 = _dl_load_elf_shared_library(secure, rpnt, strs + libent[i].liboffset))
> -+			&&  (tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, strs + libent[i].liboffset))
> - 			) {
> - 				return tpnt1;
> - 			}
> -@@ -295,14 +295,14 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> - 	/* Look for libraries wherever the shared library loader
> - 	 * was installed */
> - 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
> --	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
> -+	tpnt1 = search_for_named_library(libname, resolve_flags, _dl_ldsopath, rpnt, NULL);
> - 	if (tpnt1 != NULL)
> - 		return tpnt1;
> -
> - 	/* Lastly, search the standard list of paths for the library.
> - 	   This list must exactly match the list in uClibc/ldso/util/ldd.c */
> - 	_dl_if_debug_dprint("\tsearching full lib path list\n");
> --	tpnt1 = search_for_named_library(libname, secure,
> -+	tpnt1 = search_for_named_library(libname, resolve_flags,
> - 					UCLIBC_RUNTIME_PREFIX "lib:"
> - 					UCLIBC_RUNTIME_PREFIX "usr/lib"
> - #ifndef __LDSO_CACHE_SUPPORT__
> -@@ -329,7 +329,7 @@ goof:
> -  * are required.
> -  */
> -
> --struct elf_resolve *_dl_load_elf_shared_library(int secure,
> -+struct elf_resolve *_dl_load_elf_shared_library(int resolve_flags,
> - 	struct dyn_elf **rpnt, char *libname)
> - {
> - 	ElfW(Ehdr) *epnt;
> -@@ -368,7 +368,7 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
> - 	}
> - 	/* If we are in secure mode (i.e. a setu/gid binary using LD_PRELOAD),
> - 	   we don't load the library if it isn't setuid. */
> --	if (secure) {
> -+	if (resolve_flags&  DL_RESOLVE_SECURE) {
> - 		if (!(st.st_mode&  S_ISUID)) {
> - 			_dl_close(infile);
> - 			return NULL;
> -@@ -384,6 +384,10 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
> - 			return tpnt;
> - 		}
> - 	}
> -+	if (resolve_flags&  DL_RESOLVE_NOLOAD) {
> -+		_dl_close(infile);
> -+		return NULL;
> -+	}
> - 	header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ | PROT_WRITE,
> - 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
> - 	if (_dl_mmap_check_error(header)) {
> -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
> -index 9423670..b71af34 100644
> ---- a/ldso/ldso/ldso.c
> -+++ b/ldso/ldso/ldso.c
> -@@ -646,7 +646,9 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
> - 			if (!_dl_secure || _dl_strchr(str, '/') == NULL) {
> - 				_dl_if_debug_dprint("\tfile='%s';  needed by '%s'\n", str, _dl_progname);
> -
> --				tpnt1 = _dl_load_shared_library(_dl_secure,&rpnt, NULL, str, trace_loaded_objects);
> -+				tpnt1 = _dl_load_shared_library(
> -+					_dl_secure ? DL_RESOLVE_SECURE : 0,
> -+					&rpnt, NULL, str, trace_loaded_objects);
> - 				if (!tpnt1) {
> - #ifdef __LDSO_LDD_SUPPORT__
> - 					if (trace_loaded_objects)
> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
> -index 68cd579..edf38d2 100644
> ---- a/ldso/libdl/libdl.c
> -+++ b/ldso/libdl/libdl.c
> -@@ -288,7 +288,7 @@ void *dlopen(const char *libname, int flag)
> - #endif
> -
> - 	/* A bit of sanity checking... */
> --	if (!(flag&  (RTLD_LAZY|RTLD_NOW))) {
> -+	if (!(flag&  (RTLD_LAZY|RTLD_NOW|RTLD_NOLOAD))) {
> - 		_dl_error_number = LD_BAD_HANDLE;
> - 		return NULL;
> - 	}
> -@@ -358,8 +358,9 @@ void *dlopen(const char *libname, int flag)
> - 	/* Try to load the specified library */
> - 	_dl_if_debug_print("Trying to dlopen '%s', RTLD_GLOBAL:%d RTLD_NOW:%d\n",
> - 			(char*)libname, (flag&  RTLD_GLOBAL ? 1:0), (now_flag&  RTLD_NOW ? 1:0));
> --	tpnt = _dl_load_shared_library(0,&rpnt, tfrom, (char*)libname, 0);
> -
> -+	tpnt = _dl_load_shared_library((flag&  RTLD_NOLOAD) ? DL_RESOLVE_NOLOAD : 0,
> -+					&rpnt, tfrom, (char*)libname, 0);
> - 	if (tpnt == NULL) {
> - 		_dl_unmap_cache();
> - 		return NULL;
> -diff --git a/libc/sysdeps/linux/common/bits/dlfcn.h b/libc/sysdeps/linux/common/bits/dlfcn.h
> -index 4bfbbff..47b42ad 100644
> ---- a/libc/sysdeps/linux/common/bits/dlfcn.h
> -+++ b/libc/sysdeps/linux/common/bits/dlfcn.h
> -@@ -24,9 +24,9 @@
> - /* The MODE argument to `dlopen' contains one of the following: */
> - #define RTLD_LAZY	0x00001	/* Lazy function call binding.  */
> - #define RTLD_NOW	0x00002	/* Immediate function call binding.  */
> --#if 0 /* uClibc doesnt support these */
> --#define	RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
> -+#define RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
> - #define RTLD_NOLOAD	0x00004	/* Do not load the object.  */
> -+#if 0 /* uClibc doesnt support these */
> - #define RTLD_DEEPBIND	0x00008	/* Use deep binding.  */
> - #endif
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
> deleted file mode 100644
> index b19408f..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
> +++ /dev/null
> @@ -1,172 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313301agb;
> -        Sat, 8 Jan 2011 16:45:17 -0800 (PST)
> -Received: by 10.216.186.82 with SMTP id v60mr20017574wem.56.1294533916559;
> -        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id o13si33755824wee.56.2011.01.08.16.45.16;
> -        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClFDL; Sun, 09 Jan 2011 01:45:16 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 2/7] ARM: introduce blind options to select&  force THUMB mode
> -Date: Sun,  9 Jan 2011 01:45:05 +0100
> -Message-Id:<1294533910-19305-3-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -Add three new blind options to set use of Thumb mode:
> -- COMPILE_IN_THUMB_MODE
> -  - if set, CFLAGS will contain -mthumb
> -  - if unset, the compiler's default is used
> -- HAS_THUMB
> -  - CPUS with Thumb instruction set can select this
> -  - use of BX depends on this
> -- FORCE_THUMB
> -  - CPUs that are Thumb-only must select this
> -  - this selects: HAS_THUMB, COMPILE_IN_THUMB_MODE and USE_BX
> -
> -Also, remove leading space in Rules.mak.
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - Rules.mak                |    7 ++++---
> - extra/Configs/Config.arm |   31 ++++++++++++++++++++++++++++---
> - 2 files changed, 32 insertions(+), 6 deletions(-)
> -
> -diff --git a/Rules.mak b/Rules.mak
> -index eecdc64..2a16908 100644
> ---- a/Rules.mak
> -+++ b/Rules.mak
> -@@ -348,9 +348,10 @@ ifeq ($(TARGET_ARCH),arm)
> - 	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
> - 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
> - 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
> -- 	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
> -- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3 -mthumb
> -- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1 -mthumb
> -+	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
> -+	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
> -+	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
> -+	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
> - endif
> -
> - ifeq ($(TARGET_ARCH),mips)
> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
> -index 3b90e67..c9c40d4 100644
> ---- a/extra/Configs/Config.arm
> -+++ b/extra/Configs/Config.arm
> -@@ -64,70 +64,95 @@ config CONFIG_ARM710
> - config CONFIG_ARM7TDMI
> - 	bool "Arm 7TDMI"
> - 	select ARCH_HAS_NO_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM720T
> - 	bool "Arm 720T"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM920T
> - 	bool "Arm 920T"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM922T
> - 	bool "Arm 922T"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM926T
> - 	bool "Arm 926T"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM10T
> - 	bool "Arm 10T"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM1136JF_S
> - 	bool "Arm 1136JF-S"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM1176JZ_S
> - 	bool "Arm 1176JZ-S"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM1176JZF_S
> - 	bool "Arm 1176JZF-S"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM_CORTEX_M3
> - 	bool "Arm Cortex-M3"
> - 	select ARCH_HAS_NO_MMU
> --	select USE_BX
> -+	select FORCE_THUMB
> -
> - config CONFIG_ARM_CORTEX_M1
> - 	bool "Arm Cortex-M1"
> - 	select ARCH_HAS_NO_MMU
> --	select USE_BX
> -+	select FORCE_THUMB
> -
> - config CONFIG_ARM_SA110
> - 	bool "Intel StrongArm SA-110"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM_SA1100
> - 	bool "Intel StrongArm SA-1100"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM_XSCALE
> - 	bool "Intel Xscale"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - config CONFIG_ARM_IWMMXT
> - 	bool "Intel Xscale With WMMX PXA27x"
> - 	select ARCH_HAS_MMU
> -+	select HAS_THUMB
> -
> - endchoice
> -
> -+config HAS_THUMB
> -+	bool
> -+
> -+config FORCE_THUMB
> -+	bool
> -+	select HAS_THUMB
> -+	select COMPILE_IN_THUMB_MODE
> -+	select USE_BX
> -+
> -+config COMPILE_IN_THUMB_MODE
> -+	bool
> -+
> - config USE_BX
> - 	bool "Use BX in function return"
> - 	default y
> --	depends on !CONFIG_GENERIC_ARM&&  !CONFIG_ARM610&&  !CONFIG_ARM710
> -+	depends on HAS_THUMB
> - 	help
> - 	  Use BX instruction for THUMB aware architectures.
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
> deleted file mode 100644
> index 4b85a43..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -Some architectures like ppc, arm use aligned 64 bit inputs so a register is not wasted
> -this then uses __NR_sync_file_range2 syscall. Implement is
> -
> -Singed-off-by: Khem Raj<raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: git/libc/sysdeps/linux/common/sync_file_range.c
> -===================================================================
> ---- git.orig/libc/sysdeps/linux/common/sync_file_range.c	2011-07-19 14:23:35.000000000 -0700
> -+++ git/libc/sysdeps/linux/common/sync_file_range.c	2011-07-19 15:04:38.631808666 -0700
> -@@ -11,7 +11,8 @@
> - #if defined __USE_GNU
> - #include<fcntl.h>
> -
> --#if defined __NR_sync_file_range&&  defined __UCLIBC_HAS_LFS__
> -+#if defined __UCLIBC_HAS_LFS__
> -+#if defined __NR_sync_file_range
> - #define __NR___syscall_sync_file_range __NR_sync_file_range
> - static __inline__ _syscall6(int, __syscall_sync_file_range, int, fd,
> - 		off_t, offset_hi, off_t, offset_lo,
> -@@ -23,5 +24,23 @@
> - 		__LONG_LONG_PAIR((long)(nbytes>>  32), (long)(nbytes&  0xffffffff)),
> - 		flags);
> - }
> --#endif
> --#endif
> -+#elif defined __NR_sync_file_range2
> -+#define __NR___syscall_sync_file_range2 __NR_sync_file_range2
> -+static __inline__ _syscall6(int, __syscall_sync_file_range2, int, fd,
> -+		unsigned int, flags, off_t, offset_hi, off_t, offset_lo,
> -+		off_t, nbytes_hi, off_t, nbytes_lo)
> -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags)
> -+{
> -+	return __syscall_sync_file_range2(fd, flags,
> -+		__LONG_LONG_PAIR((long)(offset>>  32), (long)(offset&  0xffffffff)),
> -+		__LONG_LONG_PAIR((long)(nbytes>>  32), (long)(nbytes&  0xffffffff)));
> -+}
> -+#else
> -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags)
> -+{
> -+	__set_errno (ENOSYS);
> -+	return -1
> -+}
> -+#endif /* __NR_sync_file_range */
> -+#endif /* __UCLIBC_HAS_LFS__ */
> -+#endif /* __USE_GNU */
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
> deleted file mode 100644
> index 82970ca..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -Delivered-To: raj.khem@gmail.com
> -Received: by 10.90.86.4 with SMTP id j4cs313305agb;
> -        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
> -Received: by 10.216.153.210 with SMTP id f60mr573848wek.114.1294533918335;
> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
> -Return-Path:<yann.morin.1998@anciens.enib.fr>
> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
> -        by mx.google.com with ESMTP id n4si33737071wej.152.2011.01.08.16.45.17;
> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
> -Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
> -Received: from roazhon.bzh.lan ([90.32.245.227])
> -	by mwinf5d24 with ME
> -	id tClC1f0024v5z3u03ClGDX; Sun, 09 Jan 2011 01:45:17 +0100
> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -To: uclibc@uclibc.org
> -Cc: Khem Raj<raj.khem@gmail.com>,
> -	Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
> -	Carmelo AMOROSO<carmelo.amoroso@st.com>
> -Subject: [PATCH 4/7] ARM: transform the EABI/OABI choice into a boolean
> -Date: Sun,  9 Jan 2011 01:45:07 +0100
> -Message-Id:<1294533910-19305-5-git-send-email-yann.morin.1998@anciens.enib.fr>
> -X-Mailer: git-send-email 1.7.1
> -In-Reply-To:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -References:<1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
> -
> -The CONFIG_ARM_OABI option is never used.
> -
> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
> -Cc: Khem Raj<raj.khem@gmail.com>
> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
> ----
> - extra/Configs/Config.arm |   23 ++++++++---------------
> - 1 files changed, 8 insertions(+), 15 deletions(-)
> -
> -Index: git/extra/Configs/Config.arm
> -===================================================================
> ---- git.orig/extra/Configs/Config.arm
> -+++ git/extra/Configs/Config.arm
> -@@ -12,23 +12,16 @@ config FORCE_OPTIONS_FOR_ARCH
> - 	default y
> - 	select ARCH_ANY_ENDIAN
> -
> --choice
> --	prompt "Target ABI"
> --	default CONFIG_ARM_EABI
> -+config CONFIG_ARM_EABI
> -+	bool "Build for EABI"
> - 	help
> --	  If you choose "EABI" here, functions and constants required by the
> --	  ARM EABI will be built into the library.  You should choose "EABI"
> -+	  If you say 'y' here, functions and constants required by the
> -+	  ARM EABI will be built into the library.  You should say 'y'
> - 	  if your compiler uses the ARM EABI, in which case you will also
> --	  need a kernel supporting the EABI system call interface, or "OABI"
> --	  for a compiler using the old Linux ABI.
> --
> --config CONFIG_ARM_OABI
> --	bool "OABI"
> --
> --config CONFIG_ARM_EABI
> --	bool "EABI"
> -+	  need a kernel supporting the EABI system call interface.
> -
> --endchoice
> -+	  If you say 'n' here, then the library will be built for the
> -+	  old Linux ABI.
> -
> - config COMPILE_IN_THUMB_MODE
> - 	bool "Build using Thumb mode"
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
> deleted file mode 100644
> index 504d37b..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
> -===================================================================
> ---- uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
> -+++ uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
> -@@ -38,4 +38,8 @@
> - /* define if target supports IEEE signed zero floats */
> - #define __UCLIBC_HAVE_SIGNED_ZERO__
> -
> -+#ifdef __ARM_EABI__
> -+# define __UCLIBC_TRUNCATE64_HAS_4_ARGS__
> -+#endif
> -+
> - #endif /* _BITS_UCLIBC_ARCH_FEATURES_H */
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
> deleted file mode 100644
> index 78401bd..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
> +++ /dev/null
> @@ -1,455 +0,0 @@
> -From 2becc16ecbef71c496644d9dc6cbd7383d7cdca3 Mon Sep 17 00:00:00 2001
> -From: Henning Heinold<heinold@inf.fu-berlin.de>
> -Date: Sat, 4 Jun 2011 21:21:41 +0200
> -Subject: [PATCH 1/2] libc: updates the linux scheduler functions, most stuff
> - was taken from the eglibc
> -
> -
> -Signed-off-by: Henning Heinold<heinold@inf.fu-berlin.de>
> ----
> - include/sched.h                            |   52 ++++++++++++----
> - libc/sysdeps/linux/common/Makefile.in      |    4 +-
> - libc/sysdeps/linux/common/bits/sched.h     |   96 +++++++++++++++++++++++-----
> - libc/sysdeps/linux/common/sched_cpualloc.c |   27 ++++++++
> - libc/sysdeps/linux/common/sched_cpucount.c |   60 +++++++++++++++++
> - libc/sysdeps/linux/common/sched_cpufree.c  |   27 ++++++++
> - libc/sysdeps/linux/common/sched_getcpu.c   |   37 +++++++++++
> - libc/sysdeps/linux/common/unshare.c        |   12 ++++
> - 8 files changed, 286 insertions(+), 29 deletions(-)
> - create mode 100644 libc/sysdeps/linux/common/sched_cpualloc.c
> - create mode 100644 libc/sysdeps/linux/common/sched_cpucount.c
> - create mode 100644 libc/sysdeps/linux/common/sched_cpufree.c
> - create mode 100644 libc/sysdeps/linux/common/sched_getcpu.c
> - create mode 100644 libc/sysdeps/linux/common/unshare.c
> -
> -diff --git a/include/sched.h b/include/sched.h
> -index 0d110c3..e265b84 100644
> ---- a/include/sched.h
> -+++ b/include/sched.h
> -@@ -1,5 +1,5 @@
> - /* Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
> --   Copyright (C) 1996,1997,1999,2001-2003,2004 Free Software Foundation, Inc.
> -+   Copyright (C) 1996,1997,1999,2001-2004,2007 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> -
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -25,6 +25,9 @@
> - /* Get type definitions.  */
> - #include<bits/types.h>
> -
> -+#define __need_size_t
> -+#include<stddef.h>
> -+
> - #define __need_timespec
> - #include<time.h>
> -
> -@@ -65,11 +68,42 @@ extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __THROW;
> -
> - #if defined __USE_GNU&&  defined __UCLIBC_LINUX_SPECIFIC__
> - /* Access macros for `cpu_set'.  */
> --#define CPU_SETSIZE __CPU_SETSIZE
> --#define CPU_SET(cpu, cpusetp)	__CPU_SET (cpu, cpusetp)
> --#define CPU_CLR(cpu, cpusetp)	__CPU_CLR (cpu, cpusetp)
> --#define CPU_ISSET(cpu, cpusetp)	__CPU_ISSET (cpu, cpusetp)
> --#define CPU_ZERO(cpusetp)	__CPU_ZERO (cpusetp)
> -+# define CPU_SETSIZE __CPU_SETSIZE
> -+# define CPU_SET(cpu, cpusetp)	 __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
> -+# define CPU_CLR(cpu, cpusetp)	 __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
> -+# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu_set_t), \
> -+						cpusetp)
> -+# define CPU_ZERO(cpusetp)	 __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
> -+# define CPU_COUNT(cpusetp)	 __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)
> -+
> -+# define CPU_SET_S(cpu, setsize, cpusetp)   __CPU_SET_S (cpu, setsize, cpusetp)
> -+# define CPU_CLR_S(cpu, setsize, cpusetp)   __CPU_CLR_S (cpu, setsize, cpusetp)
> -+# define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu, setsize, \
> -+							   cpusetp)
> -+# define CPU_ZERO_S(setsize, cpusetp)	    __CPU_ZERO_S (setsize, cpusetp)
> -+# define CPU_COUNT_S(setsize, cpusetp)	    __CPU_COUNT_S (setsize, cpusetp)
> -+
> -+# define CPU_EQUAL(cpusetp1, cpusetp2) \
> -+  __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
> -+# define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
> -+  __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
> -+
> -+# define CPU_AND(destset, srcset1, srcset2) \
> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2,&)
> -+# define CPU_OR(destset, srcset1, srcset2) \
> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)
> -+# define CPU_XOR(destset, srcset1, srcset2) \
> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)
> -+# define CPU_AND_S(setsize, destset, srcset1, srcset2) \
> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2,&)
> -+# define CPU_OR_S(setsize, destset, srcset1, srcset2) \
> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2, |)
> -+# define CPU_XOR_S(setsize, destset, srcset1, srcset2) \
> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)
> -+
> -+# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
> -+# define CPU_ALLOC(count) __CPU_ALLOC (count)
> -+# define CPU_FREE(cpuset) __CPU_FREE (cpuset)
> -
> -
> - /* Set the CPU affinity for a task */
> -@@ -79,12 +113,6 @@ extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
> - /* Get the CPU affinity for a task */
> - extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
> - 			      cpu_set_t *__cpuset) __THROW;
> --
> --extern int __clone (int (*__fn) (void *__arg), void *__child_stack,
> --		    int __flags, void *__arg, ...);
> --extern int __clone2 (int (*__fn) (void *__arg), void *__child_stack_base,
> --		     size_t __child_stack_size, int __flags, void *__arg, ...);
> --
> - #endif
> -
> - __END_DECLS
> -diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
> -index 8f936ff..cb8c153 100644
> ---- a/libc/sysdeps/linux/common/Makefile.in
> -+++ b/libc/sysdeps/linux/common/Makefile.in
> -@@ -22,9 +22,11 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += capget.c capset.c inotify.c ioperm.c iopl.c \
> - 	modify_ldt.c pipe2.c personality.c ppoll.c prctl.c \
> - 	readahead.c reboot.c \
> - 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
> -+	sched_cpualloc.c sched_cpucount.c sched_cpufree.c \
> - 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
> - 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
> --	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c
> -+	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c \
> -+	uselib.c vhangup.c
> - # NPTL needs these internally: madvise.c
> - CSRC-$(findstring y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) += madvise.c
> - ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
> -diff --git a/libc/sysdeps/linux/common/bits/sched.h b/libc/sysdeps/linux/common/bits/sched.h
> -index b48a0c8..fea66a8 100644
> ---- a/libc/sysdeps/linux/common/bits/sched.h
> -+++ b/libc/sysdeps/linux/common/bits/sched.h
> -@@ -1,6 +1,7 @@
> - /* Definitions of constants and data structure for POSIX 1003.1b-1993
> -    scheduling interface.
> --   Copyright (C) 1996-1999,2001-2003,2005,2006 Free Software Foundation, Inc.
> -+   Copyright (C) 1996-1999,2001-2003,2005,2006,2007,2008
> -+   Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> -
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -58,7 +59,13 @@
> - 				      force CLONE_PTRACE on this clone.  */
> - # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
> - 					  the child.  */
> --# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
> -+# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
> -+# define CLONE_NEWUTS	0x04000000	/* New utsname group.  */
> -+# define CLONE_NEWIPC	0x08000000	/* New ipcs.  */
> -+# define CLONE_NEWUSER	0x10000000	/* New user namespace.  */
> -+# define CLONE_NEWPID	0x20000000	/* New pid namespace.  */
> -+# define CLONE_NEWNET	0x40000000	/* New network namespace.  */
> -+# define CLONE_IO	0x80000000	/* Clone I/O context.  */
> - #endif
> -
> - /* The official definition.  */
> -@@ -74,10 +81,11 @@ __BEGIN_DECLS
> - extern int clone (int (*__fn) (void *__arg), void *__child_stack,
> - 		  int __flags, void *__arg, ...) __THROW;
> -
> --#if 0
> - /* Unshare the specified resources.  */
> - extern int unshare (int __flags) __THROW;
> --#endif
> -+
> -+/* Get index of currently used CPU.  */
> -+extern int sched_getcpu (void) __THROW;
> - #endif
> -
> - __END_DECLS
> -@@ -102,7 +110,7 @@ struct __sched_param
> - # define __CPU_SETSIZE	1024
> - # define __NCPUBITS	(8 * sizeof (__cpu_mask))
> -
> --/* Type for array elements in 'cpu_set'.  */
> -+/* Type for array elements in 'cpu_set_t'.  */
> - typedef unsigned long int __cpu_mask;
> -
> - /* Basic access functions.  */
> -@@ -116,17 +124,73 @@ typedef struct
> - } cpu_set_t;
> -
> - /* Access functions for CPU masks.  */
> --# define __CPU_ZERO(cpusetp) \
> -+# define __CPU_ZERO_S(setsize, cpusetp) \
> -   do {									      \
> --    unsigned int __i;							      \
> --    cpu_set_t *__arr = (cpusetp);					      \
> --    for (__i = 0; __i<  sizeof (cpu_set_t) / sizeof (__cpu_mask); ++__i)      \
> --      __arr->__bits[__i] = 0;						      \
> -+    size_t __i;								      \
> -+    size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
> -+    __cpu_mask *__bits = (cpusetp)->__bits;				      \
> -+    for (__i = 0; __i<  __imax; ++__i)					      \
> -+      __bits[__i] = 0;							      \
> -   } while (0)
> --# define __CPU_SET(cpu, cpusetp) \
> --  ((cpusetp)->__bits[__CPUELT (cpu)] |= __CPUMASK (cpu))
> --# define __CPU_CLR(cpu, cpusetp) \
> --  ((cpusetp)->__bits[__CPUELT (cpu)]&= ~__CPUMASK (cpu))
> --# define __CPU_ISSET(cpu, cpusetp) \
> --  (((cpusetp)->__bits[__CPUELT (cpu)]&  __CPUMASK (cpu)) != 0)
> -+# define __CPU_SET_S(cpu, setsize, cpusetp) \
> -+  (__extension__							      \
> -+   ({ size_t __cpu = (cpu);						      \
> -+      __cpu<  8 * (setsize)						      \
> -+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
> -+	 |= __CPUMASK (__cpu))						      \
> -+      : 0; }))
> -+# define __CPU_CLR_S(cpu, setsize, cpusetp) \
> -+  (__extension__							      \
> -+   ({ size_t __cpu = (cpu);						      \
> -+      __cpu<  8 * (setsize)						      \
> -+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
> -+	&= ~__CPUMASK (__cpu))						      \
> -+      : 0; }))
> -+# define __CPU_ISSET_S(cpu, setsize, cpusetp) \
> -+  (__extension__							      \
> -+   ({ size_t __cpu = (cpu);						      \
> -+      __cpu<  8 * (setsize)						      \
> -+      ? ((((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]	      \
> -+	&  __CPUMASK (__cpu))) != 0					      \
> -+      : 0; }))
> -+
> -+# define __CPU_COUNT_S(setsize, cpusetp) \
> -+  __sched_cpucount (setsize, cpusetp)
> -+
> -+# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
> -+  (__extension__							      \
> -+   ({ __cpu_mask *__arr1 = (cpusetp1)->__bits;				      \
> -+      __cpu_mask *__arr2 = (cpusetp2)->__bits;				      \
> -+      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
> -+      size_t __i;							      \
> -+      for (__i = 0; __i<  __imax; ++__i)				      \
> -+	if (__arr1[__i] != __arr2[__i])					      \
> -+	  break;							      \
> -+      __i == __imax; }))
> -+
> -+# define __CPU_OP_S(setsize, destset, srcset1, srcset2, op) \
> -+  (__extension__							      \
> -+   ({ cpu_set_t *__dest = (destset);					      \
> -+      __cpu_mask *__arr1 = (srcset1)->__bits;				      \
> -+      __cpu_mask *__arr2 = (srcset2)->__bits;				      \
> -+      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
> -+      size_t __i;							      \
> -+      for (__i = 0; __i<  __imax; ++__i)				      \
> -+	((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i];    \
> -+      __dest; }))
> -+
> -+# define __CPU_ALLOC_SIZE(count) \
> -+  ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))
> -+# define __CPU_ALLOC(count) __sched_cpualloc (count)
> -+# define __CPU_FREE(cpuset) __sched_cpufree (cpuset)
> -+
> -+__BEGIN_DECLS
> -+
> -+extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
> -+  __THROW;
> -+extern cpu_set_t *__sched_cpualloc (size_t __count) __THROW __wur;
> -+extern void __sched_cpufree (cpu_set_t *__set) __THROW;
> -+
> -+__END_DECLS
> -+
> - #endif
> -diff --git a/libc/sysdeps/linux/common/sched_cpualloc.c b/libc/sysdeps/linux/common/sched_cpualloc.c
> -new file mode 100644
> -index 0000000..2642a80
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/sched_cpualloc.c
> -@@ -0,0 +1,27 @@
> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include<sched.h>
> -+#include<stdlib.h>
> -+
> -+
> -+cpu_set_t *
> -+__sched_cpualloc (size_t count)
> -+{
> -+  return malloc (CPU_ALLOC_SIZE (count));
> -+}
> -diff --git a/libc/sysdeps/linux/common/sched_cpucount.c b/libc/sysdeps/linux/common/sched_cpucount.c
> -new file mode 100644
> -index 0000000..331c0b8
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/sched_cpucount.c
> -@@ -0,0 +1,60 @@
> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include<limits.h>
> -+#include<sched.h>
> -+
> -+
> -+int
> -+__sched_cpucount (size_t setsize, const cpu_set_t *setp)
> -+{
> -+  int s = 0;
> -+  const __cpu_mask *p = setp->__bits;
> -+  const __cpu_mask *end =&setp->__bits[setsize / sizeof (__cpu_mask)];
> -+
> -+  while (p<  end)
> -+    {
> -+      __cpu_mask l = *p++;
> -+
> -+#ifdef POPCNT
> -+      s += POPCNT (l);
> -+#else
> -+      if (l == 0)
> -+	continue;
> -+
> -+# if LONG_BIT>  32
> -+      l = (l&  0x5555555555555555ul) + ((l>>  1)&  0x5555555555555555ul);
> -+      l = (l&  0x3333333333333333ul) + ((l>>  2)&  0x3333333333333333ul);
> -+      l = (l&  0x0f0f0f0f0f0f0f0ful) + ((l>>  4)&  0x0f0f0f0f0f0f0f0ful);
> -+      l = (l&  0x00ff00ff00ff00fful) + ((l>>  8)&  0x00ff00ff00ff00fful);
> -+      l = (l&  0x0000ffff0000fffful) + ((l>>  16)&  0x0000ffff0000fffful);
> -+      l = (l&  0x00000000fffffffful) + ((l>>  32)&  0x00000000fffffffful);
> -+# else
> -+      l = (l&  0x55555555ul) + ((l>>  1)&  0x55555555ul);
> -+      l = (l&  0x33333333ul) + ((l>>  2)&  0x33333333ul);
> -+      l = (l&  0x0f0f0f0ful) + ((l>>  4)&  0x0f0f0f0ful);
> -+      l = (l&  0x00ff00fful) + ((l>>  8)&  0x00ff00fful);
> -+      l = (l&  0x0000fffful) + ((l>>  16)&  0x0000fffful);
> -+# endif
> -+
> -+      s += l;
> -+#endif
> -+    }
> -+
> -+  return s;
> -+}
> -diff --git a/libc/sysdeps/linux/common/sched_cpufree.c b/libc/sysdeps/linux/common/sched_cpufree.c
> -new file mode 100644
> -index 0000000..dd4c613
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/sched_cpufree.c
> -@@ -0,0 +1,27 @@
> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include<sched.h>
> -+#include<stdlib.h>
> -+
> -+
> -+void
> -+__sched_cpufree (cpu_set_t *set)
> -+{
> -+  free (set);
> -+}
> -diff --git a/libc/sysdeps/linux/common/sched_getcpu.c b/libc/sysdeps/linux/common/sched_getcpu.c
> -new file mode 100644
> -index 0000000..b193d65
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/sched_getcpu.c
> -@@ -0,0 +1,37 @@
> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include<stdlib.h>
> -+#include<errno.h>
> -+#include<sched.h>
> -+#include<sysdep.h>
> -+
> -+
> -+int
> -+sched_getcpu (void)
> -+{
> -+#ifdef __NR_getcpu
> -+  unsigned int cpu;
> -+  int r = INLINE_SYSCALL (getcpu, 3,&cpu, NULL, NULL);
> -+
> -+  return r == -1 ? r : cpu;
> -+#else
> -+  __set_errno (ENOSYS);
> -+  return -1;
> -+#endif
> -+}
> -diff --git a/libc/sysdeps/linux/common/unshare.c b/libc/sysdeps/linux/common/unshare.c
> -new file mode 100644
> -index 0000000..485bf88
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/unshare.c
> -@@ -0,0 +1,12 @@
> -+/* vi: set sw=4 ts=4: */
> -+/*
> -+ * unshare() for uClibc
> -+ *
> -+ * Copyright (C) 2011 Henning Heinold<heinold@inf.fu-berlin.de>
> -+ *
> -+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#include<sys/syscall.h>
> -+#include<sched.h>
> -+_syscall1(int, unshare, int, flags)
> ---
> -1.7.5.3
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
> new file mode 100644
> index 0000000..2f0c191
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
> @@ -0,0 +1,32 @@
> +From 6c3919a6d4a8686772e2a302bf951548ee24a8c1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Fri, 3 Feb 2012 10:57:44 -0800
> +Subject: [PATCH] Declare __err and pass it to INTERNAL_SYSCALL_NCS so
> + subsequent macros can use it
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +---
> + libc/sysdeps/linux/common/bits/syscalls-common.h |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +
> +Upstream-Status: Pending
> +
> +diff --git a/libc/sysdeps/linux/common/bits/syscalls-common.h b/libc/sysdeps/linux/common/bits/syscalls-common.h
> +index faebd1b..0f5a929 100644
> +--- a/libc/sysdeps/linux/common/bits/syscalls-common.h
> ++++ b/libc/sysdeps/linux/common/bits/syscalls-common.h
> +@@ -59,8 +59,8 @@
> + #ifndef INLINE_SYSCALL_NOERR_NCS
> + # define INLINE_SYSCALL_NOERR_NCS(name, nr, args...)			\
> + ({									\
> +-	/*INTERNAL_SYSCALL_DECL(__err);*/					\
> +-	long __res = INTERNAL_SYSCALL_NCS(name, /*__err*/, nr, args);	\
> ++	INTERNAL_SYSCALL_DECL(__err);					\
> ++	long __res = INTERNAL_SYSCALL_NCS(name, __err, nr, args);	\
> + 	__res;								\
> + })
> + #endif
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
> new file mode 100644
> index 0000000..da4ffef
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
> @@ -0,0 +1,177 @@
> +From effbfd8e8a7b883671b24fc9759b135b48dbfaca Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Fri, 3 Feb 2012 20:06:55 -0800
> +Subject: [PATCH] lstat/stat/fstat: Use 64bit version of syscall if available
> +
> +This is needed for stat'ing loop devices>  255
> +since otherwise kernel returns EOVERFLOW becasue
> +it needs st_rdev/st_dev to be larger than 16bits but
> +in kernel it uses __old_kernel_stat for stat
> +syscall which has st_rdev/st_dev as unsigned short
> +
> +Add a testcase
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +---
> + libc/sysdeps/linux/common/fstat.c |   18 ++++++++++++++----
> + libc/sysdeps/linux/common/lstat.c |   19 ++++++++++++++-----
> + libc/sysdeps/linux/common/stat.c  |   18 ++++++++++++++----
> + test/stat/stat-loop256.c          |   32 ++++++++++++++++++++++++++++++++
> + 4 files changed, 74 insertions(+), 13 deletions(-)
> + create mode 100644 test/stat/stat-loop256.c
> +
> +diff --git a/libc/sysdeps/linux/common/fstat.c b/libc/sysdeps/linux/common/fstat.c
> +index acc639b..4726a68 100644
> +--- a/libc/sysdeps/linux/common/fstat.c
> ++++ b/libc/sysdeps/linux/common/fstat.c
> +@@ -12,18 +12,28 @@
> + #include<sys/stat.h>
> + #include "xstatconv.h"
> +
> +-#define __NR___syscall_fstat __NR_fstat
> +-static __inline__ _syscall2(int, __syscall_fstat, int, fd, struct kernel_stat *, buf)
> +-
> + int fstat(int fd, struct stat *buf)
> + {
> + 	int result;
> ++#ifdef __NR_fstat64
> ++	/* normal stat call has limited values for various stat elements
> ++	 * e.g. uid device major/minor etc.
> ++	 * so we use 64 variant if available
> ++	 * in order to get newer versions of stat elements
> ++	 */
> ++	struct kernel_stat64 kbuf;
> ++	result = INLINE_SYSCALL(fstat64, 2, fd,&kbuf);
> ++	if (result == 0) {
> ++		__xstat32_conv(&kbuf, buf);
> ++	}
> ++#else
> + 	struct kernel_stat kbuf;
> +
> +-	result = __syscall_fstat(fd,&kbuf);
> ++	result = INLINE_SYSCALL(fstat, 2, fd,&kbuf);
> + 	if (result == 0) {
> + 		__xstat_conv(&kbuf, buf);
> + 	}
> ++#endif
> + 	return result;
> + }
> + libc_hidden_def(fstat)
> +diff --git a/libc/sysdeps/linux/common/lstat.c b/libc/sysdeps/linux/common/lstat.c
> +index aa77447..db72d1f 100644
> +--- a/libc/sysdeps/linux/common/lstat.c
> ++++ b/libc/sysdeps/linux/common/lstat.c
> +@@ -12,19 +12,28 @@
> + #include<sys/stat.h>
> + #include "xstatconv.h"
> +
> +-#define __NR___syscall_lstat __NR_lstat
> +-static __inline__ _syscall2(int, __syscall_lstat,
> +-		const char *, file_name, struct kernel_stat *, buf)
> +-
> + int lstat(const char *file_name, struct stat *buf)
> + {
> + 	int result;
> ++#ifdef __NR_lstat64
> ++	/* normal stat call has limited values for various stat elements
> ++	 * e.g. uid device major/minor etc.
> ++	 * so we use 64 variant if available
> ++	 * in order to get newer versions of stat elements
> ++	 */
> ++	struct kernel_stat64 kbuf;
> ++	result = INLINE_SYSCALL(lstat64, 2, file_name,&kbuf);
> ++	if (result == 0) {
> ++		__xstat32_conv(&kbuf, buf);
> ++	}
> ++#else
> + 	struct kernel_stat kbuf;
> +
> +-	result = __syscall_lstat(file_name,&kbuf);
> ++	result = INLINE_SYSCALL(lstat, 2, file_name,&kbuf);
> + 	if (result == 0) {
> + 		__xstat_conv(&kbuf, buf);
> + 	}
> ++#endif
> + 	return result;
> + }
> + libc_hidden_def(lstat)
> +diff --git a/libc/sysdeps/linux/common/stat.c b/libc/sysdeps/linux/common/stat.c
> +index a6ab291..829f35a 100644
> +--- a/libc/sysdeps/linux/common/stat.c
> ++++ b/libc/sysdeps/linux/common/stat.c
> +@@ -12,20 +12,30 @@
> + #include<sys/stat.h>
> + #include "xstatconv.h"
> +
> +-#define __NR___syscall_stat __NR_stat
> + #undef stat
> +-static __inline__ _syscall2(int, __syscall_stat,
> +-		const char *, file_name, struct kernel_stat *, buf)
> +
> + int stat(const char *file_name, struct stat *buf)
> + {
> + 	int result;
> ++#ifdef __NR_stat64
> ++	/* normal stat call has limited values for various stat elements
> ++	 * e.g. uid device major/minor etc.
> ++	 * so we use 64 variant if available
> ++	 * in order to get newer versions of stat elements
> ++	 */
> ++	struct kernel_stat64 kbuf;
> ++	result = INLINE_SYSCALL(stat64, 2, file_name,&kbuf);
> ++	if (result == 0) {
> ++		__xstat32_conv(&kbuf, buf);
> ++	}
> ++#else
> + 	struct kernel_stat kbuf;
> +
> +-	result = __syscall_stat(file_name,&kbuf);
> ++	result = INLINE_SYSCALL(stat, 2, file_name,&kbuf);
> + 	if (result == 0) {
> + 		__xstat_conv(&kbuf, buf);
> + 	}
> ++#endif
> + 	return result;
> + }
> + libc_hidden_def(stat)
> +diff --git a/test/stat/stat-loop256.c b/test/stat/stat-loop256.c
> +new file mode 100644
> +index 0000000..14284c1
> +--- /dev/null
> ++++ b/test/stat/stat-loop256.c
> +@@ -0,0 +1,32 @@
> ++#include<stdio.h>
> ++#include<unistd.h>
> ++#include<stdlib.h>
> ++#include<sys/stat.h>
> ++int main()
> ++{
> ++    struct stat statbuf;
> ++    int ret = 0;
> ++    char* loop255 = "/dev/loop255";
> ++    char* loop256 = "/dev/loop256";
> ++    mode_t mode = 0660;
> ++    mknod(loop255, mode, 0x7ff);
> ++    mknod(loop256, mode, 0x100700);
> ++    ret = stat(loop255,&statbuf);
> ++    if(ret<  0) {
> ++	printf("stat: Cant stat %s\n",loop255);
> ++	unlink(loop255);
> ++	exit(1);
> ++    }
> ++    ret = stat(loop256,&statbuf);
> ++    if(ret<  0) {
> ++        printf("stat: Cant stat %s\n",loop256);
> ++	unlink(loop255);
> ++	unlink(loop256);
> ++        exit(1);
> ++    }
> ++
> ++    unlink(loop255);
> ++    unlink(loop256);
> ++    exit(0);
> ++}
> ++
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
> similarity index 99%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
> index 7fd148f..b31b991 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
> @@ -8,6 +8,8 @@ Signed-off-by: Salvatore Cro<salvatore.cro at st.com>
>    create mode 100644 include/argp.h
>    create mode 100644 libc/argp/argp-fmtstream.h
>
> +Upstream-Status: Pending
> +
>   Index: git/include/argp.h
>   ===================================================================
>   --- /dev/null
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
> similarity index 99%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
> index 04a3c78..3e9680f 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
> @@ -13,6 +13,9 @@ it doesn't need to link libuargp.so explicitely.
>   Signed-off-by: Salvatore Cro<salvatore.cro at st.com>
>   Signed-off-by: Filippo Arcidiacono<filippo.arcidiacono at st.com>
>   Signed-off-by: Carmelo Amoroso<carmelo.amoroso at st.com>
> +
> +Upstream-Status: Pending
> +
>   ---
>    Makefile.in                                 |    8 +
>    Makerules                                   |    8 +-
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
> similarity index 97%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
> index 429f27d..15ee0ca 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
> @@ -1,5 +1,5 @@
>   When compiling in thumb mode for arm with -Os gcc gives up since it can not find registers
> -to spill. So we use -O2 option for compiling fork.c It may be addressable is gcc.
> +to spill. So we use -O2 option for compiling fork.c It may be addressable in gcc.
>
>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
> new file mode 100644
> index 0000000..4e900f3
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
> @@ -0,0 +1,25 @@
> +Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
> +
> +Upstream-Status: Pending
> +
> +Index: git/libc/sysdeps/linux/common/bits/socket.h
> +===================================================================
> +--- git.orig/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:23:21.537456132 -0800
> ++++ git/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:25:10.125461388 -0800
> +@@ -235,8 +235,15 @@
> + #define	MSG_ERRQUEUE	MSG_ERRQUEUE
> +     MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
> + #define	MSG_NOSIGNAL	MSG_NOSIGNAL
> +-    MSG_MORE		= 0x8000  /* Sender will send more.  */
> ++    MSG_MORE		= 0x8000,  /* Sender will send more.  */
> + #define	MSG_MORE	MSG_MORE
> ++    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to return.*/
> ++#define MSG_WAITFORONE  MSG_WAITFORONE
> ++
> ++    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
> ++                                           descriptor received through
> ++                                           SCM_RIGHTS.  */
> ++#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
> +   };
> +
> +
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
> new file mode 100644
> index 0000000..481f23b
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
> @@ -0,0 +1,37 @@
> +Implement dup3()
> +
> +Upstream-Status: Pending
> +
> +Index: git/libc/sysdeps/linux/common/dup3.c
> +===================================================================
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ git/libc/sysdeps/linux/common/dup3.c	2012-01-27 07:40:52.802900849 -0800
> +@@ -0,0 +1,15 @@
> ++/* vi: set sw=4 ts=4: */
> ++/*
> ++ * dup3() for uClibc
> ++ *
> ++ * Copyright (C) 2000-2006 Erik Andersen<andersen@uclibc.org>
> ++ *
> ++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> ++ */
> ++
> ++#include<sys/syscall.h>
> ++#include<unistd.h>
> ++
> ++
> ++_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
> ++libc_hidden_def(dup3)
> +Index: git/include/unistd.h
> +===================================================================
> +--- git.orig/include/unistd.h	2012-01-27 01:19:17.521792781 -0800
> ++++ git/include/unistd.h	2012-01-27 07:40:03.106898447 -0800
> +@@ -512,6 +512,8 @@
> + /* Duplicate FD to FD2, closing FD2 and making it open on the same file.  */
> + extern int dup2 (int __fd, int __fd2) __THROW;
> + libc_hidden_proto(dup2)
> ++extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
> ++libc_hidden_proto(dup3)
> +
> + /* NULL-terminated array of "NAME=VALUE" environment variables.  */
> + extern char **__environ;
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
> similarity index 86%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
> index cfa68ce..d44acca 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
> @@ -1,3 +1,9 @@
> +resolver code should always be in arm mode
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
>   Index: uClibc/ldso/ldso/arm/resolve.S
>   ===================================================================
>   --- uClibc.orig/ldso/ldso/arm/resolve.S	2009-03-20 12:03:32.000000000 -0700
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
> new file mode 100644
> index 0000000..8064115
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
> @@ -0,0 +1,19 @@
> +Index: git/include/libc-symbols.h
> +===================================================================
> +--- git.orig/include/libc-symbols.h	2011-07-05 17:04:41.171219323 -0700
> ++++ git/include/libc-symbols.h	2011-07-05 22:50:36.851661478 -0700
> +@@ -48,10 +48,12 @@
> +
> +    */
> +
> +-#include<bits/uClibc_arch_features.h>
> +-
> + /* Enable declarations of GNU extensions, since we are compiling them.  */
> + #define _GNU_SOURCE	1
> ++#define __need_uClibc_config_h
> ++#include<bits/uClibc_config.h>
> ++#undef __need_uClibc_config_h
> ++#include<bits/uClibc_arch_features.h>
> +
> + /* Prepare for the case that `__builtin_expect' is not available.  */
> + #if defined __GNUC__&&  __GNUC__ == 2&&  __GNUC_MINOR__<  96
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
> similarity index 100%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.machine
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
> similarity index 64%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
> index 631951e..c9c15a3 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
> @@ -3,16 +3,16 @@ http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
>
>   Upstream-Status: Pending
>
> -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
> -index 505247e..2b2d429 100644
> ---- a/ldso/ldso/dl-elf.c
> -+++ b/ldso/ldso/dl-elf.c
> -@@ -133,53 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
> +Index: git/ldso/ldso/dl-elf.c
> +===================================================================
> +--- git.orig/ldso/ldso/dl-elf.c	2012-01-23 19:18:58.000000000 -0800
> ++++ git/ldso/ldso/dl-elf.c	2012-01-23 21:52:06.144646590 -0800
> +@@ -133,53 +133,60 @@
>     * in uClibc/ldso/util/ldd.c */
>    static struct elf_resolve *
> - search_for_named_library(const char *name, int secure, const char *path_list,
> + search_for_named_library(const char *name, unsigned rflags, const char *path_list,
>   -	struct dyn_elf **rpnt)
> -+	struct dyn_elf **rpnt, const char *origin)
> ++	struct dyn_elf **rpnt, const char* origin)
>    {
>   -	char *path, *path_n, *mylibname;
>   +	char *mylibname;
> @@ -47,18 +47,6 @@ index 505247e..2b2d429 100644
>   -		if (*path == 0) {
>   -			*path = ':';
>   -			done = 1;
> --		}
> --		if (*path == ':') {
> --			*path = 0;
> --			if (*path_n)
> --				_dl_strcpy(mylibname, path_n);
> --			else
> --				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
> --			_dl_strcat(mylibname, "/");
> --			_dl_strcat(mylibname, name);
> --			if ((tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname)) != NULL)
> --				return tpnt;
> --			path_n = path+1;
>   +	for (p = path_list; p != NULL; p = pn) {
>   +		pn = _dl_strchr(p + 1, ':');
>   +		if (pn != NULL) {
> @@ -69,7 +57,7 @@ index 505247e..2b2d429 100644
>   +
>   +		if (plen>= 7&&  _dl_memcmp(p, "$ORIGIN", 7) == 0) {
>   +			int olen;
> -+			if (secure&&  plen != 7)
> ++			if (rflags&&  plen != 7)
>   +				continue;
>   +			if (origin == NULL)
>   +				continue;
> @@ -86,12 +74,24 @@ index 505247e..2b2d429 100644
>   +		} else {
>   +			_dl_strcpy(mylibname, ".");
>    		}
> +-		if (*path == ':') {
> +-			*path = 0;
> +-			if (*path_n)
> +-				_dl_strcpy(mylibname, path_n);
> +-			else
> +-				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
> +-			_dl_strcat(mylibname, "/");
> +-			_dl_strcat(mylibname, name);
> +-			if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
> +-				return tpnt;
> +-			path_n = path+1;
> +-		}
>   -		path++;
>   -	} while (!done);
>   +		_dl_strcat(mylibname, "/");
>   +		_dl_strcat(mylibname, name);
>   +
> -+		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
> ++		tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname);
>   +		if (tpnt != NULL)
>   +			return tpnt;
>   +	}
> @@ -99,44 +99,46 @@ index 505247e..2b2d429 100644
>    	return NULL;
>    }
>
> -@@ -231,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> +@@ -231,8 +238,10 @@
>    	if (pnt) {
>    		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>    		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
> --		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
> -+		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
> +-		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
> ++		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt,
>   +						      tpnt->libname)) != NULL)
>    			return tpnt1;
> ++
>    	}
>    #endif
> -@@ -239,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> +
> +@@ -240,7 +249,7 @@
>    	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
>    	if (_dl_library_path) {
>    		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
> --		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt)) != NULL)
> -+		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
> +-		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt)) != NULL)
> ++		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt, NULL)) != NULL)
>    		{
>    			return tpnt1;
>    		}
> -@@ -253,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> +@@ -254,7 +263,7 @@
>    	if (pnt) {
>    		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>    		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
> --		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
> -+		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
> +-		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
> ++		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt, NULL)) != NULL)
>    			return tpnt1;
>    	}
>    #endif
> -@@ -287,7 +295,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> +@@ -288,7 +297,7 @@
>    	/* Look for libraries wherever the shared library loader
>    	 * was installed */
>    	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
> --	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt);
> -+	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
> +-	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt);
> ++	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt, NULL);
>    	if (tpnt1 != NULL)
>    		return tpnt1;
> -
> -@@ -300,7 +308,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
> + #endif
> +@@ -301,7 +310,7 @@
>    #ifndef __LDSO_CACHE_SUPPORT__
>    					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
>    #endif
> @@ -145,12 +147,12 @@ index 505247e..2b2d429 100644
>    	if (tpnt1 != NULL)
>    		return tpnt1;
>
> -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
> -index 7ee9257..9423670 100644
> ---- a/ldso/ldso/ldso.c
> -+++ b/ldso/ldso/ldso.c
> -@@ -272,6 +272,20 @@ static void __attribute__ ((destructor)) __attribute_used__ _dl_fini(void)
> - 	}
> +Index: git/ldso/ldso/ldso.c
> +===================================================================
> +--- git.orig/ldso/ldso/ldso.c	2012-01-23 19:18:58.000000000 -0800
> ++++ git/ldso/ldso/ldso.c	2012-01-23 21:34:11.152594621 -0800
> +@@ -407,6 +407,20 @@
> + 	return p - list;
>    }
>
>   +static void _dl_setup_progname(const char *argv0)
> @@ -167,10 +169,10 @@ index 7ee9257..9423670 100644
>   +	}
>   +}
>   +
> - void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
> - 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,
> - 			  char **argv
> -@@ -321,9 +335,7 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
> + void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
> + 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
> + 			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
> +@@ -458,9 +472,7 @@
>    	 * been fixed up by now.  Still no function calls outside of this
>    	 * library, since the dynamic resolver is not yet ready.
>    	 */
> @@ -179,5 +181,5 @@ index 7ee9257..9423670 100644
>   -	}
>   +	_dl_setup_progname(argv[0]);
>
> + #ifndef __LDSO_STANDALONE_SUPPORT__
>    	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
> - 		_dl_dprintf(_dl_debug_file, "Standalone execution is not supported yet\n");
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
> similarity index 96%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
> index 339ce7f..3fa10af 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
> @@ -1,3 +1,9 @@
> +Add ppc copysignl implementation
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
>   Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
>   ===================================================================
>   --- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
> similarity index 93%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
> index 1930383..bee251c 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
> @@ -1,15 +1,8 @@
> -Index: git/include/features.h
> -===================================================================
> ---- git.orig/include/features.h
> -+++ git/include/features.h
> -@@ -186,7 +186,6 @@
> - # define __need_uClibc_config_h
> - # include<bits/uClibc_config.h>
> - # undef __need_uClibc_config_h
> --
> - /* For uClibc, always optimize for size -- this should disable
> -  * a lot of expensive inlining...
> -  * TODO: this is wrong! __OPTIMIZE_SIZE__ is an indicator of
> +Dont support localised optimizations this helps to have a global -O level
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
>   Index: git/libpthread/nptl/pthread_mutex_timedlock.c
>   ===================================================================
>   --- git.orig/libpthread/nptl/pthread_mutex_timedlock.c
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
> similarity index 96%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
> index 5638d47..c33bf8e 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
> @@ -181,4 +181,10 @@ UCLIBC_HAS_FLOATS=y
>
>   # needed by systemd
>   UCLIBC_HAS_UTMPX=y
> -
> +UCLIBC_LINUX_MODULE_26=y
> +UCLIBC_HAS_RESOLVER_SUPPORT=y
> +# needed for LTP
> +UCLIBC_SUSV4_LEGACY=y
> +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
> +DO_XSI_MATH=y
> +UCLIBC_SV4_DEPRECATED=y
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
> similarity index 100%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.machine
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
> similarity index 99%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
> index cd90a09..fe191fc 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
> @@ -12,6 +12,9 @@ Signed-off-by: Henning Heinold<heinold@inf.fu-berlin.de>
>    3 files changed, 46 insertions(+), 5 deletions(-)
>    create mode 100644 libc/unistd/execvpe.c
>
> +
> +Upstream-Status: Pending
> +
>   diff --git a/include/unistd.h b/include/unistd.h
>   index 9568790..070e4f2 100644
>   --- a/include/unistd.h
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
> similarity index 81%
> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
> index f8f3a7d..37a5988 100644
> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
> @@ -1,3 +1,8 @@
> +uclibc now has log2 so enable the tests
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
>   Index: uClibc/test/math/libm-test.inc
>   ===================================================================
>   --- uClibc/test/math/libm-test.inc	(revision 23784)
> diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
> similarity index 100%
> rename from meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb
> rename to meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
> diff --git a/meta/recipes-core/uclibc/uclibc_0.9.32.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
> similarity index 45%
> rename from meta/recipes-core/uclibc/uclibc_0.9.32.bb
> rename to meta/recipes-core/uclibc/uclibc_0.9.33.bb
> index 235b436..b559fd4 100644
> --- a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
> +++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
> @@ -1,34 +1,26 @@
> -SRCREV="9152c4d67c763fde5712e2d181d92c0d7e1e2ab9"
> +SRCREV="1548ee3ca582f3732136e71613c87c16230f71cc"
>
>   require uclibc.inc
> -PR = "${INC_PR}.3"
> +
> +PR = "${INC_PR}.0"
>   PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
>
>   SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
>   	file://uClibc.machine \
>   	file://uClibc.distro \
> -	file://uclibc-arm-ftruncate64.patch \
>   	file://uclibc_enable_log2_test.patch \
>   	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
> -	file://select-force-thumb.patch \
> -	file://remove-sub-arch-variants.patch \
> -	file://transform-eabi-oabi-choice.patch \
> -	file://include-arm-asm.h.patch \
> -	file://detect-bx-availibility.patch \
> -	file://remove-eabi-oabi-selection.patch \
>   	file://powerpc_copysignl.patch \
>   	file://argp-support.patch \
>   	file://argp-headers.patch \
>   	file://remove_attribute_optimize_Os.patch \
>   	file://compile-arm-fork-with-O2.patch \
> -	file://epoll-asm-fix.patch \
> -	file://orign_path.patch \
> -	file://rtld_no.patch \
> -	file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch \
> -	file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
>   	file://uclibc-execvpe.patch \
> -	file://uclibc_scheduler_update.patch \
> -	file://sync_file_range2.patch \
> -	file://mount.h-update.patch \
> +	file://orign_path.patch \
> +	file://dup3.patch \
> +	file://define-MSG_CMSG_CLOEXEC.patch \
> +	file://0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch \
> +	file://0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch \
>   	"
> +
>   S = "${WORKDIR}/git"



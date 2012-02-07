Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rutcu-0003rG-DN
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:35:05 +0100
Received: by lahc1 with SMTP id c1so4562153lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 14:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zxK/xvFAfEWnjiPftp9yXTORvGSDuuF7KljqeVCmJxE=;
	b=MT4/bCprpkzwsVmI088B00ElvYvqxzGRSyzxCG1hgR9H6zQZiEfL4RxK5TZtvEwmOR
	McjW2OE27sv3nnSVMRI1TolOeNYXMsA1lUEvQoSkJCsLzYIC7Mv32uO0JmO1paX0YhXZ
	r00nM2bwAl+D3qGh4Mp8FwGiH5J4Lsi6bR6xI=
Received: by 10.112.85.70 with SMTP id f6mr93502lbz.16.1328653621543; Tue, 07
	Feb 2012 14:27:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 14:26:31 -0800 (PST)
In-Reply-To: <4F317539.3030306@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c30ac7c104a3e52864b2bb11c7797dfceaabc76f.1328510188.git.raj.khem@gmail.com>
	<4F317539.3030306@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 14:26:31 -0800
Message-ID: <CAMKF1spCy+HgPY9ma2QzkgjJrgUqU73GG9d7dPz73BUVpu6VLA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 07 Feb 2012 22:35:05 -0000
Content-Type: multipart/alternative; boundary=f46d04016ca924444204b86747bf

--f46d04016ca924444204b86747bf
Content-Type: text/plain; charset=UTF-8

updated

On Tue, Feb 7, 2012 at 11:02 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>
>> Prefer 0.9.33 by default
>> Delete recipes for 0.9.32
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>  ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 --
>>  ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 --
>>  .../uclibc-0.9.32/detect-bx-availibility.patch     |   75 ----
>>  .../uclibc/uclibc-0.9.32/epoll-asm-fix.patch       |   25 --
>>  .../uclibc/uclibc-0.9.32/include-arm-asm.h.patch   |   65 ---
>>  .../uclibc/uclibc-0.9.32/mount.h-update.patch      |   85 ----
>>  .../uclibc-0.9.32/remove-eabi-oabi-selection.patch |   91 ----
>>  .../uclibc-0.9.32/remove-sub-arch-variants.patch   |  215 ---------
>>  .../uclibc/uclibc-0.9.32/rtld_no.patch             |  215 ---------
>>  .../uclibc/uclibc-0.9.32/select-force-thumb.patch  |  172 --------
>>  .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   47 --
>>  .../uclibc-0.9.32/transform-eabi-oabi-choice.patch |   71 ---
>>  .../uclibc-0.9.32/uclibc-arm-ftruncate64.patch     |   13 -
>>  .../uclibc-0.9.32/uclibc_scheduler_update.patch    |  455
>> --------------------
>>  ...rr-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch |   32 ++
>>  ...fstat-Use-64bit-version-of-syscall-if-ava.patch |  177 ++++++++
>>  .../argp-headers.patch                             |    2 +
>>  .../argp-support.patch                             |    3 +
>>  .../compile-arm-fork-with-O2.patch                 |    2 +-
>>  .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 ++
>>  meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 ++
>>  ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
>>  .../libc_symbols_include_bits_uclibc_config.patch  |   19 +
>>  .../mips/uClibc.machine                            |    0
>>  .../orign_path.patch                               |   94 ++--
>>  .../powerpc_copysignl.patch                        |    6 +
>>  .../remove_attribute_optimize_Os.patch             |   17 +-
>>  .../{uclibc-0.9.32 =>  uclibc-0.9.33}/uClibc.distro |    8 +-
>>  .../uClibc.machine                                 |    0
>>  .../uclibc-execvpe.patch                           |    3 +
>>  .../uclibc_enable_log2_test.patch                  |    5 +
>>  ...-initial_0.9.32.bb =>  uclibc-initial_0.9.33.bb} |    0
>>  .../uclibc/{uclibc_0.9.32.bb =>  uclibc_0.9.33.bb}  |   26 +-
>>  34 files changed, 386 insertions(+), 1669 deletions(-)
>>  delete mode 100644
>>
meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
>>  delete mode 100644
>>
meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
>>  delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
>>  delete mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
>>  create mode 100644
>>
meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
>>  create mode 100644
>>
meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
>
>
> Missing Upstream-Status in this patch
>
>> rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>
> uclibc-0.9.33}/argp-headers.patch (99%)
>>
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/argp-support.patch (99%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/compile-arm-fork-with-O2.patch (97%)
>>  create mode 100644
>> meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
>>  create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (86%)
>>  create mode 100644
>>
meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
>
>
> Also missing Upstream-Status.
>
>
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/mips/uClibc.machine (100%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/orign_path.patch (64%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/powerpc_copysignl.patch (96%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/remove_attribute_optimize_Os.patch (93%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/uClibc.distro (96%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/uClibc.machine (100%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/uclibc-execvpe.patch (99%)
>>  rename meta/recipes-core/uclibc/{uclibc-0.9.32 =>
>>  uclibc-0.9.33}/uclibc_enable_log2_test.patch (81%)
>>  rename meta/recipes-core/uclibc/{uclibc-initial_0.9.32.bb =>
>>  uclibc-initial_0.9.33.bb} (100%)
>>  rename meta/recipes-core/uclibc/{uclibc_0.9.32.bb =>  uclibc_0.9.33.bb}
>> (45%)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc
>> b/meta/conf/distro/include/tcmode-default.inc
>> index 5bb253e..b7c2160 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -20,7 +20,7 @@ GCCVERSION ?= "4.6%"
>>  SDKGCCVERSION ?= "4.6%"
>>  BINUVERSION ?= "2.22"
>>  EGLIBCVERSION ?= "2.13"
>> -UCLIBCVERSION ?= "0.9.32"
>> +UCLIBCVERSION ?= "0.9.33"
>>  LINUXLIBCVERSION ?= "3.1"
>>
>>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
>> deleted file mode 100644
>> index da97d38..0000000
>> ---
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 06cdcd2a9dd6b46b7fbb5b3ae0a62bdb7ee6c402 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj<raj.khem@gmail.com>
>> -Date: Mon, 27 Jun 2011 17:48:18 -0700
>> -Subject: [PATCH] Config.in.arch: Free UCLIBC_HAS_FPU setting from
>> depending on UCLIBC_HAS_FLOATS
>> -
>> -UCLIBC_HAS_FLOATS and UCLIBC_HAS_FPU are denoting two different aspects.
>> -UCLIBC_HAS_FLOATS covers the floating point operations which has nothing
>> -to do if you have FPU or not.
>> -
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ----
>> - extra/Configs/Config.in.arch |    1 -
>> - 1 files changed, 0 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
>> -index 5f7a2b0..c1ca390 100644
>> ---- a/extra/Configs/Config.in.arch
>> -+++ b/extra/Configs/Config.in.arch
>> -@@ -133,7 +133,6 @@ config UCLIBC_HAS_FLOATS
>> -
>> - config UCLIBC_HAS_FPU
>> -       bool "Target CPU has a floating point unit (FPU)"
>> --      depends on UCLIBC_HAS_FLOATS
>> -       default y
>> -       help
>> -         If your target CPU does not have a Floating Point Unit (FPU) or
>> a
>> ---
>> -1.7.0.4
>> -
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
>> deleted file mode 100644
>> index 6892ceb..0000000
>> ---
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From ecc7d34cbbaf83aae87b091555650ed33e27ed2e Mon Sep 17 00:00:00 2001
>> -From: Khem Raj<raj.khem@gmail.com>
>> -Date: Thu, 30 Jun 2011 00:32:11 -0700
>> -Subject: [PATCH] mips/signalfd.h: SFD_NONBLOCK for mips is 0200 unlike
>> 04000 commonly
>> -
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ----
>> - include/sys/signalfd.h |    9 +++++++++
>> - 1 files changed, 9 insertions(+), 0 deletions(-)
>> -
>> -diff --git a/include/sys/signalfd.h b/include/sys/signalfd.h
>> -index 8cee17c..f1cb63a 100644
>> ---- a/include/sys/signalfd.h
>> -+++ b/include/sys/signalfd.h
>> -@@ -64,6 +64,15 @@ enum
>> - # define SFD_NONBLOCK SFD_NONBLOCK
>> -   };
>> -
>> -+#elif defined __mips__
>> -+enum
>> -+  {
>> -+    SFD_CLOEXEC = 02000000,
>> -+# define SFD_CLOEXEC SFD_CLOEXEC
>> -+    SFD_NONBLOCK = 0200
>> -+# define SFD_NONBLOCK SFD_NONBLOCK
>> -+  };
>> -+
>> - #else
>> - enum
>> -   {
>> ---
>> -1.7.0.4
>> -
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
>> deleted file mode 100644
>> index 43d19fc..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
>> +++ /dev/null
>> @@ -1,75 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313307agb;
>> -        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
>> -Received: by 10.227.141.78 with SMTP id
>> l14mr16920947wbu.128.1294533919168;
>> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> w30si33755908wbd.17.2011.01.08.16.45.18;
>> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClHDo; Sun, 09 Jan 2011 01:45:18 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 6/7] ARM: detect BX availibility at build time
>> -Date: Sun,  9 Jan 2011 01:45:09 +0100
>>
>> -Message-Id:<
1294533910-19305-7-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -The "use BX" option is now a suggestion that BX be used if available.
>> -Use a macro to detect if BX is available at build time. If so, and
>> -the user requested it be used, then use it. Otherwise, error out.
>> -
>> -Macro courtesy Khem RAJ:
>> -  http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.html
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - extra/Configs/Config.arm              |    4 +++-
>> - libc/sysdeps/linux/arm/bits/arm_asm.h |    9 ++++++++-
>> - 2 files changed, 11 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
>> -index 227b90c..9aa9e56 100644
>> ---- a/extra/Configs/Config.arm
>> -+++ b/extra/Configs/Config.arm
>> -@@ -33,4 +33,6 @@ config COMPILE_IN_THUMB_MODE
>> - config USE_BX
>> -       bool "Use BX in function return"
>> -       help
>> --        Use BX instruction for THUMB aware architectures.
>> -+        Say 'y' to use BX to return from functions on your thumb-aware
>> -+        processor. Say 'y' if you need to use interworking. Say 'n' if
>> not.
>> -+        It is safe to say 'y' even if you're not doing interworking.
>> -diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h
>> b/libc/sysdeps/linux/arm/bits/arm_asm.h
>> -index 1d87df6..921c9a3 100644
>> ---- a/libc/sysdeps/linux/arm/bits/arm_asm.h
>> -+++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
>> -@@ -24,5 +24,12 @@
>> - #define THUMB1_ONLY 1
>> - #endif
>> -
>> --#endif /* _ARM_ASM_H */
>> -+#if defined(__USE_BX__)
>> -+# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
>> -+      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
>> -+     )
>> -+#  error Use of BX was requested, but is not available on the target
>> processor.
>> -+# endif /* ARCH level */
>> -+#endif /* __USE_BX__ */
>> -
>> -+#endif /* _ARM_ASM_H */
>> ---
>> -1.7.1
>> -
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
>> deleted file mode 100644
>> index bcd834d..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -Fix a compile error due to last argument to syscall() not being memory
>> addressable.
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Phil Blundell<philb@gnu.org>
>> -
>> -diff --git a/libc/sysdeps/linux/common/epoll.c
>> b/libc/sysdeps/linux/common/epoll.c
>> -index 85b0cfd..c034b2c 100644
>> ---- a/libc/sysdeps/linux/common/epoll.c
>> -+++ b/libc/sysdeps/linux/common/epoll.c
>> -@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
>> - int __libc_epoll_pwait(int epfd, struct epoll_event *events, int
>> maxevents,
>> -                                               int timeout, const
>> sigset_t *set)
>> - {
>> -+      int nsig = _NSIG / 8;
>> -       if (SINGLE_THREAD_P)
>> --              return INLINE_SYSCALL(epoll_pwait, 6, epfd, events,
>> maxevents, timeout, set, _NSIG / 8);
>> -+              return INLINE_SYSCALL(epoll_pwait, 6, epfd, events,
>> maxevents, timeout, set, nsig);
>> - # ifdef __UCLIBC_HAS_THREADS_NATIVE__
>> -       else {
>> -               int oldtype = LIBC_CANCEL_ASYNC ();
>> --              int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events,
>> maxevents, timeout, set, _NSIG / 8);
>> -+              int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events,
>> maxevents, timeout, set, nsig);
>> -               LIBC_CANCEL_RESET (oldtype);
>> -               return result;
>> -       }
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
>> deleted file mode 100644
>> index 55c312e..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
>> +++ /dev/null
>> @@ -1,65 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313304agb;
>> -        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
>> -Received: by 10.227.155.75 with SMTP id
r11mr17188266wbw.3.1294533918432;
>> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> k3si33753340wbx.29.2011.01.08.16.45.17;
>> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClHDf; Sun, 09 Jan 2011 01:45:17 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 5/7] ARM: #include<bits/arm_asm.h>  where __USE_BX__ is
>> used
>> -Date: Sun,  9 Jan 2011 01:45:08 +0100
>>
>> -Message-Id:<
1294533910-19305-6-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -The check for __USE_BX__ will be available in bits/arm_asm.h,
>> -so the latter must be included wherever the former is used.
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - ldso/ldso/arm/dl-startup.h      |    1 +
>> - libc/sysdeps/linux/arm/sysdep.h |    1 +
>> - 2 files changed, 2 insertions(+), 0 deletions(-)
>> -
>> -diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
>> -index a95389d..2dfdaff 100644
>> ---- a/ldso/ldso/arm/dl-startup.h
>> -+++ b/ldso/ldso/arm/dl-startup.h
>> -@@ -7,6 +7,7 @@
>> -  */
>> -
>> - #include<features.h>
>> -+#include<bits/arm_asm.h>
>> -
>> - #if !defined(__thumb__)
>> - __asm__(
>> -diff --git a/libc/sysdeps/linux/arm/sysdep.h
>> b/libc/sysdeps/linux/arm/sysdep.h
>> -index 013f88c..e498695 100644
>> ---- a/libc/sysdeps/linux/arm/sysdep.h
>> -+++ b/libc/sysdeps/linux/arm/sysdep.h
>> -@@ -21,6 +21,7 @@
>> - #define _LINUX_ARM_SYSDEP_H 1
>> -
>> - #include<common/sysdep.h>
>> -+#include<bits/arm_asm.h>
>> -
>> - #include<sys/syscall.h>
>> - /* For Linux we can use the system call table in the header file
>> ---
>> -1.7.1
>> -
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>> deleted file mode 100644
>> index 3508e0e..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>> +++ /dev/null
>> @@ -1,85 +0,0 @@
>> -Sync mount.h from glibc this is needed to get missing defines
>> -that some apps e.g. systemd are depending on
>> -
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> -
>> -Upstream-Status: Pending
>> -
>> -Index: git/include/sys/mount.h
>> -===================================================================
>> ---- git.orig/include/sys/mount.h       2011-07-21 14:37:27.134255747
>> -0700
>> -+++ git/include/sys/mount.h    2011-07-21 14:39:53.844470932 -0700
>> -@@ -1,5 +1,5 @@
>> - /* Header file for mounting/unmount Linux filesystems.
>> --   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software
Foundation,
>> Inc.
>> -+   Copyright (C) 1996-2000, 2004, 2010 Free Software Foundation, Inc.
>> -    This file is part of the GNU C Library.
>> -
>> -    The GNU C Library is free software; you can redistribute it and/or
>> -@@ -47,23 +47,46 @@
>> - #define MS_REMOUNT    MS_REMOUNT
>> -   MS_MANDLOCK = 64,           /* Allow mandatory locks on an FS.  */
>> - #define MS_MANDLOCK   MS_MANDLOCK
>> --  S_WRITE = 128,              /* Write on file/directory/symlink.  */
>> --#define S_WRITE               S_WRITE
>> --  S_APPEND = 256,             /* Append-only file.  */
>> --#define S_APPEND      S_APPEND
>> --  S_IMMUTABLE = 512,          /* Immutable file.  */
>> --#define S_IMMUTABLE   S_IMMUTABLE
>> -+  MS_DIRSYNC = 128,           /* Directory modifications are
>> synchronous.  */
>> -+#define MS_DIRSYNC    MS_DIRSYNC
>> -   MS_NOATIME = 1024,          /* Do not update access times.  */
>> - #define MS_NOATIME    MS_NOATIME
>> -   MS_NODIRATIME = 2048,               /* Do not update directory access
>> times.  */
>> - #define MS_NODIRATIME MS_NODIRATIME
>> -   MS_BIND = 4096,             /* Bind directory at different place.  */
>> - #define MS_BIND               MS_BIND
>> -+  MS_MOVE = 8192,
>> -+#define MS_MOVE               MS_MOVE
>> -+  MS_REC = 16384,
>> -+#define MS_REC                MS_REC
>> -+  MS_SILENT = 32768,
>> -+#define MS_SILENT     MS_SILENT
>> -+  MS_POSIXACL = 1<<  16,      /* VFS does not apply the umask.  */
>> -+#define MS_POSIXACL   MS_POSIXACL
>> -+  MS_UNBINDABLE = 1<<  17,    /* Change to unbindable.  */
>> -+#define MS_UNBINDABLE MS_UNBINDABLE
>> -+  MS_PRIVATE = 1<<  18,               /* Change to private.  */
>> -+#define MS_PRIVATE    MS_PRIVATE
>> -+  MS_SLAVE = 1<<  19,         /* Change to slave.  */
>> -+#define MS_SLAVE      MS_SLAVE
>> -+  MS_SHARED = 1<<  20,                /* Change to shared.  */
>> -+#define MS_SHARED     MS_SHARED
>> -+  MS_RELATIME = 1<<  21,      /* Update atime relative to mtime/ctime.
>>  */
>> -+#define MS_RELATIME   MS_RELATIME
>> -+  MS_KERNMOUNT = 1<<  22,     /* This is a kern_mount call.  */
>> -+#define MS_KERNMOUNT  MS_KERNMOUNT
>> -+  MS_I_VERSION =  1<<  23,    /* Update inode I_version field.  */
>> -+#define MS_I_VERSION  MS_I_VERSION
>> -+  MS_STRICTATIME = 1<<  24,   /* Always perform atime updates.  */
>> -+#define MS_STRICTATIME        MS_STRICTATIME
>> -+  MS_ACTIVE = 1<<  30,
>> -+#define MS_ACTIVE     MS_ACTIVE
>> -+  MS_NOUSER = 1<<  31
>> -+#define MS_NOUSER     MS_NOUSER
>> - };
>> -
>> - /* Flags that can be altered by MS_REMOUNT  */
>> --#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
>> --                   |MS_NODIRATIME)
>> -+#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
>> -
>> -
>> - /* Magic mount flag number. Has to be or-ed to the flag values.  */
>> -@@ -100,8 +123,10 @@
>> - #define MNT_FORCE MNT_FORCE
>> -   MNT_DETACH = 2,             /* Just detach from the tree.  */
>> - #define MNT_DETACH MNT_DETACH
>> --  MNT_EXPIRE = 4              /* Mark for expiry.  */
>> -+  MNT_EXPIRE = 4,             /* Mark for expiry.  */
>> - #define MNT_EXPIRE MNT_EXPIRE
>> -+  UMOUNT_NOFOLLOW = 8         /* Don't follow symlink on umount.  */
>> -+#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
>> - };
>> -
>> -
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
>> deleted file mode 100644
>> index 8f3464e..0000000
>> ---
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
>> +++ /dev/null
>> @@ -1,91 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313309agb;
>> -        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
>> -Received: by 10.216.173.7 with SMTP id u7mr612034wel.50.1294533919433;
>> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> e10si33752027wer.68.2011.01.08.16.45.19;
>> -        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClJDu; Sun, 09 Jan 2011 01:45:18 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 7/7] ARM: remove EABI/OABI selection
>> -Date: Sun,  9 Jan 2011 01:45:10 +0100
>>
>> -Message-Id:<
1294533910-19305-8-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -Rely on the compiler to be properly setup for the default ABI.
>> -
>> -When installing-headers, there are two cases:
>> -- NPTL: no issue, a cross-compiler is already expected
>> -- LinuxThreads: no issue, EABI/OABI has no impact on installed headers.
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - extra/Configs/Config.arm               |   11 -----------
>> - libc/sysdeps/linux/arm/Makefile.arch   |    9 +++++++--
>> - libc/sysdeps/linux/arm/bits/huge_val.h |    4 ++--
>> - 3 files changed, 9 insertions(+), 15 deletions(-)
>> -
>> -Index: git/libc/sysdeps/linux/arm/Makefile.arch
>> -===================================================================
>> ---- git.orig/libc/sysdeps/linux/arm/Makefile.arch
>> -+++ git/libc/sysdeps/linux/arm/Makefile.arch
>> -@@ -24,7 +24,12 @@ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
>> - CSRC += posix_fadvise.c posix_fadvise64.c
>> - endif
>> -
>> --ifeq ($(CONFIG_ARM_EABI),y)
>> -+# Is our compiler set up for EABI ?
>> -+IS_EABI:=$(shell $(CC) $(CFLAGS) -x c - -E -dM</dev/null 2>/dev/null \
>> -+                 |sed -r -e
>> '/^\#[[:space:]]*define[[:space:]]+__ARM_EABI__([[:space:]]+1)?$$/!d;
>> s/.+/y/;' \
>> -+          )
>> -+
>> -+ifeq ($(IS_EABI),y)
>> - CSRC += aeabi_assert.c aeabi_atexit.c aeabi_errno_addr.c \
>> -       aeabi_localeconv.c aeabi_memclr.c aeabi_memcpy.c \
>> -       aeabi_memmove.c aeabi_memset.c find_exidx.c
>> -@@ -37,7 +42,7 @@ else
>> - CSRC += syscall.c
>> - endif
>> -
>> --ifeq ($(CONFIG_ARM_EABI),y)
>> -+ifeq ($(IS_EABI),y)
>> - libc-static-y += $(ARCH_OUT)/aeabi_lcsts.o $(ARCH_OUT)/aeabi_math.o \
>> -       $(ARCH_OUT)/aeabi_sighandlers.o
>> - libc-nonshared-y += $(ARCH_OUT)/aeabi_lcsts.os
$(ARCH_OUT)/aeabi_math.os
>> \
>> -Index: git/libc/sysdeps/linux/arm/bits/huge_val.h
>> -===================================================================
>> ---- git.orig/libc/sysdeps/linux/arm/bits/huge_val.h
>> -+++ git/libc/sysdeps/linux/arm/bits/huge_val.h
>> -@@ -32,7 +32,7 @@
>> - # define HUGE_VAL (__extension__ 0x1.0p2047)
>> - #elif defined __GNUC__
>> -
>> --#ifndef __CONFIG_ARM_EABI__
>> -+#ifndef __ARM_EABI__
>> - # define HUGE_VAL \
>> -   (__extension__

>>    \
>> -    ((union { unsigned __l __attribute__((__mode__(__DI__))); double
__d;
>> })   \
>> -@@ -50,7 +50,7 @@
>> -
>> - typedef union { unsigned char __c[8]; double __d; } __huge_val_t;
>> -
>> --#ifndef __CONFIG_ARM_EABI__
>> -+#ifndef __ARM_EABI__
>> - # if __BYTE_ORDER == __BIG_ENDIAN
>> - #  define __HUGE_VAL_bytes    { 0, 0, 0, 0, 0x7f, 0xf0, 0, 0 }
>> - # endif
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
>> deleted file mode 100644
>> index 920a669..0000000
>> ---
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
>> +++ /dev/null
>> @@ -1,215 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313303agb;
>> -        Sat, 8 Jan 2011 16:45:18 -0800 (PST)
>> -Received: by 10.227.98.158 with SMTP id
>> q30mr1255804wbn.151.1294533917314;
>> -        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> r3si33749838wbr.54.2011.01.08.16.45.16;
>> -        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClGDS; Sun, 09 Jan 2011 01:45:16 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 3/7] ARM: remove sub-arch/variants selection from
>> menuconfig
>> -Date: Sun,  9 Jan 2011 01:45:06 +0100
>>
>> -Message-Id:<
1294533910-19305-4-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -Rely on the compiler to be correctly set up to generate
>> -appropriate code for the target variant.
>> -
>> -This exposes the Thumb option, as it is no longer auto-selected.
>> -The "Use BX" no longer depends on supported CPU to be selected,
>> -so it now defaults to 'n' as it shall work by default on CPUs
>> -that do not have BX.
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - Rules.mak                |   19 -------
>> - extra/Configs/Config.arm |  125
>> ++--------------------------------------------
>> - 2 files changed, 5 insertions(+), 139 deletions(-)
>> -
>> -diff --git a/Rules.mak b/Rules.mak
>> -index 2a16908..09741a6 100644
>> ---- a/Rules.mak
>> -+++ b/Rules.mak
>> -@@ -332,25 +332,6 @@ ifeq ($(TARGET_ARCH),arm)
>> -       OPTIMIZATION+=-fstrict-aliasing
>> -       CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=-mlittle-endian
>> -       CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=-mbig-endian
>> --      CPU_CFLAGS-$(CONFIG_GENERIC_ARM)+=
>> --      CPU_CFLAGS-$(CONFIG_ARM610)+=-mtune=arm610 -march=armv3
>> --      CPU_CFLAGS-$(CONFIG_ARM710)+=-mtune=arm710 -march=armv3
>> --      CPU_CFLAGS-$(CONFIG_ARM7TDMI)+=-mtune=arm7tdmi -march=armv4t
>> --      CPU_CFLAGS-$(CONFIG_ARM720T)+=-mtune=arm7tdmi -march=armv4t
>> --      CPU_CFLAGS-$(CONFIG_ARM920T)+=-mtune=arm9tdmi -march=armv4t
>> --      CPU_CFLAGS-$(CONFIG_ARM922T)+=-mtune=arm9tdmi -march=armv4t
>> --      CPU_CFLAGS-$(CONFIG_ARM926T)+=-mtune=arm9e -march=armv5te
>> --      CPU_CFLAGS-$(CONFIG_ARM10T)+=-mtune=arm10tdmi -march=armv5t
>> --      CPU_CFLAGS-$(CONFIG_ARM1136JF_S)+=-mtune=arm1136jf-s -march=armv6
>> --      CPU_CFLAGS-$(CONFIG_ARM1176JZ_S)+=-mtune=arm1176jz-s -march=armv6
>> --      CPU_CFLAGS-$(CONFIG_ARM1176JZF_S)+=-mtune=arm1176jzf-s
>> -march=armv6
>> --      CPU_CFLAGS-$(CONFIG_ARM_SA110)+=-mtune=strongarm110 -march=armv4
>> --      CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100
-march=armv4
>> --      CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call
>> check_gcc,-mtune=xscale,-mtune=strongarm110)
>> --      CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
>> --      CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt
>> -mabi=iwmmxt
>> --      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
>> --      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
>> -       CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
>> - endif
>> -
>> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
>> -index c9c40d4..6c75a00 100644
>> ---- a/extra/Configs/Config.arm
>> -+++ b/extra/Configs/Config.arm
>> -@@ -30,129 +30,14 @@ config CONFIG_ARM_EABI
>> -
>> - endchoice
>> -
>> --choice
>> --      prompt "Target Processor Type"
>> --      default CONFIG_GENERIC_ARM
>> --      help
>> --        This is the processor type of your CPU. This information is
used
>> for
>> --        optimizing purposes.  To build a library that will run on all
>> ARMCPU
>> --        types (albeit not optimally fast), you can specify "Generic
Arm"
>> here.
>> --        If you pick anything other than "Generic Arm", there is no
>> guarantee
>> --        that uClibc will even run on anything other than the selected
>> --        processor type.
>> --
>> --        Here are the settings recommended for greatest speed:
>> --        - "Generic Arm" select this if your compiler is already setup
to
>> --          optimize things properly, or if you want to run on pretty
much
>> --          everything, or you just don't much care.
>> --        - For anything else, pick the ARM core type that best matches
>> the
>> --          cpu you will be using on your device.
>> --
>> --        If you don't know what to do, choose "Generic Arm".
>> --
>> --config CONFIG_GENERIC_ARM
>> --      bool "Generic Arm"
>> --
>> --config CONFIG_ARM610
>> --      bool "Arm 610"
>> --      select ARCH_HAS_MMU
>> --
>> --config CONFIG_ARM710
>> --      bool "Arm 710"
>> --      select ARCH_HAS_MMU
>> --
>> --config CONFIG_ARM7TDMI
>> --      bool "Arm 7TDMI"
>> --      select ARCH_HAS_NO_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM720T
>> --      bool "Arm 720T"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM920T
>> --      bool "Arm 920T"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM922T
>> --      bool "Arm 922T"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM926T
>> --      bool "Arm 926T"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM10T
>> --      bool "Arm 10T"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM1136JF_S
>> --      bool "Arm 1136JF-S"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM1176JZ_S
>> --      bool "Arm 1176JZ-S"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM1176JZF_S
>> --      bool "Arm 1176JZF-S"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM_CORTEX_M3
>> --      bool "Arm Cortex-M3"
>> --      select ARCH_HAS_NO_MMU
>> --      select FORCE_THUMB
>> --
>> --config CONFIG_ARM_CORTEX_M1
>> --      bool "Arm Cortex-M1"
>> --      select ARCH_HAS_NO_MMU
>> --      select FORCE_THUMB
>> --
>> --config CONFIG_ARM_SA110
>> --      bool "Intel StrongArm SA-110"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM_SA1100
>> --      bool "Intel StrongArm SA-1100"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM_XSCALE
>> --      bool "Intel Xscale"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --config CONFIG_ARM_IWMMXT
>> --      bool "Intel Xscale With WMMX PXA27x"
>> --      select ARCH_HAS_MMU
>> --      select HAS_THUMB
>> --
>> --endchoice
>> --
>> --config HAS_THUMB
>> --      bool
>> --
>> --config FORCE_THUMB
>> --      bool
>> --      select HAS_THUMB
>> --      select COMPILE_IN_THUMB_MODE
>> --      select USE_BX
>> --
>> - config COMPILE_IN_THUMB_MODE
>> --      bool
>> -+      bool "Build using Thumb mode"
>> -+      select USE_BX
>> -+      help
>> -+        Say 'y' here to force building uClibc in thumb mode.
>> -+        Say 'n' to use your compiler's default mode.
>> -
>> - config USE_BX
>> -       bool "Use BX in function return"
>> --      default y
>> --      depends on HAS_THUMB
>> -       help
>> -         Use BX instruction for THUMB aware architectures.
>> ---
>> -1.7.1
>> -
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
>> deleted file mode 100644
>> index 30cb7f6..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
>> +++ /dev/null
>> @@ -1,215 +0,0 @@
>> -Patch is backported from
>> -http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html
>> -
>> -Upstream-Status: Pending
>> -
>> -diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h
>> -index 7fbb373..7102351 100644
>> ---- a/ldso/include/dl-elf.h
>> -+++ b/ldso/include/dl-elf.h
>> -@@ -25,16 +25,18 @@ static __inline__ void _dl_map_cache(void) { }
>> - static __inline__ void _dl_unmap_cache(void) { }
>> - #endif
>> -
>> -+#define DL_RESOLVE_SECURE             0x0001
>> -+#define DL_RESOLVE_NOLOAD             0x0002
>> -
>> - /* Function prototypes for non-static stuff in readelflib1.c */
>> - extern void _dl_parse_lazy_relocation_information(struct dyn_elf *rpnt,
>> -       unsigned long rel_addr, unsigned long rel_size);
>> - extern int _dl_parse_relocation_information(struct dyn_elf *rpnt,
>> -       unsigned long rel_addr, unsigned long rel_size);
>> --extern struct elf_resolve * _dl_load_shared_library(int secure,
>> -+extern struct elf_resolve * _dl_load_shared_library(int resolve_flags,
>> -       struct dyn_elf **rpnt, struct elf_resolve *tpnt, char
>> *full_libname,
>> -       int trace_loaded_objects);
>> --extern struct elf_resolve * _dl_load_elf_shared_library(int secure,
>> -+extern struct elf_resolve * _dl_load_elf_shared_library(int
>> resolve_flags,
>> -       struct dyn_elf **rpnt, char *libname);
>> - extern struct elf_resolve *_dl_check_if_named_library_is_loaded(const
>> char *full_libname,
>> -       int trace_loaded_objects);
>> -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
>> -index 2b2d429..6d35bf2 100644
>> ---- a/ldso/ldso/dl-elf.c
>> -+++ b/ldso/ldso/dl-elf.c
>> -@@ -132,7 +132,7 @@ _dl_protect_relro (struct elf_resolve *l)
>> - /* This function's behavior must exactly match that
>> -  * in uClibc/ldso/util/ldd.c */
>> - static struct elf_resolve *
>> --search_for_named_library(const char *name, int secure, const char
>> *path_list,
>> -+search_for_named_library(const char *name, int resolve_flags, const
char
>> *path_list,
>> -       struct dyn_elf **rpnt, const char *origin)
>> - {
>> -       char *mylibname;
>> -@@ -162,7 +162,7 @@ search_for_named_library(const char *name, int
>> secure, const char *path_list,
>> -
>> -               if (plen>= 7&&  _dl_memcmp(p, "$ORIGIN", 7) == 0) {
>> -                       int olen;
>> --                      if (secure&&  plen != 7)
>> -+                      if ((resolve_flags&  DL_RESOLVE_SECURE)&&  plen
!=
>> 7)
>> -                               continue;
>> -                       if (origin == NULL)
>> -                               continue;
>> -@@ -182,7 +182,7 @@ search_for_named_library(const char *name, int
>> secure, const char *path_list,
>> -               _dl_strcat(mylibname, "/");
>> -               _dl_strcat(mylibname, name);
>> -
>> --              tpnt = _dl_load_elf_shared_library(secure, rpnt,
>> mylibname);
>> -+              tpnt = _dl_load_elf_shared_library(resolve_flags, rpnt,
>> mylibname);
>> -               if (tpnt != NULL)
>> -                       return tpnt;
>> -       }
>> -@@ -194,7 +194,7 @@ search_for_named_library(const char *name, int
>> secure, const char *path_list,
>> - unsigned long _dl_error_number;
>> - unsigned long _dl_internal_error_number;
>> -
>> --struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf
>> **rpnt,
>> -+struct elf_resolve *_dl_load_shared_library(int resolve_flags, struct
>> dyn_elf **rpnt,
>> -       struct elf_resolve *tpnt, char *full_libname, int
attribute_unused
>> trace_loaded_objects)
>> - {
>> -       char *pnt;
>> -@@ -223,7 +223,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -
>> -       if (libname != full_libname) {
>> -               _dl_if_debug_dprint("\ttrying file='%s'\n",
full_libname);
>> --              tpnt1 = _dl_load_elf_shared_library(secure, rpnt,
>> full_libname);
>> -+              tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt,
>> full_libname);
>> -               if (tpnt1) {
>> -                       return tpnt1;
>> -               }
>> -@@ -238,7 +238,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -       if (pnt) {
>> -               pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>> -               _dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt,
>> -+              if ((tpnt1 = search_for_named_library(libname,
>> resolve_flags, pnt, rpnt,
>> -                                                     tpnt->libname)) !=
>> NULL)
>> -                       return tpnt1;
>> -       }
>> -@@ -247,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -       /* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
>> -       if (_dl_library_path) {
>> -               _dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n",
>> _dl_library_path);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> _dl_library_path, rpnt, NULL)) != NULL)
>> -+              if ((tpnt1 = search_for_named_library(libname,
>> resolve_flags, _dl_library_path, rpnt, NULL)) != NULL)
>> -               {
>> -                       return tpnt1;
>> -               }
>> -@@ -261,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -       if (pnt) {
>> -               pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>> -               _dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt, NULL)) != NULL)
>> -+              if ((tpnt1 = search_for_named_library(libname,
>> resolve_flags, pnt, rpnt, NULL)) != NULL)
>> -                       return tpnt1;
>> -       }
>> - #endif
>> -@@ -284,7 +284,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -                            || libent[i].flags == LIB_ELF_LIBC0
>> -                            || libent[i].flags == LIB_ELF_LIBC5)
>> -                       &&  _dl_strcmp(libname, strs +
libent[i].sooffset)
>> == 0
>> --                      &&  (tpnt1 = _dl_load_elf_shared_library(secure,
>> rpnt, strs + libent[i].liboffset))
>> -+                      &&  (tpnt1 =
>> _dl_load_elf_shared_library(resolve_flags, rpnt, strs +
>> libent[i].liboffset))
>> -                       ) {
>> -                               return tpnt1;
>> -                       }
>> -@@ -295,14 +295,14 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> -       /* Look for libraries wherever the shared library loader
>> -        * was installed */
>> -       _dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
>> --      tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath,
>> rpnt, NULL);
>> -+      tpnt1 = search_for_named_library(libname, resolve_flags,
>> _dl_ldsopath, rpnt, NULL);
>> -       if (tpnt1 != NULL)
>> -               return tpnt1;
>> -
>> -       /* Lastly, search the standard list of paths for the library.
>> -          This list must exactly match the list in
uClibc/ldso/util/ldd.c
>> */
>> -       _dl_if_debug_dprint("\tsearching full lib path list\n");
>> --      tpnt1 = search_for_named_library(libname, secure,
>> -+      tpnt1 = search_for_named_library(libname, resolve_flags,
>> -                                       UCLIBC_RUNTIME_PREFIX "lib:"
>> -                                       UCLIBC_RUNTIME_PREFIX "usr/lib"
>> - #ifndef __LDSO_CACHE_SUPPORT__
>> -@@ -329,7 +329,7 @@ goof:
>> -  * are required.
>> -  */
>> -
>> --struct elf_resolve *_dl_load_elf_shared_library(int secure,
>> -+struct elf_resolve *_dl_load_elf_shared_library(int resolve_flags,
>> -       struct dyn_elf **rpnt, char *libname)
>> - {
>> -       ElfW(Ehdr) *epnt;
>> -@@ -368,7 +368,7 @@ struct elf_resolve *_dl_load_elf_shared_library(int
>> secure,
>> -       }
>> -       /* If we are in secure mode (i.e. a setu/gid binary using
>> LD_PRELOAD),
>> -          we don't load the library if it isn't setuid. */
>> --      if (secure) {
>> -+      if (resolve_flags&  DL_RESOLVE_SECURE) {
>> -               if (!(st.st_mode&  S_ISUID)) {
>> -                       _dl_close(infile);
>> -                       return NULL;
>> -@@ -384,6 +384,10 @@ struct elf_resolve *_dl_load_elf_shared_library(int
>> secure,
>> -                       return tpnt;
>> -               }
>> -       }
>> -+      if (resolve_flags&  DL_RESOLVE_NOLOAD) {
>> -+              _dl_close(infile);
>> -+              return NULL;
>> -+      }
>> -       header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ |
>> PROT_WRITE,
>> -                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE,
>> -1, 0);
>> -       if (_dl_mmap_check_error(header)) {
>> -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
>> -index 9423670..b71af34 100644
>> ---- a/ldso/ldso/ldso.c
>> -+++ b/ldso/ldso/ldso.c
>> -@@ -646,7 +646,9 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt,
>> DL_LOADADDR_TYPE load_addr,
>> -                       if (!_dl_secure || _dl_strchr(str, '/') == NULL)
{
>> -                               _dl_if_debug_dprint("\tfile='%s';  needed
>> by '%s'\n", str, _dl_progname);
>> -
>> --                              tpnt1 =
>> _dl_load_shared_library(_dl_secure,&rpnt, NULL, str,
trace_loaded_objects);
>> -+                              tpnt1 = _dl_load_shared_library(
>> -+                                      _dl_secure ? DL_RESOLVE_SECURE :
>> 0,
>> -+                                      &rpnt, NULL, str,
>> trace_loaded_objects);
>> -                               if (!tpnt1) {
>> - #ifdef __LDSO_LDD_SUPPORT__
>> -                                       if (trace_loaded_objects)
>> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
>> -index 68cd579..edf38d2 100644
>> ---- a/ldso/libdl/libdl.c
>> -+++ b/ldso/libdl/libdl.c
>> -@@ -288,7 +288,7 @@ void *dlopen(const char *libname, int flag)
>> - #endif
>> -
>> -       /* A bit of sanity checking... */
>> --      if (!(flag&  (RTLD_LAZY|RTLD_NOW))) {
>> -+      if (!(flag&  (RTLD_LAZY|RTLD_NOW|RTLD_NOLOAD))) {
>> -               _dl_error_number = LD_BAD_HANDLE;
>> -               return NULL;
>> -       }
>> -@@ -358,8 +358,9 @@ void *dlopen(const char *libname, int flag)
>> -       /* Try to load the specified library */
>> -       _dl_if_debug_print("Trying to dlopen '%s', RTLD_GLOBAL:%d
>> RTLD_NOW:%d\n",
>> -                       (char*)libname, (flag&  RTLD_GLOBAL ? 1:0),
>> (now_flag&  RTLD_NOW ? 1:0));
>> --      tpnt = _dl_load_shared_library(0,&rpnt, tfrom, (char*)libname,
0);
>> -
>> -+      tpnt = _dl_load_shared_library((flag&  RTLD_NOLOAD) ?
>> DL_RESOLVE_NOLOAD : 0,
>> -+                                      &rpnt, tfrom, (char*)libname, 0);
>> -       if (tpnt == NULL) {
>> -               _dl_unmap_cache();
>> -               return NULL;
>> -diff --git a/libc/sysdeps/linux/common/bits/dlfcn.h
>> b/libc/sysdeps/linux/common/bits/dlfcn.h
>> -index 4bfbbff..47b42ad 100644
>> ---- a/libc/sysdeps/linux/common/bits/dlfcn.h
>> -+++ b/libc/sysdeps/linux/common/bits/dlfcn.h
>> -@@ -24,9 +24,9 @@
>> - /* The MODE argument to `dlopen' contains one of the following: */
>> - #define RTLD_LAZY     0x00001 /* Lazy function call binding.  */
>> - #define RTLD_NOW      0x00002 /* Immediate function call binding.  */
>> --#if 0 /* uClibc doesnt support these */
>> --#define       RTLD_BINDING_MASK   0x3 /* Mask of binding time value.
 */
>> -+#define RTLD_BINDING_MASK   0x3       /* Mask of binding time value.
 */
>> - #define RTLD_NOLOAD   0x00004 /* Do not load the object.  */
>> -+#if 0 /* uClibc doesnt support these */
>> - #define RTLD_DEEPBIND 0x00008 /* Use deep binding.  */
>> - #endif
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
>> deleted file mode 100644
>> index b19408f..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
>> +++ /dev/null
>> @@ -1,172 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313301agb;
>> -        Sat, 8 Jan 2011 16:45:17 -0800 (PST)
>> -Received: by 10.216.186.82 with SMTP id
>> v60mr20017574wem.56.1294533916559;
>> -        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> o13si33755824wee.56.2011.01.08.16.45.16;
>> -        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClFDL; Sun, 09 Jan 2011 01:45:16 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 2/7] ARM: introduce blind options to select&  force
THUMB
>> mode
>> -Date: Sun,  9 Jan 2011 01:45:05 +0100
>>
>> -Message-Id:<
1294533910-19305-3-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -Add three new blind options to set use of Thumb mode:
>> -- COMPILE_IN_THUMB_MODE
>> -  - if set, CFLAGS will contain -mthumb
>> -  - if unset, the compiler's default is used
>> -- HAS_THUMB
>> -  - CPUS with Thumb instruction set can select this
>> -  - use of BX depends on this
>> -- FORCE_THUMB
>> -  - CPUs that are Thumb-only must select this
>> -  - this selects: HAS_THUMB, COMPILE_IN_THUMB_MODE and USE_BX
>> -
>> -Also, remove leading space in Rules.mak.
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - Rules.mak                |    7 ++++---
>> - extra/Configs/Config.arm |   31 ++++++++++++++++++++++++++++---
>> - 2 files changed, 32 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/Rules.mak b/Rules.mak
>> -index eecdc64..2a16908 100644
>> ---- a/Rules.mak
>> -+++ b/Rules.mak
>> -@@ -348,9 +348,10 @@ ifeq ($(TARGET_ARCH),arm)
>> -       CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100
-march=armv4
>> -       CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call
>> check_gcc,-mtune=xscale,-mtune=strongarm110)
>> -       CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
>> --      CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt
>> -mabi=iwmmxt
>> --      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3 -mthumb
>> --      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1 -mthumb
>> -+      CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt
>> -mabi=iwmmxt
>> -+      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
>> -+      CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
>> -+      CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
>> - endif
>> -
>> - ifeq ($(TARGET_ARCH),mips)
>> -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
>> -index 3b90e67..c9c40d4 100644
>> ---- a/extra/Configs/Config.arm
>> -+++ b/extra/Configs/Config.arm
>> -@@ -64,70 +64,95 @@ config CONFIG_ARM710
>> - config CONFIG_ARM7TDMI
>> -       bool "Arm 7TDMI"
>> -       select ARCH_HAS_NO_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM720T
>> -       bool "Arm 720T"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM920T
>> -       bool "Arm 920T"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM922T
>> -       bool "Arm 922T"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM926T
>> -       bool "Arm 926T"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM10T
>> -       bool "Arm 10T"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM1136JF_S
>> -       bool "Arm 1136JF-S"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM1176JZ_S
>> -       bool "Arm 1176JZ-S"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM1176JZF_S
>> -       bool "Arm 1176JZF-S"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM_CORTEX_M3
>> -       bool "Arm Cortex-M3"
>> -       select ARCH_HAS_NO_MMU
>> --      select USE_BX
>> -+      select FORCE_THUMB
>> -
>> - config CONFIG_ARM_CORTEX_M1
>> -       bool "Arm Cortex-M1"
>> -       select ARCH_HAS_NO_MMU
>> --      select USE_BX
>> -+      select FORCE_THUMB
>> -
>> - config CONFIG_ARM_SA110
>> -       bool "Intel StrongArm SA-110"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM_SA1100
>> -       bool "Intel StrongArm SA-1100"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM_XSCALE
>> -       bool "Intel Xscale"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - config CONFIG_ARM_IWMMXT
>> -       bool "Intel Xscale With WMMX PXA27x"
>> -       select ARCH_HAS_MMU
>> -+      select HAS_THUMB
>> -
>> - endchoice
>> -
>> -+config HAS_THUMB
>> -+      bool
>> -+
>> -+config FORCE_THUMB
>> -+      bool
>> -+      select HAS_THUMB
>> -+      select COMPILE_IN_THUMB_MODE
>> -+      select USE_BX
>> -+
>> -+config COMPILE_IN_THUMB_MODE
>> -+      bool
>> -+
>> - config USE_BX
>> -       bool "Use BX in function return"
>> -       default y
>> --      depends on !CONFIG_GENERIC_ARM&&  !CONFIG_ARM610&&
 !CONFIG_ARM710
>> -+      depends on HAS_THUMB
>> -       help
>> -         Use BX instruction for THUMB aware architectures.
>> ---
>> -1.7.1
>> -
>> diff --git
a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>> deleted file mode 100644
>> index 4b85a43..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -Some architectures like ppc, arm use aligned 64 bit inputs so a register
>> is not wasted
>> -this then uses __NR_sync_file_range2 syscall. Implement is
>> -
>> -Singed-off-by: Khem Raj<raj.khem@gmail.com>
>> -
>> -Upstream-Status: Pending
>> -
>> -Index: git/libc/sysdeps/linux/common/sync_file_range.c
>> -===================================================================
>> ---- git.orig/libc/sysdeps/linux/common/sync_file_range.c
2011-07-19
>> 14:23:35.000000000 -0700
>> -+++ git/libc/sysdeps/linux/common/sync_file_range.c    2011-07-19
>> 15:04:38.631808666 -0700
>> -@@ -11,7 +11,8 @@
>> - #if defined __USE_GNU
>> - #include<fcntl.h>
>> -
>> --#if defined __NR_sync_file_range&&  defined __UCLIBC_HAS_LFS__
>> -+#if defined __UCLIBC_HAS_LFS__
>> -+#if defined __NR_sync_file_range
>> - #define __NR___syscall_sync_file_range __NR_sync_file_range
>> - static __inline__ _syscall6(int, __syscall_sync_file_range, int, fd,
>> -               off_t, offset_hi, off_t, offset_lo,
>> -@@ -23,5 +24,23 @@
>> -               __LONG_LONG_PAIR((long)(nbytes>>  32), (long)(nbytes&
>>  0xffffffff)),
>> -               flags);
>> - }
>> --#endif
>> --#endif
>> -+#elif defined __NR_sync_file_range2
>> -+#define __NR___syscall_sync_file_range2 __NR_sync_file_range2
>> -+static __inline__ _syscall6(int, __syscall_sync_file_range2, int, fd,
>> -+              unsigned int, flags, off_t, offset_hi, off_t, offset_lo,
>> -+              off_t, nbytes_hi, off_t, nbytes_lo)
>> -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned
int
>> flags)
>> -+{
>> -+      return __syscall_sync_file_range2(fd, flags,
>> -+              __LONG_LONG_PAIR((long)(offset>>  32), (long)(offset&
>>  0xffffffff)),
>> -+              __LONG_LONG_PAIR((long)(nbytes>>  32), (long)(nbytes&
>>  0xffffffff)));
>> -+}
>> -+#else
>> -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned
int
>> flags)
>> -+{
>> -+      __set_errno (ENOSYS);
>> -+      return -1
>> -+}
>> -+#endif /* __NR_sync_file_range */
>> -+#endif /* __UCLIBC_HAS_LFS__ */
>> -+#endif /* __USE_GNU */
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
>> deleted file mode 100644
>> index 82970ca..0000000
>> ---
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
>> +++ /dev/null
>> @@ -1,71 +0,0 @@
>> -Delivered-To: raj.khem@gmail.com
>> -Received: by 10.90.86.4 with SMTP id j4cs313305agb;
>> -        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
>> -Received: by 10.216.153.210 with SMTP id
>> f60mr573848wek.114.1294533918335;
>> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
>> -Return-Path:<yann.morin.1998@anciens.enib.fr>
>> -Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
>> [80.12.242.123])
>> -        by mx.google.com with ESMTP id
>> n4si33737071wej.152.2011.01.08.16.45.17;
>> -        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
>> -Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted
nor
>> denied by best guess record for domain of yann.morin.1998@anciens.enib.fr
)
>> client-ip=80.12.242.123;
>> -Authentication-Results: mx.google.com; spf=neutral (google.com:
>> 80.12.242.123 is neither permitted nor denied by best guess record for
>> domain of yann.morin.1998@anciens.enib.fr)
>> smtp.mail=yann.morin.1998@anciens.enib.fr
>> -Received: from roazhon.bzh.lan ([90.32.245.227])
>> -       by mwinf5d24 with ME
>> -       id tClC1f0024v5z3u03ClGDX; Sun, 09 Jan 2011 01:45:17 +0100
>> -From: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -To: uclibc@uclibc.org
>> -Cc: Khem Raj<raj.khem@gmail.com>,
>> -       Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>,
>> -       Carmelo AMOROSO<carmelo.amoroso@st.com>
>> -Subject: [PATCH 4/7] ARM: transform the EABI/OABI choice into a boolean
>> -Date: Sun,  9 Jan 2011 01:45:07 +0100
>>
>> -Message-Id:<
1294533910-19305-5-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -X-Mailer: git-send-email 1.7.1
>>
>> -In-Reply-To:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>>
>> -References:<
1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
>> -
>> -The CONFIG_ARM_OABI option is never used.
>> -
>> -Signed-off-by: "Yann E. MORIN"<yann.morin.1998@anciens.enib.fr>
>> -Cc: Khem Raj<raj.khem@gmail.com>
>> -Cc: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> -Cc: Carmelo AMOROSO<carmelo.amoroso@st.com>
>> ----
>> - extra/Configs/Config.arm |   23 ++++++++---------------
>> - 1 files changed, 8 insertions(+), 15 deletions(-)
>> -
>> -Index: git/extra/Configs/Config.arm
>> -===================================================================
>> ---- git.orig/extra/Configs/Config.arm
>> -+++ git/extra/Configs/Config.arm
>> -@@ -12,23 +12,16 @@ config FORCE_OPTIONS_FOR_ARCH
>> -       default y
>> -       select ARCH_ANY_ENDIAN
>> -
>> --choice
>> --      prompt "Target ABI"
>> --      default CONFIG_ARM_EABI
>> -+config CONFIG_ARM_EABI
>> -+      bool "Build for EABI"
>> -       help
>> --        If you choose "EABI" here, functions and constants required by
>> the
>> --        ARM EABI will be built into the library.  You should choose
>> "EABI"
>> -+        If you say 'y' here, functions and constants required by the
>> -+        ARM EABI will be built into the library.  You should say 'y'
>> -         if your compiler uses the ARM EABI, in which case you will also
>> --        need a kernel supporting the EABI system call interface, or
>> "OABI"
>> --        for a compiler using the old Linux ABI.
>> --
>> --config CONFIG_ARM_OABI
>> --      bool "OABI"
>> --
>> --config CONFIG_ARM_EABI
>> --      bool "EABI"
>> -+        need a kernel supporting the EABI system call interface.
>> -
>> --endchoice
>> -+        If you say 'n' here, then the library will be built for the
>> -+        old Linux ABI.
>> -
>> - config COMPILE_IN_THUMB_MODE
>> -       bool "Build using Thumb mode"
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
>> deleted file mode 100644
>> index 504d37b..0000000
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -Index: uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
>> -===================================================================
>> ----
uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
>> -+++ uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
>> -@@ -38,4 +38,8 @@
>> - /* define if target supports IEEE signed zero floats */
>> - #define __UCLIBC_HAVE_SIGNED_ZERO__
>> -
>> -+#ifdef __ARM_EABI__
>> -+# define __UCLIBC_TRUNCATE64_HAS_4_ARGS__
>> -+#endif
>> -+
>> - #endif /* _BITS_UCLIBC_ARCH_FEATURES_H */
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
>> deleted file mode 100644
>> index 78401bd..0000000
>> ---
a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
>> +++ /dev/null
>> @@ -1,455 +0,0 @@
>> -From 2becc16ecbef71c496644d9dc6cbd7383d7cdca3 Mon Sep 17 00:00:00 2001
>> -From: Henning Heinold<heinold@inf.fu-berlin.de>
>> -Date: Sat, 4 Jun 2011 21:21:41 +0200
>> -Subject: [PATCH 1/2] libc: updates the linux scheduler functions, most
>> stuff
>> - was taken from the eglibc
>> -
>> -
>> -Signed-off-by: Henning Heinold<heinold@inf.fu-berlin.de>
>> ----
>> - include/sched.h                            |   52 ++++++++++++----
>> - libc/sysdeps/linux/common/Makefile.in      |    4 +-
>> - libc/sysdeps/linux/common/bits/sched.h     |   96
>> +++++++++++++++++++++++-----
>> - libc/sysdeps/linux/common/sched_cpualloc.c |   27 ++++++++
>> - libc/sysdeps/linux/common/sched_cpucount.c |   60 +++++++++++++++++
>> - libc/sysdeps/linux/common/sched_cpufree.c  |   27 ++++++++
>> - libc/sysdeps/linux/common/sched_getcpu.c   |   37 +++++++++++
>> - libc/sysdeps/linux/common/unshare.c        |   12 ++++
>> - 8 files changed, 286 insertions(+), 29 deletions(-)
>> - create mode 100644 libc/sysdeps/linux/common/sched_cpualloc.c
>> - create mode 100644 libc/sysdeps/linux/common/sched_cpucount.c
>> - create mode 100644 libc/sysdeps/linux/common/sched_cpufree.c
>> - create mode 100644 libc/sysdeps/linux/common/sched_getcpu.c
>> - create mode 100644 libc/sysdeps/linux/common/unshare.c
>> -
>> -diff --git a/include/sched.h b/include/sched.h
>> -index 0d110c3..e265b84 100644
>> ---- a/include/sched.h
>> -+++ b/include/sched.h
>> -@@ -1,5 +1,5 @@
>> - /* Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling
>> interface.
>> --   Copyright (C) 1996,1997,1999,2001-2003,2004 Free Software
Foundation,
>> Inc.
>> -+   Copyright (C) 1996,1997,1999,2001-2004,2007 Free Software
Foundation,
>> Inc.
>> -    This file is part of the GNU C Library.
>> -
>> -    The GNU C Library is free software; you can redistribute it and/or
>> -@@ -25,6 +25,9 @@
>> - /* Get type definitions.  */
>> - #include<bits/types.h>
>> -
>> -+#define __need_size_t
>> -+#include<stddef.h>
>> -+
>> - #define __need_timespec
>> - #include<time.h>
>> -
>> -@@ -65,11 +68,42 @@ extern int sched_rr_get_interval (__pid_t __pid,
>> struct timespec *__t) __THROW;
>> -
>> - #if defined __USE_GNU&&  defined __UCLIBC_LINUX_SPECIFIC__
>> - /* Access macros for `cpu_set'.  */
>> --#define CPU_SETSIZE __CPU_SETSIZE
>> --#define CPU_SET(cpu, cpusetp) __CPU_SET (cpu, cpusetp)
>> --#define CPU_CLR(cpu, cpusetp) __CPU_CLR (cpu, cpusetp)
>> --#define CPU_ISSET(cpu, cpusetp)       __CPU_ISSET (cpu, cpusetp)
>> --#define CPU_ZERO(cpusetp)     __CPU_ZERO (cpusetp)
>> -+# define CPU_SETSIZE __CPU_SETSIZE
>> -+# define CPU_SET(cpu, cpusetp)         __CPU_SET_S (cpu, sizeof
>> (cpu_set_t), cpusetp)
>> -+# define CPU_CLR(cpu, cpusetp)         __CPU_CLR_S (cpu, sizeof
>> (cpu_set_t), cpusetp)
>> -+# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof
(cpu_set_t),
>> \
>> -+                                              cpusetp)
>> -+# define CPU_ZERO(cpusetp)     __CPU_ZERO_S (sizeof (cpu_set_t),
>> cpusetp)
>> -+# define CPU_COUNT(cpusetp)    __CPU_COUNT_S (sizeof (cpu_set_t),
>> cpusetp)
>> -+
>> -+# define CPU_SET_S(cpu, setsize, cpusetp)   __CPU_SET_S (cpu, setsize,
>> cpusetp)
>> -+# define CPU_CLR_S(cpu, setsize, cpusetp)   __CPU_CLR_S (cpu, setsize,
>> cpusetp)
>> -+# define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu,
setsize,
>> \
>> -+                                                         cpusetp)
>> -+# define CPU_ZERO_S(setsize, cpusetp)     __CPU_ZERO_S (setsize,
>> cpusetp)
>> -+# define CPU_COUNT_S(setsize, cpusetp)            __CPU_COUNT_S
>> (setsize, cpusetp)
>> -+
>> -+# define CPU_EQUAL(cpusetp1, cpusetp2) \
>> -+  __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
>> -+# define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
>> -+  __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
>> -+
>> -+# define CPU_AND(destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2,&)
>> -+# define CPU_OR(destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)
>> -+# define CPU_XOR(destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)
>> -+# define CPU_AND_S(setsize, destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2,&)
>> -+# define CPU_OR_S(setsize, destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2, |)
>> -+# define CPU_XOR_S(setsize, destset, srcset1, srcset2) \
>> -+  __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)
>> -+
>> -+# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
>> -+# define CPU_ALLOC(count) __CPU_ALLOC (count)
>> -+# define CPU_FREE(cpuset) __CPU_FREE (cpuset)
>> -
>> -
>> - /* Set the CPU affinity for a task */
>> -@@ -79,12 +113,6 @@ extern int sched_setaffinity (__pid_t __pid, size_t
>> __cpusetsize,
>> - /* Get the CPU affinity for a task */
>> - extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
>> -                             cpu_set_t *__cpuset) __THROW;
>> --
>> --extern int __clone (int (*__fn) (void *__arg), void *__child_stack,
>> --                  int __flags, void *__arg, ...);
>> --extern int __clone2 (int (*__fn) (void *__arg), void
>> *__child_stack_base,
>> --                   size_t __child_stack_size, int __flags, void *__arg,
>> ...);
>> --
>> - #endif
>> -
>> - __END_DECLS
>> -diff --git a/libc/sysdeps/linux/common/Makefile.in
>> b/libc/sysdeps/linux/common/Makefile.in
>> -index 8f936ff..cb8c153 100644
>> ---- a/libc/sysdeps/linux/common/Makefile.in
>> -+++ b/libc/sysdeps/linux/common/Makefile.in
>> -@@ -22,9 +22,11 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += capget.c capset.c
>> inotify.c ioperm.c iopl.c \
>> -       modify_ldt.c pipe2.c personality.c ppoll.c prctl.c \
>> -       readahead.c reboot.c \
>> -       remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
>> -+      sched_cpualloc.c sched_cpucount.c sched_cpufree.c \
>> -       sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
>> -       splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
>> --      sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c
>> -+      sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c \
>> -+      uselib.c vhangup.c
>> - # NPTL needs these internally: madvise.c
>> - CSRC-$(findstring
>> y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) += madvise.c
>> - ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
>> -diff --git a/libc/sysdeps/linux/common/bits/sched.h
>> b/libc/sysdeps/linux/common/bits/sched.h
>> -index b48a0c8..fea66a8 100644
>> ---- a/libc/sysdeps/linux/common/bits/sched.h
>> -+++ b/libc/sysdeps/linux/common/bits/sched.h
>> -@@ -1,6 +1,7 @@
>> - /* Definitions of constants and data structure for POSIX 1003.1b-1993
>> -    scheduling interface.
>> --   Copyright (C) 1996-1999,2001-2003,2005,2006 Free Software
Foundation,
>> Inc.
>> -+   Copyright (C) 1996-1999,2001-2003,2005,2006,2007,2008
>> -+   Free Software Foundation, Inc.
>> -    This file is part of the GNU C Library.
>> -
>> -    The GNU C Library is free software; you can redistribute it and/or
>> -@@ -58,7 +59,13 @@
>> -                                     force CLONE_PTRACE on this clone.
>>  */
>> - # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer
>> in
>> -                                         the child.  */
>> --# define CLONE_STOPPED        0x02000000 /* Start in stopped state.  */
>> -+# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
>> -+# define CLONE_NEWUTS 0x04000000      /* New utsname group.  */
>> -+# define CLONE_NEWIPC 0x08000000      /* New ipcs.  */
>> -+# define CLONE_NEWUSER        0x10000000      /* New user namespace.
 */
>> -+# define CLONE_NEWPID 0x20000000      /* New pid namespace.  */
>> -+# define CLONE_NEWNET 0x40000000      /* New network namespace.  */
>> -+# define CLONE_IO     0x80000000      /* Clone I/O context.  */
>> - #endif
>> -
>> - /* The official definition.  */
>> -@@ -74,10 +81,11 @@ __BEGIN_DECLS
>> - extern int clone (int (*__fn) (void *__arg), void *__child_stack,
>> -                 int __flags, void *__arg, ...) __THROW;
>> -
>> --#if 0
>> - /* Unshare the specified resources.  */
>> - extern int unshare (int __flags) __THROW;
>> --#endif
>> -+
>> -+/* Get index of currently used CPU.  */
>> -+extern int sched_getcpu (void) __THROW;
>> - #endif
>> -
>> - __END_DECLS
>> -@@ -102,7 +110,7 @@ struct __sched_param
>> - # define __CPU_SETSIZE        1024
>> - # define __NCPUBITS   (8 * sizeof (__cpu_mask))
>> -
>> --/* Type for array elements in 'cpu_set'.  */
>> -+/* Type for array elements in 'cpu_set_t'.  */
>> - typedef unsigned long int __cpu_mask;
>> -
>> - /* Basic access functions.  */
>> -@@ -116,17 +124,73 @@ typedef struct
>> - } cpu_set_t;
>> -
>> - /* Access functions for CPU masks.  */
>> --# define __CPU_ZERO(cpusetp) \
>> -+# define __CPU_ZERO_S(setsize, cpusetp) \
>> -   do {

>>            \
>> --    unsigned int __i;
>>     \
>> --    cpu_set_t *__arr = (cpusetp);
>>     \
>> --    for (__i = 0; __i<  sizeof (cpu_set_t) / sizeof (__cpu_mask);
++__i)
>>      \
>> --      __arr->__bits[__i] = 0;
>>     \
>> -+    size_t __i;
>>             \
>> -+    size_t __imax = (setsize) / sizeof (__cpu_mask);

>>    \
>> -+    __cpu_mask *__bits = (cpusetp)->__bits;
>>     \
>> -+    for (__i = 0; __i<  __imax; ++__i)

>>            \
>> -+      __bits[__i] = 0;

>>            \
>> -   } while (0)
>> --# define __CPU_SET(cpu, cpusetp) \
>> --  ((cpusetp)->__bits[__CPUELT (cpu)] |= __CPUMASK (cpu))
>> --# define __CPU_CLR(cpu, cpusetp) \
>> --  ((cpusetp)->__bits[__CPUELT (cpu)]&= ~__CPUMASK (cpu))
>> --# define __CPU_ISSET(cpu, cpusetp) \
>> --  (((cpusetp)->__bits[__CPUELT (cpu)]&  __CPUMASK (cpu)) != 0)
>> -+# define __CPU_SET_S(cpu, setsize, cpusetp) \
>> -+  (__extension__

>>    \
>> -+   ({ size_t __cpu = (cpu);
>>     \
>> -+      __cpu<  8 * (setsize)
>>     \
>> -+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]
>>             \
>> -+       |= __CPUMASK (__cpu))

>>    \
>> -+      : 0; }))
>> -+# define __CPU_CLR_S(cpu, setsize, cpusetp) \
>> -+  (__extension__

>>    \
>> -+   ({ size_t __cpu = (cpu);
>>     \
>> -+      __cpu<  8 * (setsize)
>>     \
>> -+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]
>>             \
>> -+      &= ~__CPUMASK (__cpu))

>>    \
>> -+      : 0; }))
>> -+# define __CPU_ISSET_S(cpu, setsize, cpusetp) \
>> -+  (__extension__

>>    \
>> -+   ({ size_t __cpu = (cpu);
>>     \
>> -+      __cpu<  8 * (setsize)
>>     \
>> -+      ? ((((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]

>>    \
>> -+      &  __CPUMASK (__cpu))) != 0
>>     \
>> -+      : 0; }))
>> -+
>> -+# define __CPU_COUNT_S(setsize, cpusetp) \
>> -+  __sched_cpucount (setsize, cpusetp)
>> -+
>> -+# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
>> -+  (__extension__

>>    \
>> -+   ({ __cpu_mask *__arr1 = (cpusetp1)->__bits;

>>            \
>> -+      __cpu_mask *__arr2 = (cpusetp2)->__bits;

>>            \
>> -+      size_t __imax = (setsize) / sizeof (__cpu_mask);

>>            \
>> -+      size_t __i;
>>     \
>> -+      for (__i = 0; __i<  __imax; ++__i)

>>    \
>> -+      if (__arr1[__i] != __arr2[__i])
>>     \
>> -+        break;

>>    \
>> -+      __i == __imax; }))
>> -+
>> -+# define __CPU_OP_S(setsize, destset, srcset1, srcset2, op) \
>> -+  (__extension__

>>    \
>> -+   ({ cpu_set_t *__dest = (destset);

>>    \
>> -+      __cpu_mask *__arr1 = (srcset1)->__bits;
>>     \
>> -+      __cpu_mask *__arr2 = (srcset2)->__bits;
>>     \
>> -+      size_t __imax = (setsize) / sizeof (__cpu_mask);

>>            \
>> -+      size_t __i;
>>     \
>> -+      for (__i = 0; __i<  __imax; ++__i)

>>    \
>> -+      ((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op
__arr2[__i];
>>    \
>> -+      __dest; }))
>> -+
>> -+# define __CPU_ALLOC_SIZE(count) \
>> -+  ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))
>> -+# define __CPU_ALLOC(count) __sched_cpualloc (count)
>> -+# define __CPU_FREE(cpuset) __sched_cpufree (cpuset)
>> -+
>> -+__BEGIN_DECLS
>> -+
>> -+extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
>> -+  __THROW;
>> -+extern cpu_set_t *__sched_cpualloc (size_t __count) __THROW __wur;
>> -+extern void __sched_cpufree (cpu_set_t *__set) __THROW;
>> -+
>> -+__END_DECLS
>> -+
>> - #endif
>> -diff --git a/libc/sysdeps/linux/common/sched_cpualloc.c
>> b/libc/sysdeps/linux/common/sched_cpualloc.c
>> -new file mode 100644
>> -index 0000000..2642a80
>> ---- /dev/null
>> -+++ b/libc/sysdeps/linux/common/sched_cpualloc.c
>> -@@ -0,0 +1,27 @@
>> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, write to the Free
>> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>> -+   02111-1307 USA.  */
>> -+
>> -+#include<sched.h>
>> -+#include<stdlib.h>
>> -+
>> -+
>> -+cpu_set_t *
>> -+__sched_cpualloc (size_t count)
>> -+{
>> -+  return malloc (CPU_ALLOC_SIZE (count));
>> -+}
>> -diff --git a/libc/sysdeps/linux/common/sched_cpucount.c
>> b/libc/sysdeps/linux/common/sched_cpucount.c
>> -new file mode 100644
>> -index 0000000..331c0b8
>> ---- /dev/null
>> -+++ b/libc/sysdeps/linux/common/sched_cpucount.c
>> -@@ -0,0 +1,60 @@
>> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, write to the Free
>> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>> -+   02111-1307 USA.  */
>> -+
>> -+#include<limits.h>
>> -+#include<sched.h>
>> -+
>> -+
>> -+int
>> -+__sched_cpucount (size_t setsize, const cpu_set_t *setp)
>> -+{
>> -+  int s = 0;
>> -+  const __cpu_mask *p = setp->__bits;
>> -+  const __cpu_mask *end =&setp->__bits[setsize / sizeof (__cpu_mask)];
>> -+
>> -+  while (p<  end)
>> -+    {
>> -+      __cpu_mask l = *p++;
>> -+
>> -+#ifdef POPCNT
>> -+      s += POPCNT (l);
>> -+#else
>> -+      if (l == 0)
>> -+      continue;
>> -+
>> -+# if LONG_BIT>  32
>> -+      l = (l&  0x5555555555555555ul) + ((l>>  1)&
>>  0x5555555555555555ul);
>> -+      l = (l&  0x3333333333333333ul) + ((l>>  2)&
>>  0x3333333333333333ul);
>> -+      l = (l&  0x0f0f0f0f0f0f0f0ful) + ((l>>  4)&
>>  0x0f0f0f0f0f0f0f0ful);
>> -+      l = (l&  0x00ff00ff00ff00fful) + ((l>>  8)&
>>  0x00ff00ff00ff00fful);
>> -+      l = (l&  0x0000ffff0000fffful) + ((l>>  16)&
>>  0x0000ffff0000fffful);
>> -+      l = (l&  0x00000000fffffffful) + ((l>>  32)&
>>  0x00000000fffffffful);
>> -+# else
>> -+      l = (l&  0x55555555ul) + ((l>>  1)&  0x55555555ul);
>> -+      l = (l&  0x33333333ul) + ((l>>  2)&  0x33333333ul);
>> -+      l = (l&  0x0f0f0f0ful) + ((l>>  4)&  0x0f0f0f0ful);
>> -+      l = (l&  0x00ff00fful) + ((l>>  8)&  0x00ff00fful);
>> -+      l = (l&  0x0000fffful) + ((l>>  16)&  0x0000fffful);
>> -+# endif
>> -+
>> -+      s += l;
>> -+#endif
>> -+    }
>> -+
>> -+  return s;
>> -+}
>> -diff --git a/libc/sysdeps/linux/common/sched_cpufree.c
>> b/libc/sysdeps/linux/common/sched_cpufree.c
>> -new file mode 100644
>> -index 0000000..dd4c613
>> ---- /dev/null
>> -+++ b/libc/sysdeps/linux/common/sched_cpufree.c
>> -@@ -0,0 +1,27 @@
>> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, write to the Free
>> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>> -+   02111-1307 USA.  */
>> -+
>> -+#include<sched.h>
>> -+#include<stdlib.h>
>> -+
>> -+
>> -+void
>> -+__sched_cpufree (cpu_set_t *set)
>> -+{
>> -+  free (set);
>> -+}
>> -diff --git a/libc/sysdeps/linux/common/sched_getcpu.c
>> b/libc/sysdeps/linux/common/sched_getcpu.c
>> -new file mode 100644
>> -index 0000000..b193d65
>> ---- /dev/null
>> -+++ b/libc/sysdeps/linux/common/sched_getcpu.c
>> -@@ -0,0 +1,37 @@
>> -+/* Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   This file is part of the GNU C Library.
>> -+
>> -+   The GNU C Library is free software; you can redistribute it and/or
>> -+   modify it under the terms of the GNU Lesser General Public
>> -+   License as published by the Free Software Foundation; either
>> -+   version 2.1 of the License, or (at your option) any later version.
>> -+
>> -+   The GNU C Library is distributed in the hope that it will be useful,
>> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+   Lesser General Public License for more details.
>> -+
>> -+   You should have received a copy of the GNU Lesser General Public
>> -+   License along with the GNU C Library; if not, write to the Free
>> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>> -+   02111-1307 USA.  */
>> -+
>> -+#include<stdlib.h>
>> -+#include<errno.h>
>> -+#include<sched.h>
>> -+#include<sysdep.h>
>> -+
>> -+
>> -+int
>> -+sched_getcpu (void)
>> -+{
>> -+#ifdef __NR_getcpu
>> -+  unsigned int cpu;
>> -+  int r = INLINE_SYSCALL (getcpu, 3,&cpu, NULL, NULL);
>> -+
>> -+  return r == -1 ? r : cpu;
>> -+#else
>> -+  __set_errno (ENOSYS);
>> -+  return -1;
>> -+#endif
>> -+}
>> -diff --git a/libc/sysdeps/linux/common/unshare.c
>> b/libc/sysdeps/linux/common/unshare.c
>> -new file mode 100644
>> -index 0000000..485bf88
>> ---- /dev/null
>> -+++ b/libc/sysdeps/linux/common/unshare.c
>> -@@ -0,0 +1,12 @@
>> -+/* vi: set sw=4 ts=4: */
>> -+/*
>> -+ * unshare() for uClibc
>> -+ *
>> -+ * Copyright (C) 2011 Henning Heinold<heinold@inf.fu-berlin.de>
>> -+ *
>> -+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this
>> tarball.
>> -+ */
>> -+
>> -+#include<sys/syscall.h>
>> -+#include<sched.h>
>> -+_syscall1(int, unshare, int, flags)
>> ---
>> -1.7.5.3
>> -
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
>> new file mode 100644
>> index 0000000..2f0c191
>> --- /dev/null
>> +++
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
>> @@ -0,0 +1,32 @@
>> +From 6c3919a6d4a8686772e2a302bf951548ee24a8c1 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj<raj.khem@gmail.com>
>> +Date: Fri, 3 Feb 2012 10:57:44 -0800
>> +Subject: [PATCH] Declare __err and pass it to INTERNAL_SYSCALL_NCS so
>> + subsequent macros can use it
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +---
>> + libc/sysdeps/linux/common/bits/syscalls-common.h |    4 ++--
>> + 1 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +
>> +Upstream-Status: Pending
>> +
>> +diff --git a/libc/sysdeps/linux/common/bits/syscalls-common.h
>> b/libc/sysdeps/linux/common/bits/syscalls-common.h
>> +index faebd1b..0f5a929 100644
>> +--- a/libc/sysdeps/linux/common/bits/syscalls-common.h
>> ++++ b/libc/sysdeps/linux/common/bits/syscalls-common.h
>> +@@ -59,8 +59,8 @@
>> + #ifndef INLINE_SYSCALL_NOERR_NCS
>> + # define INLINE_SYSCALL_NOERR_NCS(name, nr, args...)                  \
>> + ({                                                                    \
>> +-      /*INTERNAL_SYSCALL_DECL(__err);*/
>>       \
>> +-      long __res = INTERNAL_SYSCALL_NCS(name, /*__err*/, nr, args);   \
>> ++      INTERNAL_SYSCALL_DECL(__err);                                   \
>> ++      long __res = INTERNAL_SYSCALL_NCS(name, __err, nr, args);       \
>> +       __res;                                                          \
>> + })
>> + #endif
>> +--
>> +1.7.5.4
>> +
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
>> new file mode 100644
>> index 0000000..da4ffef
>> --- /dev/null
>> +++
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
>> @@ -0,0 +1,177 @@
>> +From effbfd8e8a7b883671b24fc9759b135b48dbfaca Mon Sep 17 00:00:00 2001
>> +From: Khem Raj<raj.khem@gmail.com>
>> +Date: Fri, 3 Feb 2012 20:06:55 -0800
>> +Subject: [PATCH] lstat/stat/fstat: Use 64bit version of syscall if
>> available
>> +
>> +This is needed for stat'ing loop devices>  255
>> +since otherwise kernel returns EOVERFLOW becasue
>> +it needs st_rdev/st_dev to be larger than 16bits but
>> +in kernel it uses __old_kernel_stat for stat
>> +syscall which has st_rdev/st_dev as unsigned short
>> +
>> +Add a testcase
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +---
>> + libc/sysdeps/linux/common/fstat.c |   18 ++++++++++++++----
>> + libc/sysdeps/linux/common/lstat.c |   19 ++++++++++++++-----
>> + libc/sysdeps/linux/common/stat.c  |   18 ++++++++++++++----
>> + test/stat/stat-loop256.c          |   32
>> ++++++++++++++++++++++++++++++++
>> + 4 files changed, 74 insertions(+), 13 deletions(-)
>> + create mode 100644 test/stat/stat-loop256.c
>> +
>> +diff --git a/libc/sysdeps/linux/common/fstat.c
>> b/libc/sysdeps/linux/common/fstat.c
>> +index acc639b..4726a68 100644
>> +--- a/libc/sysdeps/linux/common/fstat.c
>> ++++ b/libc/sysdeps/linux/common/fstat.c
>> +@@ -12,18 +12,28 @@
>> + #include<sys/stat.h>
>> + #include "xstatconv.h"
>> +
>> +-#define __NR___syscall_fstat __NR_fstat
>> +-static __inline__ _syscall2(int, __syscall_fstat, int, fd, struct
>> kernel_stat *, buf)
>> +-
>> + int fstat(int fd, struct stat *buf)
>> + {
>> +       int result;
>> ++#ifdef __NR_fstat64
>> ++      /* normal stat call has limited values for various stat elements
>> ++       * e.g. uid device major/minor etc.
>> ++       * so we use 64 variant if available
>> ++       * in order to get newer versions of stat elements
>> ++       */
>> ++      struct kernel_stat64 kbuf;
>> ++      result = INLINE_SYSCALL(fstat64, 2, fd,&kbuf);
>> ++      if (result == 0) {
>> ++              __xstat32_conv(&kbuf, buf);
>> ++      }
>> ++#else
>> +       struct kernel_stat kbuf;
>> +
>> +-      result = __syscall_fstat(fd,&kbuf);
>> ++      result = INLINE_SYSCALL(fstat, 2, fd,&kbuf);
>> +       if (result == 0) {
>> +               __xstat_conv(&kbuf, buf);
>> +       }
>> ++#endif
>> +       return result;
>> + }
>> + libc_hidden_def(fstat)
>> +diff --git a/libc/sysdeps/linux/common/lstat.c
>> b/libc/sysdeps/linux/common/lstat.c
>> +index aa77447..db72d1f 100644
>> +--- a/libc/sysdeps/linux/common/lstat.c
>> ++++ b/libc/sysdeps/linux/common/lstat.c
>> +@@ -12,19 +12,28 @@
>> + #include<sys/stat.h>
>> + #include "xstatconv.h"
>> +
>> +-#define __NR___syscall_lstat __NR_lstat
>> +-static __inline__ _syscall2(int, __syscall_lstat,
>> +-              const char *, file_name, struct kernel_stat *, buf)
>> +-
>> + int lstat(const char *file_name, struct stat *buf)
>> + {
>> +       int result;
>> ++#ifdef __NR_lstat64
>> ++      /* normal stat call has limited values for various stat elements
>> ++       * e.g. uid device major/minor etc.
>> ++       * so we use 64 variant if available
>> ++       * in order to get newer versions of stat elements
>> ++       */
>> ++      struct kernel_stat64 kbuf;
>> ++      result = INLINE_SYSCALL(lstat64, 2, file_name,&kbuf);
>> ++      if (result == 0) {
>> ++              __xstat32_conv(&kbuf, buf);
>> ++      }
>> ++#else
>> +       struct kernel_stat kbuf;
>> +
>> +-      result = __syscall_lstat(file_name,&kbuf);
>> ++      result = INLINE_SYSCALL(lstat, 2, file_name,&kbuf);
>> +       if (result == 0) {
>> +               __xstat_conv(&kbuf, buf);
>> +       }
>> ++#endif
>> +       return result;
>> + }
>> + libc_hidden_def(lstat)
>> +diff --git a/libc/sysdeps/linux/common/stat.c
>> b/libc/sysdeps/linux/common/stat.c
>> +index a6ab291..829f35a 100644
>> +--- a/libc/sysdeps/linux/common/stat.c
>> ++++ b/libc/sysdeps/linux/common/stat.c
>> +@@ -12,20 +12,30 @@
>> + #include<sys/stat.h>
>> + #include "xstatconv.h"
>> +
>> +-#define __NR___syscall_stat __NR_stat
>> + #undef stat
>> +-static __inline__ _syscall2(int, __syscall_stat,
>> +-              const char *, file_name, struct kernel_stat *, buf)
>> +
>> + int stat(const char *file_name, struct stat *buf)
>> + {
>> +       int result;
>> ++#ifdef __NR_stat64
>> ++      /* normal stat call has limited values for various stat elements
>> ++       * e.g. uid device major/minor etc.
>> ++       * so we use 64 variant if available
>> ++       * in order to get newer versions of stat elements
>> ++       */
>> ++      struct kernel_stat64 kbuf;
>> ++      result = INLINE_SYSCALL(stat64, 2, file_name,&kbuf);
>> ++      if (result == 0) {
>> ++              __xstat32_conv(&kbuf, buf);
>> ++      }
>> ++#else
>> +       struct kernel_stat kbuf;
>> +
>> +-      result = __syscall_stat(file_name,&kbuf);
>> ++      result = INLINE_SYSCALL(stat, 2, file_name,&kbuf);
>> +       if (result == 0) {
>> +               __xstat_conv(&kbuf, buf);
>> +       }
>> ++#endif
>> +       return result;
>> + }
>> + libc_hidden_def(stat)
>> +diff --git a/test/stat/stat-loop256.c b/test/stat/stat-loop256.c
>> +new file mode 100644
>> +index 0000000..14284c1
>> +--- /dev/null
>> ++++ b/test/stat/stat-loop256.c
>> +@@ -0,0 +1,32 @@
>> ++#include<stdio.h>
>> ++#include<unistd.h>
>> ++#include<stdlib.h>
>> ++#include<sys/stat.h>
>> ++int main()
>> ++{
>> ++    struct stat statbuf;
>> ++    int ret = 0;
>> ++    char* loop255 = "/dev/loop255";
>> ++    char* loop256 = "/dev/loop256";
>> ++    mode_t mode = 0660;
>> ++    mknod(loop255, mode, 0x7ff);
>> ++    mknod(loop256, mode, 0x100700);
>> ++    ret = stat(loop255,&statbuf);
>> ++    if(ret<  0) {
>> ++      printf("stat: Cant stat %s\n",loop255);
>> ++      unlink(loop255);
>> ++      exit(1);
>> ++    }
>> ++    ret = stat(loop256,&statbuf);
>> ++    if(ret<  0) {
>> ++        printf("stat: Cant stat %s\n",loop256);
>> ++      unlink(loop255);
>> ++      unlink(loop256);
>> ++        exit(1);
>> ++    }
>> ++
>> ++    unlink(loop255);
>> ++    unlink(loop256);
>> ++    exit(0);
>> ++}
>> ++
>> +--
>> +1.7.5.4
>> +
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
>> similarity index 99%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
>> index 7fd148f..b31b991 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
>> @@ -8,6 +8,8 @@ Signed-off-by: Salvatore Cro<salvatore.cro at st.com>
>>   create mode 100644 include/argp.h
>>   create mode 100644 libc/argp/argp-fmtstream.h
>>
>> +Upstream-Status: Pending
>> +
>>  Index: git/include/argp.h
>>  ===================================================================
>>  --- /dev/null
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
>> similarity index 99%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
>> index 04a3c78..3e9680f 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
>> @@ -13,6 +13,9 @@ it doesn't need to link libuargp.so explicitely.
>>  Signed-off-by: Salvatore Cro<salvatore.cro at st.com>
>>  Signed-off-by: Filippo Arcidiacono<filippo.arcidiacono at st.com>
>>  Signed-off-by: Carmelo Amoroso<carmelo.amoroso at st.com>
>> +
>> +Upstream-Status: Pending
>> +
>>  ---
>>   Makefile.in                                 |    8 +
>>   Makerules                                   |    8 +-
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
>> similarity index 97%
>> rename from
>> meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
>> rename to
>> meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
>> index 429f27d..15ee0ca 100644
>> ---
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
>> +++
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
>> @@ -1,5 +1,5 @@
>>  When compiling in thumb mode for arm with -Os gcc gives up since it can
>> not find registers
>> -to spill. So we use -O2 option for compiling fork.c It may be
addressable
>> is gcc.
>> +to spill. So we use -O2 option for compiling fork.c It may be
addressable
>> in gcc.
>>
>>  Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
>> new file mode 100644
>> index 0000000..4e900f3
>> --- /dev/null
>> +++
b/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
>> @@ -0,0 +1,25 @@
>> +Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
>> +
>> +Upstream-Status: Pending
>> +
>> +Index: git/libc/sysdeps/linux/common/bits/socket.h
>> +===================================================================
>> +--- git.orig/libc/sysdeps/linux/common/bits/socket.h   2012-01-26
>> 23:23:21.537456132 -0800
>> ++++ git/libc/sysdeps/linux/common/bits/socket.h        2012-01-26
>> 23:25:10.125461388 -0800
>> +@@ -235,8 +235,15 @@
>> + #define       MSG_ERRQUEUE    MSG_ERRQUEUE
>> +     MSG_NOSIGNAL      = 0x4000, /* Do not generate SIGPIPE.  */
>> + #define       MSG_NOSIGNAL    MSG_NOSIGNAL
>> +-    MSG_MORE          = 0x8000  /* Sender will send more.  */
>> ++    MSG_MORE          = 0x8000,  /* Sender will send more.  */
>> + #define       MSG_MORE        MSG_MORE
>> ++    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to
>> return.*/
>> ++#define MSG_WAITFORONE  MSG_WAITFORONE
>> ++
>> ++    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
>> ++                                           descriptor received through
>> ++                                           SCM_RIGHTS.  */
>> ++#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
>> +   };
>> +
>> +
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
>> new file mode 100644
>> index 0000000..481f23b
>> --- /dev/null
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
>> @@ -0,0 +1,37 @@
>> +Implement dup3()
>> +
>> +Upstream-Status: Pending
>> +
>> +Index: git/libc/sysdeps/linux/common/dup3.c
>> +===================================================================
>> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
>> ++++ git/libc/sysdeps/linux/common/dup3.c       2012-01-27
>> 07:40:52.802900849 -0800
>> +@@ -0,0 +1,15 @@
>> ++/* vi: set sw=4 ts=4: */
>> ++/*
>> ++ * dup3() for uClibc
>> ++ *
>> ++ * Copyright (C) 2000-2006 Erik Andersen<andersen@uclibc.org>
>> ++ *
>> ++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this
>> tarball.
>> ++ */
>> ++
>> ++#include<sys/syscall.h>
>> ++#include<unistd.h>
>> ++
>> ++
>> ++_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
>> ++libc_hidden_def(dup3)
>> +Index: git/include/unistd.h
>> +===================================================================
>> +--- git.orig/include/unistd.h  2012-01-27 01:19:17.521792781 -0800
>> ++++ git/include/unistd.h       2012-01-27 07:40:03.106898447 -0800
>> +@@ -512,6 +512,8 @@
>> + /* Duplicate FD to FD2, closing FD2 and making it open on the same
file.
>>  */
>> + extern int dup2 (int __fd, int __fd2) __THROW;
>> + libc_hidden_proto(dup2)
>> ++extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
>> ++libc_hidden_proto(dup3)
>> +
>> + /* NULL-terminated array of "NAME=VALUE" environment variables.  */
>> + extern char **__environ;
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>> similarity index 86%
>> rename from
>>
meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>> rename to
>>
meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>> index cfa68ce..d44acca 100644
>> ---
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>> +++
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>> @@ -1,3 +1,9 @@
>> +resolver code should always be in arm mode
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +
>> +Upstream-Status: Pending
>> +
>>  Index: uClibc/ldso/ldso/arm/resolve.S
>>  ===================================================================
>>  --- uClibc.orig/ldso/ldso/arm/resolve.S       2009-03-20
>> 12:03:32.000000000 -0700
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
>> new file mode 100644
>> index 0000000..8064115
>> --- /dev/null
>> +++
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
>> @@ -0,0 +1,19 @@
>> +Index: git/include/libc-symbols.h
>> +===================================================================
>> +--- git.orig/include/libc-symbols.h    2011-07-05 17:04:41.171219323
>> -0700
>> ++++ git/include/libc-symbols.h 2011-07-05 22:50:36.851661478 -0700
>> +@@ -48,10 +48,12 @@
>> +
>> +    */
>> +
>> +-#include<bits/uClibc_arch_features.h>
>> +-
>> + /* Enable declarations of GNU extensions, since we are compiling them.
>>  */
>> + #define _GNU_SOURCE   1
>> ++#define __need_uClibc_config_h
>> ++#include<bits/uClibc_config.h>
>> ++#undef __need_uClibc_config_h
>> ++#include<bits/uClibc_arch_features.h>
>> +
>> + /* Prepare for the case that `__builtin_expect' is not available.  */
>> + #if defined __GNUC__&&  __GNUC__ == 2&&  __GNUC_MINOR__<  96
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.machine
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
>> similarity index 100%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.machine
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
>> similarity index 64%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
>> index 631951e..c9c15a3 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
>> @@ -3,16 +3,16 @@
>> http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
>>
>>  Upstream-Status: Pending
>>
>> -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
>> -index 505247e..2b2d429 100644
>> ---- a/ldso/ldso/dl-elf.c
>> -+++ b/ldso/ldso/dl-elf.c
>> -@@ -133,53 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
>> +Index: git/ldso/ldso/dl-elf.c
>> +===================================================================
>> +--- git.orig/ldso/ldso/dl-elf.c        2012-01-23 19:18:58.000000000
>> -0800
>> ++++ git/ldso/ldso/dl-elf.c     2012-01-23 21:52:06.144646590 -0800
>> +@@ -133,53 +133,60 @@
>>    * in uClibc/ldso/util/ldd.c */
>>   static struct elf_resolve *
>> - search_for_named_library(const char *name, int secure, const char
>> *path_list,
>> + search_for_named_library(const char *name, unsigned rflags, const char
>> *path_list,
>>  -     struct dyn_elf **rpnt)
>> -+      struct dyn_elf **rpnt, const char *origin)
>> ++      struct dyn_elf **rpnt, const char* origin)
>>   {
>>  -     char *path, *path_n, *mylibname;
>>  +     char *mylibname;
>> @@ -47,18 +47,6 @@ index 505247e..2b2d429 100644
>>  -             if (*path == 0) {
>>  -                     *path = ':';
>>  -                     done = 1;
>> --              }
>> --              if (*path == ':') {
>> --                      *path = 0;
>> --                      if (*path_n)
>> --                              _dl_strcpy(mylibname, path_n);
>> --                      else
>> --                              _dl_strcpy(mylibname, "."); /* Assume
>> current dir if empty path */
>> --                      _dl_strcat(mylibname, "/");
>> --                      _dl_strcat(mylibname, name);
>> --                      if ((tpnt = _dl_load_elf_shared_library(secure,
>> rpnt, mylibname)) != NULL)
>> --                              return tpnt;
>> --                      path_n = path+1;
>>  +     for (p = path_list; p != NULL; p = pn) {
>>  +             pn = _dl_strchr(p + 1, ':');
>>  +             if (pn != NULL) {
>> @@ -69,7 +57,7 @@ index 505247e..2b2d429 100644
>>  +
>>  +             if (plen>= 7&&  _dl_memcmp(p, "$ORIGIN", 7) == 0) {
>>  +                     int olen;
>> -+                      if (secure&&  plen != 7)
>> ++                      if (rflags&&  plen != 7)
>>  +                             continue;
>>  +                     if (origin == NULL)
>>  +                             continue;
>> @@ -86,12 +74,24 @@ index 505247e..2b2d429 100644
>>  +             } else {
>>  +                     _dl_strcpy(mylibname, ".");
>>                }
>> +-              if (*path == ':') {
>> +-                      *path = 0;
>> +-                      if (*path_n)
>> +-                              _dl_strcpy(mylibname, path_n);
>> +-                      else
>> +-                              _dl_strcpy(mylibname, "."); /* Assume
>> current dir if empty path */
>> +-                      _dl_strcat(mylibname, "/");
>> +-                      _dl_strcat(mylibname, name);
>> +-                      if ((tpnt = _dl_load_elf_shared_library(rflags,
>> rpnt, mylibname)) != NULL)
>> +-                              return tpnt;
>> +-                      path_n = path+1;
>> +-              }
>>  -             path++;
>>  -     } while (!done);
>>  +             _dl_strcat(mylibname, "/");
>>  +             _dl_strcat(mylibname, name);
>>  +
>> -+              tpnt = _dl_load_elf_shared_library(secure, rpnt,
>> mylibname);
>> ++              tpnt = _dl_load_elf_shared_library(rflags, rpnt,
>> mylibname);
>>  +             if (tpnt != NULL)
>>  +                     return tpnt;
>>  +     }
>> @@ -99,44 +99,46 @@ index 505247e..2b2d429 100644
>>        return NULL;
>>   }
>>
>> -@@ -231,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> +@@ -231,8 +238,10 @@
>>        if (pnt) {
>>                pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>>                _dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt)) != NULL)
>> -+              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt,
>> +-              if ((tpnt1 = search_for_named_library(libname, rflags,
>> pnt, rpnt)) != NULL)
>> ++              if ((tpnt1 = search_for_named_library(libname, rflags,
>> pnt, rpnt,
>>  +                                                   tpnt->libname)) !=
>> NULL)
>>                        return tpnt1;
>> ++
>>        }
>>   #endif
>> -@@ -239,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> +
>> +@@ -240,7 +249,7 @@
>>        /* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
>>        if (_dl_library_path) {
>>                _dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n",
>> _dl_library_path);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> _dl_library_path, rpnt)) != NULL)
>> -+              if ((tpnt1 = search_for_named_library(libname, secure,
>> _dl_library_path, rpnt, NULL)) != NULL)
>> +-              if ((tpnt1 = search_for_named_library(libname, rflags,
>> _dl_library_path, rpnt)) != NULL)
>> ++              if ((tpnt1 = search_for_named_library(libname, rflags,
>> _dl_library_path, rpnt, NULL)) != NULL)
>>                {
>>                        return tpnt1;
>>                }
>> -@@ -253,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> +@@ -254,7 +263,7 @@
>>        if (pnt) {
>>                pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
>>                _dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
>> --              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt)) != NULL)
>> -+              if ((tpnt1 = search_for_named_library(libname, secure,
>> pnt, rpnt, NULL)) != NULL)
>> +-              if ((tpnt1 = search_for_named_library(libname, rflags,
>> pnt, rpnt)) != NULL)
>> ++              if ((tpnt1 = search_for_named_library(libname, rflags,
>> pnt, rpnt, NULL)) != NULL)
>>                        return tpnt1;
>>        }
>>   #endif
>> -@@ -287,7 +295,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> +@@ -288,7 +297,7 @@
>>        /* Look for libraries wherever the shared library loader
>>         * was installed */
>>        _dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
>> --      tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath,
>> rpnt);
>> -+      tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath,
>> rpnt, NULL);
>> +-      tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath,
>> rpnt);
>> ++      tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath,
>> rpnt, NULL);
>>        if (tpnt1 != NULL)
>>                return tpnt1;
>> -
>> -@@ -300,7 +308,7 @@ struct elf_resolve *_dl_load_shared_library(int
>> secure, struct dyn_elf **rpnt,
>> + #endif
>> +@@ -301,7 +310,7 @@
>>   #ifndef __LDSO_CACHE_SUPPORT__
>>                                        ":" UCLIBC_RUNTIME_PREFIX
>> "usr/X11R6/lib"
>>   #endif
>> @@ -145,12 +147,12 @@ index 505247e..2b2d429 100644
>>        if (tpnt1 != NULL)
>>                return tpnt1;
>>
>> -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
>> -index 7ee9257..9423670 100644
>> ---- a/ldso/ldso/ldso.c
>> -+++ b/ldso/ldso/ldso.c
>> -@@ -272,6 +272,20 @@ static void __attribute__ ((destructor))
>> __attribute_used__ _dl_fini(void)
>> -       }
>> +Index: git/ldso/ldso/ldso.c
>> +===================================================================
>> +--- git.orig/ldso/ldso/ldso.c  2012-01-23 19:18:58.000000000 -0800
>> ++++ git/ldso/ldso/ldso.c       2012-01-23 21:34:11.152594621 -0800
>> +@@ -407,6 +407,20 @@
>> +       return p - list;
>>   }
>>
>>  +static void _dl_setup_progname(const char *argv0)
>> @@ -167,10 +169,10 @@ index 7ee9257..9423670 100644
>>  +     }
>>  +}
>>  +
>> - void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE
>> load_addr,
>> -                         ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,
>> -                         char **argv
>> -@@ -321,9 +335,7 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt,
>> DL_LOADADDR_TYPE load_addr,
>> + void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE
>> load_addr,
>> +                         ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,
>> char **argv
>> +                         DL_GET_READY_TO_RUN_EXTRA_PARMS)
>> +@@ -458,9 +472,7 @@
>>         * been fixed up by now.  Still no function calls outside of this
>>         * library, since the dynamic resolver is not yet ready.
>>         */
>> @@ -179,5 +181,5 @@ index 7ee9257..9423670 100644
>>  -     }
>>  +     _dl_setup_progname(argv[0]);
>>
>> + #ifndef __LDSO_STANDALONE_SUPPORT__
>>        if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
>> -               _dl_dprintf(_dl_debug_file, "Standalone execution is not
>> supported yet\n");
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
>> similarity index 96%
>> rename from
meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
>> index 339ce7f..3fa10af 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
>> @@ -1,3 +1,9 @@
>> +Add ppc copysignl implementation
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +
>>  Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
>>  ===================================================================
>>  --- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch
>> diff --git
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
>> similarity index 93%
>> rename from
>> meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
>> rename to
>> meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
>> index 1930383..bee251c 100644
>> ---
>>
a/meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
>> +++
>>
b/meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
>> @@ -1,15 +1,8 @@
>> -Index: git/include/features.h
>> -===================================================================
>> ---- git.orig/include/features.h
>> -+++ git/include/features.h
>> -@@ -186,7 +186,6 @@
>> - # define __need_uClibc_config_h
>> - # include<bits/uClibc_config.h>
>> - # undef __need_uClibc_config_h
>> --
>> - /* For uClibc, always optimize for size -- this should disable
>> -  * a lot of expensive inlining...
>> -  * TODO: this is wrong! __OPTIMIZE_SIZE__ is an indicator of
>> +Dont support localised optimizations this helps to have a global -O
level
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>>  Index: git/libpthread/nptl/pthread_mutex_timedlock.c
>>  ===================================================================
>>  --- git.orig/libpthread/nptl/pthread_mutex_timedlock.c
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
>> similarity index 96%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
>> index 5638d47..c33bf8e 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
>> @@ -181,4 +181,10 @@ UCLIBC_HAS_FLOATS=y
>>
>>  # needed by systemd
>>  UCLIBC_HAS_UTMPX=y
>> -
>> +UCLIBC_LINUX_MODULE_26=y
>> +UCLIBC_HAS_RESOLVER_SUPPORT=y
>> +# needed for LTP
>> +UCLIBC_SUSV4_LEGACY=y
>> +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
>> +DO_XSI_MATH=y
>> +UCLIBC_SV4_DEPRECATED=y
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.machine
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
>> similarity index 100%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.machine
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
>> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
>> similarity index 99%
>> rename from meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
>> rename to meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
>> index cd90a09..fe191fc 100644
>> --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
>> +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
>> @@ -12,6 +12,9 @@ Signed-off-by: Henning Heinold<heinold@inf.fu-berlin.de
>
>>   3 files changed, 46 insertions(+), 5 deletions(-)
>>   create mode 100644 libc/unistd/execvpe.c
>>
>> +
>> +Upstream-Status: Pending
>> +
>>  diff --git a/include/unistd.h b/include/unistd.h
>>  index 9568790..070e4f2 100644
>>  --- a/include/unistd.h
>> diff --git
>> a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
>> b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
>> similarity index 81%
>> rename from
>> meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
>> rename to
>> meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
>> index f8f3a7d..37a5988 100644
>> ---
a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
>> +++
b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
>> @@ -1,3 +1,8 @@
>> +uclibc now has log2 so enable the tests
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>>  Index: uClibc/test/math/libm-test.inc
>>  ===================================================================
>>  --- uClibc/test/math/libm-test.inc    (revision 23784)
>> diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb
>> b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
>> similarity index 100%
>> rename from meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb
>> rename to meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
>> diff --git a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
>> b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
>> similarity index 45%
>> rename from meta/recipes-core/uclibc/uclibc_0.9.32.bb
>> rename to meta/recipes-core/uclibc/uclibc_0.9.33.bb
>> index 235b436..b559fd4 100644
>> --- a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
>> +++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
>> @@ -1,34 +1,26 @@
>> -SRCREV="9152c4d67c763fde5712e2d181d92c0d7e1e2ab9"
>> +SRCREV="1548ee3ca582f3732136e71613c87c16230f71cc"
>>
>>  require uclibc.inc
>> -PR = "${INC_PR}.3"
>> +
>> +PR = "${INC_PR}.0"
>>  PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
>>
>>  SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git<http://uclibc.org/uClibc.git;branch=$%7BPV%7D;protocol=git>\
>>        file://uClibc.machine \
>>        file://uClibc.distro \
>> -       file://uclibc-arm-ftruncate64.patch \
>>        file://uclibc_enable_log2_test.patch \
>>        file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
>> -       file://select-force-thumb.patch \
>> -       file://remove-sub-arch-variants.patch \
>> -       file://transform-eabi-oabi-choice.patch \
>> -       file://include-arm-asm.h.patch \
>> -       file://detect-bx-availibility.patch \
>> -       file://remove-eabi-oabi-selection.patch \
>>        file://powerpc_copysignl.patch \
>>        file://argp-support.patch \
>>        file://argp-headers.patch \
>>        file://remove_attribute_optimize_Os.patch \
>>        file://compile-arm-fork-with-O2.patch \
>> -       file://epoll-asm-fix.patch \
>> -       file://orign_path.patch \
>> -       file://rtld_no.patch \
>> -
>> file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch \
>> -
>> file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
>>        file://uclibc-execvpe.patch \
>> -       file://uclibc_scheduler_update.patch \
>> -       file://sync_file_range2.patch \
>> -       file://mount.h-update.patch \
>> +       file://orign_path.patch \
>> +       file://dup3.patch \
>> +       file://define-MSG_CMSG_CLOEXEC.patch \
>> +
>> file://0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch \
>> +
>> file://0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch \
>>        "
>> +
>>  S = "${WORKDIR}/git"

--f46d04016ca924444204b86747bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace">updated<br></font></font><br>On =
Tue, Feb 7, 2012 at 11:02 AM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.int=
el.com" target=3D"_blank">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; On 02/=
05/2012 10:40 PM, Khem Raj wrote:<br>

&gt;&gt;<br>&gt;&gt; Prefer 0.9.33 by default<br>
&gt;&gt; Delete recipes for 0.9.32<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: K=
hem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/conf/distro/inclu=
de/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-<br>


&gt;&gt; =C2=A0...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch | =C2=A0 =
29 --<br>&gt;&gt; =C2=A0...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch =
| =C2=A0 33 --<br>&gt;&gt; =C2=A0.../uclibc-0.9.32/detect-bx-availibility.p=
atch =C2=A0 =C2=A0 | =C2=A0 75 ----<br>


&gt;&gt; =C2=A0.../uclibc/uclibc-0.9.32/epoll-asm-fix.patch =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 25 --<br>&gt;&gt; =C2=A0.../uclibc/uclibc-0.9.32/include-ar=
m-asm.h.patch =C2=A0 | =C2=A0 65 ---<br>&gt;&gt; =C2=A0.../uclibc/uclibc-0.=
9.32/mount.h-update.patch =C2=A0 =C2=A0 =C2=A0| =C2=A0 85 ----<br>


&gt;&gt; =C2=A0.../uclibc-0.9.32/remove-eabi-oabi-selection.patch | =C2=A0 =
91 ----<br>&gt;&gt; =C2=A0.../uclibc-0.9.32/remove-sub-arch-variants.patch =
=C2=A0 | =C2=A0215 ---------<br>&gt;&gt; =C2=A0.../uclibc/uclibc-0.9.32/rtl=
d_no.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0215 ---------<=
br>


&gt;&gt; =C2=A0.../uclibc/uclibc-0.9.32/select-force-thumb.patch =C2=A0| =
=C2=A0172 --------<br>&gt;&gt; =C2=A0.../uclibc/uclibc-0.9.32/sync_file_ran=
ge2.patch =C2=A0 =C2=A0| =C2=A0 47 --<br>&gt;&gt; =C2=A0.../uclibc-0.9.32/t=
ransform-eabi-oabi-choice.patch | =C2=A0 71 ---<br>


&gt;&gt; =C2=A0.../uclibc-0.9.32/uclibc-arm-ftruncate64.patch =C2=A0 =C2=A0=
 | =C2=A0 13 -<br>&gt;&gt; =C2=A0.../uclibc-0.9.32/uclibc_scheduler_update.=
patch =C2=A0 =C2=A0| =C2=A0455<br>&gt;&gt; --------------------<br>&gt;&gt;=
 =C2=A0...rr-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch | =C2=A0 32 ++<br=
>


&gt;&gt; =C2=A0...fstat-Use-64bit-version-of-syscall-if-ava.patch | =C2=A01=
77 ++++++++<br>&gt;&gt; =C2=A0.../argp-headers.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +<br>&gt;&gt; =C2=A0.../argp-support.patch =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A03 +<br>


&gt;&gt; =C2=A0.../compile-arm-fork-with-O2.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>&gt;&gt; =C2=A0.../u=
clibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch =C2=A0 =C2=A0| =C2=A0 25 ++<br>&=
gt;&gt; =C2=A0meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch =C2=A0| =C2=
=A0 37 ++<br>


&gt;&gt; =C2=A0...so_use_arm_dl_linux_resolve_in_thumb_mode.patch | =C2=A0 =
=C2=A06 +<br>&gt;&gt; =C2=A0.../libc_symbols_include_bits_uclibc_config.pat=
ch =C2=A0| =C2=A0 19 +<br>&gt;&gt; =C2=A0.../mips/uClibc.machine =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A00<br>&gt;&gt; =C2=A0.../orign_path.patch =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 94 ++--<br>


&gt;&gt; =C2=A0.../powerpc_copysignl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +<br>&=
gt;&gt; =C2=A0.../remove_attribute_optimize_Os.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 17 +-<br>&gt;&gt; =C2=A0.../{uclibc-0.9.32 =
=3D&gt; =C2=A0uclibc-0.9.33}/uClibc.distro | =C2=A0 =C2=A08 +-<br>


&gt;&gt; =C2=A0.../uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A00<br>&gt;&gt; =C2=A0.../uclibc-execvpe.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A03 +<br>&gt;&gt; =C2=A0.../uclibc_enable_log2_test.patch =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05=
 +<br>&gt;&gt; =C2=A0...-<a href=3D"http://initial_0.9.32.bb" target=3D"_bl=
ank">initial_0.9.32.bb</a> =3D&gt; =C2=A0<a href=3D"http://uclibc-initial_0=
.9.33.bb" target=3D"_blank">uclibc-initial_0.9.33.bb</a>} | =C2=A0 =C2=A00<=
br>


&gt;&gt; =C2=A0.../uclibc/{<a href=3D"http://uclibc_0.9.32.bb" target=3D"_b=
lank">uclibc_0.9.32.bb</a> =3D&gt; =C2=A0<a href=3D"http://uclibc_0.9.33.bb=
" target=3D"_blank">uclibc_0.9.33.bb</a>} =C2=A0| =C2=A0 26 +-<br>&gt;&gt; =
=C2=A034 files changed, 386 insertions(+), 1669 deletions(-)<br>


&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch<b=
r>&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/uc=
libc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch=
<br>


&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.32/detect-bx-availibility.patch<br>&gt;&gt; =C2=A0delete mode 100644=
<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch<br>=
&gt;&gt; =C2=A0delete mode 100644<br>


&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch<br>=
&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.32/mount.h-update.patch<br>&gt;&gt; =C2=A0delete mode 100644<br>&gt;=
&gt; meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patc=
h<br>


&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.32/remove-sub-arch-variants.patch<br>&gt;&gt; =C2=A0delete mode 1006=
44 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch<br>&gt;&gt; =C2=A0d=
elete mode 100644<br>


&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch<br=
>&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucl=
ibc-0.9.32/sync_file_range2.patch<br>&gt;&gt; =C2=A0delete mode 100644<br>&=
gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.p=
atch<br>


&gt;&gt; =C2=A0delete mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.32/uclibc-arm-ftruncate64.patch<br>&gt;&gt; =C2=A0delete mode 100644=
<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update=
.patch<br>


&gt;&gt; =C2=A0create mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch<b=
r>&gt;&gt; =C2=A0create mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/uc=
libc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch=
<br>


&gt;<br>&gt;<br>&gt; Missing Upstream-Status in this patch<br>&gt;<br>&gt;&=
gt; rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;<br>&gt; =
uclibc-0.9.33}/argp-headers.patch (99%)<br>&gt;&gt;<br>&gt;&gt; =C2=A0renam=
e meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>


&gt;&gt; =C2=A0uclibc-0.9.33}/argp-support.patch (99%)<br>&gt;&gt; =C2=A0re=
name meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;&gt; =C2=A0ucli=
bc-0.9.33}/compile-arm-fork-with-O2.patch (97%)<br>&gt;&gt; =C2=A0create mo=
de 100644<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMS=
G_CLOEXEC.patch<br>


&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/du=
p3.patch<br>&gt;&gt; =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =
=3D&gt;<br>&gt;&gt; =C2=A0uclibc-0.9.33}/ldso_use_arm_dl_linux_resolve_in_t=
humb_mode.patch (86%)<br>


&gt;&gt; =C2=A0create mode 100644<br>&gt;&gt; meta/recipes-core/uclibc/ucli=
bc-0.9.33/libc_symbols_include_bits_uclibc_config.patch<br>&gt;<br>&gt;<br>=
&gt; Also missing Upstream-Status.<br>&gt;<br>&gt;<br>&gt;&gt; =C2=A0rename=
 meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>


&gt;&gt; =C2=A0uclibc-0.9.33}/mips/uClibc.machine (100%)<br>&gt;&gt; =C2=A0=
rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;&gt; =C2=A0uc=
libc-0.9.33}/orign_path.patch (64%)<br>&gt;&gt; =C2=A0rename meta/recipes-c=
ore/uclibc/{uclibc-0.9.32 =3D&gt;<br>


&gt;&gt; =C2=A0uclibc-0.9.33}/powerpc_copysignl.patch (96%)<br>&gt;&gt; =C2=
=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;&gt; =C2=
=A0uclibc-0.9.33}/remove_attribute_optimize_Os.patch (93%)<br>&gt;&gt; =C2=
=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>


&gt;&gt; =C2=A0uclibc-0.9.33}/uClibc.distro (96%)<br>&gt;&gt; =C2=A0rename =
meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;&gt; =C2=A0uclibc-0.=
9.33}/uClibc.machine (100%)<br>&gt;&gt; =C2=A0rename meta/recipes-core/ucli=
bc/{uclibc-0.9.32 =3D&gt;<br>


&gt;&gt; =C2=A0uclibc-0.9.33}/uclibc-execvpe.patch (99%)<br>&gt;&gt; =C2=A0=
rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D&gt;<br>&gt;&gt; =C2=A0uc=
libc-0.9.33}/uclibc_enable_log2_test.patch (81%)<br>&gt;&gt; =C2=A0rename m=
eta/recipes-core/uclibc/{<a href=3D"http://uclibc-initial_0.9.32.bb" target=
=3D"_blank">uclibc-initial_0.9.32.bb</a> =3D&gt;<br>


&gt;&gt; =C2=A0<a href=3D"http://uclibc-initial_0.9.33.bb" target=3D"_blank=
">uclibc-initial_0.9.33.bb</a>} (100%)<br>&gt;&gt; =C2=A0rename meta/recipe=
s-core/uclibc/{<a href=3D"http://uclibc_0.9.32.bb" target=3D"_blank">uclibc=
_0.9.32.bb</a> =3D&gt; =C2=A0<a href=3D"http://uclibc_0.9.33.bb" target=3D"=
_blank">uclibc_0.9.33.bb</a>}<br>


&gt;&gt; (45%)<br>&gt;&gt;<br>&gt;&gt; diff --git a/meta/conf/distro/includ=
e/tcmode-default.inc<br>&gt;&gt; b/meta/conf/distro/include/tcmode-default.=
inc<br>&gt;&gt; index 5bb253e..b7c2160 100644<br>&gt;&gt; --- a/meta/conf/d=
istro/include/tcmode-default.inc<br>


&gt;&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>&gt;&gt; @@ -=
20,7 +20,7 @@ GCCVERSION ?=3D &quot;4.6%&quot;<br>&gt;&gt; =C2=A0SDKGCCVERS=
ION ?=3D &quot;4.6%&quot;<br>&gt;&gt; =C2=A0BINUVERSION ?=3D &quot;2.22&quo=
t;<br>&gt;&gt; =C2=A0EGLIBCVERSION ?=3D &quot;2.13&quot;<br>


&gt;&gt; -UCLIBCVERSION ?=3D &quot;0.9.32&quot;<br>&gt;&gt; +UCLIBCVERSION =
?=3D &quot;0.9.33&quot;<br>&gt;&gt; =C2=A0LINUXLIBCVERSION ?=3D &quot;3.1&q=
uot;<br>&gt;&gt;<br>&gt;&gt; =C2=A0PREFERRED_VERSION_gcc ?=3D &quot;${GCCVE=
RSION}&quot;<br>


&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/00=
01-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch<br>&gt;&gt; b=
/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS=
_FPU-setting-from-depe.patch<br>


&gt;&gt; deleted file mode 100644<br>&gt;&gt; index da97d38..0000000<br>&gt=
;&gt; ---<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.=
in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch<br>&gt;&gt; +++ /dev/nu=
ll<br>


&gt;&gt; @@ -1,29 +0,0 @@<br>&gt;&gt; -From 06cdcd2a9dd6b46b7fbb5b3ae0a62bd=
b7ee6c402 Mon Sep 17 00:00:00 2001<br>&gt;&gt; -From: Khem Raj&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>

&gt;&gt; -Date: Mon, 27 Jun 2011 17:48:18 -0700<br>
&gt;&gt; -Subject: [PATCH] Config.in.arch: Free UCLIBC_HAS_FPU setting from=
<br>&gt;&gt; depending on UCLIBC_HAS_FLOATS<br>&gt;&gt; -<br>&gt;&gt; -UCLI=
BC_HAS_FLOATS and UCLIBC_HAS_FPU are denoting two different aspects.<br>


&gt;&gt; -UCLIBC_HAS_FLOATS covers the floating point operations which has =
nothing<br>&gt;&gt; -to do if you have FPU or not.<br>&gt;&gt; -<br>&gt;&gt=
; -Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>


&gt;&gt; ----<br>&gt;&gt; - extra/Configs/Config.in.arch | =C2=A0 =C2=A01 -=
<br>&gt;&gt; - 1 files changed, 0 insertions(+), 1 deletions(-)<br>&gt;&gt;=
 -<br>&gt;&gt; -diff --git a/extra/Configs/Config.in.arch b/extra/Configs/C=
onfig.in.arch<br>


&gt;&gt; -index 5f7a2b0..c1ca390 100644<br>&gt;&gt; ---- a/extra/Configs/Co=
nfig.in.arch<br>&gt;&gt; -+++ b/extra/Configs/Config.in.arch<br>&gt;&gt; -@=
@ -133,7 +133,6 @@ config UCLIBC_HAS_FLOATS<br>&gt;&gt; -<br>&gt;&gt; - con=
fig UCLIBC_HAS_FPU<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Target CPU has a floating point =
unit (FPU)&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0depends on UCLIBC_HAS_F=
LOATS<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 default y<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 help<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 If your target CP=
U does not have a Floating Point Unit (FPU) or<br>


&gt;&gt; a<br>&gt;&gt; ---<br>&gt;&gt; -1.7.0.4<br>&gt;&gt; -<br>&gt;&gt; d=
iff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-si=
gnalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch<br>&gt;&gt; b/meta/reci=
pes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is=
-0200-unlike.patch<br>


&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 6892ceb..0000000<br>&gt=
;&gt; ---<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-si=
gnalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch<br>&gt;&gt; +++ /dev/nu=
ll<br>


&gt;&gt; @@ -1,33 +0,0 @@<br>&gt;&gt; -From ecc7d34cbbaf83aae87b091555650ed=
33e27ed2e Mon Sep 17 00:00:00 2001<br>&gt;&gt; -From: Khem Raj&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>

&gt;&gt; -Date: Thu, 30 Jun 2011 00:32:11 -0700<br>
&gt;&gt; -Subject: [PATCH] mips/signalfd.h: SFD_NONBLOCK for mips is 0200 u=
nlike<br>&gt;&gt; 04000 commonly<br>&gt;&gt; -<br>&gt;&gt; -Signed-off-by: =
Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>&gt;<br>


&gt;&gt; ----<br>&gt;&gt; - include/sys/signalfd.h | =C2=A0 =C2=A09 +++++++=
++<br>&gt;&gt; - 1 files changed, 9 insertions(+), 0 deletions(-)<br>&gt;&g=
t; -<br>&gt;&gt; -diff --git a/include/sys/signalfd.h b/include/sys/signalf=
d.h<br>


&gt;&gt; -index 8cee17c..f1cb63a 100644<br>&gt;&gt; ---- a/include/sys/sign=
alfd.h<br>&gt;&gt; -+++ b/include/sys/signalfd.h<br>&gt;&gt; -@@ -64,6 +64,=
15 @@ enum<br>&gt;&gt; - # define SFD_NONBLOCK SFD_NONBLOCK<br>&gt;&gt; - =
=C2=A0 };<br>


&gt;&gt; -<br>&gt;&gt; -+#elif defined __mips__<br>&gt;&gt; -+enum<br>&gt;&=
gt; -+ =C2=A0{<br>&gt;&gt; -+ =C2=A0 =C2=A0SFD_CLOEXEC =3D 02000000,<br>&gt=
;&gt; -+# define SFD_CLOEXEC SFD_CLOEXEC<br>&gt;&gt; -+ =C2=A0 =C2=A0SFD_NO=
NBLOCK =3D 0200<br>&gt;&gt; -+# define SFD_NONBLOCK SFD_NONBLOCK<br>


&gt;&gt; -+ =C2=A0};<br>&gt;&gt; -+<br>&gt;&gt; - #else<br>&gt;&gt; - enum<=
br>&gt;&gt; - =C2=A0 {<br>&gt;&gt; ---<br>&gt;&gt; -1.7.0.4<br>&gt;&gt; -<b=
r>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/=
detect-bx-availibility.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.pa=
tch<br>&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 43d19fc..0000000=
<br>&gt;&gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availib=
ility.patch<br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,75 +0,0 @@<br>&gt;&gt; -Delivered-=
To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a><br>&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313307agb;<br=
>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:20 -0800 (PST)<=
br>
&gt;&gt; -Received: by 10.227.141.78 with SMTP id<br>&gt;&gt; l14mr16920947=
wbu.128.1294533919168;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan=
 2011 16:45:19 -0800 (PST)<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:y=
ann.morin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.e=
nib.fr</a>&gt;<br>


&gt;&gt; -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=
=3D"_blank">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.or=
ange.fr" target=3D"_blank">smtp01.smtpout.orange.fr</a><br>&gt;&gt; <a href=
=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"_blank">[80.12.2=
42.123</a>])<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx.google.com" t=
arget=3D"_blank">mx.google.com</a> with ESMTP id<br>
&gt;&gt; w30si33755908wbd.17.2011.01.08.16.45.18;<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:19 -0800 (PST)<br>&gt;&gt; -Receive=
d-SPF: neutral (<a href=3D"http://google.com" target=3D"_blank">google.com<=
/a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_blank"=
>80.12.242.123</a> is neither permitted nor<br>


&gt;&gt; denied by best guess record for domain of <a href=3D"mailto:yann.m=
orin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.f=
r</a>)<br>&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+1801=
2242123" target=3D"_blank">80.12.242.123</a>;<br>

&gt;&gt; -Authentication-Results: <a href=3D"http://mx.google.com" target=
=3D"_blank">mx.google.com</a>; spf=3Dneutral (<a href=3D"http://google.com"=
 target=3D"_blank">google.com</a>:<br>
&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.f=
r" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>

&gt;&gt; smtp.mail=3D<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" tar=
get=3D"_blank">yann.morin.1998@anciens.enib.fr</a><br>
&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 id tClC1f0024v5z3u03ClHDo; Sun, 09 Jan 2011 01:45:18 +0100<br>&gt;&gt; =
-From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.1998@ancie=
ns.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 6/7] ARM: detect BX availibility at build time<br>&gt;=
&gt; -Date: Sun, =C2=A09 Jan 2011 01:45:09 +0100<br>


&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-7-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-7-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -The &quot;use BX&quot; option is now a suggestion t=
hat BX be used if available.<br>&gt;&gt; -Use a macro to detect if BX is av=
ailable at build time. If so, and<br>&gt;&gt; -the user requested it be use=
d, then use it. Otherwise, error out.<br>


&gt;&gt; -<br>&gt;&gt; -Macro courtesy Khem RAJ:<br>&gt;&gt; - =C2=A0<a hre=
f=3D"http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.html" targe=
t=3D"_blank">http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.htm=
l</a><br>

&gt;&gt; -<br>
&gt;&gt; -Signed-off-by: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yan=
n.morin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.eni=
b.fr</a>&gt;<br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>


&gt;&gt; -Cc: Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Ca=
rmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" target=3D"_blank=
">carmelo.amoroso@st.com</a>&gt;<br>


&gt;&gt; ----<br>&gt;&gt; - extra/Configs/Config.arm =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +++-<br>&gt;&gt; - libc/sysdeps=
/linux/arm/bits/arm_asm.h | =C2=A0 =C2=A09 ++++++++-<br>&gt;&gt; - 2 files =
changed, 11 insertions(+), 2 deletions(-)<br>&gt;&gt; -<br>


&gt;&gt; -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm<=
br>&gt;&gt; -index 227b90c..9aa9e56 100644<br>&gt;&gt; ---- a/extra/Configs=
/Config.arm<br>&gt;&gt; -+++ b/extra/Configs/Config.arm<br>&gt;&gt; -@@ -33=
,4 +33,6 @@ config COMPILE_IN_THUMB_MODE<br>


&gt;&gt; - config USE_BX<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Use =
BX in function return&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 help<br>&gt;=
&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0Use BX instruction for THUMB aware archi=
tectures.<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Say &#39;y&#39; to use =
BX to return from functions on your thumb-aware<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0processor. Say &#39;y&#39; if you ne=
ed to use interworking. Say &#39;n&#39; if<br>&gt;&gt; not.<br>&gt;&gt; -+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0It is safe to say &#39;y&#39; even if you&#39;re=
 not doing interworking.<br>&gt;&gt; -diff --git a/libc/sysdeps/linux/arm/b=
its/arm_asm.h<br>


&gt;&gt; b/libc/sysdeps/linux/arm/bits/arm_asm.h<br>&gt;&gt; -index 1d87df6=
..921c9a3 100644<br>&gt;&gt; ---- a/libc/sysdeps/linux/arm/bits/arm_asm.h<b=
r>&gt;&gt; -+++ b/libc/sysdeps/linux/arm/bits/arm_asm.h<br>&gt;&gt; -@@ -24=
,5 +24,12 @@<br>


&gt;&gt; - #define THUMB1_ONLY 1<br>&gt;&gt; - #endif<br>&gt;&gt; -<br>&gt;=
&gt; --#endif /* _ARM_ASM_H */<br>&gt;&gt; -+#if defined(__USE_BX__)<br>&gt=
;&gt; -+# if ( =C2=A0 defined (__ARM_ARCH_2__) =C2=A0|| defined (__ARM_ARCH=
_3__) \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0|| defined (__ARM_ARCH_3M__) || defined (__=
ARM_ARCH_4__) \<br>&gt;&gt; -+ =C2=A0 =C2=A0 )<br>&gt;&gt; -+# =C2=A0error =
Use of BX was requested, but is not available on the target<br>&gt;&gt; pro=
cessor.<br>&gt;&gt; -+# endif /* ARCH level */<br>


&gt;&gt; -+#endif /* __USE_BX__ */<br>&gt;&gt; -<br>&gt;&gt; -+#endif /* _A=
RM_ASM_H */<br>&gt;&gt; ---<br>&gt;&gt; -1.7.1<br>&gt;&gt; -<br>&gt;&gt; di=
ff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch<br>&g=
t;&gt; deleted file mode 100644<br>&gt;&gt; index bcd834d..0000000<br>&gt;&=
gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch<br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,25 +0,0 @@<br>&gt;&gt; -Fix a comp=
ile error due to last argument to syscall() not being memory<br>&gt;&gt; ad=
dressable.<br>&gt;&gt; -<br>&gt;&gt; -Upstream-Status: Pending<br>&gt;&gt; =
-Signed-off-by: Phil Blundell&lt;<a href=3D"mailto:philb@gnu.org" target=3D=
"_blank">philb@gnu.org</a>&gt;<br>


&gt;&gt; -<br>&gt;&gt; -diff --git a/libc/sysdeps/linux/common/epoll.c<br>&=
gt;&gt; b/libc/sysdeps/linux/common/epoll.c<br>&gt;&gt; -index 85b0cfd..c03=
4b2c 100644<br>&gt;&gt; ---- a/libc/sysdeps/linux/common/epoll.c<br>&gt;&gt=
; -+++ b/libc/sysdeps/linux/common/epoll.c<br>


&gt;&gt; -@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwa=
it;<br>&gt;&gt; - int __libc_epoll_pwait(int epfd, struct epoll_event *even=
ts, int<br>&gt;&gt; maxevents,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int timeout, co=
nst<br>


&gt;&gt; sigset_t *set)<br>&gt;&gt; - {<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0=
int nsig =3D _NSIG / 8;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if (SINGLE_THREA=
D_P)<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
INLINE_SYSCALL(epoll_pwait, 6, epfd, events,<br>&gt;&gt; maxevents, timeout=
, set, _NSIG / 8);<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return INLINE_S=
YSCALL(epoll_pwait, 6, epfd, events,<br>&gt;&gt; maxevents, timeout, set, n=
sig);<br>&gt;&gt; - # ifdef __UCLIBC_HAS_THREADS_NATIVE__<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 else {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int oldtype =3D LIBC_CANCEL_ASYNC ();<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int result =3D =
INLINE_SYSCALL(epoll_pwait, 6, epfd, events,<br>&gt;&gt; maxevents, timeout=
, set, _NSIG / 8);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int result =3D INLINE_SYSCALL(epoll_pwait, 6, epfd, events,<br>


&gt;&gt; maxevents, timeout, set, nsig);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBC_CANCEL_RESET (oldtype);<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-co=
re/uclibc/uclibc-0.9.32/include-arm-asm.h.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch<b=
r>&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 55c312e..0000000<br>&=
gt;&gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patc=
h<br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,65 +0,0 @@<br>&gt;&gt; -Delivered-=
To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a><br>&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313304agb;<br=
>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:19 -0800 (PST)<=
br>
&gt;&gt; -Received: by 10.227.155.75 with SMTP id r11mr17188266wbw.3.129453=
3918432;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:18=
 -0800 (PST)<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:yann.morin.1998=
@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;=
<br>


&gt;&gt; -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=
=3D"_blank">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.or=
ange.fr" target=3D"_blank">smtp01.smtpout.orange.fr</a><br>&gt;&gt; <a href=
=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"_blank">[80.12.2=
42.123</a>])<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx.google.com" t=
arget=3D"_blank">mx.google.com</a> with ESMTP id<br>
&gt;&gt; k3si33753340wbx.29.2011.01.08.16.45.17;<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:18 -0800 (PST)<br>&gt;&gt; -Receive=
d-SPF: neutral (<a href=3D"http://google.com" target=3D"_blank">google.com<=
/a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_blank"=
>80.12.242.123</a> is neither permitted nor<br>


&gt;&gt; denied by best guess record for domain of <a href=3D"mailto:yann.m=
orin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.f=
r</a>)<br>&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+1801=
2242123" target=3D"_blank">80.12.242.123</a>;<br>

&gt;&gt; -Authentication-Results: <a href=3D"http://mx.google.com" target=
=3D"_blank">mx.google.com</a>; spf=3Dneutral (<a href=3D"http://google.com"=
 target=3D"_blank">google.com</a>:<br>
&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.f=
r" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>

&gt;&gt; smtp.mail=3D<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" tar=
get=3D"_blank">yann.morin.1998@anciens.enib.fr</a><br>
&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 id tClC1f0024v5z3u03ClHDf; Sun, 09 Jan 2011 01:45:17 +0100<br>&gt;&gt; =
-From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.1998@ancie=
ns.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 5/7] ARM: #include&lt;bits/arm_asm.h&gt; =C2=A0where _=
_USE_BX__ is<br>&gt;&gt; used<br>

&gt;&gt; -Date: Sun, =C2=A09 Jan 2011 01:45:08 +0100<br>
&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-6-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-6-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -The check for __USE_BX__ will be available in bits/=
arm_asm.h,<br>&gt;&gt; -so the latter must be included wherever the former =
is used.<br>&gt;&gt; -<br>&gt;&gt; -Signed-off-by: &quot;Yann E. MORIN&quot=
;&lt;<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">y=
ann.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Bernhard Reutner-Fischer=
&lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@=
gmail.com</a>&gt;<br>

&gt;&gt; -Cc: Carmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" =
target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>
&gt;&gt; ----<br>&gt;&gt; - ldso/ldso/arm/dl-startup.h =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A01 +<br>&gt;&gt; - libc/sysdeps/linux/arm/sysdep.h | =C2=A0 =
=C2=A01 +<br>&gt;&gt; - 2 files changed, 2 insertions(+), 0 deletions(-)<br=
>&gt;&gt; -<br>&gt;&gt; -diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/lds=
o/arm/dl-startup.h<br>


&gt;&gt; -index a95389d..2dfdaff 100644<br>&gt;&gt; ---- a/ldso/ldso/arm/dl=
-startup.h<br>&gt;&gt; -+++ b/ldso/ldso/arm/dl-startup.h<br>&gt;&gt; -@@ -7=
,6 +7,7 @@<br>&gt;&gt; - =C2=A0*/<br>&gt;&gt; -<br>&gt;&gt; - #include&lt;f=
eatures.h&gt;<br>


&gt;&gt; -+#include&lt;bits/arm_asm.h&gt;<br>&gt;&gt; -<br>&gt;&gt; - #if !=
defined(__thumb__)<br>&gt;&gt; - __asm__(<br>&gt;&gt; -diff --git a/libc/sy=
sdeps/linux/arm/sysdep.h<br>&gt;&gt; b/libc/sysdeps/linux/arm/sysdep.h<br>


&gt;&gt; -index 013f88c..e498695 100644<br>&gt;&gt; ---- a/libc/sysdeps/lin=
ux/arm/sysdep.h<br>&gt;&gt; -+++ b/libc/sysdeps/linux/arm/sysdep.h<br>&gt;&=
gt; -@@ -21,6 +21,7 @@<br>&gt;&gt; - #define _LINUX_ARM_SYSDEP_H 1<br>

&gt;&gt; -<br>
&gt;&gt; - #include&lt;common/sysdep.h&gt;<br>&gt;&gt; -+#include&lt;bits/a=
rm_asm.h&gt;<br>&gt;&gt; -<br>&gt;&gt; - #include&lt;sys/syscall.h&gt;<br>&=
gt;&gt; - /* For Linux we can use the system call table in the header file<=
br>


&gt;&gt; ---<br>&gt;&gt; -1.7.1<br>&gt;&gt; -<br>&gt;&gt; diff --git a/meta=
/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch<br>&gt;&gt; b/meta/=
recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch<br>&gt;&gt; deleted =
file mode 100644<br>


&gt;&gt; index 3508e0e..0000000<br>&gt;&gt; --- a/meta/recipes-core/uclibc/=
uclibc-0.9.32/mount.h-update.patch<br>&gt;&gt; +++ /dev/null<br>&gt;&gt; @@=
 -1,85 +0,0 @@<br>&gt;&gt; -Sync mount.h from glibc this is needed to get m=
issing defines<br>


&gt;&gt; -that some apps e.g. systemd are depending on<br>&gt;&gt; -<br>&gt=
;&gt; -Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -<br>&gt;&gt; -Upstre=
am-Status: Pending<br>


&gt;&gt; -<br>&gt;&gt; -Index: git/include/sys/mount.h<br>&gt;&gt; -=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; ---- git.orig/inc=
lude/sys/mount.h =C2=A0 =C2=A0 =C2=A0 2011-07-21 14:37:27.134255747<br>


&gt;&gt; -0700<br>&gt;&gt; -+++ git/include/sys/mount.h =C2=A0 =C2=A02011-0=
7-21 14:39:53.844470932 -0700<br>&gt;&gt; -@@ -1,5 +1,5 @@<br>&gt;&gt; - /*=
 Header file for mounting/unmount Linux filesystems.<br>&gt;&gt; -- =C2=A0 =
Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation,<br>


&gt;&gt; Inc.<br>&gt;&gt; -+ =C2=A0 Copyright (C) 1996-2000, 2004, 2010 Fre=
e Software Foundation, Inc.<br>&gt;&gt; - =C2=A0 =C2=A0This file is part of=
 the GNU C Library.<br>&gt;&gt; -<br>&gt;&gt; - =C2=A0 =C2=A0The GNU C Libr=
ary is free software; you can redistribute it and/or<br>


&gt;&gt; -@@ -47,23 +47,46 @@<br>&gt;&gt; - #define MS_REMOUNT =C2=A0 =C2=
=A0MS_REMOUNT<br>&gt;&gt; - =C2=A0 MS_MANDLOCK =3D 64, =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Allow mandatory locks on an FS. =C2=A0*/<br>&gt;&gt; - #d=
efine MS_MANDLOCK =C2=A0 MS_MANDLOCK<br>&gt;&gt; -- =C2=A0S_WRITE =3D 128, =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write on file/directory/=
symlink. =C2=A0*/<br>


&gt;&gt; --#define S_WRITE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 S_WRITE<br>&gt;&gt; -- =C2=A0S_APPEND =3D 256, =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Append-only file. =C2=A0*/<br>&gt;&gt; --#define S_APPEND=
 =C2=A0 =C2=A0 =C2=A0S_APPEND<br>&gt;&gt; -- =C2=A0S_IMMUTABLE =3D 512, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Immutable file. =C2=A0*/<br>


&gt;&gt; --#define S_IMMUTABLE =C2=A0 S_IMMUTABLE<br>&gt;&gt; -+ =C2=A0MS_D=
IRSYNC =3D 128, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Directory modificatio=
ns are<br>&gt;&gt; synchronous. =C2=A0*/<br>&gt;&gt; -+#define MS_DIRSYNC =
=C2=A0 =C2=A0MS_DIRSYNC<br>&gt;&gt; - =C2=A0 MS_NOATIME =3D 1024, =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do not update access times. =C2=A0*/<br>


&gt;&gt; - #define MS_NOATIME =C2=A0 =C2=A0MS_NOATIME<br>&gt;&gt; - =C2=A0 =
MS_NODIRATIME =3D 2048, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 Do not update directory access<br>&gt;&gt; times. =C2=A0*/<br>&gt;&gt; - #=
define MS_NODIRATIME MS_NODIRATIME<br>&gt;&gt; - =C2=A0 MS_BIND =3D 4096, =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Bind directory at different pl=
ace. =C2=A0*/<br>


&gt;&gt; - #define MS_BIND =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 MS_BIND<br>&gt;&gt; -+ =C2=A0MS_MOVE =3D 8192,<br>&gt;&gt; -+#define MS_MO=
VE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MS_MOVE<br>&gt;&gt; -+ =
=C2=A0MS_REC =3D 16384,<br>&gt;&gt; -+#define MS_REC =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MS_REC<br>&gt;&gt; -+ =C2=A0MS_SILENT =3D=
 32768,<br>


&gt;&gt; -+#define MS_SILENT =C2=A0 =C2=A0 MS_SILENT<br>&gt;&gt; -+ =C2=A0M=
S_POSIXACL =3D 1&lt;&lt; =C2=A016, =C2=A0 =C2=A0 =C2=A0/* VFS does not appl=
y the umask. =C2=A0*/<br>&gt;&gt; -+#define MS_POSIXACL =C2=A0 MS_POSIXACL<=
br>&gt;&gt; -+ =C2=A0MS_UNBINDABLE =3D 1&lt;&lt; =C2=A017, =C2=A0 =C2=A0/* =
Change to unbindable. =C2=A0*/<br>


&gt;&gt; -+#define MS_UNBINDABLE MS_UNBINDABLE<br>&gt;&gt; -+ =C2=A0MS_PRIV=
ATE =3D 1&lt;&lt; =C2=A018, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Change to private. =C2=A0*/<br>&gt;&gt; -+#define MS_PRIVATE =C2=A0 =
=C2=A0MS_PRIVATE<br>&gt;&gt; -+ =C2=A0MS_SLAVE =3D 1&lt;&lt; =C2=A019, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Change to slave. =C2=A0*/<br>


&gt;&gt; -+#define MS_SLAVE =C2=A0 =C2=A0 =C2=A0MS_SLAVE<br>&gt;&gt; -+ =C2=
=A0MS_SHARED =3D 1&lt;&lt; =C2=A020, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Change to shared. =C2=A0*/<br>&gt;&gt; -+#define MS_SHA=
RED =C2=A0 =C2=A0 MS_SHARED<br>&gt;&gt; -+ =C2=A0MS_RELATIME =3D 1&lt;&lt; =
=C2=A021, =C2=A0 =C2=A0 =C2=A0/* Update atime relative to mtime/ctime.<br>


&gt;&gt; =C2=A0*/<br>&gt;&gt; -+#define MS_RELATIME =C2=A0 MS_RELATIME<br>&=
gt;&gt; -+ =C2=A0MS_KERNMOUNT =3D 1&lt;&lt; =C2=A022, =C2=A0 =C2=A0 /* This=
 is a kern_mount call. =C2=A0*/<br>&gt;&gt; -+#define MS_KERNMOUNT =C2=A0MS=
_KERNMOUNT<br>&gt;&gt; -+ =C2=A0MS_I_VERSION =3D =C2=A01&lt;&lt; =C2=A023, =
=C2=A0 =C2=A0/* Update inode I_version field. =C2=A0*/<br>


&gt;&gt; -+#define MS_I_VERSION =C2=A0MS_I_VERSION<br>&gt;&gt; -+ =C2=A0MS_=
STRICTATIME =3D 1&lt;&lt; =C2=A024, =C2=A0 /* Always perform atime updates.=
 =C2=A0*/<br>&gt;&gt; -+#define MS_STRICTATIME =C2=A0 =C2=A0 =C2=A0 =C2=A0M=
S_STRICTATIME<br>&gt;&gt; -+ =C2=A0MS_ACTIVE =3D 1&lt;&lt; =C2=A030,<br>


&gt;&gt; -+#define MS_ACTIVE =C2=A0 =C2=A0 MS_ACTIVE<br>&gt;&gt; -+ =C2=A0M=
S_NOUSER =3D 1&lt;&lt; =C2=A031<br>&gt;&gt; -+#define MS_NOUSER =C2=A0 =C2=
=A0 MS_NOUSER<br>&gt;&gt; - };<br>&gt;&gt; -<br>&gt;&gt; - /* Flags that ca=
n be altered by MS_REMOUNT =C2=A0*/<br>


&gt;&gt; --#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOA=
TIME \<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |MS_NODIRATIME)<br>&gt;&gt; -+#define MS_RMT_MASK (MS_RDONLY|MS_=
SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)<br>

&gt;&gt; -<br>
&gt;&gt; -<br>&gt;&gt; - /* Magic mount flag number. Has to be or-ed to the=
 flag values. =C2=A0*/<br>&gt;&gt; -@@ -100,8 +123,10 @@<br>&gt;&gt; - #def=
ine MNT_FORCE MNT_FORCE<br>&gt;&gt; - =C2=A0 MNT_DETACH =3D 2, =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Just detach from the tree. =C2=A0*/<br>


&gt;&gt; - #define MNT_DETACH MNT_DETACH<br>&gt;&gt; -- =C2=A0MNT_EXPIRE =
=3D 4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mark for expiry. =
=C2=A0*/<br>&gt;&gt; -+ =C2=A0MNT_EXPIRE =3D 4, =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Mark for expiry. =C2=A0*/<br>&gt;&gt; - #define MNT_EXPIR=
E MNT_EXPIRE<br>


&gt;&gt; -+ =C2=A0UMOUNT_NOFOLLOW =3D 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&=
#39;t follow symlink on umount. =C2=A0*/<br>&gt;&gt; -+#define UMOUNT_NOFOL=
LOW UMOUNT_NOFOLLOW<br>&gt;&gt; - };<br>&gt;&gt; -<br>&gt;&gt; -<br>&gt;&gt=
; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/remove-ea=
bi-oabi-selection.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selectio=
n.patch<br>&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 8f3464e..000=
0000<br>&gt;&gt; ---<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/r=
emove-eabi-oabi-selection.patch<br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,91 +0,0 @@<br>&gt;&gt; -Delivered-=
To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a><br>&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313309agb;<br=
>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:20 -0800 (PST)<=
br>
&gt;&gt; -Received: by 10.216.173.7 with SMTP id u7mr612034wel.50.129453391=
9433;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:19 -0=
800 (PST)<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:yann.morin.1998@an=
ciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br=
>


&gt;&gt; -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=
=3D"_blank">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.or=
ange.fr" target=3D"_blank">smtp01.smtpout.orange.fr</a><br>&gt;&gt; <a href=
=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"_blank">[80.12.2=
42.123</a>])<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx.google.com" t=
arget=3D"_blank">mx.google.com</a> with ESMTP id<br>
&gt;&gt; e10si33752027wer.68.2011.01.08.16.45.19;<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:19 -0800 (PST)<br>&gt;&gt; -Receive=
d-SPF: neutral (<a href=3D"http://google.com" target=3D"_blank">google.com<=
/a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_blank"=
>80.12.242.123</a> is neither permitted nor<br>


&gt;&gt; denied by best guess record for domain of <a href=3D"mailto:yann.m=
orin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.f=
r</a>)<br>&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+1801=
2242123" target=3D"_blank">80.12.242.123</a>;<br>

&gt;&gt; -Authentication-Results: <a href=3D"http://mx.google.com" target=
=3D"_blank">mx.google.com</a>; spf=3Dneutral (<a href=3D"http://google.com"=
 target=3D"_blank">google.com</a>:<br>
&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.f=
r" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>

&gt;&gt; smtp.mail=3D<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" tar=
get=3D"_blank">yann.morin.1998@anciens.enib.fr</a><br>
&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 id tClC1f0024v5z3u03ClJDu; Sun, 09 Jan 2011 01:45:18 +0100<br>&gt;&gt; =
-From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.1998@ancie=
ns.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 7/7] ARM: remove EABI/OABI selection<br>&gt;&gt; -Date=
: Sun, =C2=A09 Jan 2011 01:45:10 +0100<br>


&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-8-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-8-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -Rely on the compiler to be properly setup for the d=
efault ABI.<br>&gt;&gt; -<br>&gt;&gt; -When installing-headers, there are t=
wo cases:<br>&gt;&gt; -- NPTL: no issue, a cross-compiler is already expect=
ed<br>


&gt;&gt; -- LinuxThreads: no issue, EABI/OABI has no impact on installed he=
aders.<br>&gt;&gt; -<br>&gt;&gt; -Signed-off-by: &quot;Yann E. MORIN&quot;&=
lt;<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">yan=
n.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Bernhard Reutner-Fischer=
&lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@=
gmail.com</a>&gt;<br>

&gt;&gt; -Cc: Carmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" =
target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>
&gt;&gt; ----<br>&gt;&gt; - extra/Configs/Config.arm =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 -----------<br>&gt;&gt; - libc/sysd=
eps/linux/arm/Makefile.arch =C2=A0 | =C2=A0 =C2=A09 +++++++--<br>&gt;&gt; -=
 libc/sysdeps/linux/arm/bits/huge_val.h | =C2=A0 =C2=A04 ++--<br>


&gt;&gt; - 3 files changed, 9 insertions(+), 15 deletions(-)<br>&gt;&gt; -<=
br>&gt;&gt; -Index: git/libc/sysdeps/linux/arm/Makefile.arch<br>&gt;&gt; -=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>

&gt;&gt; ---- git.orig/libc/sysdeps/linux/arm/Makefile.arch<br>
&gt;&gt; -+++ git/libc/sysdeps/linux/arm/Makefile.arch<br>&gt;&gt; -@@ -24,=
7 +24,12 @@ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)<br>&gt;&gt; - CSRC +=
=3D posix_fadvise.c posix_fadvise64.c<br>&gt;&gt; - endif<br>&gt;&gt; -<br>


&gt;&gt; --ifeq ($(CONFIG_ARM_EABI),y)<br>&gt;&gt; -+# Is our compiler set =
up for EABI ?<br>&gt;&gt; -+IS_EABI:=3D$(shell $(CC) $(CFLAGS) -x c - -E -d=
M&lt;/dev/null 2&gt;/dev/null \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |sed -r -e<br>


&gt;&gt; &#39;/^\#[[:space:]]*define[[:space:]]+__ARM_EABI__([[:space:]]+1)=
?$$/!d;<br>&gt;&gt; s/.+/y/;&#39; \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0)<br>&gt;&gt; -+<br>&gt;&gt; -+ifeq ($(IS_EABI),y)<br>&gt;&gt; - =
CSRC +=3D aeabi_assert.c aeabi_atexit.c aeabi_errno_addr.c \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 aeabi_localeconv.c aeabi_memclr.c aeabi_mem=
cpy.c \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 aeabi_memmove.c aeabi_memset.c f=
ind_exidx.c<br>&gt;&gt; -@@ -37,7 +42,7 @@ else<br>&gt;&gt; - CSRC +=3D sys=
call.c<br>&gt;&gt; - endif<br>


&gt;&gt; -<br>&gt;&gt; --ifeq ($(CONFIG_ARM_EABI),y)<br>&gt;&gt; -+ifeq ($(=
IS_EABI),y)<br>&gt;&gt; - libc-static-y +=3D $(ARCH_OUT)/aeabi_lcsts.o $(AR=
CH_OUT)/aeabi_math.o \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 $(ARCH_OUT)/aeabi=
_sighandlers.o<br>


&gt;&gt; - libc-nonshared-y +=3D $(ARCH_OUT)/aeabi_lcsts.os $(ARCH_OUT)/aea=
bi_math.os<br>&gt;&gt; \<br>&gt;&gt; -Index: git/libc/sysdeps/linux/arm/bit=
s/huge_val.h<br>&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>


&gt;&gt; ---- git.orig/libc/sysdeps/linux/arm/bits/huge_val.h<br>&gt;&gt; -=
+++ git/libc/sysdeps/linux/arm/bits/huge_val.h<br>&gt;&gt; -@@ -32,7 +32,7 =
@@<br>&gt;&gt; - # define HUGE_VAL (__extension__ 0x1.0p2047)<br>&gt;&gt; -=
 #elif defined __GNUC__<br>


&gt;&gt; -<br>&gt;&gt; --#ifndef __CONFIG_ARM_EABI__<br>&gt;&gt; -+#ifndef =
__ARM_EABI__<br>&gt;&gt; - # define HUGE_VAL \<br>&gt;&gt; - =C2=A0 (__exte=
nsion__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =
=C2=A0\<br>


&gt;&gt; - =C2=A0 =C2=A0((union { unsigned __l __attribute__((__mode__(__DI=
__))); double __d;<br>&gt;&gt; }) =C2=A0 \<br>&gt;&gt; -@@ -50,7 +50,7 @@<b=
r>&gt;&gt; -<br>&gt;&gt; - typedef union { unsigned char __c[8]; double __d=
; } __huge_val_t;<br>


&gt;&gt; -<br>&gt;&gt; --#ifndef __CONFIG_ARM_EABI__<br>&gt;&gt; -+#ifndef =
__ARM_EABI__<br>&gt;&gt; - # if __BYTE_ORDER =3D=3D __BIG_ENDIAN<br>&gt;&gt=
; - # =C2=A0define __HUGE_VAL_bytes =C2=A0 =C2=A0{ 0, 0, 0, 0, 0x7f, 0xf0, =
0, 0 }<br>&gt;&gt; - # endif<br>


&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/re=
move-sub-arch-variants.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-=
0.9.32/remove-sub-arch-variants.patch<br>&gt;&gt; deleted file mode 100644<=
br>


&gt;&gt; index 920a669..0000000<br>&gt;&gt; ---<br>&gt;&gt; a/meta/recipes-=
core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch<br>&gt;&gt; +++ /d=
ev/null<br>&gt;&gt; @@ -1,215 +0,0 @@<br>&gt;&gt; -Delivered-To: <a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>


&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313303agb;<br>&gt;&gt; -=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:18 -0800 (PST)<br>&gt;&gt=
; -Received: by 10.227.98.158 with SMTP id<br>&gt;&gt; q30mr1255804wbn.151.=
1294533917314;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:17 -0800 (PST)=
<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:yann.morin.1998@anciens.eni=
b.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=3D"_blank=
">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.orange.fr" t=
arget=3D"_blank">smtp01.smtpout.orange.fr</a><br>


&gt;&gt; <a href=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"=
_blank">[80.12.242.123</a>])<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a=
 href=3D"http://mx.google.com" target=3D"_blank">mx.google.com</a> with ESM=
TP id<br>&gt;&gt; r3si33749838wbr.54.2011.01.08.16.45.16;<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:17 -0800 (PST)=
<br>
&gt;&gt; -Received-SPF: neutral (<a href=3D"http://google.com" target=3D"_b=
lank">google.com</a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" =
target=3D"_blank">80.12.242.123</a> is neither permitted nor<br>&gt;&gt; de=
nied by best guess record for domain of <a href=3D"mailto:yann.morin.1998@a=
nciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>


&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+18012242123" t=
arget=3D"_blank">80.12.242.123</a>;<br>&gt;&gt; -Authentication-Results: <a=
 href=3D"http://mx.google.com" target=3D"_blank">mx.google.com</a>; spf=3Dn=
eutral (<a href=3D"http://google.com" target=3D"_blank">google.com</a>:<br>

&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>
&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.fr" targe=
t=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>&gt;&gt; smtp.mail=3D<=
a href=3D"mailto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">yann.mo=
rin.1998@anciens.enib.fr</a><br>

&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 id tClC1f0024v5z3u03ClGDS; Sun, 09 Jan 2011 01:45:16 +0100<br=
>&gt;&gt; -From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.=
1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>=
&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 3/7] ARM: remove sub-arch/variants selection from<br>&=
gt;&gt; menuconfig<br>

&gt;&gt; -Date: Sun, =C2=A09 Jan 2011 01:45:06 +0100<br>
&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-4-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-4-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -Rely on the compiler to be correctly set up to gene=
rate<br>&gt;&gt; -appropriate code for the target variant.<br>&gt;&gt; -<br=
>&gt;&gt; -This exposes the Thumb option, as it is no longer auto-selected.=
<br>


&gt;&gt; -The &quot;Use BX&quot; no longer depends on supported CPU to be s=
elected,<br>&gt;&gt; -so it now defaults to &#39;n&#39; as it shall work by=
 default on CPUs<br>&gt;&gt; -that do not have BX.<br>&gt;&gt; -<br>&gt;&gt=
; -Signed-off-by: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin=
.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a=
>&gt;<br>


&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Bernhard Reutner-Fischer=
&lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@=
gmail.com</a>&gt;<br>

&gt;&gt; -Cc: Carmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" =
target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>
&gt;&gt; ----<br>&gt;&gt; - Rules.mak =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 19 -------<br>&gt;&gt; - extra/Configs/Config.=
arm | =C2=A0125<br>&gt;&gt; ++--------------------------------------------<=
br>&gt;&gt; - 2 files changed, 5 insertions(+), 139 deletions(-)<br>


&gt;&gt; -<br>&gt;&gt; -diff --git a/Rules.mak b/Rules.mak<br>&gt;&gt; -ind=
ex 2a16908..09741a6 100644<br>&gt;&gt; ---- a/Rules.mak<br>&gt;&gt; -+++ b/=
Rules.mak<br>&gt;&gt; -@@ -332,25 +332,6 @@ ifeq ($(TARGET_ARCH),arm)<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 OPTIMIZATION+=3D-fstrict-aliasing<br>&gt;&g=
t; - =C2=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=3D-mlittle-endi=
an<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=3D-mbi=
g-endian<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_GENERIC_ARM=
)+=3D<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM610)+=3D-mtune=3Darm=
610 -march=3Darmv3<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_A=
RM710)+=3D-mtune=3Darm710 -march=3Darmv3<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=
=A0CPU_CFLAGS-$(CONFIG_ARM7TDMI)+=3D-mtune=3Darm7tdmi -march=3Darmv4t<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM720T)+=3D-mtune=3Dar=
m7tdmi -march=3Darmv4t<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONF=
IG_ARM920T)+=3D-mtune=3Darm9tdmi -march=3Darmv4t<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM922T)+=3D-mtune=3Darm9tdmi -march=3Darmv4t=
<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM926T)+=3D-mtune=3Dar=
m9e -march=3Darmv5te<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG=
_ARM10T)+=3D-mtune=3Darm10tdmi -march=3Darmv5t<br>&gt;&gt; -- =C2=A0 =C2=A0=
 =C2=A0CPU_CFLAGS-$(CONFIG_ARM1136JF_S)+=3D-mtune=3Darm1136jf-s -march=3Dar=
mv6<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM1176JZ_S)+=3D-mtune=
=3Darm1176jz-s -march=3Darmv6<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS=
-$(CONFIG_ARM1176JZF_S)+=3D-mtune=3Darm1176jzf-s<br>&gt;&gt; -march=3Darmv6=
<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_SA110)+=3D-mtun=
e=3Dstrongarm110 -march=3Darmv4<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=3D-mtune=
=3Dstrongarm1100 -march=3Darmv4<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLA=
GS-$(CONFIG_ARM_XSCALE)+=3D$(call<br>&gt;&gt; check_gcc,-mtune=3Dxscale,-mt=
une=3Dstrongarm110)<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_=
ARM_XSCALE)+=3D-march=3Darmv5te -Wa,-mcpu=3Dxscale<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=3D-march=
=3Diwmmxt -Wa,-mcpu=3Diwmmxt<br>&gt;&gt; -mabi=3Diwmmxt<br>&gt;&gt; -- =C2=
=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=3D-mcpu=3Dcortex-m3<br=
>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=3D-mcp=
u=3Dcortex-m1<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=3D-mth=
umb<br>&gt;&gt; - endif<br>&gt;&gt; -<br>&gt;&gt; -diff --git a/extra/Confi=
gs/Config.arm b/extra/Configs/Config.arm<br>&gt;&gt; -index c9c40d4..6c75a0=
0 100644<br>

&gt;&gt; ---- a/extra/Configs/Config.arm<br>
&gt;&gt; -+++ b/extra/Configs/Config.arm<br>&gt;&gt; -@@ -30,129 +30,14 @@ =
config CONFIG_ARM_EABI<br>&gt;&gt; -<br>&gt;&gt; - endchoice<br>&gt;&gt; -<=
br>&gt;&gt; --choice<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0prompt &quot;Target=
 Processor Type&quot;<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0default CONFIG_GENERIC_ARM<br>&gt;&gt; -- =
=C2=A0 =C2=A0 =C2=A0help<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0This is =
the processor type of your CPU. This information is used<br>&gt;&gt; for<br=
>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0optimizing purposes. =C2=A0To build=
 a library that will run on all<br>


&gt;&gt; ARMCPU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0types (albeit not=
 optimally fast), you can specify &quot;Generic Arm&quot;<br>&gt;&gt; here.=
<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0If you pick anything other than =
&quot;Generic Arm&quot;, there is no<br>


&gt;&gt; guarantee<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0that uClibc wi=
ll even run on anything other than the selected<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0processor type.<br>&gt;&gt; --<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Here are the settings recommended for greatest speed:<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;Generic Arm&quot; select thi=
s if your compiler is already setup to<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0optimize things properly, or if you want to run on pretty much=
<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0everything, or you just d=
on&#39;t much care.<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0- For anything else, pick the ARM co=
re type that best matches<br>&gt;&gt; the<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cpu you will be using on your device.<br>&gt;&gt; --<br>&g=
t;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0If you don&#39;t know what to do, choo=
se &quot;Generic Arm&quot;.<br>


&gt;&gt; --<br>&gt;&gt; --config CONFIG_GENERIC_ARM<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0bool &quot;Generic Arm&quot;<br>&gt;&gt; --<br>&gt;&gt; --conf=
ig CONFIG_ARM610<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 610&quot=
;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>


&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM710<br>&gt;&gt; -- =C2=A0 =C2=A0=
 =C2=A0bool &quot;Arm 710&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select A=
RCH_HAS_MMU<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM7TDMI<br>&gt;&gt;=
 -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 7TDMI&quot;<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_NO_MMU<br>&gt;&gt; -- =C2=
=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFI=
G_ARM720T<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 720T&quot;<br>&=
gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>


&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM920T<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0bool &quot;Arm 920T&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0sele=
ct ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;=
&gt; --<br>&gt;&gt; --config CONFIG_ARM922T<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 922T&quot;<br>&gt;&gt; -- =
=C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0=
select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM926T<br>&gt;=
&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 926T&quot;<br>

&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>
&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt;=
 --config CONFIG_ARM10T<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 1=
0T&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt;=
 -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>


&gt;&gt; --config CONFIG_ARM1136JF_S<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0boo=
l &quot;Arm 1136JF-S&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_H=
AS_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<b=
r>&gt;&gt; --config CONFIG_ARM1176JZ_S<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 1176JZ-S&quot;<br>&gt;&gt; -=
- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=
=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM1176JZF_S=
<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm 1176JZF-S&quot;<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_AR=
M_CORTEX_M3<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Arm Cortex-M3&quo=
t;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_NO_MMU<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select FORCE_THUMB<br>&gt;&gt; --<br>&gt;&g=
t; --config CONFIG_ARM_CORTEX_M1<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &q=
uot;Arm Cortex-M1&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_=
NO_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select FORCE_THUMB<br>


&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM_SA110<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0bool &quot;Intel StrongArm SA-110&quot;<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS=
_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_ARM_SA1100<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Intel StrongArm SA-1100&quot;<br=
>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_AR=
M_XSCALE<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Intel Xscale&quot;<b=
r>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt; --config CONFIG_AR=
M_IWMMXT<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;Intel Xscale With WM=
MX PXA27x&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select ARCH_HAS_MMU<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; --<br>&gt;&gt;=
 --endchoice<br>&gt;&gt; --<br>&gt;&gt; --config HAS_THUMB<br>&gt;&gt; -- =
=C2=A0 =C2=A0 =C2=A0bool<br>&gt;&gt; --<br>&gt;&gt; --config FORCE_THUMB<br=
>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool<br>

&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>
&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select COMPILE_IN_THUMB_MODE<br>&gt;&gt; --=
 =C2=A0 =C2=A0 =C2=A0select USE_BX<br>&gt;&gt; --<br>&gt;&gt; - config COMP=
ILE_IN_THUMB_MODE<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool<br>&gt;&gt; -+ =
=C2=A0 =C2=A0 =C2=A0bool &quot;Build using Thumb mode&quot;<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select USE_BX<br>&gt;&gt; -+ =C2=A0 =C2=A0 =
=C2=A0help<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Say &#39;y&#39; here t=
o force building uClibc in thumb mode.<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Say &#39;n&#39; to use your compiler&#39;s default mode.<br>


&gt;&gt; -<br>&gt;&gt; - config USE_BX<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 b=
ool &quot;Use BX in function return&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=
=A0default y<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0depends on HAS_THUMB<br>&gt=
;&gt; - =C2=A0 =C2=A0 =C2=A0 help<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Use BX instruction for THUMB aware architectures.<br>


&gt;&gt; ---<br>&gt;&gt; -1.7.1<br>&gt;&gt; -<br>&gt;&gt; diff --git a/meta=
/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch<br>&gt;&gt; b/meta/recipes=
-core/uclibc/uclibc-0.9.32/rtld_no.patch<br>&gt;&gt; deleted file mode 1006=
44<br>


&gt;&gt; index 30cb7f6..0000000<br>&gt;&gt; --- a/meta/recipes-core/uclibc/=
uclibc-0.9.32/rtld_no.patch<br>&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,215=
 +0,0 @@<br>&gt;&gt; -Patch is backported from<br>&gt;&gt; -<a href=3D"http=
://lists.busybox.net/pipermail/uclibc/2011-March/045004.html" target=3D"_bl=
ank">http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html</a><b=
r>


&gt;&gt; -<br>&gt;&gt; -Upstream-Status: Pending<br>&gt;&gt; -<br>&gt;&gt; =
-diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h<br>&gt;&gt; -in=
dex 7fbb373..7102351 100644<br>&gt;&gt; ---- a/ldso/include/dl-elf.h<br>


&gt;&gt; -+++ b/ldso/include/dl-elf.h<br>&gt;&gt; -@@ -25,16 +25,18 @@ stat=
ic __inline__ void _dl_map_cache(void) { }<br>&gt;&gt; - static __inline__ =
void _dl_unmap_cache(void) { }<br>&gt;&gt; - #endif<br>&gt;&gt; -<br>&gt;&g=
t; -+#define DL_RESOLVE_SECURE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
0001<br>


&gt;&gt; -+#define DL_RESOLVE_NOLOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0002<br>&gt;&gt; -<br>&gt;&gt; - /* Function prototypes for non-stati=
c stuff in readelflib1.c */<br>&gt;&gt; - extern void _dl_parse_lazy_reloca=
tion_information(struct dyn_elf *rpnt,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 unsigned long rel_addr, unsigned long rel_s=
ize);<br>&gt;&gt; - extern int _dl_parse_relocation_information(struct dyn_=
elf *rpnt,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 unsigned long rel_addr, unsig=
ned long rel_size);<br>&gt;&gt; --extern struct elf_resolve * _dl_load_shar=
ed_library(int secure,<br>


&gt;&gt; -+extern struct elf_resolve * _dl_load_shared_library(int resolve_=
flags,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 struct dyn_elf **rpnt, struct elf=
_resolve *tpnt, char<br>&gt;&gt; *full_libname,<br>&gt;&gt; - =C2=A0 =C2=A0=
 =C2=A0 int trace_loaded_objects);<br>


&gt;&gt; --extern struct elf_resolve * _dl_load_elf_shared_library(int secu=
re,<br>&gt;&gt; -+extern struct elf_resolve * _dl_load_elf_shared_library(i=
nt<br>&gt;&gt; resolve_flags,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 struct dyn=
_elf **rpnt, char *libname);<br>


&gt;&gt; - extern struct elf_resolve *_dl_check_if_named_library_is_loaded(=
const<br>&gt;&gt; char *full_libname,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 in=
t trace_loaded_objects);<br>&gt;&gt; -diff --git a/ldso/ldso/dl-elf.c b/lds=
o/ldso/dl-elf.c<br>


&gt;&gt; -index 2b2d429..6d35bf2 100644<br>&gt;&gt; ---- a/ldso/ldso/dl-elf=
.c<br>&gt;&gt; -+++ b/ldso/ldso/dl-elf.c<br>&gt;&gt; -@@ -132,7 +132,7 @@ _=
dl_protect_relro (struct elf_resolve *l)<br>&gt;&gt; - /* This function&#39=
;s behavior must exactly match that<br>


&gt;&gt; - =C2=A0* in uClibc/ldso/util/ldd.c */<br>&gt;&gt; - static struct=
 elf_resolve *<br>&gt;&gt; --search_for_named_library(const char *name, int=
 secure, const char<br>&gt;&gt; *path_list,<br>&gt;&gt; -+search_for_named_=
library(const char *name, int resolve_flags, const char<br>


&gt;&gt; *path_list,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 struct dyn_elf **rp=
nt, const char *origin)<br>&gt;&gt; - {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =
char *mylibname;<br>&gt;&gt; -@@ -162,7 +162,7 @@ search_for_named_library(=
const char *name, int<br>

&gt;&gt; secure, const char *path_list,<br>
&gt;&gt; -<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (plen&gt;=3D 7&amp;&amp; =C2=A0_dl_memcmp(p, &quot;$ORIGIN&quot;, 7) =3D=
=3D 0) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int olen;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (secure&amp;&amp; =
=C2=A0plen !=3D 7)<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ((resolve_flags&amp; =C2=A0DL_RESOLVE_SECURE)&amp;&amp; =C2=
=A0plen !=3D<br>&gt;&gt; 7)<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
ontinue;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (origin =3D=3D NULL)<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>&gt;&gt; -@@ -182,7 =
+182,7 @@ search_for_named_library(const char *name, int<br>&gt;&gt; secure=
, const char *path_list,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _dl_strcat(mylibname, &quot;/&quot;);<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_strcat(myli=
bname, name);<br>&gt;&gt; -<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tpnt =3D _dl_load_elf_shared_library(secure, rpnt,<br>&gt;=
&gt; mylibname);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tpnt =3D _dl_load_elf_shared_library(resolve_flags, rpnt,<br>


&gt;&gt; mylibname);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (tpnt !=3D NULL)<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt;<br>&gt;&gt; -=
 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; -@@ -194,7 +194,7 @@ search_for_named_l=
ibrary(const char *name, int<br>


&gt;&gt; secure, const char *path_list,<br>&gt;&gt; - unsigned long _dl_err=
or_number;<br>&gt;&gt; - unsigned long _dl_internal_error_number;<br>&gt;&g=
t; -<br>&gt;&gt; --struct elf_resolve *_dl_load_shared_library(int secure, =
struct dyn_elf<br>


&gt;&gt; **rpnt,<br>&gt;&gt; -+struct elf_resolve *_dl_load_shared_library(=
int resolve_flags, struct<br>&gt;&gt; dyn_elf **rpnt,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 struct elf_resolve *tpnt, char *full_libname, int attribute_u=
nused<br>&gt;&gt; trace_loaded_objects)<br>


&gt;&gt; - {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 char *pnt;<br>&gt;&gt; -@@ =
-223,7 +223,7 @@ struct elf_resolve *_dl_load_shared_library(int<br>&gt;&gt=
; secure, struct dyn_elf **rpnt,<br>&gt;&gt; -<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 if (libname !=3D full_libname) {<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dp=
rint(&quot;\ttrying file=3D&#39;%s&#39;\n&quot;, full_libname);<br>&gt;&gt;=
 -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt1 =3D _dl_load_elf_=
shared_library(secure, rpnt,<br>&gt;&gt; full_libname);<br>&gt;&gt; -+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt1 =3D _dl_load_elf_shared_=
library(resolve_flags, rpnt,<br>


&gt;&gt; full_libname);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (tpnt1) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt1;<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; -@@ -238,7 +238=
,7 @@ struct elf_resolve *_dl_load_shared_library(int<br>


&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =
if (pnt) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
nt +=3D (unsigned long) tpnt-&gt;dynamic_info[DT_STRTAB];<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\ts=
earching RPATH=3D&#39;%s&#39;\n&quot;, pnt);<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D =
search_for_named_library(libname, secure,<br>&gt;&gt; pnt, rpnt,<br>&gt;&gt=
; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_=
for_named_library(libname,<br>&gt;&gt; resolve_flags, pnt, rpnt,<br>&gt;&gt=
; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tpnt-&gt;libname)) !=3D<br>


&gt;&gt; NULL)<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt1;<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt;&gt; -@@ -247,7 +247,7 @@ struct elf_resolve *_dl_load_shar=
ed_library(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 /* Check in LD_{ELF_}LIBRARY_PATH, if specified and allow=
ed */<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if (_dl_library_path) {<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\ts=
earching LD_LIBRARY_PATH=3D&#39;%s&#39;\n&quot;,<br>&gt;&gt; _dl_library_pa=
th);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tp=
nt1 =3D search_for_named_library(libname, secure,<br>


&gt;&gt; _dl_library_path, rpnt, NULL)) !=3D NULL)<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_li=
brary(libname,<br>&gt;&gt; resolve_flags, _dl_library_path, rpnt, NULL)) !=
=3D NULL)<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<=
br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return tpnt1;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; -@@ -261,7 +261,7 @@ struct elf_resolve *_d=
l_load_shared_library(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt=
;&gt; - =C2=A0 =C2=A0 =C2=A0 if (pnt) {<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pnt +=3D (unsig=
ned long) tpnt-&gt;dynamic_info[DT_STRTAB];<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\tsearching RUNPA=
TH=3D&#39;%s&#39;\n&quot;, pnt);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname, secur=
e,<br>


&gt;&gt; pnt, rpnt, NULL)) !=3D NULL)<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname,=
<br>&gt;&gt; resolve_flags, pnt, rpnt, NULL)) !=3D NULL)<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn tpnt1;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 }<br>


&gt;&gt; - #endif<br>&gt;&gt; -@@ -284,7 +284,7 @@ struct elf_resolve *_dl_=
load_shared_library(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&=
gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| libent[i].flags =3D=3D LIB_ELF_LIBC0<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| libent[i].flags =3D=3D LIB_ELF_LIBC5)<=
br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;&amp; =C2=A0_dl_strcmp(libname, strs + libent[i].soo=
ffset)<br>&gt;&gt; =3D=3D 0<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; =C2=A0(tpnt1 =3D _d=
l_load_elf_shared_library(secure,<br>


&gt;&gt; rpnt, strs + libent[i].liboffset))<br>&gt;&gt; -+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; =
=C2=A0(tpnt1 =3D<br>&gt;&gt; _dl_load_elf_shared_library(resolve_flags, rpn=
t, strs +<br>&gt;&gt; libent[i].liboffset))<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt1;<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>&gt;&gt; -@@ -295,14 +295,14 @@ struct elf_resolve *_dl_load_shared_lib=
rary(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 /* Look for libraries wherever the shared l=
ibrary loader<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0* was installed */<b=
r>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\tsearching lds=
o dir=3D&#39;%s&#39;\n&quot;, _dl_ldsopath);<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0tpnt1 =3D search_for_named_library(libname,=
 secure, _dl_ldsopath,<br>&gt;&gt; rpnt, NULL);<br>&gt;&gt; -+ =C2=A0 =C2=
=A0 =C2=A0tpnt1 =3D search_for_named_library(libname, resolve_flags,<br>&gt=
;&gt; _dl_ldsopath, rpnt, NULL);<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if (tpnt1 !=3D NULL)<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt1;<br>&gt;&gt; -<br>&g=
t;&gt; - =C2=A0 =C2=A0 =C2=A0 /* Lastly, search the standard list of paths =
for the library.<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This list =
must exactly match the list in uClibc/ldso/util/ldd.c<br>


&gt;&gt; */<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\t=
searching full lib path list\n&quot;);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0t=
pnt1 =3D search_for_named_library(libname, secure,<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0tpnt1 =3D search_for_named_library(libname, resolve_flags,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UCLIB=
C_RUNTIME_PREFIX &quot;lib:&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UCLIBC_RUNTIME_PREFIX &quot;usr/lib&quot;<b=
r>&gt;&gt; - #ifndef __LDSO_CACHE_SUPPORT__<br>


&gt;&gt; -@@ -329,7 +329,7 @@ goof:<br>&gt;&gt; - =C2=A0* are required.<br>=
&gt;&gt; - =C2=A0*/<br>&gt;&gt; -<br>&gt;&gt; --struct elf_resolve *_dl_loa=
d_elf_shared_library(int secure,<br>&gt;&gt; -+struct elf_resolve *_dl_load=
_elf_shared_library(int resolve_flags,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 struct dyn_elf **rpnt, char *libname)<br>&g=
t;&gt; - {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 ElfW(Ehdr) *epnt;<br>&gt;&gt;=
 -@@ -368,7 +368,7 @@ struct elf_resolve *_dl_load_elf_shared_library(int<b=
r>&gt;&gt; secure,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 }<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 /* If we are in secure mode (i.e. a setu/gi=
d binary using<br>&gt;&gt; LD_PRELOAD),<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0we don&#39;t load the library if it isn&#39;t setuid. */<br>&g=
t;&gt; -- =C2=A0 =C2=A0 =C2=A0if (secure) {<br>&gt;&gt; -+ =C2=A0 =C2=A0 =
=C2=A0if (resolve_flags&amp; =C2=A0DL_RESOLVE_SECURE) {<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(st.st_mod=
e&amp; =C2=A0S_ISUID)) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_close(infile);<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NULL;<br>&gt;&gt; -@@ -384,6 +384,10 @@ struct elf_resolve *_dl_=
load_elf_shared_library(int<br>


&gt;&gt; secure,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpnt;<br>&gt;&gt; - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 }<=
br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0if (resolve_flags&amp; =C2=A0DL_RESOLVE_=
NOLOAD) {<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_d=
l_close(infile);<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br=
>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 heade=
r =3D _dl_mmap((void *) 0, _dl_pagesize, PROT_READ |<br>&gt;&gt; PROT_WRITE=
,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE,<br>


&gt;&gt; -1, 0);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if (_dl_mmap_check_erro=
r(header)) {<br>&gt;&gt; -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c<=
br>&gt;&gt; -index 9423670..b71af34 100644<br>&gt;&gt; ---- a/ldso/ldso/lds=
o.c<br>&gt;&gt; -+++ b/ldso/ldso/ldso.c<br>


&gt;&gt; -@@ -646,7 +646,9 @@ void _dl_get_ready_to_run(struct elf_resolve =
*tpnt,<br>&gt;&gt; DL_LOADADDR_TYPE load_addr,<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!_dl_sec=
ure || _dl_strchr(str, &#39;/&#39;) =3D=3D NULL) {<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_if_debug_dprint(&quot;\tfile=
=3D&#39;%s&#39;; =C2=A0needed<br>
&gt;&gt; by &#39;%s&#39;\n&quot;, str, _dl_progname);<br>&gt;&gt; -<br>&gt;=
&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt1 =3D<br>&gt;&gt; _dl_load_shared=
_library(_dl_secure,&amp;rpnt, NULL, str, trace_loaded_objects);<br>&gt;&gt=
; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt1 =3D _dl_load_shared_library(<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_se=
cure ? DL_RESOLVE_SECURE :<br>&gt;&gt; 0,<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rpnt, NULL, str,<br>&gt;&gt; =
trace_loaded_objects);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tpn=
t1) {<br>


&gt;&gt; - #ifdef __LDSO_LDD_SUPPORT__<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (trace_loaded_objects)<br>&gt;&gt=
; -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c<br>&gt;&gt; -index =
68cd579..edf38d2 100644<br>


&gt;&gt; ---- a/ldso/libdl/libdl.c<br>&gt;&gt; -+++ b/ldso/libdl/libdl.c<br=
>&gt;&gt; -@@ -288,7 +288,7 @@ void *dlopen(const char *libname, int flag)<=
br>&gt;&gt; - #endif<br>&gt;&gt; -<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 /* A =
bit of sanity checking... */<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0if (!(flag&amp; =C2=A0(RTLD_LAZY|RTLD_NOW))=
) {<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0if (!(flag&amp; =C2=A0(RTLD_LAZY|RTL=
D_NOW|RTLD_NOLOAD))) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _dl_error_number =3D LD_BAD_HANDLE;<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; -@@ -358,8 +358,9 @@ void *dl=
open(const char *libname, int flag)<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 /* T=
ry to load the specified library */<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 _dl_=
if_debug_print(&quot;Trying to dlopen &#39;%s&#39;, RTLD_GLOBAL:%d<br>


&gt;&gt; RTLD_NOW:%d\n&quot;,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (char*)libname, (flag&amp; =
=C2=A0RTLD_GLOBAL ? 1:0),<br>&gt;&gt; (now_flag&amp; =C2=A0RTLD_NOW ? 1:0))=
;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0tpnt =3D _dl_load_shared_library(0,&am=
p;rpnt, tfrom, (char*)libname, 0);<br>


&gt;&gt; -<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0tpnt =3D _dl_load_shared_libr=
ary((flag&amp; =C2=A0RTLD_NOLOAD) ?<br>&gt;&gt; DL_RESOLVE_NOLOAD : 0,<br>&=
gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r=
pnt, tfrom, (char*)libname, 0);<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 if (tpnt=
 =3D=3D NULL) {<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_unmap_cache=
();<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return N=
ULL;<br>&gt;&gt; -diff --git a/libc/sysdeps/linux/common/bits/dlfcn.h<br>&g=
t;&gt; b/libc/sysdeps/linux/common/bits/dlfcn.h<br>&gt;&gt; -index 4bfbbff.=
.47b42ad 100644<br>


&gt;&gt; ---- a/libc/sysdeps/linux/common/bits/dlfcn.h<br>&gt;&gt; -+++ b/l=
ibc/sysdeps/linux/common/bits/dlfcn.h<br>&gt;&gt; -@@ -24,9 +24,9 @@<br>&gt=
;&gt; - /* The MODE argument to `dlopen&#39; contains one of the following:=
 */<br>


&gt;&gt; - #define RTLD_LAZY =C2=A0 =C2=A0 0x00001 /* Lazy function call bi=
nding. =C2=A0*/<br>&gt;&gt; - #define RTLD_NOW =C2=A0 =C2=A0 =C2=A00x00002 =
/* Immediate function call binding. =C2=A0*/<br>&gt;&gt; --#if 0 /* uClibc =
doesnt support these */<br>&gt;&gt; --#define =C2=A0 =C2=A0 =C2=A0 RTLD_BIN=
DING_MASK =C2=A0 0x3 /* Mask of binding time value. =C2=A0*/<br>


&gt;&gt; -+#define RTLD_BINDING_MASK =C2=A0 0x3 =C2=A0 =C2=A0 =C2=A0 /* Mas=
k of binding time value. =C2=A0*/<br>&gt;&gt; - #define RTLD_NOLOAD =C2=A0 =
0x00004 /* Do not load the object. =C2=A0*/<br>&gt;&gt; -+#if 0 /* uClibc d=
oesnt support these */<br>&gt;&gt; - #define RTLD_DEEPBIND 0x00008 /* Use d=
eep binding. =C2=A0*/<br>


&gt;&gt; - #endif<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uc=
libc/uclibc-0.9.32/select-force-thumb.patch<br>&gt;&gt; b/meta/recipes-core=
/uclibc/uclibc-0.9.32/select-force-thumb.patch<br>&gt;&gt; deleted file mod=
e 100644<br>


&gt;&gt; index b19408f..0000000<br>&gt;&gt; --- a/meta/recipes-core/uclibc/=
uclibc-0.9.32/select-force-thumb.patch<br>&gt;&gt; +++ /dev/null<br>&gt;&gt=
; @@ -1,172 +0,0 @@<br>&gt;&gt; -Delivered-To: <a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a><br>


&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313301agb;<br>&gt;&gt; -=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:17 -0800 (PST)<br>&gt;&gt=
; -Received: by 10.216.186.82 with SMTP id<br>&gt;&gt; v60mr20017574wem.56.=
1294533916559;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:16 -0800 (PST)=
<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:yann.morin.1998@anciens.eni=
b.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=3D"_blank=
">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.orange.fr" t=
arget=3D"_blank">smtp01.smtpout.orange.fr</a><br>


&gt;&gt; <a href=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"=
_blank">[80.12.242.123</a>])<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a=
 href=3D"http://mx.google.com" target=3D"_blank">mx.google.com</a> with ESM=
TP id<br>&gt;&gt; o13si33755824wee.56.2011.01.08.16.45.16;<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:16 -0800 (PST)=
<br>
&gt;&gt; -Received-SPF: neutral (<a href=3D"http://google.com" target=3D"_b=
lank">google.com</a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" =
target=3D"_blank">80.12.242.123</a> is neither permitted nor<br>&gt;&gt; de=
nied by best guess record for domain of <a href=3D"mailto:yann.morin.1998@a=
nciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>


&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+18012242123" t=
arget=3D"_blank">80.12.242.123</a>;<br>&gt;&gt; -Authentication-Results: <a=
 href=3D"http://mx.google.com" target=3D"_blank">mx.google.com</a>; spf=3Dn=
eutral (<a href=3D"http://google.com" target=3D"_blank">google.com</a>:<br>

&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>
&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.fr" targe=
t=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>&gt;&gt; smtp.mail=3D<=
a href=3D"mailto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">yann.mo=
rin.1998@anciens.enib.fr</a><br>

&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 id tClC1f0024v5z3u03ClFDL; Sun, 09 Jan 2011 01:45:16 +0100<br=
>&gt;&gt; -From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.=
1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>=
&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 2/7] ARM: introduce blind options to select&amp; =C2=
=A0force THUMB<br>&gt;&gt; mode<br>

&gt;&gt; -Date: Sun, =C2=A09 Jan 2011 01:45:05 +0100<br>
&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-3-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-3-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -Add three new blind options to set use of Thumb mod=
e:<br>&gt;&gt; -- COMPILE_IN_THUMB_MODE<br>&gt;&gt; - =C2=A0- if set, CFLAG=
S will contain -mthumb<br>&gt;&gt; - =C2=A0- if unset, the compiler&#39;s d=
efault is used<br>


&gt;&gt; -- HAS_THUMB<br>&gt;&gt; - =C2=A0- CPUS with Thumb instruction set=
 can select this<br>&gt;&gt; - =C2=A0- use of BX depends on this<br>&gt;&gt=
; -- FORCE_THUMB<br>&gt;&gt; - =C2=A0- CPUs that are Thumb-only must select=
 this<br>&gt;&gt; - =C2=A0- this selects: HAS_THUMB, COMPILE_IN_THUMB_MODE =
and USE_BX<br>


&gt;&gt; -<br>&gt;&gt; -Also, remove leading space in Rules.mak.<br>&gt;&gt=
; -<br>&gt;&gt; -Signed-off-by: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mai=
lto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anci=
ens.enib.fr</a>&gt;<br>


&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Bernhard Reutner-Fischer=
&lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@=
gmail.com</a>&gt;<br>

&gt;&gt; -Cc: Carmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" =
target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>
&gt;&gt; ----<br>&gt;&gt; - Rules.mak =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A07 ++++---<br>&gt;&gt; - extra/Configs/Co=
nfig.arm | =C2=A0 31 ++++++++++++++++++++++++++++---<br>&gt;&gt; - 2 files =
changed, 32 insertions(+), 6 deletions(-)<br>&gt;&gt; -<br>


&gt;&gt; -diff --git a/Rules.mak b/Rules.mak<br>&gt;&gt; -index eecdc64..2a=
16908 100644<br>&gt;&gt; ---- a/Rules.mak<br>&gt;&gt; -+++ b/Rules.mak<br>&=
gt;&gt; -@@ -348,9 +348,10 @@ ifeq ($(TARGET_ARCH),arm)<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=3D-mtune=3Dstrongarm1100=
 -march=3Darmv4<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=3D$(call<b=
r>&gt;&gt; check_gcc,-mtune=3Dxscale,-mtune=3Dstrongarm110)<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=3D-march=3Darmv5te -W=
a,-mcpu=3Dxscale<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM=
_IWMMXT)+=3D-march=3Diwmmxt -Wa,-mcpu=3Diwmmxt<br>


&gt;&gt; -mabi=3Diwmmxt<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CON=
FIG_ARM_CORTEX_M3)+=3D-mcpu=3Dcortex-m3 -mthumb<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=3D-mcpu=3Dcortex-m1 -mthumb<b=
r>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=3D-march=
=3Diwmmxt -Wa,-mcpu=3Diwmmxt<br>


&gt;&gt; -mabi=3Diwmmxt<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(CON=
FIG_ARM_CORTEX_M3)+=3D-mcpu=3Dcortex-m3<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0=
CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=3D-mcpu=3Dcortex-m1<br>&gt;&gt; -+ =C2=
=A0 =C2=A0 =C2=A0CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=3D-mthumb<br>


&gt;&gt; - endif<br>&gt;&gt; -<br>&gt;&gt; - ifeq ($(TARGET_ARCH),mips)<br>=
&gt;&gt; -diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm<=
br>&gt;&gt; -index 3b90e67..c9c40d4 100644<br>&gt;&gt; ---- a/extra/Configs=
/Config.arm<br>


&gt;&gt; -+++ b/extra/Configs/Config.arm<br>&gt;&gt; -@@ -64,70 +64,95 @@ c=
onfig CONFIG_ARM710<br>&gt;&gt; - config CONFIG_ARM7TDMI<br>&gt;&gt; - =C2=
=A0 =C2=A0 =C2=A0 bool &quot;Arm 7TDMI&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 select ARCH_HAS_NO_MMU<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; =
- config CONFIG_ARM720T<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm 7=
20T&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt=
; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>


&gt;&gt; - config CONFIG_ARM920T<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &q=
uot;Arm 920T&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<b=
r>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt=
; - config CONFIG_ARM922T<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm=
 922T&quot;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM=
926T<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm 926T&quot;<br>&gt;&g=
t; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =
=C2=A0select HAS_THUMB<br>


&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM10T<br>&gt;&gt; - =C2=A0 =C2=A0 =
=C2=A0 bool &quot;Arm 10T&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select A=
RCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt;=
 -<br>&gt;&gt; - config CONFIG_ARM1136JF_S<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm 1136JF-S&quot;<br>&gt;&gt; -=
 =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=
=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM1176JZ_S<b=
r>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm 1176JZ-S&quot;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM=
1176JZF_S<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Arm 1176JZF-S&quot;=
<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; =
- config CONFIG_ARM_CORTEX_M3<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot=
;Arm Cortex-M3&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_NO_=
MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select USE_BX<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select FORCE_THUMB<br>&gt;&gt; -<br>&gt;&gt=
; - config CONFIG_ARM_CORTEX_M1<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &qu=
ot;Arm Cortex-M1&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_N=
O_MMU<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0select USE_BX<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select FORCE_THUMB<br>&gt;&gt; -<br>&gt;&gt=
; - config CONFIG_ARM_SA110<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;I=
ntel StrongArm SA-110&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_=
HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select HAS_THUMB<br>


&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM_SA1100<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 bool &quot;Intel StrongArm SA-1100&quot;<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select=
 HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM_XSCALE<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Intel Xscale&quot;<br>&gt;&gt; -=
 =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=
=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - config CONFIG_ARM_IWMMXT<br=
>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Intel Xscale With WMMX PXA27x&q=
uot;<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 select ARCH_HAS_MMU<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0select HAS_THUMB<br>&gt;&gt; -<br>&gt;&gt; - endchoice<br>&gt;=
&gt; -<br>&gt;&gt; -+config HAS_THUMB<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0bo=
ol<br>&gt;&gt; -+<br>&gt;&gt; -+config FORCE_THUMB<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0bool<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0sel=
ect HAS_THUMB<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select COMPILE_IN_THUMB_MO=
DE<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0select USE_BX<br>&gt;&gt; -+<br>&gt;&=
gt; -+config COMPILE_IN_THUMB_MODE<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0bool<=
br>


&gt;&gt; -+<br>&gt;&gt; - config USE_BX<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =
bool &quot;Use BX in function return&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 default y<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0depends on !CONFIG_GENERIC=
_ARM&amp;&amp; =C2=A0!CONFIG_ARM610&amp;&amp; =C2=A0!CONFIG_ARM710<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0depends on HAS_THUMB<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 help<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 Use BX instruc=
tion for THUMB aware architectures.<br>&gt;&gt; ---<br>&gt;&gt; -1.7.1<br>&=
gt;&gt; -<br>&gt;&gt; diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/s=
ync_file_range2.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch<br=
>&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 4b85a43..0000000<br>&g=
t;&gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch<=
br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,47 +0,0 @@<br>&gt;&gt; -Some archi=
tectures like ppc, arm use aligned 64 bit inputs so a register<br>&gt;&gt; =
is not wasted<br>&gt;&gt; -this then uses __NR_sync_file_range2 syscall. Im=
plement is<br>


&gt;&gt; -<br>&gt;&gt; -Singed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -<br=
>&gt;&gt; -Upstream-Status: Pending<br>&gt;&gt; -<br>&gt;&gt; -Index: git/l=
ibc/sysdeps/linux/common/sync_file_range.c<br>


&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt;=
 ---- git.orig/libc/sysdeps/linux/common/sync_file_range.c =C2=A0 =C2=A0 =
=C2=A0 2011-07-19<br>&gt;&gt; 14:23:35.000000000 -0700<br>&gt;&gt; -+++ git=
/libc/sysdeps/linux/common/sync_file_range.c =C2=A0 =C2=A02011-07-19<br>


&gt;&gt; 15:04:38.631808666 -0700<br>&gt;&gt; -@@ -11,7 +11,8 @@<br>&gt;&gt=
; - #if defined __USE_GNU<br>&gt;&gt; - #include&lt;fcntl.h&gt;<br>&gt;&gt;=
 -<br>&gt;&gt; --#if defined __NR_sync_file_range&amp;&amp; =C2=A0defined _=
_UCLIBC_HAS_LFS__<br>


&gt;&gt; -+#if defined __UCLIBC_HAS_LFS__<br>&gt;&gt; -+#if defined __NR_sy=
nc_file_range<br>&gt;&gt; - #define __NR___syscall_sync_file_range __NR_syn=
c_file_range<br>&gt;&gt; - static __inline__ _syscall6(int, __syscall_sync_=
file_range, int, fd,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_t, offset_h=
i, off_t, offset_lo,<br>&gt;&gt; -@@ -23,5 +24,23 @@<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __LONG_LONG_PAIR((long)(nbytes&gt=
;&gt; =C2=A032), (long)(nbytes&amp;<br>&gt;&gt; =C2=A00xffffffff)),<br>&gt;=
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags);<br>


&gt;&gt; - }<br>&gt;&gt; --#endif<br>&gt;&gt; --#endif<br>&gt;&gt; -+#elif =
defined __NR_sync_file_range2<br>&gt;&gt; -+#define __NR___syscall_sync_fil=
e_range2 __NR_sync_file_range2<br>&gt;&gt; -+static __inline__ _syscall6(in=
t, __syscall_sync_file_range2, int, fd,<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int, f=
lags, off_t, offset_hi, off_t, offset_lo,<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t, nbytes_hi, off_t, nbytes_lo)<br>&gt;&=
gt; -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned =
int<br>


&gt;&gt; flags)<br>&gt;&gt; -+{<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0return _=
_syscall_sync_file_range2(fd, flags,<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0__LONG_LONG_PAIR((long)(offset&gt;&gt; =C2=A032)=
, (long)(offset&amp;<br>&gt;&gt; =C2=A00xffffffff)),<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__LONG_LONG_PAIR((long)(nbytes&gt;=
&gt; =C2=A032), (long)(nbytes&amp;<br>


&gt;&gt; =C2=A00xffffffff)));<br>&gt;&gt; -+}<br>&gt;&gt; -+#else<br>&gt;&g=
t; -+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned i=
nt<br>&gt;&gt; flags)<br>&gt;&gt; -+{<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__=
set_errno (ENOSYS);<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0return -1<br>&gt;&gt; -+}<br>&gt;&gt; -+#en=
dif /* __NR_sync_file_range */<br>&gt;&gt; -+#endif /* __UCLIBC_HAS_LFS__ *=
/<br>&gt;&gt; -+#endif /* __USE_GNU */<br>&gt;&gt; diff --git<br>&gt;&gt; a=
/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch<br=
>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choic=
e.patch<br>&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 82970ca..000=
0000<br>&gt;&gt; ---<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/t=
ransform-eabi-oabi-choice.patch<br>


&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,71 +0,0 @@<br>&gt;&gt; -Delivered-=
To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a><br>&gt;&gt; -Received: by 10.90.86.4 with SMTP id j4cs313305agb;<br=
>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 8 Jan 2011 16:45:19 -0800 (PST)<=
br>
&gt;&gt; -Received: by 10.216.153.210 with SMTP id<br>&gt;&gt; f60mr573848w=
ek.114.1294533918335;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0Sat, 08 Jan =
2011 16:45:18 -0800 (PST)<br>&gt;&gt; -Return-Path:&lt;<a href=3D"mailto:ya=
nn.morin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.en=
ib.fr</a>&gt;<br>


&gt;&gt; -Received: from <a href=3D"http://smtp.smtpout.orange.fr" target=
=3D"_blank">smtp.smtpout.orange.fr</a> (<a href=3D"http://smtp01.smtpout.or=
ange.fr" target=3D"_blank">smtp01.smtpout.orange.fr</a><br>&gt;&gt; <a href=
=3D"tel:%5B80.12.242.123" value=3D"+18012242123" target=3D"_blank">[80.12.2=
42.123</a>])<br>

&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx.google.com" t=
arget=3D"_blank">mx.google.com</a> with ESMTP id<br>
&gt;&gt; n4si33737071wej.152.2011.01.08.16.45.17;<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sat, 08 Jan 2011 16:45:18 -0800 (PST)<br>&gt;&gt; -Receive=
d-SPF: neutral (<a href=3D"http://google.com" target=3D"_blank">google.com<=
/a>: <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_blank"=
>80.12.242.123</a> is neither permitted nor<br>


&gt;&gt; denied by best guess record for domain of <a href=3D"mailto:yann.m=
orin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.f=
r</a>)<br>&gt;&gt; client-ip=3D<a href=3D"tel:80.12.242.123" value=3D"+1801=
2242123" target=3D"_blank">80.12.242.123</a>;<br>

&gt;&gt; -Authentication-Results: <a href=3D"http://mx.google.com" target=
=3D"_blank">mx.google.com</a>; spf=3Dneutral (<a href=3D"http://google.com"=
 target=3D"_blank">google.com</a>:<br>
&gt;&gt; <a href=3D"tel:80.12.242.123" value=3D"+18012242123" target=3D"_bl=
ank">80.12.242.123</a> is neither permitted nor denied by best guess record=
 for<br>&gt;&gt; domain of <a href=3D"mailto:yann.morin.1998@anciens.enib.f=
r" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>)<br>

&gt;&gt; smtp.mail=3D<a href=3D"mailto:yann.morin.1998@anciens.enib.fr" tar=
get=3D"_blank">yann.morin.1998@anciens.enib.fr</a><br>
&gt;&gt; -Received: from roazhon.bzh.lan ([90.32.245.227])<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 by mwinf5d24 with ME<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=
=A0 id tClC1f0024v5z3u03ClGDX; Sun, 09 Jan 2011 01:45:17 +0100<br>&gt;&gt; =
-From: &quot;Yann E. MORIN&quot;&lt;<a href=3D"mailto:yann.morin.1998@ancie=
ns.enib.fr" target=3D"_blank">yann.morin.1998@anciens.enib.fr</a>&gt;<br>


&gt;&gt; -To: <a href=3D"mailto:uclibc@uclibc.org" target=3D"_blank">uclibc=
@uclibc.org</a><br>&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;,<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 Bernhard Reutner-Fischer&lt;<a href=3D"mailto:rep.dot.nop@gma=
il.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 Carmelo AMOROSO&lt;<a href=3D"mailto:carmel=
o.amoroso@st.com" target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>&gt;&=
gt; -Subject: [PATCH 4/7] ARM: transform the EABI/OABI choice into a boolea=
n<br>&gt;&gt; -Date: Sun, =C2=A09 Jan 2011 01:45:07 +0100<br>


&gt;&gt;<br>&gt;&gt; -Message-Id:&lt;<a href=3D"mailto:1294533910-19305-5-g=
it-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910=
-19305-5-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt;=
 -X-Mailer: git-send-email 1.7.1<br>


&gt;&gt;<br>&gt;&gt; -In-Reply-To:&lt;<a href=3D"mailto:1294533910-19305-1-=
git-send-email-yann.morin.1998@anciens.enib.fr" target=3D"_blank">129453391=
0-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>&gt;&gt=
;<br>

&gt;&gt; -References:&lt;<a href=3D"mailto:1294533910-19305-1-git-send-emai=
l-yann.morin.1998@anciens.enib.fr" target=3D"_blank">1294533910-19305-1-git=
-send-email-yann.morin.1998@anciens.enib.fr</a>&gt;<br>
&gt;&gt; -<br>&gt;&gt; -The CONFIG_ARM_OABI option is never used.<br>&gt;&g=
t; -<br>&gt;&gt; -Signed-off-by: &quot;Yann E. MORIN&quot;&lt;<a href=3D"ma=
ilto:yann.morin.1998@anciens.enib.fr" target=3D"_blank">yann.morin.1998@anc=
iens.enib.fr</a>&gt;<br>


&gt;&gt; -Cc: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; -Cc: Bernhard Reutner-Fischer=
&lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@=
gmail.com</a>&gt;<br>

&gt;&gt; -Cc: Carmelo AMOROSO&lt;<a href=3D"mailto:carmelo.amoroso@st.com" =
target=3D"_blank">carmelo.amoroso@st.com</a>&gt;<br>
&gt;&gt; ----<br>&gt;&gt; - extra/Configs/Config.arm | =C2=A0 23 ++++++++--=
-------------<br>&gt;&gt; - 1 files changed, 8 insertions(+), 15 deletions(=
-)<br>&gt;&gt; -<br>&gt;&gt; -Index: git/extra/Configs/Config.arm<br>&gt;&g=
t; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>


&gt;&gt; ---- git.orig/extra/Configs/Config.arm<br>&gt;&gt; -+++ git/extra/=
Configs/Config.arm<br>&gt;&gt; -@@ -12,23 +12,16 @@ config FORCE_OPTIONS_FO=
R_ARCH<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 default y<br>&gt;&gt; - =C2=A0 =
=C2=A0 =C2=A0 select ARCH_ANY_ENDIAN<br>


&gt;&gt; -<br>&gt;&gt; --choice<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0prompt &=
quot;Target ABI&quot;<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0default CONFIG_ARM=
_EABI<br>&gt;&gt; -+config CONFIG_ARM_EABI<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=
=A0bool &quot;Build for EABI&quot;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 help<=
br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0If you choose &quot;EABI&quot; here,=
 functions and constants required by<br>&gt;&gt; the<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ARM EABI will be built into the library. =C2=A0You shou=
ld choose<br>&gt;&gt; &quot;EABI&quot;<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say &#39;y&#39; here, functio=
ns and constants required by the<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ARM EABI will be built into the library. =C2=A0You should say &#39;y&#39;<b=
r>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if your compiler uses the ARM EABI=
, in which case you will also<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0need a kernel supporting the EABI sy=
stem call interface, or<br>&gt;&gt; &quot;OABI&quot;<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0for a compiler using the old Linux ABI.<br>&gt;&gt; --<=
br>&gt;&gt; --config CONFIG_ARM_OABI<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quot;OABI&quot;<br>&gt;&gt; --<br>&gt=
;&gt; --config CONFIG_ARM_EABI<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0bool &quo=
t;EABI&quot;<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0need a kernel suppor=
ting the EABI system call interface.<br>&gt;&gt; -<br>


&gt;&gt; --endchoice<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say &=
#39;n&#39; here, then the library will be built for the<br>&gt;&gt; -+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0old Linux ABI.<br>&gt;&gt; -<br>&gt;&gt; - config C=
OMPILE_IN_THUMB_MODE<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 bool &quot;Build us=
ing Thumb mode&quot;<br>


&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/uc=
libc-arm-ftruncate64.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.=
9.32/uclibc-arm-ftruncate64.patch<br>&gt;&gt; deleted file mode 100644<br>


&gt;&gt; index 504d37b..0000000<br>&gt;&gt; --- a/meta/recipes-core/uclibc/=
uclibc-0.9.32/uclibc-arm-ftruncate64.patch<br>&gt;&gt; +++ /dev/null<br>&gt=
;&gt; @@ -1,13 +0,0 @@<br>&gt;&gt; -Index: uclibc-0.9.29/libc/sysdeps/linux=
/arm/bits/uClibc_arch_features.h<br>


&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt;=
 ---- uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h=
<br>&gt;&gt; -+++ uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_fea=
tures.h<br>


&gt;&gt; -@@ -38,4 +38,8 @@<br>&gt;&gt; - /* define if target supports IEEE=
 signed zero floats */<br>&gt;&gt; - #define __UCLIBC_HAVE_SIGNED_ZERO__<br=
>&gt;&gt; -<br>&gt;&gt; -+#ifdef __ARM_EABI__<br>&gt;&gt; -+# define __UCLI=
BC_TRUNCATE64_HAS_4_ARGS__<br>


&gt;&gt; -+#endif<br>&gt;&gt; -+<br>&gt;&gt; - #endif /* _BITS_UCLIBC_ARCH_=
FEATURES_H */<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc=
/uclibc-0.9.32/uclibc_scheduler_update.patch<br>&gt;&gt; b/meta/recipes-cor=
e/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch<br>


&gt;&gt; deleted file mode 100644<br>&gt;&gt; index 78401bd..0000000<br>&gt=
;&gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.=
patch<br>&gt;&gt; +++ /dev/null<br>&gt;&gt; @@ -1,455 +0,0 @@<br>&gt;&gt; -=
From 2becc16ecbef71c496644d9dc6cbd7383d7cdca3 Mon Sep 17 00:00:00 2001<br>


&gt;&gt; -From: Henning Heinold&lt;<a href=3D"mailto:heinold@inf.fu-berlin.=
de" target=3D"_blank">heinold@inf.fu-berlin.de</a>&gt;<br>&gt;&gt; -Date: S=
at, 4 Jun 2011 21:21:41 +0200<br>&gt;&gt; -Subject: [PATCH 1/2] libc: updat=
es the linux scheduler functions, most<br>


&gt;&gt; stuff<br>&gt;&gt; - was taken from the eglibc<br>&gt;&gt; -<br>&gt=
;&gt; -<br>&gt;&gt; -Signed-off-by: Henning Heinold&lt;<a href=3D"mailto:he=
inold@inf.fu-berlin.de" target=3D"_blank">heinold@inf.fu-berlin.de</a>&gt;<=
br>

&gt;&gt; ----<br>
&gt;&gt; - include/sched.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 52 ++++++++++++--=
--<br>&gt;&gt; - libc/sysdeps/linux/common/Makefile.in =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A04 +-<br>&gt;&gt; - libc/sysdeps/linux/common/bits/sched.h =
=C2=A0 =C2=A0 | =C2=A0 96<br>&gt;&gt; +++++++++++++++++++++++-----<br>


&gt;&gt; - libc/sysdeps/linux/common/sched_cpualloc.c | =C2=A0 27 ++++++++<=
br>&gt;&gt; - libc/sysdeps/linux/common/sched_cpucount.c | =C2=A0 60 ++++++=
+++++++++++<br>&gt;&gt; - libc/sysdeps/linux/common/sched_cpufree.c =C2=A0|=
 =C2=A0 27 ++++++++<br>


&gt;&gt; - libc/sysdeps/linux/common/sched_getcpu.c =C2=A0 | =C2=A0 37 ++++=
+++++++<br>&gt;&gt; - libc/sysdeps/linux/common/unshare.c =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 12 ++++<br>&gt;&gt; - 8 files changed, 286 insertions(+)=
, 29 deletions(-)<br>&gt;&gt; - create mode 100644 libc/sysdeps/linux/commo=
n/sched_cpualloc.c<br>


&gt;&gt; - create mode 100644 libc/sysdeps/linux/common/sched_cpucount.c<br=
>&gt;&gt; - create mode 100644 libc/sysdeps/linux/common/sched_cpufree.c<br=
>&gt;&gt; - create mode 100644 libc/sysdeps/linux/common/sched_getcpu.c<br>


&gt;&gt; - create mode 100644 libc/sysdeps/linux/common/unshare.c<br>&gt;&g=
t; -<br>&gt;&gt; -diff --git a/include/sched.h b/include/sched.h<br>&gt;&gt=
; -index 0d110c3..e265b84 100644<br>&gt;&gt; ---- a/include/sched.h<br>


&gt;&gt; -+++ b/include/sched.h<br>&gt;&gt; -@@ -1,5 +1,5 @@<br>&gt;&gt; - =
/* Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling<br>&gt;&gt; =
interface.<br>&gt;&gt; -- =C2=A0 Copyright (C) 1996,1997,1999,2001-2003,200=
4 Free Software Foundation,<br>


&gt;&gt; Inc.<br>&gt;&gt; -+ =C2=A0 Copyright (C) 1996,1997,1999,2001-2004,=
2007 Free Software Foundation,<br>&gt;&gt; Inc.<br>&gt;&gt; - =C2=A0 =C2=A0=
This file is part of the GNU C Library.<br>&gt;&gt; -<br>&gt;&gt; - =C2=A0 =
=C2=A0The GNU C Library is free software; you can redistribute it and/or<br=
>


&gt;&gt; -@@ -25,6 +25,9 @@<br>&gt;&gt; - /* Get type definitions. =C2=A0*/=
<br>&gt;&gt; - #include&lt;bits/types.h&gt;<br>&gt;&gt; -<br>&gt;&gt; -+#de=
fine __need_size_t<br>&gt;&gt; -+#include&lt;stddef.h&gt;<br>&gt;&gt; -+<br=
>


&gt;&gt; - #define __need_timespec<br>&gt;&gt; - #include&lt;time.h&gt;<br>=
&gt;&gt; -<br>&gt;&gt; -@@ -65,11 +68,42 @@ extern int sched_rr_get_interva=
l (__pid_t __pid,<br>&gt;&gt; struct timespec *__t) __THROW;<br>&gt;&gt; -<=
br>


&gt;&gt; - #if defined __USE_GNU&amp;&amp; =C2=A0defined __UCLIBC_LINUX_SPE=
CIFIC__<br>&gt;&gt; - /* Access macros for `cpu_set&#39;. =C2=A0*/<br>&gt;&=
gt; --#define CPU_SETSIZE __CPU_SETSIZE<br>&gt;&gt; --#define CPU_SET(cpu, =
cpusetp) __CPU_SET (cpu, cpusetp)<br>


&gt;&gt; --#define CPU_CLR(cpu, cpusetp) __CPU_CLR (cpu, cpusetp)<br>&gt;&g=
t; --#define CPU_ISSET(cpu, cpusetp) =C2=A0 =C2=A0 =C2=A0 __CPU_ISSET (cpu,=
 cpusetp)<br>&gt;&gt; --#define CPU_ZERO(cpusetp) =C2=A0 =C2=A0 __CPU_ZERO =
(cpusetp)<br>&gt;&gt; -+# define CPU_SETSIZE __CPU_SETSIZE<br>


&gt;&gt; -+# define CPU_SET(cpu, cpusetp) =C2=A0 =C2=A0 =C2=A0 =C2=A0 __CPU=
_SET_S (cpu, sizeof<br>&gt;&gt; (cpu_set_t), cpusetp)<br>&gt;&gt; -+# defin=
e CPU_CLR(cpu, cpusetp) =C2=A0 =C2=A0 =C2=A0 =C2=A0 __CPU_CLR_S (cpu, sizeo=
f<br>&gt;&gt; (cpu_set_t), cpusetp)<br>


&gt;&gt; -+# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu=
_set_t),<br>&gt;&gt; \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpusetp)<br>&gt;&gt; -+=
# define CPU_ZERO(cpusetp) =C2=A0 =C2=A0 __CPU_ZERO_S (sizeof (cpu_set_t),<=
br>


&gt;&gt; cpusetp)<br>&gt;&gt; -+# define CPU_COUNT(cpusetp) =C2=A0 =C2=A0__=
CPU_COUNT_S (sizeof (cpu_set_t),<br>&gt;&gt; cpusetp)<br>&gt;&gt; -+<br>&gt=
;&gt; -+# define CPU_SET_S(cpu, setsize, cpusetp) =C2=A0 __CPU_SET_S (cpu, =
setsize,<br>


&gt;&gt; cpusetp)<br>&gt;&gt; -+# define CPU_CLR_S(cpu, setsize, cpusetp) =
=C2=A0 __CPU_CLR_S (cpu, setsize,<br>&gt;&gt; cpusetp)<br>&gt;&gt; -+# defi=
ne CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu, setsize,<br>&gt;&=
gt; \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpusetp)<br>&gt=
;&gt; -+# define CPU_ZERO_S(setsize, cpusetp) =C2=A0 =C2=A0 __CPU_ZERO_S (s=
etsize,<br>&gt;&gt; cpusetp)<br>&gt;&gt; -+# define CPU_COUNT_S(setsize, cp=
usetp) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__CPU_COUNT_S<br>


&gt;&gt; (setsize, cpusetp)<br>&gt;&gt; -+<br>&gt;&gt; -+# define CPU_EQUAL=
(cpusetp1, cpusetp2) \<br>&gt;&gt; -+ =C2=A0__CPU_EQUAL_S (sizeof (cpu_set_=
t), cpusetp1, cpusetp2)<br>&gt;&gt; -+# define CPU_EQUAL_S(setsize, cpusetp=
1, cpusetp2) \<br>


&gt;&gt; -+ =C2=A0__CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)<br>&gt;&gt; -=
+<br>&gt;&gt; -+# define CPU_AND(destset, srcset1, srcset2) \<br>&gt;&gt; -=
+ =C2=A0__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2,&amp;)<br=
>&gt;&gt; -+# define CPU_OR(destset, srcset1, srcset2) \<br>


&gt;&gt; -+ =C2=A0__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2=
, |)<br>&gt;&gt; -+# define CPU_XOR(destset, srcset1, srcset2) \<br>&gt;&gt=
; -+ =C2=A0__CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)<br=
>&gt;&gt; -+# define CPU_AND_S(setsize, destset, srcset1, srcset2) \<br>


&gt;&gt; -+ =C2=A0__CPU_OP_S (setsize, destset, srcset1, srcset2,&amp;)<br>=
&gt;&gt; -+# define CPU_OR_S(setsize, destset, srcset1, srcset2) \<br>&gt;&=
gt; -+ =C2=A0__CPU_OP_S (setsize, destset, srcset1, srcset2, |)<br>&gt;&gt;=
 -+# define CPU_XOR_S(setsize, destset, srcset1, srcset2) \<br>


&gt;&gt; -+ =C2=A0__CPU_OP_S (setsize, destset, srcset1, srcset2, ^)<br>&gt=
;&gt; -+<br>&gt;&gt; -+# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (cou=
nt)<br>&gt;&gt; -+# define CPU_ALLOC(count) __CPU_ALLOC (count)<br>&gt;&gt;=
 -+# define CPU_FREE(cpuset) __CPU_FREE (cpuset)<br>


&gt;&gt; -<br>&gt;&gt; -<br>&gt;&gt; - /* Set the CPU affinity for a task *=
/<br>&gt;&gt; -@@ -79,12 +113,6 @@ extern int sched_setaffinity (__pid_t __=
pid, size_t<br>&gt;&gt; __cpusetsize,<br>&gt;&gt; - /* Get the CPU affinity=
 for a task */<br>


&gt;&gt; - extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize=
,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_set_t *__cpuset) __THROW;<br>&gt=
;&gt; --<br>&gt;&gt; --extern int __clone (int (*__fn) (void *__arg), void =
*__child_stack,<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nt __flags, void *__arg, ...);<br>&gt;&gt; --extern int __clone2 (int (*__f=
n) (void *__arg), void<br>&gt;&gt; *__child_stack_base,<br>&gt;&gt; -- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t __child_=
stack_size, int __flags, void *__arg,<br>


&gt;&gt; ...);<br>&gt;&gt; --<br>&gt;&gt; - #endif<br>&gt;&gt; -<br>&gt;&gt=
; - __END_DECLS<br>&gt;&gt; -diff --git a/libc/sysdeps/linux/common/Makefil=
e.in<br>&gt;&gt; b/libc/sysdeps/linux/common/Makefile.in<br>&gt;&gt; -index=
 8f936ff..cb8c153 100644<br>


&gt;&gt; ---- a/libc/sysdeps/linux/common/Makefile.in<br>&gt;&gt; -+++ b/li=
bc/sysdeps/linux/common/Makefile.in<br>&gt;&gt; -@@ -22,9 +22,11 @@ CSRC-$(=
UCLIBC_LINUX_SPECIFIC) +=3D capget.c capset.c<br>&gt;&gt; inotify.c ioperm.=
c iopl.c \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 modify_ldt.c pipe2.c personality.c ppoll.c =
prctl.c \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 readahead.c reboot.c \<br>&gt;=
&gt; - =C2=A0 =C2=A0 =C2=A0 remap_file_pages.c sched_getaffinity.c sched_se=
taffinity.c \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0sched_cpualloc.c sched_cpu=
count.c sched_cpufree.c \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 sendfile64.c sendfile.c setfsgid.c setfsuid=
.c setresuid.c \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 splice.c vmsplice.c tee=
.c signalfd.c swapoff.c swapon.c \<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0sync_=
file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0sync_file_range.c sysctl.c sysinfo.c timerf=
d.c unshare.c \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0uselib.c vhangup.c<br>&g=
t;&gt; - # NPTL needs these internally: madvise.c<br>&gt;&gt; - CSRC-$(find=
string<br>&gt;&gt; y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) =
+=3D madvise.c<br>


&gt;&gt; - ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)<br>&gt;&gt; -diff --git a/=
libc/sysdeps/linux/common/bits/sched.h<br>&gt;&gt; b/libc/sysdeps/linux/com=
mon/bits/sched.h<br>&gt;&gt; -index b48a0c8..fea66a8 100644<br>&gt;&gt; ---=
- a/libc/sysdeps/linux/common/bits/sched.h<br>


&gt;&gt; -+++ b/libc/sysdeps/linux/common/bits/sched.h<br>&gt;&gt; -@@ -1,6=
 +1,7 @@<br>&gt;&gt; - /* Definitions of constants and data structure for P=
OSIX 1003.1b-1993<br>&gt;&gt; - =C2=A0 =C2=A0scheduling interface.<br>&gt;&=
gt; -- =C2=A0 Copyright (C) 1996-1999,2001-2003,2005,2006 Free Software Fou=
ndation,<br>


&gt;&gt; Inc.<br>&gt;&gt; -+ =C2=A0 Copyright (C) 1996-1999,2001-2003,2005,=
2006,2007,2008<br>&gt;&gt; -+ =C2=A0 Free Software Foundation, Inc.<br>&gt;=
&gt; - =C2=A0 =C2=A0This file is part of the GNU C Library.<br>&gt;&gt; -<b=
r>&gt;&gt; - =C2=A0 =C2=A0The GNU C Library is free software; you can redis=
tribute it and/or<br>


&gt;&gt; -@@ -58,7 +59,13 @@<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 force CLONE_PTRACE on this clone.<br>&gt;&gt; =C2=A0*/=
<br>&gt;&gt; - # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userl=
evel buffer<br>&gt;&gt; in<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 the child. =C2=A0*/<br>&gt;&gt; --# define CLONE_STOPPED =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x02000000 /* Start in stopped state. =C2=A0*/<br>&gt;&gt; -+#=
 define CLONE_STOPPED 0x02000000 /* Start in stopped state. =C2=A0*/<br>


&gt;&gt; -+# define CLONE_NEWUTS 0x04000000 =C2=A0 =C2=A0 =C2=A0/* New utsn=
ame group. =C2=A0*/<br>&gt;&gt; -+# define CLONE_NEWIPC 0x08000000 =C2=A0 =
=C2=A0 =C2=A0/* New ipcs. =C2=A0*/<br>&gt;&gt; -+# define CLONE_NEWUSER =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x10000000 =C2=A0 =C2=A0 =C2=A0/* New user namespac=
e. =C2=A0*/<br>


&gt;&gt; -+# define CLONE_NEWPID 0x20000000 =C2=A0 =C2=A0 =C2=A0/* New pid =
namespace. =C2=A0*/<br>&gt;&gt; -+# define CLONE_NEWNET 0x40000000 =C2=A0 =
=C2=A0 =C2=A0/* New network namespace. =C2=A0*/<br>&gt;&gt; -+# define CLON=
E_IO =C2=A0 =C2=A0 0x80000000 =C2=A0 =C2=A0 =C2=A0/* Clone I/O context. =C2=
=A0*/<br>


&gt;&gt; - #endif<br>&gt;&gt; -<br>&gt;&gt; - /* The official definition. =
=C2=A0*/<br>&gt;&gt; -@@ -74,10 +81,11 @@ __BEGIN_DECLS<br>&gt;&gt; - exter=
n int clone (int (*__fn) (void *__arg), void *__child_stack,<br>&gt;&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int __flags, void *=
__arg, ...) __THROW;<br>


&gt;&gt; -<br>&gt;&gt; --#if 0<br>&gt;&gt; - /* Unshare the specified resou=
rces. =C2=A0*/<br>&gt;&gt; - extern int unshare (int __flags) __THROW;<br>&=
gt;&gt; --#endif<br>&gt;&gt; -+<br>&gt;&gt; -+/* Get index of currently use=
d CPU. =C2=A0*/<br>


&gt;&gt; -+extern int sched_getcpu (void) __THROW;<br>&gt;&gt; - #endif<br>=
&gt;&gt; -<br>&gt;&gt; - __END_DECLS<br>&gt;&gt; -@@ -102,7 +110,7 @@ struc=
t __sched_param<br>&gt;&gt; - # define __CPU_SETSIZE =C2=A0 =C2=A0 =C2=A0 =
=C2=A01024<br>&gt;&gt; - # define __NCPUBITS =C2=A0 (8 * sizeof (__cpu_mask=
))<br>


&gt;&gt; -<br>&gt;&gt; --/* Type for array elements in &#39;cpu_set&#39;. =
=C2=A0*/<br>&gt;&gt; -+/* Type for array elements in &#39;cpu_set_t&#39;. =
=C2=A0*/<br>&gt;&gt; - typedef unsigned long int __cpu_mask;<br>&gt;&gt; -<=
br>&gt;&gt; - /* Basic access functions. =C2=A0*/<br>


&gt;&gt; -@@ -116,17 +124,73 @@ typedef struct<br>&gt;&gt; - } cpu_set_t;<b=
r>&gt;&gt; -<br>&gt;&gt; - /* Access functions for CPU masks. =C2=A0*/<br>&=
gt;&gt; --# define __CPU_ZERO(cpusetp) \<br>&gt;&gt; -+# define __CPU_ZERO_=
S(setsize, cpusetp) \<br>


&gt;&gt; - =C2=A0 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>&gt;&gt; -- =C2=A0 =C2=A0unsigned int __i; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -- =C2=A0 =C2=A0cpu_set_=
t *__arr =3D (cpusetp); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -- =C2=A0 =C2=A0for (__i =3D 0; __i&lt=
; =C2=A0sizeof (cpu_set_t) / sizeof (__cpu_mask); ++__i)<br>&gt;&gt; =C2=A0=
 =C2=A0 =C2=A0\<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0__arr-&gt;__bits[__i] =
=3D 0; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>


&gt;&gt; -+ =C2=A0 =C2=A0size_t __i; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>&gt;&=
gt; -+ =C2=A0 =C2=A0size_t __imax =3D (setsize) / sizeof (__cpu_mask); =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&=
gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0__cpu_mask *__bits =3D (cpus=
etp)-&gt;__bits; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0for (__i =3D 0; __i&lt=
; =C2=A0__imax; ++__i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0=
 =C2=A0__bits[__i] =3D 0; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>

&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; - =C2=A0 } while (0)<br>&gt;&gt; --# define __CPU_SET(cpu, cpusetp=
) \<br>&gt;&gt; -- =C2=A0((cpusetp)-&gt;__bits[__CPUELT (cpu)] |=3D __CPUMA=
SK (cpu))<br>&gt;&gt; --# define __CPU_CLR(cpu, cpusetp) \<br>&gt;&gt; -- =
=C2=A0((cpusetp)-&gt;__bits[__CPUELT (cpu)]&amp;=3D ~__CPUMASK (cpu))<br>


&gt;&gt; --# define __CPU_ISSET(cpu, cpusetp) \<br>&gt;&gt; -- =C2=A0(((cpu=
setp)-&gt;__bits[__CPUELT (cpu)]&amp; =C2=A0__CPUMASK (cpu)) !=3D 0)<br>&gt=
;&gt; -+# define __CPU_SET_S(cpu, setsize, cpusetp) \<br>&gt;&gt; -+ =C2=A0=
(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 ({ size_t __cpu =3D (cpu); =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu=
&lt; =C2=A08 * (setsize) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0? (((__cpu_mask *) ((cpusetp)-&gt;__bits))[=
__CPUELT (__cpu)] =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 |=3D __CPUMA=
SK (__cpu)) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =
=C2=A0: 0; }))<br>


&gt;&gt; -+# define __CPU_CLR_S(cpu, setsize, cpusetp) \<br>&gt;&gt; -+ =C2=
=A0(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&=
gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 ({ size_t __cpu =3D (cpu); =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>


&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu&lt; =C2=
=A08 * (setsize) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0? (((__cpu_mask *) ((cpusetp)-&gt;__bits))[__CPUELT (__cpu)] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0&amp;=3D ~__CPUMASK (__cpu)) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&=
gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0: 0; }))<br>&gt;&gt; =
-+# define __CPU_ISSET_S(cpu, setsize, cpusetp) \<br>&gt;&gt; -+ =C2=A0(__e=
xtension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 ({ size_t __cpu =3D (cpu); =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu=
&lt; =C2=A08 * (setsize) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0? ((((__cpu_mask *) ((cpusetp)-&gt;__bits))=
[__CPUELT (__cpu)] =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0\<b=
r>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0&amp; =C2=A0__CPUMASK (__cpu))) !=3D 0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=
=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0: 0; }))<br>


&gt;&gt; -+<br>&gt;&gt; -+# define __CPU_COUNT_S(setsize, cpusetp) \<br>&gt=
;&gt; -+ =C2=A0__sched_cpucount (setsize, cpusetp)<br>&gt;&gt; -+<br>&gt;&g=
t; -+# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \<br>&gt;&gt; -+ =
=C2=A0(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 ({ __cpu_mask *__arr1 =3D (cp=
usetp1)-&gt;__bits; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu_mask *__arr2 =3D (=
cpusetp2)-&gt;__bits; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =
=C2=A0 =C2=A0size_t __imax =3D (setsize) / sizeof (__cpu_mask); =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0size_t =
__i; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0for (__i =3D 0;=
 __i&lt; =C2=A0__imax; ++__i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&=
gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0if (__arr1[__i] !=3D =
__arr2[__i]) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0=
 =C2=A0 \<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=
=A0 =C2=A0 =C2=A0__i =3D=3D __imax; }))<br>&gt;&gt; -+<br>&gt;&gt; -+# defi=
ne __CPU_OP_S(setsize, destset, srcset1, srcset2, op) \<br>


&gt;&gt; -+ =C2=A0(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 ({ cpu_set_t *__des=
t =3D (destset); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&g=
t;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu_mask *__arr1=
 =3D (srcset1)-&gt;__bits; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__cpu_mask *__a=
rr2 =3D (srcset2)-&gt;__bits; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<b=
r>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0size_t __imax =3D (setsize) / sizeof (__c=
pu_mask); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0size_t __i; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 \<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0f=
or (__i =3D 0; __i&lt; =C2=A0__imax; ++__i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0((__cp=
u_mask *) __dest-&gt;__bits)[__i] =3D __arr1[__i] op __arr2[__i];<br>


&gt;&gt; =C2=A0 =C2=A0\<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__dest; }))<br>&=
gt;&gt; -+<br>&gt;&gt; -+# define __CPU_ALLOC_SIZE(count) \<br>&gt;&gt; -+ =
=C2=A0((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))<br>=
&gt;&gt; -+# define __CPU_ALLOC(count) __sched_cpualloc (count)<br>


&gt;&gt; -+# define __CPU_FREE(cpuset) __sched_cpufree (cpuset)<br>&gt;&gt;=
 -+<br>&gt;&gt; -+__BEGIN_DECLS<br>&gt;&gt; -+<br>&gt;&gt; -+extern int __s=
ched_cpucount (size_t __setsize, const cpu_set_t *__setp)<br>&gt;&gt; -+ =
=C2=A0__THROW;<br>


&gt;&gt; -+extern cpu_set_t *__sched_cpualloc (size_t __count) __THROW __wu=
r;<br>&gt;&gt; -+extern void __sched_cpufree (cpu_set_t *__set) __THROW;<br=
>&gt;&gt; -+<br>&gt;&gt; -+__END_DECLS<br>&gt;&gt; -+<br>&gt;&gt; - #endif<=
br>


&gt;&gt; -diff --git a/libc/sysdeps/linux/common/sched_cpualloc.c<br>&gt;&g=
t; b/libc/sysdeps/linux/common/sched_cpualloc.c<br>&gt;&gt; -new file mode =
100644<br>&gt;&gt; -index 0000000..2642a80<br>&gt;&gt; ---- /dev/null<br>


&gt;&gt; -+++ b/libc/sysdeps/linux/common/sched_cpualloc.c<br>&gt;&gt; -@@ =
-0,0 +1,27 @@<br>&gt;&gt; -+/* Copyright (C) 2007 Free Software Foundation,=
 Inc.<br>&gt;&gt; -+ =C2=A0 This file is part of the GNU C Library.<br>&gt;=
&gt; -+<br>


&gt;&gt; -+ =C2=A0 The GNU C Library is free software; you can redistribute=
 it and/or<br>&gt;&gt; -+ =C2=A0 modify it under the terms of the GNU Lesse=
r General Public<br>&gt;&gt; -+ =C2=A0 License as published by the Free Sof=
tware Foundation; either<br>


&gt;&gt; -+ =C2=A0 version 2.1 of the License, or (at your option) any late=
r version.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 The GNU C Library is distri=
buted in the hope that it will be useful,<br>&gt;&gt; -+ =C2=A0 but WITHOUT=
 ANY WARRANTY; without even the implied warranty of<br>


&gt;&gt; -+ =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=
=A0See the GNU<br>&gt;&gt; -+ =C2=A0 Lesser General Public License for more=
 details.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 You should have received a c=
opy of the GNU Lesser General Public<br>


&gt;&gt; -+ =C2=A0 License along with the GNU C Library; if not, write to t=
he Free<br>&gt;&gt; -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, S=
uite 330, Boston, MA<br>&gt;&gt; -+ =C2=A0 02111-1307 USA. =C2=A0*/<br>&gt;=
&gt; -+<br>&gt;&gt; -+#include&lt;sched.h&gt;<br>


&gt;&gt; -+#include&lt;stdlib.h&gt;<br>&gt;&gt; -+<br>&gt;&gt; -+<br>&gt;&g=
t; -+cpu_set_t *<br>&gt;&gt; -+__sched_cpualloc (size_t count)<br>&gt;&gt; =
-+{<br>&gt;&gt; -+ =C2=A0return malloc (CPU_ALLOC_SIZE (count));<br>&gt;&gt=
; -+}<br>


&gt;&gt; -diff --git a/libc/sysdeps/linux/common/sched_cpucount.c<br>&gt;&g=
t; b/libc/sysdeps/linux/common/sched_cpucount.c<br>&gt;&gt; -new file mode =
100644<br>&gt;&gt; -index 0000000..331c0b8<br>&gt;&gt; ---- /dev/null<br>


&gt;&gt; -+++ b/libc/sysdeps/linux/common/sched_cpucount.c<br>&gt;&gt; -@@ =
-0,0 +1,60 @@<br>&gt;&gt; -+/* Copyright (C) 2007 Free Software Foundation,=
 Inc.<br>&gt;&gt; -+ =C2=A0 This file is part of the GNU C Library.<br>&gt;=
&gt; -+<br>


&gt;&gt; -+ =C2=A0 The GNU C Library is free software; you can redistribute=
 it and/or<br>&gt;&gt; -+ =C2=A0 modify it under the terms of the GNU Lesse=
r General Public<br>&gt;&gt; -+ =C2=A0 License as published by the Free Sof=
tware Foundation; either<br>


&gt;&gt; -+ =C2=A0 version 2.1 of the License, or (at your option) any late=
r version.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 The GNU C Library is distri=
buted in the hope that it will be useful,<br>&gt;&gt; -+ =C2=A0 but WITHOUT=
 ANY WARRANTY; without even the implied warranty of<br>


&gt;&gt; -+ =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=
=A0See the GNU<br>&gt;&gt; -+ =C2=A0 Lesser General Public License for more=
 details.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 You should have received a c=
opy of the GNU Lesser General Public<br>


&gt;&gt; -+ =C2=A0 License along with the GNU C Library; if not, write to t=
he Free<br>&gt;&gt; -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, S=
uite 330, Boston, MA<br>&gt;&gt; -+ =C2=A0 02111-1307 USA. =C2=A0*/<br>&gt;=
&gt; -+<br>&gt;&gt; -+#include&lt;limits.h&gt;<br>


&gt;&gt; -+#include&lt;sched.h&gt;<br>&gt;&gt; -+<br>&gt;&gt; -+<br>&gt;&gt=
; -+int<br>&gt;&gt; -+__sched_cpucount (size_t setsize, const cpu_set_t *se=
tp)<br>&gt;&gt; -+{<br>&gt;&gt; -+ =C2=A0int s =3D 0;<br>&gt;&gt; -+ =C2=A0=
const __cpu_mask *p =3D setp-&gt;__bits;<br>


&gt;&gt; -+ =C2=A0const __cpu_mask *end =3D&amp;setp-&gt;__bits[setsize / s=
izeof (__cpu_mask)];<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0while (p&lt; =C2=
=A0end)<br>&gt;&gt; -+ =C2=A0 =C2=A0{<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0__=
cpu_mask l =3D *p++;<br>&gt;&gt; -+<br>&gt;&gt; -+#ifdef POPCNT<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0s +=3D POPCNT (l);<br>&gt;&gt; -+#else<br>&=
gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0if (l =3D=3D 0)<br>&gt;&gt; -+ =C2=A0 =C2=A0=
 =C2=A0continue;<br>&gt;&gt; -+<br>&gt;&gt; -+# if LONG_BIT&gt; =C2=A032<br=
>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D (l&amp; =C2=A00x5555555555555555ul) =
+ ((l&gt;&gt; =C2=A01)&amp;<br>


&gt;&gt; =C2=A00x5555555555555555ul);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =
=3D (l&amp; =C2=A00x3333333333333333ul) + ((l&gt;&gt; =C2=A02)&amp;<br>&gt;=
&gt; =C2=A00x3333333333333333ul);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D =
(l&amp; =C2=A00x0f0f0f0f0f0f0f0ful) + ((l&gt;&gt; =C2=A04)&amp;<br>


&gt;&gt; =C2=A00x0f0f0f0f0f0f0f0ful);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =
=3D (l&amp; =C2=A00x00ff00ff00ff00fful) + ((l&gt;&gt; =C2=A08)&amp;<br>&gt;=
&gt; =C2=A00x00ff00ff00ff00fful);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D =
(l&amp; =C2=A00x0000ffff0000fffful) + ((l&gt;&gt; =C2=A016)&amp;<br>


&gt;&gt; =C2=A00x0000ffff0000fffful);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =
=3D (l&amp; =C2=A00x00000000fffffffful) + ((l&gt;&gt; =C2=A032)&amp;<br>&gt=
;&gt; =C2=A00x00000000fffffffful);<br>&gt;&gt; -+# else<br>&gt;&gt; -+ =C2=
=A0 =C2=A0 =C2=A0l =3D (l&amp; =C2=A00x55555555ul) + ((l&gt;&gt; =C2=A01)&a=
mp; =C2=A00x55555555ul);<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D (l&amp; =C2=A00x33333333ul) + ((l&gt;=
&gt; =C2=A02)&amp; =C2=A00x33333333ul);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0=
l =3D (l&amp; =C2=A00x0f0f0f0ful) + ((l&gt;&gt; =C2=A04)&amp; =C2=A00x0f0f0=
f0ful);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D (l&amp; =C2=A00x00ff00fful=
) + ((l&gt;&gt; =C2=A08)&amp; =C2=A00x00ff00fful);<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0l =3D (l&amp; =C2=A00x0000fffful) + ((l&gt;=
&gt; =C2=A016)&amp; =C2=A00x0000fffful);<br>&gt;&gt; -+# endif<br>&gt;&gt; =
-+<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0s +=3D l;<br>&gt;&gt; -+#endif<br>&gt=
;&gt; -+ =C2=A0 =C2=A0}<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0return s;<br>


&gt;&gt; -+}<br>&gt;&gt; -diff --git a/libc/sysdeps/linux/common/sched_cpuf=
ree.c<br>&gt;&gt; b/libc/sysdeps/linux/common/sched_cpufree.c<br>&gt;&gt; -=
new file mode 100644<br>&gt;&gt; -index 0000000..dd4c613<br>&gt;&gt; ---- /=
dev/null<br>


&gt;&gt; -+++ b/libc/sysdeps/linux/common/sched_cpufree.c<br>&gt;&gt; -@@ -=
0,0 +1,27 @@<br>&gt;&gt; -+/* Copyright (C) 2007 Free Software Foundation, =
Inc.<br>&gt;&gt; -+ =C2=A0 This file is part of the GNU C Library.<br>&gt;&=
gt; -+<br>


&gt;&gt; -+ =C2=A0 The GNU C Library is free software; you can redistribute=
 it and/or<br>&gt;&gt; -+ =C2=A0 modify it under the terms of the GNU Lesse=
r General Public<br>&gt;&gt; -+ =C2=A0 License as published by the Free Sof=
tware Foundation; either<br>


&gt;&gt; -+ =C2=A0 version 2.1 of the License, or (at your option) any late=
r version.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 The GNU C Library is distri=
buted in the hope that it will be useful,<br>&gt;&gt; -+ =C2=A0 but WITHOUT=
 ANY WARRANTY; without even the implied warranty of<br>


&gt;&gt; -+ =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=
=A0See the GNU<br>&gt;&gt; -+ =C2=A0 Lesser General Public License for more=
 details.<br>&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 You should have received a c=
opy of the GNU Lesser General Public<br>


&gt;&gt; -+ =C2=A0 License along with the GNU C Library; if not, write to t=
he Free<br>&gt;&gt; -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, S=
uite 330, Boston, MA<br>&gt;&gt; -+ =C2=A0 02111-1307 USA. =C2=A0*/<br>&gt;=
&gt; -+<br>&gt;&gt; -+#include&lt;sched.h&gt;<br>


&gt;&gt; -+#include&lt;stdlib.h&gt;<br>&gt;&gt; -+<br>&gt;&gt; -+<br>&gt;&g=
t; -+void<br>&gt;&gt; -+__sched_cpufree (cpu_set_t *set)<br>&gt;&gt; -+{<br=
>&gt;&gt; -+ =C2=A0free (set);<br>&gt;&gt; -+}<br>&gt;&gt; -diff --git a/li=
bc/sysdeps/linux/common/sched_getcpu.c<br>


&gt;&gt; b/libc/sysdeps/linux/common/sched_getcpu.c<br>&gt;&gt; -new file m=
ode 100644<br>&gt;&gt; -index 0000000..b193d65<br>&gt;&gt; ---- /dev/null<b=
r>&gt;&gt; -+++ b/libc/sysdeps/linux/common/sched_getcpu.c<br>&gt;&gt; -@@ =
-0,0 +1,37 @@<br>


&gt;&gt; -+/* Copyright (C) 2007 Free Software Foundation, Inc.<br>&gt;&gt;=
 -+ =C2=A0 This file is part of the GNU C Library.<br>&gt;&gt; -+<br>&gt;&g=
t; -+ =C2=A0 The GNU C Library is free software; you can redistribute it an=
d/or<br>


&gt;&gt; -+ =C2=A0 modify it under the terms of the GNU Lesser General Publ=
ic<br>&gt;&gt; -+ =C2=A0 License as published by the Free Software Foundati=
on; either<br>&gt;&gt; -+ =C2=A0 version 2.1 of the License, or (at your op=
tion) any later version.<br>


&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0 The GNU C Library is distributed in the h=
ope that it will be useful,<br>&gt;&gt; -+ =C2=A0 but WITHOUT ANY WARRANTY;=
 without even the implied warranty of<br>&gt;&gt; -+ =C2=A0 MERCHANTABILITY=
 or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU<br>


&gt;&gt; -+ =C2=A0 Lesser General Public License for more details.<br>&gt;&=
gt; -+<br>&gt;&gt; -+ =C2=A0 You should have received a copy of the GNU Les=
ser General Public<br>&gt;&gt; -+ =C2=A0 License along with the GNU C Libra=
ry; if not, write to the Free<br>


&gt;&gt; -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, B=
oston, MA<br>&gt;&gt; -+ =C2=A0 02111-1307 USA. =C2=A0*/<br>&gt;&gt; -+<br>=
&gt;&gt; -+#include&lt;stdlib.h&gt;<br>&gt;&gt; -+#include&lt;errno.h&gt;<b=
r>&gt;&gt; -+#include&lt;sched.h&gt;<br>


&gt;&gt; -+#include&lt;sysdep.h&gt;<br>&gt;&gt; -+<br>&gt;&gt; -+<br>&gt;&g=
t; -+int<br>&gt;&gt; -+sched_getcpu (void)<br>&gt;&gt; -+{<br>&gt;&gt; -+#i=
fdef __NR_getcpu<br>&gt;&gt; -+ =C2=A0unsigned int cpu;<br>&gt;&gt; -+ =C2=
=A0int r =3D INLINE_SYSCALL (getcpu, 3,&amp;cpu, NULL, NULL);<br>


&gt;&gt; -+<br>&gt;&gt; -+ =C2=A0return r =3D=3D -1 ? r : cpu;<br>&gt;&gt; =
-+#else<br>&gt;&gt; -+ =C2=A0__set_errno (ENOSYS);<br>&gt;&gt; -+ =C2=A0ret=
urn -1;<br>&gt;&gt; -+#endif<br>&gt;&gt; -+}<br>&gt;&gt; -diff --git a/libc=
/sysdeps/linux/common/unshare.c<br>


&gt;&gt; b/libc/sysdeps/linux/common/unshare.c<br>&gt;&gt; -new file mode 1=
00644<br>&gt;&gt; -index 0000000..485bf88<br>&gt;&gt; ---- /dev/null<br>&gt=
;&gt; -+++ b/libc/sysdeps/linux/common/unshare.c<br>&gt;&gt; -@@ -0,0 +1,12=
 @@<br>


&gt;&gt; -+/* vi: set sw=3D4 ts=3D4: */<br>&gt;&gt; -+/*<br>&gt;&gt; -+ * u=
nshare() for uClibc<br>&gt;&gt; -+ *<br>&gt;&gt; -+ * Copyright (C) 2011 He=
nning Heinold&lt;<a href=3D"mailto:heinold@inf.fu-berlin.de" target=3D"_bla=
nk">heinold@inf.fu-berlin.de</a>&gt;<br>


&gt;&gt; -+ *<br>&gt;&gt; -+ * Licensed under the LGPL v2.1, see the file C=
OPYING.LIB in this<br>&gt;&gt; tarball.<br>&gt;&gt; -+ */<br>&gt;&gt; -+<br=
>&gt;&gt; -+#include&lt;sys/syscall.h&gt;<br>&gt;&gt; -+#include&lt;sched.h=
&gt;<br>


&gt;&gt; -+_syscall1(int, unshare, int, flags)<br>&gt;&gt; ---<br>&gt;&gt; =
-1.7.5.3<br>&gt;&gt; -<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-co=
re/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_=
NCS-so.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pa=
ss-it-to-INTERNAL_SYSCALL_NCS-so.patch<br>&gt;&gt; new file mode 100644<br>=
&gt;&gt; index 0000000..2f0c191<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++<b=
r>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pa=
ss-it-to-INTERNAL_SYSCALL_NCS-so.patch<br>&gt;&gt; @@ -0,0 +1,32 @@<br>&gt;=
&gt; +From 6c3919a6d4a8686772e2a302bf951548ee24a8c1 Mon Sep 17 00:00:00 200=
1<br>


&gt;&gt; +From: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +Date: Fri, 3 Feb 2012 10:5=
7:44 -0800<br>&gt;&gt; +Subject: [PATCH] Declare __err and pass it to INTER=
NAL_SYSCALL_NCS so<br>


&gt;&gt; + subsequent macros can use it<br>&gt;&gt; +<br>&gt;&gt; +Signed-o=
ff-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +---<br>&gt;&gt; + libc/sysdeps/linu=
x/common/bits/syscalls-common.h | =C2=A0 =C2=A04 ++--<br>


&gt;&gt; + 1 files changed, 2 insertions(+), 2 deletions(-)<br>&gt;&gt; +<b=
r>&gt;&gt; +<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +<br>&gt;&gt=
; +diff --git a/libc/sysdeps/linux/common/bits/syscalls-common.h<br>&gt;&gt=
; b/libc/sysdeps/linux/common/bits/syscalls-common.h<br>


&gt;&gt; +index faebd1b..0f5a929 100644<br>&gt;&gt; +--- a/libc/sysdeps/lin=
ux/common/bits/syscalls-common.h<br>&gt;&gt; ++++ b/libc/sysdeps/linux/comm=
on/bits/syscalls-common.h<br>&gt;&gt; +@@ -59,8 +59,8 @@<br>&gt;&gt; + #ifn=
def INLINE_SYSCALL_NOERR_NCS<br>


&gt;&gt; + # define INLINE_SYSCALL_NOERR_NCS(name, nr, args...) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; + ({ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0/*INTERNAL_SYSCALL_DECL(_=
_err);*/ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 \<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0long __r=
es =3D INTERNAL_SYSCALL_NCS(name, /*__err*/, nr, args); =C2=A0 \<br>&gt;&gt=
; ++ =C2=A0 =C2=A0 =C2=A0INTERNAL_SYSCALL_DECL(__err); =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0long __res =
=3D INTERNAL_SYSCALL_NCS(name, __err, nr, args); =C2=A0 =C2=A0 =C2=A0 \<br>


&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 __res; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; + })<br>&gt;&gt; + #endif<br>&gt;&gt; +--=
<br>&gt;&gt; +1.7.5.4<br>&gt;&gt; +<br>&gt;&gt; diff --git<br>&gt;&gt; a/me=
ta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-versio=
n-of-syscall-if-ava.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use=
-64bit-version-of-syscall-if-ava.patch<br>&gt;&gt; new file mode 100644<br>=
&gt;&gt; index 0000000..da4ffef<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++<b=
r>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use=
-64bit-version-of-syscall-if-ava.patch<br>&gt;&gt; @@ -0,0 +1,177 @@<br>&gt=
;&gt; +From effbfd8e8a7b883671b24fc9759b135b48dbfaca Mon Sep 17 00:00:00 20=
01<br>


&gt;&gt; +From: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +Date: Fri, 3 Feb 2012 20:0=
6:55 -0800<br>&gt;&gt; +Subject: [PATCH] lstat/stat/fstat: Use 64bit versio=
n of syscall if<br>


&gt;&gt; available<br>&gt;&gt; +<br>&gt;&gt; +This is needed for stat&#39;i=
ng loop devices&gt; =C2=A0255<br>&gt;&gt; +since otherwise kernel returns E=
OVERFLOW becasue<br>&gt;&gt; +it needs st_rdev/st_dev to be larger than 16b=
its but<br>


&gt;&gt; +in kernel it uses __old_kernel_stat for stat<br>&gt;&gt; +syscall=
 which has st_rdev/st_dev as unsigned short<br>&gt;&gt; +<br>&gt;&gt; +Add =
a testcase<br>&gt;&gt; +<br>&gt;&gt; +Signed-off-by: Khem Raj&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br=
>


&gt;&gt; +---<br>&gt;&gt; + libc/sysdeps/linux/common/fstat.c | =C2=A0 18 +=
+++++++++++++----<br>&gt;&gt; + libc/sysdeps/linux/common/lstat.c | =C2=A0 =
19 ++++++++++++++-----<br>&gt;&gt; + libc/sysdeps/linux/common/stat.c =C2=
=A0| =C2=A0 18 ++++++++++++++----<br>


&gt;&gt; + test/stat/stat-loop256.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 32<br>&gt;&gt; ++++++++++++++++++++++++++++++++<br>&gt;&gt; + 4 files c=
hanged, 74 insertions(+), 13 deletions(-)<br>&gt;&gt; + create mode 100644 =
test/stat/stat-loop256.c<br>


&gt;&gt; +<br>&gt;&gt; +diff --git a/libc/sysdeps/linux/common/fstat.c<br>&=
gt;&gt; b/libc/sysdeps/linux/common/fstat.c<br>&gt;&gt; +index acc639b..472=
6a68 100644<br>&gt;&gt; +--- a/libc/sysdeps/linux/common/fstat.c<br>&gt;&gt=
; ++++ b/libc/sysdeps/linux/common/fstat.c<br>


&gt;&gt; +@@ -12,18 +12,28 @@<br>&gt;&gt; + #include&lt;sys/stat.h&gt;<br>&=
gt;&gt; + #include &quot;xstatconv.h&quot;<br>&gt;&gt; +<br>&gt;&gt; +-#def=
ine __NR___syscall_fstat __NR_fstat<br>&gt;&gt; +-static __inline__ _syscal=
l2(int, __syscall_fstat, int, fd, struct<br>


&gt;&gt; kernel_stat *, buf)<br>&gt;&gt; +-<br>&gt;&gt; + int fstat(int fd,=
 struct stat *buf)<br>&gt;&gt; + {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int r=
esult;<br>&gt;&gt; ++#ifdef __NR_fstat64<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=
=A0/* normal stat call has limited values for various stat elements<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 * e.g. uid device major/minor etc.<br>&gt;=
&gt; ++ =C2=A0 =C2=A0 =C2=A0 * so we use 64 variant if available<br>&gt;&gt=
; ++ =C2=A0 =C2=A0 =C2=A0 * in order to get newer versions of stat elements=
<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0=
struct kernel_stat64 kbuf;<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SYSCALL(fstat64, 2, fd,&a=
mp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0if (result =3D=3D 0) {<br>&gt;=
&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__xstat32_conv(&amp=
;kbuf, buf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; ++#else<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 struct kernel_stat kbuf;<br>


&gt;&gt; +<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0result =3D __syscall_fstat(fd=
,&amp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SYSCALL(f=
stat, 2, fd,&amp;kbuf);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (result =3D=
=3D 0) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __x=
stat_conv(&amp;kbuf, buf);<br>


&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; ++#endif<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 return result;<br>&gt;&gt; + }<br>&gt;&gt; + libc_hidden_def=
(fstat)<br>&gt;&gt; +diff --git a/libc/sysdeps/linux/common/lstat.c<br>&gt;=
&gt; b/libc/sysdeps/linux/common/lstat.c<br>


&gt;&gt; +index aa77447..db72d1f 100644<br>&gt;&gt; +--- a/libc/sysdeps/lin=
ux/common/lstat.c<br>&gt;&gt; ++++ b/libc/sysdeps/linux/common/lstat.c<br>&=
gt;&gt; +@@ -12,19 +12,28 @@<br>&gt;&gt; + #include&lt;sys/stat.h&gt;<br>


&gt;&gt; + #include &quot;xstatconv.h&quot;<br>&gt;&gt; +<br>&gt;&gt; +-#de=
fine __NR___syscall_lstat __NR_lstat<br>&gt;&gt; +-static __inline__ _sysca=
ll2(int, __syscall_lstat,<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0const char *, file_name, struct kernel_stat *, buf)<br>


&gt;&gt; +-<br>&gt;&gt; + int lstat(const char *file_name, struct stat *buf=
)<br>&gt;&gt; + {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int result;<br>&gt;&gt=
; ++#ifdef __NR_lstat64<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0/* normal stat c=
all has limited values for various stat elements<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 * e.g. uid device major/minor etc.<br>&gt;=
&gt; ++ =C2=A0 =C2=A0 =C2=A0 * so we use 64 variant if available<br>&gt;&gt=
; ++ =C2=A0 =C2=A0 =C2=A0 * in order to get newer versions of stat elements=
<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0=
struct kernel_stat64 kbuf;<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SYSCALL(lstat64, 2, file_=
name,&amp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0if (result =3D=3D 0) {<=
br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__xstat32_co=
nv(&amp;kbuf, buf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; ++#els=
e<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct kernel_stat kbuf;<br>


&gt;&gt; +<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0result =3D __syscall_lstat(fi=
le_name,&amp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SY=
SCALL(lstat, 2, file_name,&amp;kbuf);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if=
 (result =3D=3D 0) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __xstat_conv(&amp;kbuf, buf);<br>


&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; ++#endif<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 return result;<br>&gt;&gt; + }<br>&gt;&gt; + libc_hidden_def=
(lstat)<br>&gt;&gt; +diff --git a/libc/sysdeps/linux/common/stat.c<br>&gt;&=
gt; b/libc/sysdeps/linux/common/stat.c<br>


&gt;&gt; +index a6ab291..829f35a 100644<br>&gt;&gt; +--- a/libc/sysdeps/lin=
ux/common/stat.c<br>&gt;&gt; ++++ b/libc/sysdeps/linux/common/stat.c<br>&gt=
;&gt; +@@ -12,20 +12,30 @@<br>&gt;&gt; + #include&lt;sys/stat.h&gt;<br>


&gt;&gt; + #include &quot;xstatconv.h&quot;<br>&gt;&gt; +<br>&gt;&gt; +-#de=
fine __NR___syscall_stat __NR_stat<br>&gt;&gt; + #undef stat<br>&gt;&gt; +-=
static __inline__ _syscall2(int, __syscall_stat,<br>&gt;&gt; +- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *, file_name, struct kerne=
l_stat *, buf)<br>


&gt;&gt; +<br>&gt;&gt; + int stat(const char *file_name, struct stat *buf)<=
br>&gt;&gt; + {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int result;<br>&gt;&gt; =
++#ifdef __NR_stat64<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0/* normal stat call=
 has limited values for various stat elements<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 * e.g. uid device major/minor etc.<br>&gt;=
&gt; ++ =C2=A0 =C2=A0 =C2=A0 * so we use 64 variant if available<br>&gt;&gt=
; ++ =C2=A0 =C2=A0 =C2=A0 * in order to get newer versions of stat elements=
<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0=
struct kernel_stat64 kbuf;<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SYSCALL(stat64, 2, file_n=
ame,&amp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0if (result =3D=3D 0) {<b=
r>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__xstat32_con=
v(&amp;kbuf, buf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; ++#else=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct kernel_stat kbuf;<br>


&gt;&gt; +<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0result =3D __syscall_stat(fil=
e_name,&amp;kbuf);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0result =3D INLINE_SYS=
CALL(stat, 2, file_name,&amp;kbuf);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (=
result =3D=3D 0) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __xstat_conv(&amp;kbuf, buf);<br>


&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; ++#endif<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 return result;<br>&gt;&gt; + }<br>&gt;&gt; + libc_hidden_def=
(stat)<br>&gt;&gt; +diff --git a/test/stat/stat-loop256.c b/test/stat/stat-=
loop256.c<br>&gt;&gt; +new file mode 100644<br>


&gt;&gt; +index 0000000..14284c1<br>&gt;&gt; +--- /dev/null<br>&gt;&gt; +++=
+ b/test/stat/stat-loop256.c<br>&gt;&gt; +@@ -0,0 +1,32 @@<br>&gt;&gt; ++#i=
nclude&lt;stdio.h&gt;<br>&gt;&gt; ++#include&lt;unistd.h&gt;<br>&gt;&gt; ++=
#include&lt;stdlib.h&gt;<br>


&gt;&gt; ++#include&lt;sys/stat.h&gt;<br>&gt;&gt; ++int main()<br>&gt;&gt; =
++{<br>&gt;&gt; ++ =C2=A0 =C2=A0struct stat statbuf;<br>&gt;&gt; ++ =C2=A0 =
=C2=A0int ret =3D 0;<br>&gt;&gt; ++ =C2=A0 =C2=A0char* loop255 =3D &quot;/d=
ev/loop255&quot;;<br>&gt;&gt; ++ =C2=A0 =C2=A0char* loop256 =3D &quot;/dev/=
loop256&quot;;<br>


&gt;&gt; ++ =C2=A0 =C2=A0mode_t mode =3D 0660;<br>&gt;&gt; ++ =C2=A0 =C2=A0=
mknod(loop255, mode, 0x7ff);<br>&gt;&gt; ++ =C2=A0 =C2=A0mknod(loop256, mod=
e, 0x100700);<br>&gt;&gt; ++ =C2=A0 =C2=A0ret =3D stat(loop255,&amp;statbuf=
);<br>&gt;&gt; ++ =C2=A0 =C2=A0if(ret&lt; =C2=A00) {<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0printf(&quot;stat: Cant stat %s\n&quot;,loo=
p255);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0unlink(loop255);<br>&gt;&gt; ++ =
=C2=A0 =C2=A0 =C2=A0exit(1);<br>&gt;&gt; ++ =C2=A0 =C2=A0}<br>&gt;&gt; ++ =
=C2=A0 =C2=A0ret =3D stat(loop256,&amp;statbuf);<br>&gt;&gt; ++ =C2=A0 =C2=
=A0if(ret&lt; =C2=A00) {<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;stat: Cant stat %s\n&qu=
ot;,loop256);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0unlink(loop255);<br>&gt;&g=
t; ++ =C2=A0 =C2=A0 =C2=A0unlink(loop256);<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0exit(1);<br>&gt;&gt; ++ =C2=A0 =C2=A0}<br>&gt;&gt; ++<br>&gt;&gt;=
 ++ =C2=A0 =C2=A0unlink(loop255);<br>


&gt;&gt; ++ =C2=A0 =C2=A0unlink(loop256);<br>&gt;&gt; ++ =C2=A0 =C2=A0exit(=
0);<br>&gt;&gt; ++}<br>&gt;&gt; ++<br>&gt;&gt; +--<br>&gt;&gt; +1.7.5.4<br>=
&gt;&gt; +<br>&gt;&gt; diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/=
argp-headers.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch<br>&gt=
;&gt; similarity index 99%<br>&gt;&gt; rename from meta/recipes-core/uclibc=
/uclibc-0.9.32/argp-headers.patch<br>&gt;&gt; rename to meta/recipes-core/u=
clibc/uclibc-0.9.33/argp-headers.patch<br>


&gt;&gt; index 7fd148f..b31b991 100644<br>&gt;&gt; --- a/meta/recipes-core/=
uclibc/uclibc-0.9.32/argp-headers.patch<br>&gt;&gt; +++ b/meta/recipes-core=
/uclibc/uclibc-0.9.33/argp-headers.patch<br>&gt;&gt; @@ -8,6 +8,8 @@ Signed=
-off-by: Salvatore Cro&lt;salvatore.cro at <a href=3D"http://st.com" target=
=3D"_blank">st.com</a>&gt;<br>


&gt;&gt; =C2=A0 create mode 100644 include/argp.h<br>&gt;&gt; =C2=A0 create=
 mode 100644 libc/argp/argp-fmtstream.h<br>&gt;&gt;<br>&gt;&gt; +Upstream-S=
tatus: Pending<br>&gt;&gt; +<br>&gt;&gt; =C2=A0Index: git/include/argp.h<br=
>&gt;&gt; =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>


&gt;&gt; =C2=A0--- /dev/null<br>&gt;&gt; diff --git a/meta/recipes-core/ucl=
ibc/uclibc-0.9.32/argp-support.patch<br>&gt;&gt; b/meta/recipes-core/uclibc=
/uclibc-0.9.33/argp-support.patch<br>&gt;&gt; similarity index 99%<br>&gt;&=
gt; rename from meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch<b=
r>


&gt;&gt; rename to meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patc=
h<br>&gt;&gt; index 04a3c78..3e9680f 100644<br>&gt;&gt; --- a/meta/recipes-=
core/uclibc/uclibc-0.9.32/argp-support.patch<br>&gt;&gt; +++ b/meta/recipes=
-core/uclibc/uclibc-0.9.33/argp-support.patch<br>


&gt;&gt; @@ -13,6 +13,9 @@ it doesn&#39;t need to link libuargp.so explicit=
ely.<br>&gt;&gt; =C2=A0Signed-off-by: Salvatore Cro&lt;salvatore.cro at <a =
href=3D"http://st.com" target=3D"_blank">st.com</a>&gt;<br>&gt;&gt; =C2=A0S=
igned-off-by: Filippo Arcidiacono&lt;filippo.arcidiacono at <a href=3D"http=
://st.com" target=3D"_blank">st.com</a>&gt;<br>


&gt;&gt; =C2=A0Signed-off-by: Carmelo Amoroso&lt;carmelo.amoroso at <a href=
=3D"http://st.com" target=3D"_blank">st.com</a>&gt;<br>&gt;&gt; +<br>&gt;&g=
t; +Upstream-Status: Pending<br>&gt;&gt; +<br>&gt;&gt; =C2=A0---<br>&gt;&gt=
; =C2=A0 Makefile.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
8 +<br>


&gt;&gt; =C2=A0 Makerules =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A08 +-<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclib=
c/uclibc-0.9.32/compile-arm-fork-with-O2.patch<br>&gt;&gt; b/meta/recipes-c=
ore/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch<br>


&gt;&gt; similarity index 97%<br>&gt;&gt; rename from<br>&gt;&gt; meta/reci=
pes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch<br>&gt;&gt; re=
name to<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork=
-with-O2.patch<br>


&gt;&gt; index 429f27d..15ee0ca 100644<br>&gt;&gt; ---<br>&gt;&gt; a/meta/r=
ecipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch<br>&gt;&gt;=
 +++<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-=
with-O2.patch<br>


&gt;&gt; @@ -1,5 +1,5 @@<br>&gt;&gt; =C2=A0When compiling in thumb mode for=
 arm with -Os gcc gives up since it can<br>&gt;&gt; not find registers<br>&=
gt;&gt; -to spill. So we use -O2 option for compiling fork.c It may be addr=
essable<br>


&gt;&gt; is gcc.<br>&gt;&gt; +to spill. So we use -O2 option for compiling =
fork.c It may be addressable<br>&gt;&gt; in gcc.<br>&gt;&gt;<br>&gt;&gt; =
=C2=A0Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>


&gt;&gt;<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/ucli=
bc-0.9.33/define-MSG_CMSG_CLOEXEC.patch<br>&gt;&gt; b/meta/recipes-core/ucl=
ibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch<br>&gt;&gt; new file mode 1=
00644<br>


&gt;&gt; index 0000000..4e900f3<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b=
/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch<br>&g=
t;&gt; @@ -0,0 +1,25 @@<br>&gt;&gt; +Add definition of MSG_WAITFORONE and M=
SG_CMSG_CLOEXEC<br>


&gt;&gt; +<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +<br>&gt;&gt; =
+Index: git/libc/sysdeps/linux/common/bits/socket.h<br>&gt;&gt; +=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; +--- git.orig/libc/s=
ysdeps/linux/common/bits/socket.h =C2=A0 2012-01-26<br>


&gt;&gt; 23:23:21.537456132 -0800<br>&gt;&gt; ++++ git/libc/sysdeps/linux/c=
ommon/bits/socket.h =C2=A0 =C2=A0 =C2=A0 =C2=A02012-01-26<br>&gt;&gt; 23:25=
:10.125461388 -0800<br>&gt;&gt; +@@ -235,8 +235,15 @@<br>&gt;&gt; + #define=
 =C2=A0 =C2=A0 =C2=A0 MSG_ERRQUEUE =C2=A0 =C2=A0MSG_ERRQUEUE<br>


&gt;&gt; + =C2=A0 =C2=A0 MSG_NOSIGNAL =C2=A0 =C2=A0 =C2=A0=3D 0x4000, /* Do=
 not generate SIGPIPE. =C2=A0*/<br>&gt;&gt; + #define =C2=A0 =C2=A0 =C2=A0 =
MSG_NOSIGNAL =C2=A0 =C2=A0MSG_NOSIGNAL<br>&gt;&gt; +- =C2=A0 =C2=A0MSG_MORE=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x8000 =C2=A0/* Sender will send mor=
e. =C2=A0*/<br>&gt;&gt; ++ =C2=A0 =C2=A0MSG_MORE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0x8000, =C2=A0/* Sender will send more. =C2=A0*/<br>


&gt;&gt; + #define =C2=A0 =C2=A0 =C2=A0 MSG_MORE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MSG_MORE<br>&gt;&gt; ++ =C2=A0 =C2=A0MSG_WAITFORONE =C2=A0 =C2=A0 =C2=A0=
=3D 0x10000, /* Wait for at least one packet to<br>&gt;&gt; return.*/<br>&g=
t;&gt; ++#define MSG_WAITFORONE =C2=A0MSG_WAITFORONE<br>&gt;&gt; ++<br>


&gt;&gt; ++ =C2=A0 =C2=A0MSG_CMSG_CLOEXEC =C2=A0 =C2=A0=3D 0x40000000 =C2=
=A0 =C2=A0/* Set close_on_exit for file<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor received th=
rough<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SCM_RIGHTS. =C2=A0*/<br>


&gt;&gt; ++#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC<br>&gt;&gt; + =C2=A0 }=
;<br>&gt;&gt; +<br>&gt;&gt; +<br>&gt;&gt; diff --git a/meta/recipes-core/uc=
libc/uclibc-0.9.33/dup3.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc=
-0.9.33/dup3.patch<br>


&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..481f23b<br>&gt;&gt=
; --- /dev/null<br>&gt;&gt; +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/du=
p3.patch<br>&gt;&gt; @@ -0,0 +1,37 @@<br>&gt;&gt; +Implement dup3()<br>


&gt;&gt; +<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +<br>&gt;&gt; =
+Index: git/libc/sysdeps/linux/common/dup3.c<br>&gt;&gt; +=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; +--- /dev/null =C2=A01970-=
01-01 00:00:00.000000000 +0000<br>


&gt;&gt; ++++ git/libc/sysdeps/linux/common/dup3.c =C2=A0 =C2=A0 =C2=A0 201=
2-01-27<br>&gt;&gt; 07:40:52.802900849 -0800<br>&gt;&gt; +@@ -0,0 +1,15 @@<=
br>&gt;&gt; ++/* vi: set sw=3D4 ts=3D4: */<br>&gt;&gt; ++/*<br>&gt;&gt; ++ =
* dup3() for uClibc<br>


&gt;&gt; ++ *<br>&gt;&gt; ++ * Copyright (C) 2000-2006 Erik Andersen&lt;<a =
href=3D"mailto:andersen@uclibc.org" target=3D"_blank">andersen@uclibc.org</=
a>&gt;<br>&gt;&gt; ++ *<br>&gt;&gt; ++ * Licensed under the LGPL v2.1, see =
the file COPYING.LIB in this<br>


&gt;&gt; tarball.<br>&gt;&gt; ++ */<br>&gt;&gt; ++<br>&gt;&gt; ++#include&l=
t;sys/syscall.h&gt;<br>&gt;&gt; ++#include&lt;unistd.h&gt;<br>&gt;&gt; ++<b=
r>&gt;&gt; ++<br>&gt;&gt; ++_syscall3(int, dup3, int, oldfd, int, newfd, in=
t, flags)<br>


&gt;&gt; ++libc_hidden_def(dup3)<br>&gt;&gt; +Index: git/include/unistd.h<b=
r>&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt;=
 +--- git.orig/include/unistd.h =C2=A02012-01-27 01:19:17.521792781 -0800<b=
r>


&gt;&gt; ++++ git/include/unistd.h =C2=A0 =C2=A0 =C2=A0 2012-01-27 07:40:03=
.106898447 -0800<br>&gt;&gt; +@@ -512,6 +512,8 @@<br>&gt;&gt; + /* Duplicat=
e FD to FD2, closing FD2 and making it open on the same file.<br>&gt;&gt; =
=C2=A0*/<br>&gt;&gt; + extern int dup2 (int __fd, int __fd2) __THROW;<br>


&gt;&gt; + libc_hidden_proto(dup2)<br>&gt;&gt; ++extern int dup3 (int __fd,=
 int __fd2, int __flags) __THROW;<br>&gt;&gt; ++libc_hidden_proto(dup3)<br>=
&gt;&gt; +<br>&gt;&gt; + /* NULL-terminated array of &quot;NAME=3DVALUE&quo=
t; environment variables. =C2=A0*/<br>


&gt;&gt; + extern char **__environ;<br>&gt;&gt; diff --git<br>&gt;&gt; a/me=
ta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb=
_mode.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_a=
rm_dl_linux_resolve_in_thumb_mode.patch<br>


&gt;&gt; similarity index 86%<br>&gt;&gt; rename from<br>&gt;&gt; meta/reci=
pes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.p=
atch<br>&gt;&gt; rename to<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.=
33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch<br>


&gt;&gt; index cfa68ce..d44acca 100644<br>&gt;&gt; ---<br>&gt;&gt; a/meta/r=
ecipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mod=
e.patch<br>&gt;&gt; +++<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.3=
3/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch<br>


&gt;&gt; @@ -1,3 +1,9 @@<br>&gt;&gt; +resolver code should always be in arm=
 mode<br>&gt;&gt; +<br>&gt;&gt; +Signed-off-by: Khem Raj&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;=
&gt; +<br>

&gt;&gt; +Upstream-Status: Pending<br>
&gt;&gt; +<br>&gt;&gt; =C2=A0Index: uClibc/ldso/ldso/arm/resolve.S<br>&gt;&=
gt; =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt;=
 =C2=A0--- uClibc.orig/ldso/ldso/arm/resolve.S =C2=A0 =C2=A0 =C2=A0 2009-03=
-20<br>&gt;&gt; 12:03:32.000000000 -0700<br>


&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.33/li=
bc_symbols_include_bits_uclibc_config.patch<br>&gt;&gt; b/meta/recipes-core=
/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch<br>


&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..8064115<br>&gt;&gt=
; --- /dev/null<br>&gt;&gt; +++<br>&gt;&gt; b/meta/recipes-core/uclibc/ucli=
bc-0.9.33/libc_symbols_include_bits_uclibc_config.patch<br>&gt;&gt; @@ -0,0=
 +1,19 @@<br>


&gt;&gt; +Index: git/include/libc-symbols.h<br>&gt;&gt; +=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; +--- git.orig/include/libc-sy=
mbols.h =C2=A0 =C2=A02011-07-05 17:04:41.171219323<br>&gt;&gt; -0700<br>


&gt;&gt; ++++ git/include/libc-symbols.h 2011-07-05 22:50:36.851661478 -070=
0<br>&gt;&gt; +@@ -48,10 +48,12 @@<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0*/<br>&gt;&gt; +<br>&gt;&gt; +-#include&lt;bits/uClibc_arch_features.h&g=
t;<br>&gt;&gt; +-<br>


&gt;&gt; + /* Enable declarations of GNU extensions, since we are compiling=
 them.<br>&gt;&gt; =C2=A0*/<br>&gt;&gt; + #define _GNU_SOURCE =C2=A0 1<br>&=
gt;&gt; ++#define __need_uClibc_config_h<br>&gt;&gt; ++#include&lt;bits/uCl=
ibc_config.h&gt;<br>


&gt;&gt; ++#undef __need_uClibc_config_h<br>&gt;&gt; ++#include&lt;bits/uCl=
ibc_arch_features.h&gt;<br>&gt;&gt; +<br>&gt;&gt; + /* Prepare for the case=
 that `__builtin_expect&#39; is not available. =C2=A0*/<br>&gt;&gt; + #if d=
efined __GNUC__&amp;&amp; =C2=A0__GNUC__ =3D=3D 2&amp;&amp; =C2=A0__GNUC_MI=
NOR__&lt; =C2=A096<br>


&gt;&gt; diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.ma=
chine<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.mach=
ine<br>&gt;&gt; similarity index 100%<br>&gt;&gt; rename from meta/recipes-=
core/uclibc/uclibc-0.9.32/mips/uClibc.machine<br>


&gt;&gt; rename to meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machi=
ne<br>&gt;&gt; diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_pa=
th.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.pa=
tch<br>


&gt;&gt; similarity index 64%<br>&gt;&gt; rename from meta/recipes-core/ucl=
ibc/uclibc-0.9.32/orign_path.patch<br>&gt;&gt; rename to meta/recipes-core/=
uclibc/uclibc-0.9.33/orign_path.patch<br>&gt;&gt; index 631951e..c9c15a3 10=
0644<br>


&gt;&gt; --- a/meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch<br>&=
gt;&gt; +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch<br>&g=
t;&gt; @@ -3,16 +3,16 @@<br>&gt;&gt; <a href=3D"http://lists.busybox.net/pi=
permail/uclibc/2011-March/045003.html" target=3D"_blank">http://lists.busyb=
ox.net/pipermail/uclibc/2011-March/045003.html</a><br>


&gt;&gt;<br>&gt;&gt; =C2=A0Upstream-Status: Pending<br>&gt;&gt;<br>&gt;&gt;=
 -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c<br>&gt;&gt; -index 5=
05247e..2b2d429 100644<br>&gt;&gt; ---- a/ldso/ldso/dl-elf.c<br>&gt;&gt; -+=
++ b/ldso/ldso/dl-elf.c<br>


&gt;&gt; -@@ -133,53 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)<b=
r>&gt;&gt; +Index: git/ldso/ldso/dl-elf.c<br>&gt;&gt; +=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; +--- git.orig/ldso/ldso/dl-el=
f.c =C2=A0 =C2=A0 =C2=A0 =C2=A02012-01-23 19:18:58.000000000<br>


&gt;&gt; -0800<br>&gt;&gt; ++++ git/ldso/ldso/dl-elf.c =C2=A0 =C2=A0 2012-0=
1-23 21:52:06.144646590 -0800<br>&gt;&gt; +@@ -133,53 +133,60 @@<br>&gt;&gt=
; =C2=A0 =C2=A0* in uClibc/ldso/util/ldd.c */<br>&gt;&gt; =C2=A0 static str=
uct elf_resolve *<br>


&gt;&gt; - search_for_named_library(const char *name, int secure, const cha=
r<br>&gt;&gt; *path_list,<br>&gt;&gt; + search_for_named_library(const char=
 *name, unsigned rflags, const char<br>&gt;&gt; *path_list,<br>&gt;&gt; =C2=
=A0- =C2=A0 =C2=A0 struct dyn_elf **rpnt)<br>


&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0struct dyn_elf **rpnt, const char *origin)<=
br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0struct dyn_elf **rpnt, const char* origi=
n)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; =C2=A0- =C2=A0 =C2=A0 char *path, *path=
_n, *mylibname;<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 char *mylibname;<br>


&gt;&gt; @@ -47,18 +47,6 @@ index 505247e..2b2d429 100644<br>&gt;&gt; =C2=
=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*path =3D=3D 0) {<br>&gt=
;&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *path =3D &#39;:&#39;;<br>&gt;&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done =3D 1;<br>&gt;&gt; --=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*path =3D=
=3D &#39;:&#39;) {<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*path =3D 0;<br>&gt;&gt; -- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*path=
_n)<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcpy(mylibname, path_=
n);<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0else<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcpy(my=
libname, &quot;.&quot;); /* Assume<br>&gt;&gt; current dir if empty path */=
<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_dl_strcat(mylibname, &quot;/&quot;);<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0_dl_strcat(mylibname, name);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt =3D _d=
l_load_elf_shared_library(secure,<br>&gt;&gt; rpnt, mylibname)) !=3D NULL)<=
br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tpnt;<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0path_n =3D path+1;<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 for (p =
=3D path_list; p !=3D NULL; p =3D pn) {<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D _dl_strchr(p + 1, &#39;:&#39;);<br>&gt;&=
gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pn !=3D NULL) {<b=
r>


&gt;&gt; @@ -69,7 +57,7 @@ index 505247e..2b2d429 100644<br>&gt;&gt; =C2=A0=
+<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (plen&gt=
;=3D 7&amp;&amp; =C2=A0_dl_memcmp(p, &quot;$ORIGIN&quot;, 7) =3D=3D 0) {<br=
>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int olen;<br>

&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (secure&amp;&amp; =C2=A0plen !=3D 7)<br>
&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rflags&amp;&amp; =C2=A0plen !=3D 7)<br>&gt;&gt; =C2=A0+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (origin =3D=3D NULL)<b=
r>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>


&gt;&gt; @@ -86,12 +74,24 @@ index 505247e..2b2d429 100644<br>&gt;&gt; =C2=
=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt;&gt; =C2=A0+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_=
strcpy(mylibname, &quot;.&quot;);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (*path =3D=3D &#39;:&#39;) {<br>


&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*path =3D 0;<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*path_n)<br>&gt;&gt; +- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcpy(mylibname, path_n);<br>&gt;&gt; +- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcpy(mylibname, &=
quot;.&quot;); /* Assume<br>


&gt;&gt; current dir if empty path */<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcat(mylibname=
, &quot;/&quot;);<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_strcat(mylibname, name);<br>&gt;&gt; =
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ((tpnt =3D _dl_load_elf_shared_library(rflags,<br>


&gt;&gt; rpnt, mylibname)) !=3D NULL)<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return tpnt;<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_n =3D path+1;<br>&gt;&gt; +- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; =C2=A0- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path++;<br>&gt;&gt; =C2=A0- =C2=A0 =
=C2=A0 } while (!done);<br>


&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_strcat(mylib=
name, &quot;/&quot;);<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _dl_strcat(mylibname, name);<br>&gt;&gt; =C2=A0+<br>&gt;&gt; -+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt =3D _dl_load_elf_share=
d_library(secure, rpnt,<br>&gt;&gt; mylibname);<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpnt =3D _dl_lo=
ad_elf_shared_library(rflags, rpnt,<br>&gt;&gt; mylibname);<br>&gt;&gt; =C2=
=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tpnt !=3D NULL)<br>&gt;&=
gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return tpnt;<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 }<br>&gt;&gt; @@ -99,=
44 +99,46 @@ index 505247e..2b2d429 100644<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>&gt;&gt; =C2=A0 }<br>&g=
t;&gt;<br>&gt;&gt; -@@ -231,7 +238,8 @@ struct elf_resolve *_dl_load_shared=
_library(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&gt; +@@ -23=
1,8 +238,10 @@<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pnt) {<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pnt +=3D (u=
nsigned long) tpnt-&gt;dynamic_info[DT_STRTAB];<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_if_debug_dprint(&quot;\tsearch=
ing RPATH=3D&#39;%s&#39;\n&quot;, pnt);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname=
, secure,<br>


&gt;&gt; pnt, rpnt)) !=3D NULL)<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname, secure=
,<br>&gt;&gt; pnt, rpnt,<br>&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname, rflags,<br>


&gt;&gt; pnt, rpnt)) !=3D NULL)<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname, rflags=
,<br>&gt;&gt; pnt, rpnt,<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
pnt-&gt;libname)) !=3D<br>


&gt;&gt; NULL)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tpnt1;<br>&gt;&gt; ++<br>&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; =C2=A0 #endif<br>&gt;&gt; -@@ -23=
9,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int<br>&gt;&gt; s=
ecure, struct dyn_elf **rpnt,<br>


&gt;&gt; +<br>&gt;&gt; +@@ -240,7 +249,7 @@<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_dl_library_path) {<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_if_debug_dprint(=
&quot;\tsearching LD_LIBRARY_PATH=3D&#39;%s&#39;\n&quot;,<br>


&gt;&gt; _dl_library_path);<br>&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(libname, secure,<b=
r>&gt;&gt; _dl_library_path, rpnt)) !=3D NULL)<br>&gt;&gt; -+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_library(=
libname, secure,<br>


&gt;&gt; _dl_library_path, rpnt, NULL)) !=3D NULL)<br>&gt;&gt; +- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D search_for_named_li=
brary(libname, rflags,<br>&gt;&gt; _dl_library_path, rpnt)) !=3D NULL)<br>&=
gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D s=
earch_for_named_library(libname, rflags,<br>


&gt;&gt; _dl_library_path, rpnt, NULL)) !=3D NULL)<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 tpnt1;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>&gt;&gt; -@@ -253,7 +261,7 @@ struct elf_resolve *_dl_load_shared_libr=
ary(int<br>


&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&gt; +@@ -254,7 +263,7 @@<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pnt) {<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pnt +=3D (unsigned long) tpnt-&gt;=
dynamic_info[DT_STRTAB];<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_dl_if_debug_dprint(&quot;\tsearching RUNPATH=3D&#39;%s&#3=
9;\n&quot;, pnt);<br>


&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D =
search_for_named_library(libname, secure,<br>&gt;&gt; pnt, rpnt)) !=3D NULL=
)<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1=
 =3D search_for_named_library(libname, secure,<br>&gt;&gt; pnt, rpnt, NULL)=
) !=3D NULL)<br>


&gt;&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1 =3D =
search_for_named_library(libname, rflags,<br>&gt;&gt; pnt, rpnt)) !=3D NULL=
)<br>&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tpnt1=
 =3D search_for_named_library(libname, rflags,<br>&gt;&gt; pnt, rpnt, NULL)=
) !=3D NULL)<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return tpnt1;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=
&gt;&gt; =C2=A0 #endif<br>&gt;&gt; -@@ -287,7 +295,7 @@ struct elf_resolve =
*_dl_load_shared_library(int<br>&gt;&gt; secure, struct dyn_elf **rpnt,<br>=
&gt;&gt; +@@ -288,7 +297,7 @@<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Look for libraries wherever the shar=
ed library loader<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 * was installed *=
/<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_if_debug_dprint(&quot;\tsearch=
ing ldso dir=3D&#39;%s&#39;\n&quot;, _dl_ldsopath);<br>&gt;&gt; -- =C2=A0 =
=C2=A0 =C2=A0tpnt1 =3D search_for_named_library(libname, secure, _dl_ldsopa=
th,<br>


&gt;&gt; rpnt);<br>&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0tpnt1 =3D search_for_nam=
ed_library(libname, secure, _dl_ldsopath,<br>&gt;&gt; rpnt, NULL);<br>&gt;&=
gt; +- =C2=A0 =C2=A0 =C2=A0tpnt1 =3D search_for_named_library(libname, rfla=
gs, _dl_ldsopath,<br>&gt;&gt; rpnt);<br>


&gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0tpnt1 =3D search_for_named_library(libname,=
 rflags, _dl_ldsopath,<br>&gt;&gt; rpnt, NULL);<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (tpnt1 !=3D NULL)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return tpnt1;<br>&gt;&gt; -<br>&gt;&gt; -@@ -300=
,7 +308,7 @@ struct elf_resolve *_dl_load_shared_library(int<br>


&gt;&gt; secure, struct dyn_elf **rpnt,<br>&gt;&gt; + #endif<br>&gt;&gt; +@=
@ -301,7 +310,7 @@<br>&gt;&gt; =C2=A0 #ifndef __LDSO_CACHE_SUPPORT__<br>&gt=
;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;:&quot; UCLIBC_RUNTIME_PREFIX<br>


&gt;&gt; &quot;usr/X11R6/lib&quot;<br>&gt;&gt; =C2=A0 #endif<br>&gt;&gt; @@=
 -145,12 +147,12 @@ index 505247e..2b2d429 100644<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (tpnt1 !=3D NULL)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return tpnt1;<br>&gt;&gt;<br>&gt;&gt; -diff --gi=
t a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c<br>


&gt;&gt; -index 7ee9257..9423670 100644<br>&gt;&gt; ---- a/ldso/ldso/ldso.c=
<br>&gt;&gt; -+++ b/ldso/ldso/ldso.c<br>&gt;&gt; -@@ -272,6 +272,20 @@ stat=
ic void __attribute__ ((destructor))<br>&gt;&gt; __attribute_used__ _dl_fin=
i(void)<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +Index: git/ldso/ldso/ldso.c<=
br>&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&=
gt; +--- git.orig/ldso/ldso/ldso.c =C2=A02012-01-23 19:18:58.000000000 -080=
0<br>


&gt;&gt; ++++ git/ldso/ldso/ldso.c =C2=A0 =C2=A0 =C2=A0 2012-01-23 21:34:11=
.152594621 -0800<br>&gt;&gt; +@@ -407,6 +407,20 @@<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 return p - list;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt;<br>&gt;&gt; =
=C2=A0+static void _dl_setup_progname(const char *argv0)<br>


&gt;&gt; @@ -167,10 +169,10 @@ index 7ee9257..9423670 100644<br>&gt;&gt; =
=C2=A0+ =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0+}<br>&gt;&gt; =C2=A0+<br>&gt;&gt=
; - void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE<br=
>&gt;&gt; load_addr,<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,<br>&gt;&=
gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 char **argv<br>&gt;&gt; -@@ -321,9 +335,7 @@ void _dl_get_re=
ady_to_run(struct elf_resolve *tpnt,<br>&gt;&gt; DL_LOADADDR_TYPE load_addr=
,<br>


&gt;&gt; + void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR=
_TYPE<br>&gt;&gt; load_addr,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ElfW(auxv_t) auxvt[AT_=
EGID + 1], char **envp,<br>&gt;&gt; char **argv<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DL_G=
ET_READY_TO_RUN_EXTRA_PARMS)<br>


&gt;&gt; +@@ -458,9 +472,7 @@<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 * bee=
n fixed up by now. =C2=A0Still no function calls outside of this<br>&gt;&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 * library, since the dynamic resolver is not =
yet ready.<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; @@ -179,5=
 +181,5 @@ index 7ee9257..9423670 100644<br>


&gt;&gt; =C2=A0- =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0+ =C2=A0 =C2=A0 _dl_setu=
p_progname(argv[0]);<br>&gt;&gt;<br>&gt;&gt; + #ifndef __LDSO_STANDALONE_SU=
PPORT__<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (_start =3D=3D (void *) a=
uxvt[AT_ENTRY].a_un.a_val) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 _dl_dprintf(_dl_debug_file, &quot;Standalone execution is=
 not<br>


&gt;&gt; supported yet\n&quot;);<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/=
recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch<br>&gt;&gt; b/met=
a/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch<br>&gt;&gt; sim=
ilarity index 96%<br>


&gt;&gt; rename from meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysig=
nl.patch<br>&gt;&gt; rename to meta/recipes-core/uclibc/uclibc-0.9.33/power=
pc_copysignl.patch<br>&gt;&gt; index 339ce7f..3fa10af 100644<br>&gt;&gt; --=
- a/meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch<br>


&gt;&gt; +++ b/meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.pat=
ch<br>&gt;&gt; @@ -1,3 +1,9 @@<br>&gt;&gt; +Add ppc copysignl implementatio=
n<br>&gt;&gt; +<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +<br>


&gt;&gt; +Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +<br>&gt;&gt; =C2=
=A0Index: git/libc/sysdeps/linux/powerpc/Makefile.arch<br>&gt;&gt; =C2=A0=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>


&gt;&gt; =C2=A0--- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch<br>&gt=
;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uclibc-0.9.32/remov=
e_attribute_optimize_Os.patch<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc=
-0.9.33/remove_attribute_optimize_Os.patch<br>


&gt;&gt; similarity index 93%<br>&gt;&gt; rename from<br>&gt;&gt; meta/reci=
pes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch<br>&gt;&gt=
; rename to<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.33/remove_attri=
bute_optimize_Os.patch<br>


&gt;&gt; index 1930383..bee251c 100644<br>&gt;&gt; ---<br>&gt;&gt; a/meta/r=
ecipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch<br>&gt;=
&gt; +++<br>&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/remove_attrib=
ute_optimize_Os.patch<br>


&gt;&gt; @@ -1,15 +1,8 @@<br>&gt;&gt; -Index: git/include/features.h<br>&gt=
;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; --=
-- git.orig/include/features.h<br>&gt;&gt; -+++ git/include/features.h<br>


&gt;&gt; -@@ -186,7 +186,6 @@<br>&gt;&gt; - # define __need_uClibc_config_h=
<br>&gt;&gt; - # include&lt;bits/uClibc_config.h&gt;<br>&gt;&gt; - # undef =
__need_uClibc_config_h<br>&gt;&gt; --<br>&gt;&gt; - /* For uClibc, always o=
ptimize for size -- this should disable<br>


&gt;&gt; - =C2=A0* a lot of expensive inlining...<br>&gt;&gt; - =C2=A0* TOD=
O: this is wrong! __OPTIMIZE_SIZE__ is an indicator of<br>&gt;&gt; +Dont su=
pport localised optimizations this helps to have a global -O level<br>&gt;&=
gt; +<br>


&gt;&gt; +Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +Upstream-Status: =
Pending<br>&gt;&gt; +<br>&gt;&gt; =C2=A0Index: git/libpthread/nptl/pthread_=
mutex_timedlock.c<br>


&gt;&gt; =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&=
gt; =C2=A0--- git.orig/libpthread/nptl/pthread_mutex_timedlock.c<br>&gt;&gt=
; diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro<br>&gt;&gt;=
 similarity index 96%<br>&gt;&gt; rename from meta/recipes-core/uclibc/ucli=
bc-0.9.32/uClibc.distro<br>&gt;&gt; rename to meta/recipes-core/uclibc/ucli=
bc-0.9.33/uClibc.distro<br>


&gt;&gt; index 5638d47..c33bf8e 100644<br>&gt;&gt; --- a/meta/recipes-core/=
uclibc/uclibc-0.9.32/uClibc.distro<br>&gt;&gt; +++ b/meta/recipes-core/ucli=
bc/uclibc-0.9.33/uClibc.distro<br>&gt;&gt; @@ -181,4 +181,10 @@ UCLIBC_HAS_=
FLOATS=3Dy<br>


&gt;&gt;<br>&gt;&gt; =C2=A0# needed by systemd<br>&gt;&gt; =C2=A0UCLIBC_HAS=
_UTMPX=3Dy<br>&gt;&gt; -<br>&gt;&gt; +UCLIBC_LINUX_MODULE_26=3Dy<br>&gt;&gt=
; +UCLIBC_HAS_RESOLVER_SUPPORT=3Dy<br>&gt;&gt; +# needed for LTP<br>&gt;&gt=
; +UCLIBC_SUSV4_LEGACY=3Dy<br>


&gt;&gt; +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=3Dy<br>&gt;&gt; +DO_XSI_MATH=3Dy<b=
r>&gt;&gt; +UCLIBC_SV4_DEPRECATED=3Dy<br>&gt;&gt; diff --git a/meta/recipes=
-core/uclibc/uclibc-0.9.32/uClibc.machine<br>&gt;&gt; b/meta/recipes-core/u=
clibc/uclibc-0.9.33/uClibc.machine<br>


&gt;&gt; similarity index 100%<br>&gt;&gt; rename from meta/recipes-core/uc=
libc/uclibc-0.9.32/uClibc.machine<br>&gt;&gt; rename to meta/recipes-core/u=
clibc/uclibc-0.9.33/uClibc.machine<br>&gt;&gt; diff --git a/meta/recipes-co=
re/uclibc/uclibc-0.9.32/uclibc-execvpe.patch<br>


&gt;&gt; b/meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch<br>&=
gt;&gt; similarity index 99%<br>&gt;&gt; rename from meta/recipes-core/ucli=
bc/uclibc-0.9.32/uclibc-execvpe.patch<br>&gt;&gt; rename to meta/recipes-co=
re/uclibc/uclibc-0.9.33/uclibc-execvpe.patch<br>


&gt;&gt; index cd90a09..fe191fc 100644<br>&gt;&gt; --- a/meta/recipes-core/=
uclibc/uclibc-0.9.32/uclibc-execvpe.patch<br>&gt;&gt; +++ b/meta/recipes-co=
re/uclibc/uclibc-0.9.33/uclibc-execvpe.patch<br>&gt;&gt; @@ -12,6 +12,9 @@ =
Signed-off-by: Henning Heinold&lt;<a href=3D"mailto:heinold@inf.fu-berlin.d=
e" target=3D"_blank">heinold@inf.fu-berlin.de</a>&gt;<br>


&gt;&gt; =C2=A0 3 files changed, 46 insertions(+), 5 deletions(-)<br>&gt;&g=
t; =C2=A0 create mode 100644 libc/unistd/execvpe.c<br>&gt;&gt;<br>&gt;&gt; =
+<br>&gt;&gt; +Upstream-Status: Pending<br>&gt;&gt; +<br>&gt;&gt; =C2=A0dif=
f --git a/include/unistd.h b/include/unistd.h<br>


&gt;&gt; =C2=A0index 9568790..070e4f2 100644<br>&gt;&gt; =C2=A0--- a/includ=
e/unistd.h<br>&gt;&gt; diff --git<br>&gt;&gt; a/meta/recipes-core/uclibc/uc=
libc-0.9.32/uclibc_enable_log2_test.patch<br>&gt;&gt; b/meta/recipes-core/u=
clibc/uclibc-0.9.33/uclibc_enable_log2_test.patch<br>


&gt;&gt; similarity index 81%<br>&gt;&gt; rename from<br>&gt;&gt; meta/reci=
pes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch<br>&gt;&gt; ren=
ame to<br>&gt;&gt; meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log=
2_test.patch<br>


&gt;&gt; index f8f3a7d..37a5988 100644<br>&gt;&gt; --- a/meta/recipes-core/=
uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch<br>&gt;&gt; +++ b/meta/r=
ecipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch<br>&gt;&gt; =
@@ -1,3 +1,8 @@<br>


&gt;&gt; +uclibc now has log2 so enable the tests<br>&gt;&gt; +<br>&gt;&gt;=
 +Signed-off-by: Khem Raj&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; +Upstream-Status: Pendin=
g<br>

&gt;&gt; +<br>
&gt;&gt; =C2=A0Index: uClibc/test/math/libm-test.inc<br>&gt;&gt; =C2=A0=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; =C2=A0--- uCli=
bc/test/math/libm-test.inc =C2=A0 =C2=A0(revision 23784)<br>&gt;&gt; diff -=
-git a/meta/recipes-core/uclibc/<a href=3D"http://uclibc-initial_0.9.32.bb"=
 target=3D"_blank">uclibc-initial_0.9.32.bb</a><br>


&gt;&gt; b/meta/recipes-core/uclibc/<a href=3D"http://uclibc-initial_0.9.33=
.bb" target=3D"_blank">uclibc-initial_0.9.33.bb</a><br>&gt;&gt; similarity =
index 100%<br>&gt;&gt; rename from meta/recipes-core/uclibc/<a href=3D"http=
://uclibc-initial_0.9.32.bb" target=3D"_blank">uclibc-initial_0.9.32.bb</a>=
<br>


&gt;&gt; rename to meta/recipes-core/uclibc/<a href=3D"http://uclibc-initia=
l_0.9.33.bb" target=3D"_blank">uclibc-initial_0.9.33.bb</a><br>&gt;&gt; dif=
f --git a/meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.32.bb" targ=
et=3D"_blank">uclibc_0.9.32.bb</a><br>


&gt;&gt; b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.33.bb" tar=
get=3D"_blank">uclibc_0.9.33.bb</a><br>&gt;&gt; similarity index 45%<br>&gt=
;&gt; rename from meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.32.=
bb" target=3D"_blank">uclibc_0.9.32.bb</a><br>


&gt;&gt; rename to meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.33=
.bb" target=3D"_blank">uclibc_0.9.33.bb</a><br>&gt;&gt; index 235b436..b559=
fd4 100644<br>&gt;&gt; --- a/meta/recipes-core/uclibc/<a href=3D"http://ucl=
ibc_0.9.32.bb" target=3D"_blank">uclibc_0.9.32.bb</a><br>


&gt;&gt; +++ b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.33.bb"=
 target=3D"_blank">uclibc_0.9.33.bb</a><br>&gt;&gt; @@ -1,34 +1,26 @@<br>&g=
t;&gt; -SRCREV=3D&quot;9152c4d67c763fde5712e2d181d92c0d7e1e2ab9&quot;<br>&g=
t;&gt; +SRCREV=3D&quot;1548ee3ca582f3732136e71613c87c16230f71cc&quot;<br>


&gt;&gt;<br>&gt;&gt; =C2=A0require uclibc.inc<br>&gt;&gt; -PR =3D &quot;${I=
NC_PR}.3&quot;<br>&gt;&gt; +<br>&gt;&gt; +PR =3D &quot;${INC_PR}.0&quot;<br=
>&gt;&gt; =C2=A0PROVIDES +=3D &quot;virtual/${TARGET_PREFIX}libc-for-gcc&qu=
ot;<br>&gt;&gt;<br>


&gt;&gt; =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://uclibc.org/uClibc.=
git;branch=3D$%7BPV%7D;protocol=3Dgit" target=3D"_blank">uclibc.org/uClibc.=
git;branch=3D${PV};protocol=3Dgit</a> \<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://uClibc.machine \<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file:/=
/uClibc.distro \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://uclibc-arm-ftruncate64.patch \<br>&g=
t;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uclibc_enable_log2_test.patch \<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ldso_use_arm_dl_linux_resolve_i=
n_thumb_mode.patch \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://select-force=
-thumb.patch \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://remove-sub-arch-variants.patch \<br>=
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://transform-eabi-oabi-choice.patch \<b=
r>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://include-arm-asm.h.patch \<br>&gt;&=
gt; - =C2=A0 =C2=A0 =C2=A0 file://detect-bx-availibility.patch \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://remove-eabi-oabi-selection.patch \<b=
r>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://powerpc_copysignl.patch \<br>&=
gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://argp-support.patch \<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://argp-headers.patch \<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0file://remove_attribute_optimize_Os.patch \<br>


&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://compile-arm-fork-with-O2.patch \=
<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://epoll-asm-fix.patch \<br>&gt;&gt=
; - =C2=A0 =C2=A0 =C2=A0 file://orign_path.patch \<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 file://rtld_no.patch \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0<br>&gt=
;&gt; file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patc=
h \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; file://0001-mips-signalfd.h-SFD=
_NONBLOCK-for-mips-is-0200-unlike.patch \<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://uclibc-execvpe.patch \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file=
://uclibc_scheduler_update.patch \<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file:=
//sync_file_range2.patch \<br>


&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 file://mount.h-update.patch \<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 file://orign_path.patch \<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 file://dup3.patch \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 file://defin=
e-MSG_CMSG_CLOEXEC.patch \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; f=
ile://0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch \<br>


&gt;&gt; + =C2=A0 =C2=A0 =C2=A0<br>&gt;&gt; file://0001-Declare-__err-and-p=
ass-it-to-INTERNAL_SYSCALL_NCS-so.patch \<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>&gt;&gt; +<br>&gt;&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quo=
t;<br><br>

--f46d04016ca924444204b86747bf--

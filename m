Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25104786AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:02:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 61so4733223plf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=SVvetjK9bPUPOkn3RmyFMRMqvqPppz+vio51DUCCk+M=;
	b=MXh49uvd1+8hYE6vf2hYVizA64IQxTSZRKlgA9vITmVjnKkY8+U74wBqLvgFlbjJAu
	k0Y/+EdMjNpHFz3jEA3fTiSJC/sS/twf0tSvmTwAVIDOl7i4ID8BuNZhl4D4LzcINt0A
	NeRa8Smw6oeqQB2tDRrL3tJE9sO/hsMAFcbZZE1YD/BCVO+bRc9j71gKlmI0igpFTxkg
	d+swN8fEsdGlwtxf4JZWr94xIfK71/IgqlezOh356k56X3iCeUZf+g9QIVkTjcu1Xl3h
	US4lujvYdLRtNQYUIdzHKRG1ID/G6lguFtKzbclalmY+EQzXCmSTVlG3/uvEXDRk4snK
	AW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SVvetjK9bPUPOkn3RmyFMRMqvqPppz+vio51DUCCk+M=;
	b=oNrWuoxlVK3OYr7inpcezSP5yFY2cyxajPArOkdENxPR3SJDZfVvh3wpQiAGK2zRQL
	8km4avmIHNINMu6tz1ZgoICkgiFrdxk9XGagBu3IHvlFcX8X8QnvYKePdvurdcjdHQ0R
	HWKb3Du5a5s0PrvMa+2hIw849EAJAmcVbd2v/HEAeTLK4Njo2pIBK6R7wi2R/ZTks/CE
	xtw2dhnGAg2x3C4X6bD008v9hywfMl0t41V0xY7//mR8WLFRMu7OTANOaeGQQ4HLZLwn
	W7DIan0u8XVl+28ogPgpYT0NUUx36ba1ZjsaPCjbnE9kz9ESLRMHA2b2ZgxofdfFBjFw
	nfYw==
X-Gm-Message-State: AJaThX5IyvoMm2hWZxsuvAN5xRDS0LptA2yFPXOUD2JL0bjTY9G6muM7
	pydiyex6anQpmtin2m/n+OywXQ==
X-Google-Smtp-Source: AGs4zMa8U6IRRyOCDo6nryIt4GGKOIzZbu45HbXPd/uyGi/WAUIdnVr3Ed4rdLFT7CQt8LaZCkGZqw==
X-Received: by 10.84.131.6 with SMTP id 6mr7505626pld.418.1511542954828;
	Fri, 24 Nov 2017 09:02:34 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	m87sm27826283pfi.88.2017.11.24.09.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 09:02:34 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1511206830-6353-1-git-send-email-armccurdy@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a8477782-df8c-03fb-776e-bc963f484498@gmail.com>
Date: Fri, 24 Nov 2017 09:02:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511206830-6353-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [pyro][PATCH] glibc_2.25: fix building for x86 with -Os (or -fno-omit-frame-pointer)
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
X-List-Received-Date: Fri, 24 Nov 2017 17:02:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in stable/pyro-next


On 11/20/2017 11:40 AM, Andre McCurdy wrote:
> Glibc 2.25 fails to build for x86 when frame pointers are enabled (ie
> when optimised for size or when -fno-omit-frame-pointer is explicitly
> included in CFLAGS etc). Backport the upstream fix from glibc 2.26.
>
>   https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=3b33d6ed6096c1d20d05a650b06026d673f7399a
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  ...rk-fno-omit-frame-pointer-support-on-i386.patch | 268 +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
>  2 files changed, 269 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch b/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch
> new file mode 100644
> index 0000000..7ed2b90
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-Rework-fno-omit-frame-pointer-support-on-i386.patch
> @@ -0,0 +1,268 @@
> +From 1ea003d4fccc4646fd1848a182405a1c7000ab18 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Date: Sun, 8 Jan 2017 11:38:23 -0200
> +Subject: [PATCH 28/28] Rework -fno-omit-frame-pointer support on i386
> +
> +Commit 6b1df8b27f fixed the -OS build issue on i386 (BZ#20729) by
> +expliciting disabling frame pointer (-fomit-frame-pointer) on the
> +faulty objects.  Although it does fix the issue, it is a subpar
> +workaround that adds complexity in build process (a rule for each
> +object to add the required compiler option and pontentially more
> +rules for objects that call {INLINE,INTERNAL}_SYSCALL) and does not
> +allow the implementations to get all the possible debug/calltrack
> +information possible (used mainly in debuggers and performance
> +measurement tools).
> +
> +This patch fixes it by adding an explicit configure check to see
> +if -fno-omit-frame-pointer is set and to act accordingly (set or
> +not OPTIMIZE_FOR_GCC_5).  The make rules is simplified and only
> +one is required: to add libc-do-syscall on loader due mmap
> +(which will be empty anyway for default build with
> +-fomit-frame-pointer).
> +
> +Checked on i386-linux-gnu with GCC 6.2.1 with CFLAGS sets as
> +'-Os', '-O2 -fno-omit-frame-pointer', and '-O2 -fomit-frame-pointer'.
> +For '-Os' the testsuite issues described by BZ#19463 and BZ#15105
> +still applied.
> +
> +It fixes BZ #21029, although it is marked as duplicated of #20729
> +(I reopened to track this cleanup).
> +
> +	[BZ #21029]
> +	* config.h.in [CAN_USE_REGISTER_ASM_EBP]: New define.
> +	* sysdeps/unix/sysv/linux/i386/Makefile
> +	[$(subdir) = elf] (sysdep-dl-routines): Add libc-do-syscall.
> +	(uses-6-syscall-arguments): Remove.
> +	[$(subdir) = misc] (CFLAGS-epoll_pwait.o): Likewise.
> +	[$(subdir) = misc] (CFLAGS-epoll_pwait.os): Likewise.
> +	[$(subdir) = misc] (CFLAGS-mmap.o): Likewise.
> +	[$(subdir) = misc] (CFLAGS-mmap.os): Likewise.
> +	[$(subdir) = misc] (CFLAGS-mmap64.o): Likewise.
> +	[$(subdir) = misc] (CFLAGS-mmap64.os): Likewise.
> +	[$(subdir) = misc] (CFLAGS-pselect.o): Likewise.
> +	[$(subdir) = misc] (cflags-pselect.o): Likewise.
> +	[$(subdir) = misc] (cflags-pselect.os): Likewise.
> +	[$(subdir) = misc] (cflags-rtld-mmap.os): Likewise.
> +	[$(subdir) = sysvipc] (cflags-semtimedop.o): Likewise.
> +	[$(subdir) = sysvipc] (cflags-semtimedop.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fadvise64.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fadvise64.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fallocate.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fallocate.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fallocate64.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-posix_fallocate64.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-sync_file_range.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-sync_file_range.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-fallocate.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-fallocate.os): Likewise.
> +	[$(subdir) = io] (CFLAGS-fallocate64.o): Likewise.
> +	[$(subdir) = io] (CFLAGS-fallocate64.os): Likewise.
> +	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrdlock.o):
> +	Likewise.
> +	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrdlock.os):
> +	Likewise.
> +	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrwlock.o):
> +	Likewise.
> +	[$(subdir) = nptl] (CFLAGS-pthread_rwlock_timedrwlock.os):
> +	Likewise.
> +	[$(subdir) = nptl] (CFLAGS-sem_wait.o): Likewise.
> +	[$(subdir) = nptl] (CFLAGS-sem_wait.os): Likewise.
> +	[$(subdir) = nptl] (CFLAGS-sem_timedwait.o): Likewise.
> +	[$(subdir) = nptl] (CFLAGS-sem_timedwait.os): Likewise.
> +	* sysdeps/unix/sysv/linux/i386/configure.ac: Add check if compiler allows
> +	ebp on inline assembly.
> +	* sysdeps/unix/sysv/linux/i386/configure: Regenerate.
> +	* sysdeps/unix/sysv/linux/i386/sysdep.h (OPTIMIZE_FOR_GCC_5):
> +	Set if CAN_USE_REGISTER_ASM_EBP is set.
> +	(check_consistency): Likewise.
> +
> +Upstream-Status: Backport
> +
> +  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=3b33d6ed6096c1d20d05a650b06026d673f7399a
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + config.h.in                               |  4 ++++
> + sysdeps/unix/sysv/linux/i386/Makefile     | 39 +------------------------------
> + sysdeps/unix/sysv/linux/i386/configure    | 39 +++++++++++++++++++++++++++++++
> + sysdeps/unix/sysv/linux/i386/configure.ac | 17 ++++++++++++++
> + sysdeps/unix/sysv/linux/i386/sysdep.h     |  6 ++---
> + 5 files changed, 64 insertions(+), 41 deletions(-)
> +
> +diff --git a/config.h.in b/config.h.in
> +index 7bfe923..fb2cc51 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -259,4 +259,8 @@
> + /* Build glibc with tunables support.  */
> + #define HAVE_TUNABLES 0
> + 
> ++/* Some compiler options may now allow to use ebp in __asm__ (used mainly
> ++   in i386 6 argument syscall issue).  */
> ++#define CAN_USE_REGISTER_ASM_EBP 0
> ++
> + #endif
> +diff --git a/sysdeps/unix/sysv/linux/i386/Makefile b/sysdeps/unix/sysv/linux/i386/Makefile
> +index 9609752..6aac0df 100644
> +--- a/sysdeps/unix/sysv/linux/i386/Makefile
> ++++ b/sysdeps/unix/sysv/linux/i386/Makefile
> +@@ -1,47 +1,18 @@
> + # The default ABI is 32.
> + default-abi := 32
> + 
> +-# %ebp is used to pass the 6th argument to system calls, so these
> +-# system calls are incompatible with a frame pointer.
> +-uses-6-syscall-arguments = -fomit-frame-pointer
> +-
> + ifeq ($(subdir),misc)
> + sysdep_routines += ioperm iopl vm86
> +-CFLAGS-epoll_pwait.o += $(uses-6-syscall-arguments)
> +-CFLAGS-epoll_pwait.os += $(uses-6-syscall-arguments)
> +-CFLAGS-mmap.o += $(uses-6-syscall-arguments)
> +-CFLAGS-mmap.os += $(uses-6-syscall-arguments)
> +-CFLAGS-mmap64.o += $(uses-6-syscall-arguments)
> +-CFLAGS-mmap64.os += $(uses-6-syscall-arguments)
> +-CFLAGS-pselect.o += $(uses-6-syscall-arguments)
> +-CFLAGS-pselect.os += $(uses-6-syscall-arguments)
> +-CFLAGS-rtld-mmap.os += $(uses-6-syscall-arguments)
> +-endif
> +-
> +-ifeq ($(subdir),sysvipc)
> +-CFLAGS-semtimedop.o += $(uses-6-syscall-arguments)
> +-CFLAGS-semtimedop.os += $(uses-6-syscall-arguments)
> + endif
> + 
> + ifeq ($(subdir),elf)
> ++sysdep-dl-routines += libc-do-syscall
> + sysdep-others += lddlibc4
> + install-bin += lddlibc4
> + endif
> + 
> + ifeq ($(subdir),io)
> + sysdep_routines += libc-do-syscall
> +-CFLAGS-posix_fadvise64.o += $(uses-6-syscall-arguments)
> +-CFLAGS-posix_fadvise64.os += $(uses-6-syscall-arguments)
> +-CFLAGS-posix_fallocate.o += $(uses-6-syscall-arguments)
> +-CFLAGS-posix_fallocate.os += $(uses-6-syscall-arguments)
> +-CFLAGS-posix_fallocate64.o += $(uses-6-syscall-arguments)
> +-CFLAGS-posix_fallocate64.os += $(uses-6-syscall-arguments)
> +-CFLAGS-sync_file_range.o += $(uses-6-syscall-arguments)
> +-CFLAGS-sync_file_range.os += $(uses-6-syscall-arguments)
> +-CFLAGS-fallocate.o += $(uses-6-syscall-arguments)
> +-CFLAGS-fallocate.os += $(uses-6-syscall-arguments)
> +-CFLAGS-fallocate64.o += $(uses-6-syscall-arguments)
> +-CFLAGS-fallocate64.os += $(uses-6-syscall-arguments)
> + endif
> + 
> + ifeq ($(subdir),nptl)
> +@@ -61,14 +32,6 @@ ifeq ($(subdir),nptl)
> + # pull in __syscall_error routine
> + libpthread-routines += sysdep
> + libpthread-shared-only-routines += sysdep
> +-CFLAGS-pthread_rwlock_timedrdlock.o += $(uses-6-syscall-arguments)
> +-CFLAGS-pthread_rwlock_timedrdlock.os += $(uses-6-syscall-arguments)
> +-CFLAGS-pthread_rwlock_timedwrlock.o += $(uses-6-syscall-arguments)
> +-CFLAGS-pthread_rwlock_timedwrlock.os += $(uses-6-syscall-arguments)
> +-CFLAGS-sem_wait.o += $(uses-6-syscall-arguments)
> +-CFLAGS-sem_wait.os += $(uses-6-syscall-arguments)
> +-CFLAGS-sem_timedwait.o += $(uses-6-syscall-arguments)
> +-CFLAGS-sem_timedwait.os += $(uses-6-syscall-arguments)
> + endif
> + 
> + ifeq ($(subdir),rt)
> +diff --git a/sysdeps/unix/sysv/linux/i386/configure b/sysdeps/unix/sysv/linux/i386/configure
> +index eb72659..ae2c356 100644
> +--- a/sysdeps/unix/sysv/linux/i386/configure
> ++++ b/sysdeps/unix/sysv/linux/i386/configure
> +@@ -3,5 +3,44 @@
> + 
> + arch_minimum_kernel=2.6.32
> + 
> ++# Check if CFLAGS allows compiler to use ebp register in inline assembly.
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if compiler flags allows ebp in inline assembly" >&5
> ++$as_echo_n "checking if compiler flags allows ebp in inline assembly... " >&6; }
> ++if ${libc_cv_can_use_register_asm_ebp+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++
> ++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++    void foo (int i)
> ++    {
> ++      register int reg asm ("ebp") = i;
> ++      asm ("# %0" : : "r" (reg));
> ++    }
> ++int
> ++main ()
> ++{
> ++
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++if ac_fn_c_try_compile "$LINENO"; then :
> ++  libc_cv_can_use_register_asm_ebp=yes
> ++else
> ++  libc_cv_can_use_register_asm_ebp=no
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_can_use_register_asm_ebp" >&5
> ++$as_echo "$libc_cv_can_use_register_asm_ebp" >&6; }
> ++if test $libc_cv_can_use_register_asm_ebp = yes; then
> ++  $as_echo "#define CAN_USE_REGISTER_ASM_EBP 1" >>confdefs.h
> ++
> ++fi
> ++
> + libc_cv_gcc_unwind_find_fde=yes
> + ldd_rewrite_script=sysdeps/unix/sysv/linux/ldd-rewrite.sed
> +diff --git a/sysdeps/unix/sysv/linux/i386/configure.ac b/sysdeps/unix/sysv/linux/i386/configure.ac
> +index 1a11da6..1cd632e 100644
> +--- a/sysdeps/unix/sysv/linux/i386/configure.ac
> ++++ b/sysdeps/unix/sysv/linux/i386/configure.ac
> +@@ -3,5 +3,22 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
> + 
> + arch_minimum_kernel=2.6.32
> + 
> ++# Check if CFLAGS allows compiler to use ebp register in inline assembly.
> ++AC_CACHE_CHECK([if compiler flags allows ebp in inline assembly],
> ++                libc_cv_can_use_register_asm_ebp, [
> ++AC_COMPILE_IFELSE(
> ++  [AC_LANG_PROGRAM([
> ++    void foo (int i)
> ++    {
> ++      register int reg asm ("ebp") = i;
> ++      asm ("# %0" : : "r" (reg));
> ++    }])],
> ++  [libc_cv_can_use_register_asm_ebp=yes],
> ++  [libc_cv_can_use_register_asm_ebp=no])
> ++])
> ++if test $libc_cv_can_use_register_asm_ebp = yes; then
> ++  AC_DEFINE(CAN_USE_REGISTER_ASM_EBP)
> ++fi
> ++
> + libc_cv_gcc_unwind_find_fde=yes
> + ldd_rewrite_script=sysdeps/unix/sysv/linux/ldd-rewrite.sed
> +diff --git a/sysdeps/unix/sysv/linux/i386/sysdep.h b/sysdeps/unix/sysv/linux/i386/sysdep.h
> +index baf4642..449b23e 100644
> +--- a/sysdeps/unix/sysv/linux/i386/sysdep.h
> ++++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
> +@@ -44,9 +44,9 @@
> + /* Since GCC 5 and above can properly spill %ebx with PIC when needed,
> +    we can inline syscalls with 6 arguments if GCC 5 or above is used
> +    to compile glibc.  Disable GCC 5 optimization when compiling for
> +-   profiling since asm ("ebp") can't be used to put the 6th argument
> +-   in %ebp for syscall.  */
> +-#if __GNUC_PREREQ (5,0) && !defined PROF
> ++   profiling or when -fno-omit-frame-pointer is used since asm ("ebp")
> ++   can't be used to put the 6th argument in %ebp for syscall.  */
> ++#if __GNUC_PREREQ (5,0) && !defined PROF && CAN_USE_REGISTER_ASM_EBP
> + # define OPTIMIZE_FOR_GCC_5
> + #endif
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
> index cf9c4f7..0f1ec0c 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
> @@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
> +           file://0028-Rework-fno-omit-frame-pointer-support-on-i386.patch \
>  "
>  
>  NATIVESDKFIXES ?= ""



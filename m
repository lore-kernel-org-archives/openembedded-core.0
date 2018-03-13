Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF32606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 17:13:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j2so136926pff.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dlu/Jip0aJiMx7eKBD6FUACpMc7brIIuq3DJZNykhUY=;
	b=vgTza9uTiU8ZPlapvCkTlv5aoV/bpdNDPgGDF6fmsbE+sUCD8sTf3RoE6cheySYjQ5
	TR61v+CZNaUAqp320u670WYIsmqBAVPItFxWYduQb+HvxPkurYfSs4Ls6HkbSLn+V6qk
	QqlXhJQUfUH7fOxfTEZOJwKjGKJDB/yRFnGFlAbIKrAFHrIs16BURMrpc66DnjEsL13t
	TkVqc/mH8bFLLSllNrHSuNir63lI5SGUMmiAV3V9TZvamby6mqrRWhuUUMEzphb3SJMN
	ssV3dOLk3Fqp1lzJ3n1pHfvgaC8jUtqYm+CEDCDJ+Ov5sNc38ycNvj/xwChslgp5o3dw
	Jobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dlu/Jip0aJiMx7eKBD6FUACpMc7brIIuq3DJZNykhUY=;
	b=Xui9PI74GE7yYsfUQT2L6k1I2nYR76UnUEbTwxkqjLvpJEY+SnUeJpLZOvrWL7LGdp
	KDZp+MEkYlzFUxuGSKMnf5ueoFdrWUBGrOUyg64CRD2+Bvjw8tocjemA0xEpJP4xLkEp
	X8WyMKR0PCQ7Jzn48kb4K3qyVod4G1kpKWRBTLP85NUPkucncPVl0KH5gjHxuL0maBUm
	S+swB+AtLMvQyElxHmvWWYnSHDEk2aa6pHx5W7Evg0mQGTMIoOqK1unQ/IQo0wO72Uoh
	RPPd13SDIAtuAFtbX2BNOf44Kbm2dr5JXYbuk7wM2SHlQ4QyrAv7Rh4hwzZmf5jJbPJ6
	6fJw==
X-Gm-Message-State: AElRT7FHpB3turmoQoPJ28KMficQB/8yX4mKOBH+IihVyVmumN3fD7az
	HUTug36Sg2T1spqxSPuTGzOFWN8ICbVuEwwdcJQ=
X-Google-Smtp-Source: AG47ELtVrJAPjqRs8byaajNLGtE6i4f3XuLDf8javgyhLIBUWQN2LpVv4/upZ789eKBf3g0CxwmI35FCqajJ2vtEMxQ=
X-Received: by 10.98.28.202 with SMTP id c193mr1300521pfc.109.1520961181225;
	Tue, 13 Mar 2018 10:13:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.179.2 with HTTP; Tue, 13 Mar 2018 10:12:30 -0700 (PDT)
In-Reply-To: <1520960982-31022-1-git-send-email-juro.bystricky@intel.com>
References: <1520960982-31022-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Mar 2018 10:12:30 -0700
Message-ID: <CAMKF1sqpPYWs2PdcYfQsXeVS44qEjYY7afrV5rMSbtDPpccg8Q@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] gcc6: Patch to fix broken gcc-sanitizers build
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
X-List-Received-Date: Tue, 13 Mar 2018 17:13:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 13, 2018 at 10:09 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Backport a patch to fix errors such as:
> error: aggregate 'sigaltstack handler_stack' has incomplete type and cannot be defined
>

this is ok

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
>  .../gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch | 90 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
> index a2430a9..42eabef 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.4.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
> @@ -93,6 +93,7 @@ BACKPORTS = "\
>             file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch \
>             file://0011-i386-Update-mfunction-return-for-return-with-pop.patch \
>             file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
> +           file://0013-gcc-sanitizers.patch \
>  "
>
>  SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch
> new file mode 100644
> index 0000000..47bcd8e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0013-gcc-sanitizers.patch
> @@ -0,0 +1,90 @@
> +From 0fa7102d76376b27ae4bbc10848600aac6ed71d2 Mon Sep 17 00:00:00 2001
> +From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Mon, 17 Jul 2017 19:41:08 +0000
> +Subject: [PATCH]       Backported from mainline        2017-07-14  Jakub
> + Jelinek  <jakub@redhat.com>
> +
> +       PR sanitizer/81066
> +       * sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
> +       * sanitizer_common/sanitizer_linux.cc: Likewise.
> +       * sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
> +       * tsan/tsan_platform_linux.cc: Likewise.
> +
> +[Romain cherry-pick on gcc-6-branch from gcc-7-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@250287 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +---
> + libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
> + libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
> + libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
> + libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
> + 4 files changed, 4 insertions(+), 7 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +index 2cefa20..223d9c6 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
> +@@ -546,8 +546,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
> + }
> + #endif
> +
> +-uptr internal_sigaltstack(const struct sigaltstack *ss,
> +-                         struct sigaltstack *oss) {
> ++uptr internal_sigaltstack(const void *ss, void *oss) {
> +   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
> + }
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +index 4497702..1594058 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_linux.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
> +@@ -19,7 +19,6 @@
> + #include "sanitizer_platform_limits_posix.h"
> +
> + struct link_map;  // Opaque type returned by dlopen().
> +-struct sigaltstack;
> +
> + namespace __sanitizer {
> + // Dirent structure for getdents(). Note that this structure is different from
> +@@ -28,8 +27,7 @@ struct linux_dirent;
> +
> + // Syscall wrappers.
> + uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
> +-uptr internal_sigaltstack(const struct sigaltstack* ss,
> +-                          struct sigaltstack* oss);
> ++uptr internal_sigaltstack(const void* ss, void* oss);
> + uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
> +     __sanitizer_sigset_t *oldset);
> + void internal_sigfillset(__sanitizer_sigset_t *set);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +index c919e4f..014162af 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
> +@@ -267,7 +267,7 @@ static int TracerThread(void* argument) {
> +
> +   // Alternate stack for signal handling.
> +   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
> +-  struct sigaltstack handler_stack;
> ++  stack_t handler_stack;
> +   internal_memset(&handler_stack, 0, sizeof(handler_stack));
> +   handler_stack.ss_sp = handler_stack_memory.data();
> +   handler_stack.ss_size = kHandlerStackSize;
> +diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
> +index 09cec5f..908f4fe 100644
> +--- a/libsanitizer/tsan/tsan_platform_linux.cc
> ++++ b/libsanitizer/tsan/tsan_platform_linux.cc
> +@@ -291,7 +291,7 @@ bool IsGlobalVar(uptr addr) {
> + int ExtractResolvFDs(void *state, int *fds, int nfd) {
> + #if SANITIZER_LINUX
> +   int cnt = 0;
> +-  __res_state *statp = (__res_state*)state;
> ++  struct __res_state *statp = (struct __res_state*)state;
> +   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
> +     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
> +       fds[cnt++] = statp->_u._ext.nssocks[i];
> +--
> +2.9.4
> --
> 2.7.4
>


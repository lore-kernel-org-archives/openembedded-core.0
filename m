Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6A5E7601C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 00:56:23 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id g126-v6so2891495qke.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ng6aDvu++ZTFBO/NOt2/GpslKgXbCGFxQlVdWPNe+Ps=;
	b=YY93ewgB/5Pr2SzWsIvPU1JbXHIo8isiZqwFZJ9hu1c69guBej6noFkFA61e/G4DtF
	7oi3gPcH2c4bXsReIWUYJlEg9iE4ikQiZlSDEWsyDEE4/KnLZzuDvlM4ubsHAFH1AewV
	WnDILLTm4uAT1wqrSMnlMTx/lLJ9qzNkwXQJnpOvl8MTm5X7OXdivjQ/TtZVtgtGP2dd
	E5hnuS9mvR35GsRhyJXyNMrafWaCPZs54ac7HeS4EQgCGZcP02LgqEx5r95zJL//iWK6
	81YFdlrsqXLXmvI3z6NnhSCTrw2o64nLPqtXF3Qvsp+Ns1Yv6u2HRDgfultGY5jTniLk
	K1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ng6aDvu++ZTFBO/NOt2/GpslKgXbCGFxQlVdWPNe+Ps=;
	b=o4saRV65WUGbOe8t/FEX2AzUcIGspveF2aBQmnpRwUpDYGHVtoRopsCAzINGbUwbFu
	gMUy11ByFK08MccbL1iYJmAOykT57yUtK60A43fgKESr4SL2lVHHBioL+xQwHgAZL440
	DqDZ4z8j7IQSJXDKvQDtAeGsUk+jjDyNghow5atxGFt8uDRMKfficgDR/d4cem0zsWyU
	xeA3opLJoWb7dRdyRiEgPx95QbI08WLYY7qnjCMq5KVFuMCntJChA8jXJn6akXiMOFaZ
	O4jS9z8d0kMT+jJbXHi6C06rQkxORXJUrSui3TOTpaupmehxjrX7sSd/M3VzvW6wx9v4
	n+KQ==
X-Gm-Message-State: APt69E1M8ZhuJG9grwhkMSKDmOICgcpGps4CIxbcdluO0gDg5o18xOFr
	2hMehODh7kNf7dsQJWjZk6SWS6OjDOURIX6b9Ws=
X-Google-Smtp-Source: ADUXVKJYlIgJPZRsuWE51bYHxIWP0rrfPUc7rtkUNf0djkFyT4t70coDO4zRzUtF5SNdTo4IqZPA7MMmUcqeX5cys5s=
X-Received: by 2002:a37:bdc5:: with SMTP id
	n188-v6mr813893qkf.12.1528246584193; 
	Tue, 05 Jun 2018 17:56:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 17:55:53 -0700 (PDT)
In-Reply-To: <1528237393-24255-1-git-send-email-daniel.diaz@linaro.org>
References: <1528237393-24255-1-git-send-email-daniel.diaz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2018 17:55:53 -0700
Message-ID: <CAMKF1sqSMNA-w2vTLYCGaVERLp4nxjXY=xE=KB6cKA1qhH=ScA@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] ltp: bump to release 20180515
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
X-List-Received-Date: Wed, 06 Jun 2018 00:56:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this version looks good to me.

On Tue, Jun 5, 2018 at 3:23 PM, Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
> The following patches have made it to upstream:
> * 0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> * 0001-configure-add-knob-to-control-numa-support.patch
> * 0003-Add-knob-to-control-tirpc-support.patch
> * 0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
> * 0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
>
> These patches have been refreshed in order to apply cleanly
> and without any fuzz:
> * 0004-build-Add-option-to-select-libc-implementation.patch
> * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> * 0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> * 0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
> * 0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
>
> This next patch was added to the set of patches that make LTP
> build with musl:
> * 0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
> v2: Actually change SRCREV, refresh/remove patches as needed.
> v3: Patch diff with -M.
> v4: Add patch for fs/read_all and musl.
>
>  .../ltp/0001-Disable-rpc01-on-glibc-and-musl.patch | 29 --------
>  ...ix-default-value-of-without-numa-switch-i.patch | 31 ---------
>  ...onfigure-add-knob-to-control-numa-support.patch | 50 --------------
>  .../0003-Add-knob-to-control-tirpc-support.patch   | 46 -------------
>  ...-Add-option-to-select-libc-implementation.patch | 77 +++++++++++++---=
------
>  ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 26 ++++----
>  ...010-replace-__BEGIN_DECLS-and-__END_DECLS.patch | 75 ----------------=
-----
>  ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch | 27 ++++----
>  ...n.h-Use-sighandler_t-instead-of-__sighand.patch | 20 +++---
>  ...etwork-nfsv4-acl-acl1.c-Security-fix-on-s.patch |  2 +-
>  ...fine-FNM_EXTMATCH-if-not-already-like-und.patch | 44 +++++++++++++
>  ...-make-is_fuse-return-zero-if-fs_type-is-N.patch | 40 -----------
>  .../ltp/{ltp_20180118.bb =3D> ltp_20180515.bb}       |  9 +--
>  13 files changed, 132 insertions(+), 344 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-g=
libc-and-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-Fix-defa=
ult-value-of-without-numa-switch-i.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-add-knob=
-to-control-numa-support.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0003-Add-knob-to-contro=
l-tirpc-support.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DE=
CLS-and-__END_DECLS.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0040-read_all-Define-FN=
M_EXTMATCH-if-not-already-like-und.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0040-safe_macros-make-i=
s_fuse-return-zero-if-fs_type-is-N.patch
>  rename meta/recipes-extended/ltp/{ltp_20180118.bb =3D> ltp_20180515.bb} =
(91%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-an=
d-musl.patch b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-an=
d-musl.patch
> deleted file mode 100644
> index 78c6dfb..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.=
patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From ff39e6b69f0b26dad8ab685ee6116ff92bc363db Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 28 Apr 2018 00:08:55 -0700
> -Subject: [PATCH] Disable rpc01 on glibc and musl
> -
> -It is not buildable with libtirpc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - testcases/network/rpc/basic_tests/Makefile | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/netw=
ork/rpc/basic_tests/Makefile
> -index 66e9d5675..16a64e7da 100644
> ---- a/testcases/network/rpc/basic_tests/Makefile
> -+++ b/testcases/network/rpc/basic_tests/Makefile
> -@@ -23,4 +23,7 @@
> - top_srcdir            ?=3D ../../../..
> -
> - include $(top_srcdir)/include/mk/env_pre.mk
> -+
> -+FILTER_OUT_DIRS +=3D rpc01
> -+
> - include $(top_srcdir)/include/mk/generic_trunk_target.mk
> ---
> -2.17.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-val=
ue-of-without-numa-switch-i.patch b/meta/recipes-extended/ltp/ltp/0001-conf=
igure-Fix-default-value-of-without-numa-switch-i.patch
> deleted file mode 100644
> index da62687..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-w=
ithout-numa-switch-i.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 4ace68a6ba501907a0741dba5f5f155e06a74c35 Mon Sep 17 00:00:00 2001
> -From: Petr Vorel <pvorel@suse.cz>
> -Date: Wed, 7 Feb 2018 11:09:49 +0100
> -Subject: [PATCH] configure: Fix default value of --without-numa switch i=
n help
> -
> -The default value is no.
> -
> -Fixes: 39a85a1f1 ("configure: add knob to control numa support")
> -
> -Signed-off-by: Petr Vorel <pvorel@suse.cz>
> -Upstream-Status: Accepted
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b39a31d..d66ea00 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -86,7 +86,7 @@ fi
> - # Numa
> - AC_ARG_WITH([numa],
> -   AC_HELP_STRING([--without-numa],
> --    [without numa support (default=3Dyes)]),
> -+    [without numa support (default=3Dno)]),
> -   [with_numa=3Dno],
> -   [with_numa=3Dyes]
> - )
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-con=
trol-numa-support.patch b/meta/recipes-extended/ltp/ltp/0001-configure-add-=
knob-to-control-numa-support.patch
> deleted file mode 100644
> index 8aaa287..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-nu=
ma-support.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 39a85a1f1e6624f554215ba4b6843d3689a8415e Mon Sep 17 00:00:00 2001
> -From: Anders Roxell <anders.roxell@linaro.org>
> -Date: Mon, 5 Feb 2018 11:56:04 +0100
> -Subject: [PATCH] configure: add knob to control numa support
> -
> -Allow to disable numa from the top level.
> -
> -Based on patch:
> -http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-exten=
ded/ltp?id=3D4c7873552e13dfdba96afca7562c398d2966ca71
> -
> -Reported-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> -Signed-off-by: Petr Vorel <pvorel@suse.cz>
> -Upstream-Status: Accepted
> ----
> - configure.ac | 10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 5c8d4ea..b39a31d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -83,6 +83,14 @@ else
> -     AC_SUBST([WITH_EXPECT],["no"])
> - fi
> -
> -+# Numa
> -+AC_ARG_WITH([numa],
> -+  AC_HELP_STRING([--without-numa],
> -+    [without numa support (default=3Dyes)]),
> -+  [with_numa=3Dno],
> -+  [with_numa=3Dyes]
> -+)
> -+
> - # Perl
> - AC_ARG_WITH([perl],
> -   [AC_HELP_STRING([--with-perl],
> -@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX
> - LTP_CHECK_SIGNAL
> - LTP_CHECK_SYSCALL_EVENTFD
> - LTP_CHECK_SYSCALL_MODIFY_LDT
> -+if test "x$with_numa" =3D xyes; then
> - LTP_CHECK_SYSCALL_NUMA
> -+fi
> - LTP_CHECK_SYSCALL_QUOTACTL
> - LTP_CHECK_SYSCALL_SIGNALFD
> - LTP_CHECK_SYSCALL_UNSHARE
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc=
-support.patch b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tir=
pc-support.patch
> deleted file mode 100644
> index 5cf1e05..0000000
> --- a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-suppor=
t.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From b193011da301b3d944e8fddcf4817513c31c5b88 Mon Sep 17 00:00:00 2001
> -From: Fathi Boudra <fathi.boudra@linaro.org>
> -Date: Thu, 7 Jan 2016 17:36:19 +0000
> -Subject: [PATCH 03/32] Add knob to control tirpc support
> -
> -allow to disable tirpc. Helps to disable it at top level for eg. musl it
> -does not yet work.
> -
> -Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> ----
> - configure.ac | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index cc50397..9e2936b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -98,6 +98,13 @@ if test "x$with_python" =3D xyes; then
> - else
> -     AC_SUBST([WITH_PYTHON],["no"])
> - fi
> -+
> -+# TI RPC
> -+AC_ARG_WITH([tirpc],
> -+  AC_HELP_STRING([--without-tirpc],
> -+    [without libtirpc support]),
> -+  [],[with_tirpc=3Dyes],
> -+)
> - # END tools knobs
> -
> - # Testsuites knobs
> -@@ -169,7 +176,9 @@ LTP_CHECK_RENAMEAT2
> - LTP_CHECK_FALLOCATE
> - LTP_CHECK_SYSCALL_FCNTL
> - LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
> -+if test "x$with_tirpc" =3D xyes; then
> - LTP_CHECK_TIRPC
> -+fi
> - LTP_CHECK_TEE
> - LTP_CHECK_SPLICE
> - LTP_CHECK_VMSPLICE
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-selec=
t-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-=
option-to-select-libc-implementation.patch
> index 0781ba1..2df3855 100644
> --- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-=
implementation.patch
> +++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-=
implementation.patch
> @@ -22,10 +22,10 @@ Upstream-Status: Pending
>   testcases/realtime/stress/pi-tests/Makefile | 5 +++++
>   8 files changed, 35 insertions(+), 2 deletions(-)
>
> -Index: git/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/Makefile
> -+++ git/Makefile
> +diff --git a/Makefile b/Makefile
> +index 297f8e7..906b280 100644
> +--- a/Makefile
> ++++ b/Makefile
>  @@ -49,6 +49,11 @@ SKIP_IDCHECK                ?=3D 0
>   UCLINUX                       ?=3D 0
>   export UCLINUX
> @@ -38,10 +38,10 @@ Index: git/Makefile
>   # CLEAN_TARGETS:      Targets which exist solely in clean.
>   # COMMON_TARGETS:     Targets which exist in all, clean, and install.
>   # INSTALL_TARGETS:    Targets which exist in clean and install (contain=
s
> -Index: git/testcases/kernel/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/Makefile
> -+++ git/testcases/kernel/Makefile
> +diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> +index 50a12fa..4f1987f 100644
> +--- a/testcases/kernel/Makefile
> ++++ b/testcases/kernel/Makefile
>  @@ -48,13 +48,16 @@ SUBDIRS                    +=3D connectors \
>                            logging \
>                            mem \
> @@ -60,10 +60,10 @@ Index: git/testcases/kernel/Makefile
>   ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
>   SUBDIRS                       +=3D power_management
>   endif
> -Index: git/testcases/kernel/sched/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/sched/Makefile
> -+++ git/testcases/kernel/sched/Makefile
> +diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Ma=
kefile
> +index 6245ed0..aa4eb7f 100644
> +--- a/testcases/kernel/sched/Makefile
> ++++ b/testcases/kernel/sched/Makefile
>  @@ -23,5 +23,7 @@
>   top_srcdir            ?=3D ../../..
>
> @@ -73,10 +73,10 @@ Index: git/testcases/kernel/sched/Makefile
>  +      FILTER_OUT_DIRS +=3D process_stress
>  +endif
>   include $(top_srcdir)/include/mk/generic_trunk_target.mk
> -Index: git/testcases/kernel/syscalls/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/syscalls/Makefile
> -+++ git/testcases/kernel/syscalls/Makefile
> +diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/sysca=
lls/Makefile
> +index 8acb395..b749126 100644
> +--- a/testcases/kernel/syscalls/Makefile
> ++++ b/testcases/kernel/syscalls/Makefile
>  @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
>   FILTER_OUT_DIRS       +=3D capget capset chmod chown clone fork getcont=
ext llseek \
>                    mincore mprotect nftw profil remap_file_pages sbrk
> @@ -89,11 +89,11 @@ Index: git/testcases/kernel/syscalls/Makefile
>
>   ifeq ($(UCLIBC),1)
>   FILTER_OUT_DIRS       +=3D profil
> -Index: git/testcases/network/nfsv4/acl/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/network/nfsv4/acl/Makefile
> -+++ git/testcases/network/nfsv4/acl/Makefile
> -@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre
> +diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nf=
sv4/acl/Makefile
> +index 8bc78c2..c36cf50 100644
> +--- a/testcases/network/nfsv4/acl/Makefile
> ++++ b/testcases/network/nfsv4/acl/Makefile
> +@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
>
>   LDLIBS                        +=3D $(ACL_LIBS)
>
> @@ -102,11 +102,25 @@ Index: git/testcases/network/nfsv4/acl/Makefile
>  +endif
>  +
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -Index: git/testcases/realtime/func/pi-tests/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/realtime/func/pi-tests/Makefile
> -+++ git/testcases/realtime/func/pi-tests/Makefile
> -@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre
> +diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/netw=
ork/rpc/basic_tests/Makefile
> +index 3160813..9bdf5d0 100644
> +--- a/testcases/network/rpc/basic_tests/Makefile
> ++++ b/testcases/network/rpc/basic_tests/Makefile
> +@@ -23,4 +23,9 @@
> + top_srcdir            ?=3D ../../../..
> +
> + include $(top_srcdir)/include/mk/env_pre.mk
> ++
> ++ifeq ($(LIBC),musl)
> ++FILTER_OUT_DIRS +=3D rpc01
> ++endif
> ++
> + include $(top_srcdir)/include/mk/generic_trunk_target.mk
> +diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realt=
ime/func/pi-tests/Makefile
> +index 7a7a57a..5808866 100644
> +--- a/testcases/realtime/func/pi-tests/Makefile
> ++++ b/testcases/realtime/func/pi-tests/Makefile
> +@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
>   include $(abs_srcdir)/../../config.mk
>
>   MAKE_TARGETS          :=3D testpi-0 testpi-1 testpi-2 testpi-4 testpi-5=
 testpi-6 testpi-7 sbrk_mutex
> @@ -116,10 +130,10 @@ Index: git/testcases/realtime/func/pi-tests/Makefil=
e
>  +
>
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -Index: git/testcases/realtime/stress/pi-tests/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/realtime/stress/pi-tests/Makefile
> -+++ git/testcases/realtime/stress/pi-tests/Makefile
> +diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/rea=
ltime/stress/pi-tests/Makefile
> +index 5edc3b4..aa5987a 100644
> +--- a/testcases/realtime/stress/pi-tests/Makefile
> ++++ b/testcases/realtime/stress/pi-tests/Makefile
>  @@ -24,4 +24,9 @@ top_srcdir           ?=3D ../../../..
>
>   include $(top_srcdir)/include/mk/env_pre.mk
> @@ -130,3 +144,6 @@ Index: git/testcases/realtime/stress/pi-tests/Makefil=
e
>  +endif
>  +
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +--
> +2.7.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-i=
s-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-=
if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> index e325ce4..428ac30 100644
> --- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defin=
ed-before-using-it.patch
> +++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defin=
ed-before-using-it.patch
> @@ -11,9 +11,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Pending
>  ---
>   testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++-
> - testcases/kernel/syscalls/getcpu/getcpu01.c        | 40 +++++++++++++++=
++++++-
> - .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++
> - 3 files changed, 73 insertions(+), 2 deletions(-)
> + testcases/kernel/syscalls/getcpu/getcpu01.c        | 39 +++++++++++++++=
++++++-
> + .../sched_getaffinity/sched_getaffinity01.c        | 26 +++++++++++++++
> + 3 files changed, 72 insertions(+), 2 deletions(-)
>
>  diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/=
kernel/syscalls/accept4/accept4_01.c
>  index 6072bfa..2b090cb 100644
> @@ -102,7 +102,7 @@ index c927512..921b107 100644
>         *cpu_id =3D sched_getcpu();
>   #endif
>         return 0;
> -@@ -191,15 +204,20 @@ unsigned int set_cpu_affinity(void)
> +@@ -191,15 +203,20 @@ unsigned int set_cpu_affinity(void)
>         cpu_set_t *set;
>         size_t size;
>         int nrcpus =3D 1024;
> @@ -123,7 +123,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>         size =3D CPU_ALLOC_SIZE(nrcpus);
>         CPU_ZERO_S(size, set);
> -@@ -207,8 +225,13 @@ realloc:
> +@@ -207,8 +224,13 @@ realloc:
>         size =3D sizeof(cpu_set_t);
>         CPU_ZERO(set);
>   #endif
> @@ -137,7 +137,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>                 if (errno =3D=3D EINVAL && nrcpus < (1024 << 8)) {
>                         nrcpus =3D nrcpus << 2;
> -@@ -220,10 +243,17 @@ realloc:
> +@@ -220,10 +242,17 @@ realloc:
>                                  "NR_CPUS of the kernel is more than 1024=
, so we'd better use a newer glibc(>=3D 2.7)");
>                 else
>   #endif
> @@ -155,7 +155,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>         CPU_ZERO_S(size, set);
>         CPU_SET_S(cpu_max, size, set);
> -@@ -231,6 +261,10 @@ realloc:
> +@@ -231,6 +260,10 @@ realloc:
>         CPU_ZERO(set);
>         CPU_SET(cpu_max, set);
>   #endif
> @@ -166,7 +166,7 @@ index c927512..921b107 100644
>         if (sched_setaffinity(0, size, set) < 0) {
>                 CPU_FREE(set);
>                 tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno=
);
> -@@ -247,11 +281,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * se=
t)
> +@@ -247,11 +280,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * se=
t)
>   {
>         unsigned int index, max =3D 0;
>         for (index =3D 0; index < size * BITS_PER_BYTE; index++)
> @@ -186,7 +186,7 @@ diff --git a/testcases/kernel/syscalls/sched_getaffin=
ity/sched_getaffinity01.c b
>  index 9d6a81a..4ed13b2 100644
>  --- a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
>  +++ b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
> -@@ -66,9 +66,11 @@ do { \
> +@@ -67,9 +67,11 @@ do { \
>         tst_resm((TEST_RETURN =3D=3D -1 ? TPASS : TFAIL) | TTERRNO, #t); =
\
>   } while (0)
>
> @@ -198,7 +198,7 @@ index 9d6a81a..4ed13b2 100644
>
>   int main(int ac, char **av)
>   {
> -@@ -95,14 +97,19 @@ static void do_test(void)
> +@@ -96,14 +98,19 @@ static void do_test(void)
>         pid_t unused_pid;
>         unsigned len;
>
> @@ -218,7 +218,7 @@ index 9d6a81a..4ed13b2 100644
>   #if __GLIBC_PREREQ(2, 7)
>         len =3D CPU_ALLOC_SIZE(nrcpus);
>         CPU_ZERO_S(len, mask);
> -@@ -110,10 +117,15 @@ realloc:
> +@@ -111,10 +118,15 @@ realloc:
>         len =3D sizeof(cpu_set_t);
>         CPU_ZERO(mask);
>   #endif
> @@ -234,7 +234,7 @@ index 9d6a81a..4ed13b2 100644
>   #if __GLIBC_PREREQ(2, 7)
>                 if (errno =3D=3D EINVAL && nrcpus < (1024 << 8)) {
>                         nrcpus =3D nrcpus << 2;
> -@@ -125,17 +137,27 @@ realloc:
> +@@ -126,17 +138,27 @@ realloc:
>                                  "newer glibc(>=3D 2.7)");
>                 else
>   #endif
> @@ -262,7 +262,7 @@ index 9d6a81a..4ed13b2 100644
>                         if (TEST_RETURN !=3D -1)
>                                 tst_resm(TPASS, "sched_getaffinity() succ=
eed, "
>                                          "this process %d is running "
> -@@ -143,11 +165,15 @@ realloc:
> +@@ -144,11 +166,15 @@ realloc:
>                 }
>         }
>
> diff --git a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and=
-__END_DECLS.patch b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DEC=
LS-and-__END_DECLS.patch
> deleted file mode 100644
> index b9fce88..0000000
> --- a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_=
DECLS.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 0130f4146ced320aadb01b22e36b13d269a8ebba Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:48:14 +0000
> -Subject: [PATCH 10/32] replace __BEGIN_DECLS and __END_DECLS
> -
> -They are not portable across libc implementations
> -therefore replace them with expanded macros
> -
> -Include <asm-generic/types.h> to get __s32 definitions
> -its not a generally available typedef
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - testcases/kernel/syscalls/epoll2/include/epoll.h | 8 ++++++--
> - utils/sctp/include/netinet/sctp.h                | 9 +++++++--
> - 2 files changed, 13 insertions(+), 4 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/epoll2/include/epoll.h b/testcase=
s/kernel/syscalls/epoll2/include/epoll.h
> -index be599c7..8cc5e7e 100644
> ---- a/testcases/kernel/syscalls/epoll2/include/epoll.h
> -+++ b/testcases/kernel/syscalls/epoll2/include/epoll.h
> -@@ -85,7 +85,9 @@ struct epoll_event
> - } EPOLL_PACKED;
> -
> -
> --__BEGIN_DECLS
> -+#ifdef __cplusplus
> -+extern "C" {
> -+#endif
> -
> - /* Creates an epoll instance.  Returns an fd for the new instance.
> -    The "size" parameter is a hint specifying the number of file
> -@@ -114,6 +116,8 @@ extern int epoll_ctl (int __epfd, int __op, int __fd=
,
> - extern int epoll_wait (int __epfd, struct epoll_event *__events,
> -                      int __maxevents, int __timeout) __THROW;
> -
> --__END_DECLS
> -+#ifdef __cplusplus
> -+}
> -+#endif
> -
> - #endif /* sys/epoll.h */
> -diff --git a/utils/sctp/include/netinet/sctp.h b/utils/sctp/include/neti=
net/sctp.h
> -index 51f5bfb..c61aef3 100644
> ---- a/utils/sctp/include/netinet/sctp.h
> -+++ b/utils/sctp/include/netinet/sctp.h
> -@@ -35,9 +35,12 @@
> -
> - #include <stdint.h>
> - #include <linux/types.h>
> -+#include <asm-generic/types.h>
> - #include <sys/socket.h>
> -
> --__BEGIN_DECLS
> -+#ifdef __cplusplus
> -+extern "C" {
> -+#endif
> -
> - typedef __s32 sctp_assoc_t;
> -
> -@@ -862,6 +865,8 @@ int sctp_recvmsg(int s, void *msg, size_t len, struc=
t sockaddr *from,
> - /* Return the address length for an address family. */
> - int sctp_getaddrlen(sa_family_t family);
> -
> --__END_DECLS
> -+#ifdef __cplusplus
> -+}
> -+#endif
> -
> - #endif /* __linux_sctp_h__ */
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MR=
EMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_=
GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> index 462976d..6c5f360 100644
> --- a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MA=
YMOVE-definition.patch
> +++ b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MA=
YMOVE-definition.patch
> @@ -18,10 +18,10 @@ Upstream-Status: Pending
>   testcases/kernel/syscalls/mremap/mremap03.c | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
>
> -Index: git/testcases/kernel/syscalls/mremap/mremap01.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap01.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap01.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap01.c b/testcases/ker=
nel/syscalls/mremap/mremap01.c
> +index d63d1e4..24ca174 100644
> +--- a/testcases/kernel/syscalls/mremap/mremap01.c
> ++++ b/testcases/kernel/syscalls/mremap/mremap01.c
>  @@ -76,10 +76,12 @@
>    */
>   #include <unistd.h>
> @@ -36,10 +36,10 @@ Index: git/testcases/kernel/syscalls/mremap/mremap01.=
c
>
>   #include "test.h"
>   #include "safe_macros.h"
> -Index: git/testcases/kernel/syscalls/mremap/mremap02.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap02.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap02.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap02.c b/testcases/ker=
nel/syscalls/mremap/mremap02.c
> +index 5a51b9a..a530a6b 100644
> +--- a/testcases/kernel/syscalls/mremap/mremap02.c
> ++++ b/testcases/kernel/syscalls/mremap/mremap02.c
>  @@ -75,9 +75,11 @@
>   #include <errno.h>
>   #include <unistd.h>
> @@ -52,10 +52,10 @@ Index: git/testcases/kernel/syscalls/mremap/mremap02.=
c
>
>   #include "test.h"
>
> -Index: git/testcases/kernel/syscalls/mremap/mremap03.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap03.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap03.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap03.c b/testcases/ker=
nel/syscalls/mremap/mremap03.c
> +index 12e3829..9b39f8b 100644
> +--- a/testcases/kernel/syscalls/mremap/mremap03.c
> ++++ b/testcases/kernel/syscalls/mremap/mremap03.c
>  @@ -76,9 +76,11 @@
>   #include <errno.h>
>   #include <unistd.h>
> @@ -68,3 +68,6 @@ Index: git/testcases/kernel/syscalls/mremap/mremap03.c
>
>   #include "test.h"
>
> +--
> +2.7.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighan=
dler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_s=
igaction.h-Use-sighandler_t-instead-of-__sighand.patch
> index c730d46..40ee894 100644
> --- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-=
instead-of-__sighand.patch
> +++ b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-=
instead-of-__sighand.patch
> @@ -11,14 +11,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  Upstream-Status: Pending
>  ---
> - include/lapi/rt_sigaction.h                      | 2 +-
> + include/lapi/rt_sigaction.h                      | 4 ++--
>   testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> + 2 files changed, 5 insertions(+), 2 deletions(-)
>
> -Index: git/include/lapi/rt_sigaction.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/include/lapi/rt_sigaction.h
> -+++ git/include/lapi/rt_sigaction.h
> +diff --git a/include/lapi/rt_sigaction.h b/include/lapi/rt_sigaction.h
> +index 18236db..15facda 100644
> +--- a/include/lapi/rt_sigaction.h
> ++++ b/include/lapi/rt_sigaction.h
>  @@ -36,12 +36,12 @@
>   #if defined(__mips__)
>   struct kernel_sigaction {
> @@ -34,10 +34,10 @@ Index: git/include/lapi/rt_sigaction.h
>         unsigned long sa_flags;
>         void (*sa_restorer) (void);
>         sigset_t sa_mask;
> -Index: git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> -+++ git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> +diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcase=
s/kernel/syscalls/rt_sigsuspend/Makefile
> +index 37bc3a9..2ca7f7c 100644
> +--- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> ++++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
>  @@ -19,4 +19,7 @@
>   top_srcdir            ?=3D ../../../..
>
> diff --git a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-a=
cl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0036-test=
cases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> index 04532be..e826d48 100644
> --- a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1=
.c-Security-fix-on-s.patch
> +++ b/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1=
.c-Security-fix-on-s.patch
> @@ -27,7 +27,7 @@ diff --git a/testcases/network/nfsv4/acl/acl1.c b/testc=
ases/network/nfsv4/acl/ac
>  index b8b67b4..7c7c506 100644
>  --- a/testcases/network/nfsv4/acl/acl1.c
>  +++ b/testcases/network/nfsv4/acl/acl1.c
> -@@ -314,7 +314,7 @@ void test_acl_default(char *dir, acl_t acl)
> +@@ -303,7 +303,7 @@ void test_acl_default(char *dir, acl_t acl)
>         char *cmd =3D malloc(256);
>
>         strcpy(cmd, "chmod 7777 ");
> diff --git a/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMA=
TCH-if-not-already-like-und.patch b/meta/recipes-extended/ltp/ltp/0040-read=
_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> new file mode 100644
> index 0000000..0245a89
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-=
not-already-like-und.patch
> @@ -0,0 +1,44 @@
> +From 23518508de307790231d16af307291f1b45e903a Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20D=3DC3=3DADaz?=3D <daniel.diaz@linaro.org>
> +Date: Tue, 5 Jun 2018 15:36:30 -0500
> +Subject: [PATCH] read_all: Define FNM_EXTMATCH if not already (like unde=
r
> + musl).
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +With musl, FNM_EXTMATCH is not defined:
> +| read_all.c: In function 'read_test':
> +| read_all.c:201:41: error: 'FNM_EXTMATCH' undeclared (first use in this=
 function); did you mean 'FNM_NOMATCH'?
> +|   if (exclude && !fnmatch(exclude, path, FNM_EXTMATCH)) {
> +|                                          ^~~~~~~~~~~~
> +|                                          FNM_NOMATCH
> +| read_all.c:201:41: note: each undeclared identifier is reported only o=
nce for each function it appears in
> +| <builtin>: recipe for target 'read_all' failed
> +| make[4]: *** [read_all] Error 1
> +
> +Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> +
> +Upstream-Status: Pending
> +---
> + testcases/kernel/fs/read_all/read_all.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/=
fs/read_all/read_all.c
> +index a8e1611..e9ff47a 100644
> +--- a/testcases/kernel/fs/read_all/read_all.c
> ++++ b/testcases/kernel/fs/read_all/read_all.c
> +@@ -59,6 +59,10 @@
> + #define MAX_PATH 4096
> + #define MAX_DISPLAY 40
> +
> ++#if !defined(FNM_EXTMATCH)
> ++#define FNM_EXTMATCH 0
> ++#endif
> ++
> + struct queue {
> +       sem_t sem;
> +       int front;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-=
return-zero-if-fs_type-is-N.patch b/meta/recipes-extended/ltp/ltp/0040-safe=
_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> deleted file mode 100644
> index 5096a85..0000000
> --- a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-=
zero-if-fs_type-is-N.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d Mon Sep 17 00:00:00 2001
> -From: Li Wang <liwang@redhat.com>
> -Date: Tue, 23 Jan 2018 17:46:35 +0800
> -Subject: [PATCH] safe_macros: make is_fuse() return zero if fs_type is N=
ULL
> -
> -This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE =
fs)
> -involves FUSE fs check in safe_mount(), but we'd better guarantee the "f=
s_type"
> -is legal to check in is_fuse() function otherwise system will kill the p=
rogram.
> -
> -  cmdline=3D"fanotify06"
> -  contacts=3D""
> -  analysis=3Dexit
> -  <<<test_output>>>
> -  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
> -  tst_test.c:1025: BROK: Test killed by SIGSEGV!
> -
> -Signed-off-by: Li Wang <liwang@redhat.com>
> -Acked-by: Jan Stancek <jstancek@redhat.com>
> -Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/com=
mit/67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d]
> ----
> - lib/safe_macros.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> -index c48e436dc..abdeca013 100644
> ---- a/lib/safe_macros.c
> -+++ b/lib/safe_macros.c
> -@@ -708,6 +708,9 @@ static int is_fuse(const char *fs_type)
> - {
> -       unsigned int i;
> -
> -+      if (!fs_type)
> -+              return 0;
> -+
> -       for (i =3D 0; i < ARRAY_SIZE(fuse_fs_types); i++) {
> -               if (!strcmp(fuse_fs_types[i], fs_type))
> -                       return 1;
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-ext=
ended/ltp/ltp_20180515.bb
> similarity index 91%
> rename from meta/recipes-extended/ltp/ltp_20180118.bb
> rename to meta/recipes-extended/ltp/ltp_20180515.bb
> index b3e2f53..b07c1b9 100644
> --- a/meta/recipes-extended/ltp/ltp_20180118.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -21,18 +21,14 @@ DEPENDS_append_libc-musl =3D " fts "
>  EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "731cd34e682d297b207668be8b1d15320a9ac1b1"
> +SRCREV =3D "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
>
>  SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
> -           file://0001-configure-add-knob-to-control-numa-support.patch =
\
> -           file://0001-configure-Fix-default-value-of-without-numa-switc=
h-i.patch \
> -           file://0003-Add-knob-to-control-tirpc-support.patch \
>             file://0004-build-Add-option-to-select-libc-implementation.pa=
tch \
>             file://0005-kernel-controllers-Link-with-libfts-explicitly-on=
-mu.patch \
>             file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl=
.patch \
>             file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-i=
t.patch \
>             file://0009-fix-redefinition-of-struct-msgbuf-error-building-=
wit.patch \
> -           file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
>             file://0018-guard-mallocopt-with-__GLIBC__.patch \
>             file://0020-getdents-define-getdents-getdents64-only-for-glib=
c.patch \
>             file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.=
patch \
> @@ -44,8 +40,7 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.gi=
t \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-o=
n-s.patch \
>             file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.=
patch \
> -           file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-i=
s-N.patch \
> -           file://0001-Disable-rpc01-on-glibc-and-musl.patch \
> +           file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-=
und.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.7.4
>


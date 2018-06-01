Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E667F74FE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7041020BE8;
	Fri,  1 Jun 2018 20:27:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AnlsbvC0CGpg; Fri,  1 Jun 2018 20:27:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25070206F3;
	Fri,  1 Jun 2018 20:27:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 93A80163484; Fri,  1 Jun 2018 16:27:50 -0400 (EDT)
Date: Fri, 1 Jun 2018 16:27:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Message-ID: <20180601202750.GW19965@denix.org>
References: <1527826211-30954-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1527826211-30954-1-git-send-email-daniel.diaz@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] ltp: bump to release 20180515
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
X-List-Received-Date: Fri, 01 Jun 2018 20:27:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 31, 2018 at 11:10:11PM -0500, Daniel Díaz wrote:
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
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> ---
> v2: Actually change SRCREV, refresh/remove patches as needed.
> 
>  .../ltp/0001-Disable-rpc01-on-glibc-and-musl.patch |  29 -----
>  ...ix-default-value-of-without-numa-switch-i.patch |  31 ------
>  ...onfigure-add-knob-to-control-numa-support.patch |  50 ---------
>  .../0003-Add-knob-to-control-tirpc-support.patch   |  46 --------
>  ...-Add-option-to-select-libc-implementation.patch |  77 ++++++++------
>  ...__GLIBC_PREREQ-is-defined-before-using-it.patch |  26 ++---
>  ...010-replace-__BEGIN_DECLS-and-__END_DECLS.patch |  75 -------------
>  ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch |  27 ++---
>  ...n.h-Use-sighandler_t-instead-of-__sighand.patch |  20 ++--
>  ...etwork-nfsv4-acl-acl1.c-Security-fix-on-s.patch |   2 +-
>  ...-make-is_fuse-return-zero-if-fs_type-is-N.patch |  40 -------
>  meta/recipes-extended/ltp/ltp_20180118.bb          | 117 ---------------------
>  meta/recipes-extended/ltp/ltp_20180515.bb          | 111 +++++++++++++++++++

Can the recipe update itself be a diff as well, git --find-renames?


>  13 files changed, 197 insertions(+), 454 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp_20180118.bb
>  create mode 100644 meta/recipes-extended/ltp/ltp_20180515.bb
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
> deleted file mode 100644
> index 78c6dfb..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
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
> -diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
> -index 66e9d5675..16a64e7da 100644
> ---- a/testcases/network/rpc/basic_tests/Makefile
> -+++ b/testcases/network/rpc/basic_tests/Makefile
> -@@ -23,4 +23,7 @@
> - top_srcdir		?= ../../../..
> - 
> - include $(top_srcdir)/include/mk/env_pre.mk
> -+
> -+FILTER_OUT_DIRS += rpc01
> -+
> - include $(top_srcdir)/include/mk/generic_trunk_target.mk
> --- 
> -2.17.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> deleted file mode 100644
> index da62687..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 4ace68a6ba501907a0741dba5f5f155e06a74c35 Mon Sep 17 00:00:00 2001
> -From: Petr Vorel <pvorel@suse.cz>
> -Date: Wed, 7 Feb 2018 11:09:49 +0100
> -Subject: [PATCH] configure: Fix default value of --without-numa switch in help
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
> --    [without numa support (default=yes)]),
> -+    [without numa support (default=no)]),
> -   [with_numa=no],
> -   [with_numa=yes]
> - )
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
> deleted file mode 100644
> index 8aaa287..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
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
> -http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71
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
> -+    [without numa support (default=yes)]),
> -+  [with_numa=no],
> -+  [with_numa=yes]
> -+)
> -+
> - # Perl
> - AC_ARG_WITH([perl],
> -   [AC_HELP_STRING([--with-perl],
> -@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX
> - LTP_CHECK_SIGNAL
> - LTP_CHECK_SYSCALL_EVENTFD
> - LTP_CHECK_SYSCALL_MODIFY_LDT
> -+if test "x$with_numa" = xyes; then
> - LTP_CHECK_SYSCALL_NUMA
> -+fi
> - LTP_CHECK_SYSCALL_QUOTACTL
> - LTP_CHECK_SYSCALL_SIGNALFD
> - LTP_CHECK_SYSCALL_UNSHARE
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
> deleted file mode 100644
> index 5cf1e05..0000000
> --- a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
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
> -@@ -98,6 +98,13 @@ if test "x$with_python" = xyes; then
> - else
> -     AC_SUBST([WITH_PYTHON],["no"])
> - fi
> -+
> -+# TI RPC
> -+AC_ARG_WITH([tirpc],
> -+  AC_HELP_STRING([--without-tirpc],
> -+    [without libtirpc support]),
> -+  [],[with_tirpc=yes],
> -+)
> - # END tools knobs
> - 
> - # Testsuites knobs
> -@@ -169,7 +176,9 @@ LTP_CHECK_RENAMEAT2
> - LTP_CHECK_FALLOCATE
> - LTP_CHECK_SYSCALL_FCNTL
> - LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
> -+if test "x$with_tirpc" = xyes; then
> - LTP_CHECK_TIRPC
> -+fi
> - LTP_CHECK_TEE
> - LTP_CHECK_SPLICE
> - LTP_CHECK_VMSPLICE
> --- 
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
> index 0781ba1..2df3855 100644
> --- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
> +++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
> @@ -22,10 +22,10 @@ Upstream-Status: Pending
>   testcases/realtime/stress/pi-tests/Makefile | 5 +++++
>   8 files changed, 35 insertions(+), 2 deletions(-)
>  
> -Index: git/Makefile
> -===================================================================
> ---- git.orig/Makefile
> -+++ git/Makefile
> +diff --git a/Makefile b/Makefile
> +index 297f8e7..906b280 100644
> +--- a/Makefile
> ++++ b/Makefile
>  @@ -49,6 +49,11 @@ SKIP_IDCHECK		?= 0
>   UCLINUX			?= 0
>   export UCLINUX
> @@ -38,10 +38,10 @@ Index: git/Makefile
>   # CLEAN_TARGETS:	Targets which exist solely in clean.
>   # COMMON_TARGETS:	Targets which exist in all, clean, and install.
>   # INSTALL_TARGETS:	Targets which exist in clean and install (contains
> -Index: git/testcases/kernel/Makefile
> -===================================================================
> ---- git.orig/testcases/kernel/Makefile
> -+++ git/testcases/kernel/Makefile
> +diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> +index 50a12fa..4f1987f 100644
> +--- a/testcases/kernel/Makefile
> ++++ b/testcases/kernel/Makefile
>  @@ -48,13 +48,16 @@ SUBDIRS			+= connectors \
>   			   logging \
>   			   mem \
> @@ -60,10 +60,10 @@ Index: git/testcases/kernel/Makefile
>   ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
>   SUBDIRS			+= power_management
>   endif
> -Index: git/testcases/kernel/sched/Makefile
> -===================================================================
> ---- git.orig/testcases/kernel/sched/Makefile
> -+++ git/testcases/kernel/sched/Makefile
> +diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
> +index 6245ed0..aa4eb7f 100644
> +--- a/testcases/kernel/sched/Makefile
> ++++ b/testcases/kernel/sched/Makefile
>  @@ -23,5 +23,7 @@
>   top_srcdir		?= ../../..
>   
> @@ -73,10 +73,10 @@ Index: git/testcases/kernel/sched/Makefile
>  +	FILTER_OUT_DIRS += process_stress
>  +endif
>   include $(top_srcdir)/include/mk/generic_trunk_target.mk
> -Index: git/testcases/kernel/syscalls/Makefile
> -===================================================================
> ---- git.orig/testcases/kernel/syscalls/Makefile
> -+++ git/testcases/kernel/syscalls/Makefile
> +diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
> +index 8acb395..b749126 100644
> +--- a/testcases/kernel/syscalls/Makefile
> ++++ b/testcases/kernel/syscalls/Makefile
>  @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
>   FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
>   		   mincore mprotect nftw profil remap_file_pages sbrk
> @@ -89,11 +89,11 @@ Index: git/testcases/kernel/syscalls/Makefile
>   
>   ifeq ($(UCLIBC),1)
>   FILTER_OUT_DIRS	+= profil
> -Index: git/testcases/network/nfsv4/acl/Makefile
> -===================================================================
> ---- git.orig/testcases/network/nfsv4/acl/Makefile
> -+++ git/testcases/network/nfsv4/acl/Makefile
> -@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre
> +diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
> +index 8bc78c2..c36cf50 100644
> +--- a/testcases/network/nfsv4/acl/Makefile
> ++++ b/testcases/network/nfsv4/acl/Makefile
> +@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
>   
>   LDLIBS			+= $(ACL_LIBS)
>   
> @@ -102,11 +102,25 @@ Index: git/testcases/network/nfsv4/acl/Makefile
>  +endif
>  +
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -Index: git/testcases/realtime/func/pi-tests/Makefile
> -===================================================================
> ---- git.orig/testcases/realtime/func/pi-tests/Makefile
> -+++ git/testcases/realtime/func/pi-tests/Makefile
> -@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre
> +diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
> +index 3160813..9bdf5d0 100644
> +--- a/testcases/network/rpc/basic_tests/Makefile
> ++++ b/testcases/network/rpc/basic_tests/Makefile
> +@@ -23,4 +23,9 @@
> + top_srcdir		?= ../../../..
> + 
> + include $(top_srcdir)/include/mk/env_pre.mk
> ++
> ++ifeq ($(LIBC),musl)
> ++FILTER_OUT_DIRS += rpc01
> ++endif
> ++
> + include $(top_srcdir)/include/mk/generic_trunk_target.mk
> +diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
> +index 7a7a57a..5808866 100644
> +--- a/testcases/realtime/func/pi-tests/Makefile
> ++++ b/testcases/realtime/func/pi-tests/Makefile
> +@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
>   include $(abs_srcdir)/../../config.mk
>   
>   MAKE_TARGETS		:= testpi-0 testpi-1 testpi-2 testpi-4 testpi-5 testpi-6 testpi-7 sbrk_mutex
> @@ -116,10 +130,10 @@ Index: git/testcases/realtime/func/pi-tests/Makefile
>  +
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -Index: git/testcases/realtime/stress/pi-tests/Makefile
> -===================================================================
> ---- git.orig/testcases/realtime/stress/pi-tests/Makefile
> -+++ git/testcases/realtime/stress/pi-tests/Makefile
> +diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
> +index 5edc3b4..aa5987a 100644
> +--- a/testcases/realtime/stress/pi-tests/Makefile
> ++++ b/testcases/realtime/stress/pi-tests/Makefile
>  @@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
>   
>   include $(top_srcdir)/include/mk/env_pre.mk
> @@ -130,3 +144,6 @@ Index: git/testcases/realtime/stress/pi-tests/Makefile
>  +endif
>  +
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +-- 
> +2.7.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> index e325ce4..428ac30 100644
> --- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> +++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> @@ -11,9 +11,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Pending
>  ---
>   testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++-
> - testcases/kernel/syscalls/getcpu/getcpu01.c        | 40 +++++++++++++++++++++-
> - .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++
> - 3 files changed, 73 insertions(+), 2 deletions(-)
> + testcases/kernel/syscalls/getcpu/getcpu01.c        | 39 +++++++++++++++++++++-
> + .../sched_getaffinity/sched_getaffinity01.c        | 26 +++++++++++++++
> + 3 files changed, 72 insertions(+), 2 deletions(-)
>  
>  diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
>  index 6072bfa..2b090cb 100644
> @@ -102,7 +102,7 @@ index c927512..921b107 100644
>   	*cpu_id = sched_getcpu();
>   #endif
>   	return 0;
> -@@ -191,15 +204,20 @@ unsigned int set_cpu_affinity(void)
> +@@ -191,15 +203,20 @@ unsigned int set_cpu_affinity(void)
>   	cpu_set_t *set;
>   	size_t size;
>   	int nrcpus = 1024;
> @@ -123,7 +123,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>   	size = CPU_ALLOC_SIZE(nrcpus);
>   	CPU_ZERO_S(size, set);
> -@@ -207,8 +225,13 @@ realloc:
> +@@ -207,8 +224,13 @@ realloc:
>   	size = sizeof(cpu_set_t);
>   	CPU_ZERO(set);
>   #endif
> @@ -137,7 +137,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>   		if (errno == EINVAL && nrcpus < (1024 << 8)) {
>   			nrcpus = nrcpus << 2;
> -@@ -220,10 +243,17 @@ realloc:
> +@@ -220,10 +242,17 @@ realloc:
>   				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
>   		else
>   #endif
> @@ -155,7 +155,7 @@ index c927512..921b107 100644
>   #if __GLIBC_PREREQ(2, 7)
>   	CPU_ZERO_S(size, set);
>   	CPU_SET_S(cpu_max, size, set);
> -@@ -231,6 +261,10 @@ realloc:
> +@@ -231,6 +260,10 @@ realloc:
>   	CPU_ZERO(set);
>   	CPU_SET(cpu_max, set);
>   #endif
> @@ -166,7 +166,7 @@ index c927512..921b107 100644
>   	if (sched_setaffinity(0, size, set) < 0) {
>   		CPU_FREE(set);
>   		tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno);
> -@@ -247,11 +281,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
> +@@ -247,11 +280,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
>   {
>   	unsigned int index, max = 0;
>   	for (index = 0; index < size * BITS_PER_BYTE; index++)
> @@ -186,7 +186,7 @@ diff --git a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c b
>  index 9d6a81a..4ed13b2 100644
>  --- a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
>  +++ b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
> -@@ -66,9 +66,11 @@ do { \
> +@@ -67,9 +67,11 @@ do { \
>   	tst_resm((TEST_RETURN == -1 ? TPASS : TFAIL) | TTERRNO, #t); \
>   } while (0)
>   
> @@ -198,7 +198,7 @@ index 9d6a81a..4ed13b2 100644
>   
>   int main(int ac, char **av)
>   {
> -@@ -95,14 +97,19 @@ static void do_test(void)
> +@@ -96,14 +98,19 @@ static void do_test(void)
>   	pid_t unused_pid;
>   	unsigned len;
>   
> @@ -218,7 +218,7 @@ index 9d6a81a..4ed13b2 100644
>   #if __GLIBC_PREREQ(2, 7)
>   	len = CPU_ALLOC_SIZE(nrcpus);
>   	CPU_ZERO_S(len, mask);
> -@@ -110,10 +117,15 @@ realloc:
> +@@ -111,10 +118,15 @@ realloc:
>   	len = sizeof(cpu_set_t);
>   	CPU_ZERO(mask);
>   #endif
> @@ -234,7 +234,7 @@ index 9d6a81a..4ed13b2 100644
>   #if __GLIBC_PREREQ(2, 7)
>   		if (errno == EINVAL && nrcpus < (1024 << 8)) {
>   			nrcpus = nrcpus << 2;
> -@@ -125,17 +137,27 @@ realloc:
> +@@ -126,17 +138,27 @@ realloc:
>   				 "newer glibc(>= 2.7)");
>   		else
>   #endif
> @@ -262,7 +262,7 @@ index 9d6a81a..4ed13b2 100644
>   			if (TEST_RETURN != -1)
>   				tst_resm(TPASS, "sched_getaffinity() succeed, "
>   					 "this process %d is running "
> -@@ -143,11 +165,15 @@ realloc:
> +@@ -144,11 +166,15 @@ realloc:
>   		}
>   	}
>   
> diff --git a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
> deleted file mode 100644
> index b9fce88..0000000
> --- a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
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
> -diff --git a/testcases/kernel/syscalls/epoll2/include/epoll.h b/testcases/kernel/syscalls/epoll2/include/epoll.h
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
> -@@ -114,6 +116,8 @@ extern int epoll_ctl (int __epfd, int __op, int __fd,
> - extern int epoll_wait (int __epfd, struct epoll_event *__events,
> - 		       int __maxevents, int __timeout) __THROW;
> - 
> --__END_DECLS
> -+#ifdef __cplusplus
> -+}
> -+#endif
> - 
> - #endif /* sys/epoll.h */
> -diff --git a/utils/sctp/include/netinet/sctp.h b/utils/sctp/include/netinet/sctp.h
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
> -@@ -862,6 +865,8 @@ int sctp_recvmsg(int s, void *msg, size_t len, struct sockaddr *from,
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
> diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> index 462976d..6c5f360 100644
> --- a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> +++ b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> @@ -18,10 +18,10 @@ Upstream-Status: Pending
>   testcases/kernel/syscalls/mremap/mremap03.c | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
>  
> -Index: git/testcases/kernel/syscalls/mremap/mremap01.c
> -===================================================================
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap01.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap01.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap01.c b/testcases/kernel/syscalls/mremap/mremap01.c
> +index d63d1e4..24ca174 100644
> +--- a/testcases/kernel/syscalls/mremap/mremap01.c
> ++++ b/testcases/kernel/syscalls/mremap/mremap01.c
>  @@ -76,10 +76,12 @@
>    */
>   #include <unistd.h>
> @@ -36,10 +36,10 @@ Index: git/testcases/kernel/syscalls/mremap/mremap01.c
>   
>   #include "test.h"
>   #include "safe_macros.h"
> -Index: git/testcases/kernel/syscalls/mremap/mremap02.c
> -===================================================================
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap02.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap02.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap02.c b/testcases/kernel/syscalls/mremap/mremap02.c
> +index 5a51b9a..a530a6b 100644
> +--- a/testcases/kernel/syscalls/mremap/mremap02.c
> ++++ b/testcases/kernel/syscalls/mremap/mremap02.c
>  @@ -75,9 +75,11 @@
>   #include <errno.h>
>   #include <unistd.h>
> @@ -52,10 +52,10 @@ Index: git/testcases/kernel/syscalls/mremap/mremap02.c
>   
>   #include "test.h"
>   
> -Index: git/testcases/kernel/syscalls/mremap/mremap03.c
> -===================================================================
> ---- git.orig/testcases/kernel/syscalls/mremap/mremap03.c
> -+++ git/testcases/kernel/syscalls/mremap/mremap03.c
> +diff --git a/testcases/kernel/syscalls/mremap/mremap03.c b/testcases/kernel/syscalls/mremap/mremap03.c
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
> diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
> index c730d46..40ee894 100644
> --- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
> +++ b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
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
> -===================================================================
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
>   	unsigned long sa_flags;
>   	void (*sa_restorer) (void);
>   	sigset_t sa_mask;
> -Index: git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> -===================================================================
> ---- git.orig/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> -+++ git/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> +diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> +index 37bc3a9..2ca7f7c 100644
> +--- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
> ++++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
>  @@ -19,4 +19,7 @@
>   top_srcdir		?= ../../../..
>   
> diff --git a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> index 04532be..e826d48 100644
> --- a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> +++ b/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> @@ -27,7 +27,7 @@ diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/ac
>  index b8b67b4..7c7c506 100644
>  --- a/testcases/network/nfsv4/acl/acl1.c
>  +++ b/testcases/network/nfsv4/acl/acl1.c
> -@@ -314,7 +314,7 @@ void test_acl_default(char *dir, acl_t acl)
> +@@ -303,7 +303,7 @@ void test_acl_default(char *dir, acl_t acl)
>   	char *cmd = malloc(256);
>   
>   	strcpy(cmd, "chmod 7777 ");
> diff --git a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch b/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> deleted file mode 100644
> index 5096a85..0000000
> --- a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d Mon Sep 17 00:00:00 2001
> -From: Li Wang <liwang@redhat.com>
> -Date: Tue, 23 Jan 2018 17:46:35 +0800
> -Subject: [PATCH] safe_macros: make is_fuse() return zero if fs_type is NULL
> -
> -This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE fs)
> -involves FUSE fs check in safe_mount(), but we'd better guarantee the "fs_type"
> -is legal to check in is_fuse() function otherwise system will kill the program.
> -
> -  cmdline="fanotify06"
> -  contacts=""
> -  analysis=exit
> -  <<<test_output>>>
> -  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
> -  tst_test.c:1025: BROK: Test killed by SIGSEGV!
> -
> -Signed-off-by: Li Wang <liwang@redhat.com>
> -Acked-by: Jan Stancek <jstancek@redhat.com>
> -Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d]
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
> - 	unsigned int i;
> - 
> -+	if (!fs_type)
> -+		return 0;
> -+
> - 	for (i = 0; i < ARRAY_SIZE(fuse_fs_types); i++) {
> - 		if (!strcmp(fuse_fs_types[i], fs_type))
> - 			return 1;
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
> deleted file mode 100644
> index 8992f1b..0000000
> --- a/meta/recipes-extended/ltp/ltp_20180118.bb
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -SUMMARY = "Linux Test Project"
> -DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
> -HOMEPAGE = "http://ltp.sourceforge.net"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
> -LIC_FILES_CHKSUM = "\
> -    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> -    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
> -    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> -    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> -    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
> -    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> -    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -    file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
> -"
> -
> -DEPENDS = "attr libaio libcap acl openssl zip-native"
> -DEPENDS_append_libc-musl = " fts "
> -EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> -CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> -CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
> -
> -SRC_URI = "git://github.com/linux-test-project/ltp.git \
> -           file://0001-configure-add-knob-to-control-numa-support.patch \
> -           file://0001-configure-Fix-default-value-of-without-numa-switch-i.patch \
> -           file://0003-Add-knob-to-control-tirpc-support.patch \
> -           file://0004-build-Add-option-to-select-libc-implementation.patch \
> -           file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
> -           file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
> -           file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
> -           file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
> -           file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
> -           file://0018-guard-mallocopt-with-__GLIBC__.patch \
> -           file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
> -           file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
> -           file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
> -           file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
> -           file://0026-crash01-Define-_GNU_SOURCE.patch \
> -           file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
> -           file://0034-periodic_output.patch \
> -           file://0035-fix-test_proc_kill-hang.patch \
> -           file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
> -           file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
> -           file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch \
> -           file://0001-Disable-rpc01-on-glibc-and-musl.patch \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools-brokensep
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -export prefix = "/opt/ltp"
> -export exec_prefix = "/opt/ltp"
> -
> -PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
> -EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
> -EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
> -# ltp network/rpc test cases ftbfs when libtirpc is found
> -EXTRA_OECONF += " --without-tirpc "
> -
> -do_install(){
> -    install -d ${D}/opt/ltp/
> -    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> -
> -    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
> -    # as it lacks dependency on some perl moudle such as LWP::Simple
> -    # And this script previously works as a tool for analyzing failures from LTP
> -    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
> -    # http://khack.osdl.org to retrieve ltp test results run on
> -    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
> -    rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
> -
> -    # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
> -    cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
> -}
> -
> -RDEPENDS_${PN} = "\
> -    acl \
> -    at \
> -    attr \
> -    bash \
> -    cpio \
> -    cronie \
> -    curl \
> -    e2fsprogs-mke2fs \
> -    expect \
> -    gawk \
> -    gzip \
> -    iproute2 \
> -    ldd \
> -    libaio \
> -    logrotate \
> -    perl \
> -    python-core \
> -    procps \
> -    unzip \
> -    util-linux \
> -    which \
> -    tar \
> -"
> -
> -FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/* /opt/ltp/testcases/data/nm01/lib.a /opt/ltp/lib/libmem.a"
> -
> -# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
> -INHIBIT_PACKAGE_STRIP_FILES = "/opt/ltp/testcases/bin/nm01 /opt/ltp/testcases/bin/ldd01"
> -INSANE_SKIP_${PN} += "already-stripped staticdev"
> -
> -# Avoid file dependency scans, as LTP checks for things that may or may not
> -# exist on the running system.  For instance it has specific checks for
> -# csh and ksh which are not typically part of OpenEmbedded systems (but
> -# can be added via additional layers.)
> -SKIP_FILEDEPS_${PN} = '1'
> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
> new file mode 100644
> index 0000000..049b829
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -0,0 +1,111 @@
> +SUMMARY = "Linux Test Project"
> +DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
> +HOMEPAGE = "http://ltp.sourceforge.net"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
> +    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
> +    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> +    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +    file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
> +"
> +
> +DEPENDS = "attr libaio libcap acl openssl zip-native"
> +DEPENDS_append_libc-musl = " fts "
> +EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> +CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> +CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> +SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
> +
> +SRC_URI = "git://github.com/linux-test-project/ltp.git \
> +           file://0004-build-Add-option-to-select-libc-implementation.patch \
> +           file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
> +           file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
> +           file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
> +           file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
> +           file://0018-guard-mallocopt-with-__GLIBC__.patch \
> +           file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
> +           file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
> +           file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
> +           file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
> +           file://0026-crash01-Define-_GNU_SOURCE.patch \
> +           file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
> +           file://0034-periodic_output.patch \
> +           file://0035-fix-test_proc_kill-hang.patch \
> +           file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
> +           file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +export prefix = "/opt/ltp"
> +export exec_prefix = "/opt/ltp"
> +
> +PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
> +EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
> +EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
> +# ltp network/rpc test cases ftbfs when libtirpc is found
> +EXTRA_OECONF += " --without-tirpc "
> +
> +do_install(){
> +    install -d ${D}/opt/ltp/
> +    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> +
> +    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
> +    # as it lacks dependency on some perl moudle such as LWP::Simple
> +    # And this script previously works as a tool for analyzing failures from LTP
> +    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
> +    # http://khack.osdl.org to retrieve ltp test results run on
> +    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
> +    rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
> +
> +    # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
> +    cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
> +}
> +
> +RDEPENDS_${PN} = "\
> +    acl \
> +    at \
> +    attr \
> +    bash \
> +    cpio \
> +    cronie \
> +    curl \
> +    e2fsprogs-mke2fs \
> +    expect \
> +    gawk \
> +    gzip \
> +    iproute2 \
> +    ldd \
> +    libaio \
> +    logrotate \
> +    perl \
> +    python-core \
> +    procps \
> +    unzip \
> +    util-linux \
> +    which \
> +    tar \
> +"
> +
> +FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/* /opt/ltp/testcases/data/nm01/lib.a /opt/ltp/lib/libmem.a"
> +
> +# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
> +INHIBIT_PACKAGE_STRIP_FILES = "/opt/ltp/testcases/bin/nm01 /opt/ltp/testcases/bin/ldd01"
> +INSANE_SKIP_${PN} += "already-stripped staticdev"
> +
> +# Avoid file dependency scans, as LTP checks for things that may or may not
> +# exist on the running system.  For instance it has specific checks for
> +# csh and ksh which are not typically part of OpenEmbedded systems (but
> +# can be added via additional layers.)
> +SKIP_FILEDEPS_${PN} = '1'
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



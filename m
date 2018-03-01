Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id DE1EE6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:43:31 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id a16so2835851pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h599LW4VWrZmcV8ONg2SAMmt3qDPXW6jSn1FsZw44cw=;
	b=tFHBBiYvmGfkpvIR4C99551HXU95pKQCjJMoA49A6iH5K+wL/Zsk4jsWanqpS70LWP
	fY0k4iHOLepKLViTzLiAifCOQiGCbLlcYRHA7fD8sHlcPPIs5DQer8k0QmZB1MLL616X
	EkvZXDecmAHaFPVzyzcRsPEradfLrc5MEi1a3Go+Vi/FFiIumxoCXLEn59rehRCT4dij
	PtBGTu8zQ1jFbVycaeCiX6dF8/Wws7mXYqx4Frw1xy5hI2I/3+e1SkoBOqfzLFRaBDzL
	7LWiQB+Pf2IB16VKv4TscQ1PRu5rUgRMSRhnCJEg7fQim8nBK0JdlSmIxVdQ/QdW0sMc
	ppxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h599LW4VWrZmcV8ONg2SAMmt3qDPXW6jSn1FsZw44cw=;
	b=plaYU2L9d0w1s8U3f3GLMkgwdF3nXHt21g1nln+apnaEI9HfLPt+YZ3BLYQYr1+CxQ
	WMtzQEv5rDWpzM0An4x/For8HU9rUxZF+fH7xdVp4QfqUQ/gCD6CEtRTUj7t40OIRI1d
	M3oKKsQ1bwu9VXyhRVdvRxNBuqd1dnJc0/YEw4w1O57sJCP44koQyCU3QoFY1deaMHV2
	zvm+Cir1fpitNgc6ITNx4CfkZ4U7IpyAo3vxgrkJF1ADtAQUBtWDP2vunqswo8fqXRrA
	i1oUHtEQ6xS5jb0GT/G6tWoLVwcg9SNCuHXbRzU9Jta6kz16hExnhYzaoioepAAc2Oq5
	8ADw==
X-Gm-Message-State: APf1xPC/Jn5YtjPSYtw1iEqFAlbY7mn4Xvxq+OOzDXCOoTGGySJJWNWY
	JwTHlf+Lod6BHQge5tD8TDzzduaf4WytMI5K5Ak=
X-Google-Smtp-Source: AG47ELvAiDgCXfLZz+2Sw5DyfZsfErp/OmO34AwHSIjv8BASjrzXCgnRIN7xV6lLO97mY/04/24YnXjur440dLPw6QU=
X-Received: by 10.98.229.21 with SMTP id n21mr2883111pff.158.1519929810561;
	Thu, 01 Mar 2018 10:43:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Thu, 1 Mar 2018 10:43:00 -0800 (PST)
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Mar 2018 10:43:00 -0800
Message-ID: <CAMKF1spQ4EAMA_NVp46W9CA7HgZHNE5AeH9JL23zQNpdn1e84g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Thu, 01 Mar 2018 18:43:32 -0000
Content-Type: text/plain; charset="UTF-8"

whole series LGTM

On Thu, Mar 1, 2018 at 10:26 AM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>  ...tive_2.26.bb => cross-localedef-native_2.27.bb} |  4 +-
>  ...glibc-initial_2.26.bb => glibc-initial_2.27.bb} |  0
>  .../{glibc-locale_2.26.bb => glibc-locale_2.27.bb} |  0
>  .../{glibc-mtrace_2.26.bb => glibc-mtrace_2.27.bb} |  0
>  ...glibc-scripts_2.26.bb => glibc-scripts_2.27.bb} |  0
>  ...libc-Look-for-host-system-ld.so.cache-as-.patch | 12 +--
>  ...libc-Fix-buffer-overrun-with-a-relocated-.patch | 10 +--
>  ...libc-Raise-the-size-of-arrays-containing-.patch | 28 +++----
>  ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |  8 +-
>  ...500-e5500-e6500-603e-fsqrt-implementation.patch |  6 +-
>  ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  8 +-
>  ...-Fix-undefined-reference-to-__sqrt_finite.patch |  6 +-
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +-
>  ...bug-1443-which-explains-what-the-patch-do.patch | 10 +--
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch | 10 +--
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +-
>  ...-configure.ac-handle-correctly-libc_cv_ro.patch |  8 +-
>  .../glibc/glibc/0013-Add-unused-attribute.patch    |  8 +-
>  ...thin-the-path-sets-wrong-config-variables.patch | 10 +--
>  ...-timezone-re-written-tzselect-as-posix-sh.patch |  8 +-
>  ...move-bash-dependency-for-nscd-init-script.patch |  6 +-
>  ...c-Cross-building-and-testing-instructions.patch |  6 +-
>  ...018-eglibc-Help-bootstrap-cross-toolchain.patch |  8 +-
>  .../0019-eglibc-Clear-cache-lines-on-ppc8xx.patch  | 10 +--
>  ...0020-eglibc-Resolve-__fpscr_values-on-SH4.patch |  8 +-
>  .../glibc/0021-eglibc-Install-PIC-archives.patch   | 20 ++---
>  ...ward-port-cross-locale-generation-support.patch | 90 +++++++++++-----------
>  ...0023-Define-DUMMY_LOCALE_T-if-not-defined.patch |  8 +-
>  ....c-Make-_dl_build_local_scope-breadth-fir.patch | 10 +--
>  ...-locale-fix-hard-coded-reference-to-gcc-E.patch |  6 +-
>  ...6-reset-dl_load_write_lock-after-forking.patch} | 29 +++----
>  ...o-lock-before-switching-to-malloc_atfork.patch} | 27 +++++--
>  .../glibc/{glibc_2.26.bb => glibc_2.27.bb}         | 10 +--
>  34 files changed, 200 insertions(+), 188 deletions(-)
>  rename meta/recipes-core/glibc/{cross-localedef-native_2.26.bb => cross-localedef-native_2.27.bb} (93%)
>  rename meta/recipes-core/glibc/{glibc-initial_2.26.bb => glibc-initial_2.27.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-locale_2.26.bb => glibc-locale_2.27.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-mtrace_2.26.bb => glibc-mtrace_2.27.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-scripts_2.26.bb => glibc-scripts_2.27.bb} (100%)
>  rename meta/recipes-core/glibc/glibc/{0027-glibc-reset-dl-load-write-lock-after-forking.patch => 0026-reset-dl_load_write_lock-after-forking.patch} (63%)
>  rename meta/recipes-core/glibc/glibc/{0028-Bug-4578-add-ld.so-lock-while-fork.patch => 0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch} (76%)
>  rename meta/recipes-core/glibc/{glibc_2.26.bb => glibc_2.27.bb} (92%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 075d2c5b242..87a5920cada 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -26,7 +26,7 @@ GCCVERSION ?= "7.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.30%"
>  GDBVERSION ?= "8.0%"
> -GLIBCVERSION ?= "2.26%"
> +GLIBCVERSION ?= "2.27%"
>  LINUXLIBCVERSION ?= "4.15%"
>
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.26.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> similarity index 93%
> rename from meta/recipes-core/glibc/cross-localedef-native_2.26.bb
> rename to meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> index af02a0ce1df..d633e9bc37e 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> @@ -21,8 +21,8 @@ SRCBRANCH ?= "release/${PV}/master"
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>
> -SRCREV_glibc ?= "d300041c533a3d837c9f37a099bcc95466860e98"
> -SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
> +SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
> +SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
>
>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
> diff --git a/meta/recipes-core/glibc/glibc-initial_2.26.bb b/meta/recipes-core/glibc/glibc-initial_2.27.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-initial_2.26.bb
> rename to meta/recipes-core/glibc/glibc-initial_2.27.bb
> diff --git a/meta/recipes-core/glibc/glibc-locale_2.26.bb b/meta/recipes-core/glibc/glibc-locale_2.27.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-locale_2.26.bb
> rename to meta/recipes-core/glibc/glibc-locale_2.27.bb
> diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.26.bb b/meta/recipes-core/glibc/glibc-mtrace_2.27.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-mtrace_2.26.bb
> rename to meta/recipes-core/glibc/glibc-mtrace_2.27.bb
> diff --git a/meta/recipes-core/glibc/glibc-scripts_2.26.bb b/meta/recipes-core/glibc/glibc-scripts_2.27.bb
> similarity index 100%
> rename from meta/recipes-core/glibc/glibc-scripts_2.26.bb
> rename to meta/recipes-core/glibc/glibc-scripts_2.27.bb
> diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> index 19c1d9bf14f..86234c9d2ee 100644
> --- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> +++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
> @@ -1,7 +1,7 @@
> -From 81346b2f7735698078d5bf919a78b6c0269d6fee Mon Sep 17 00:00:00 2001
> +From bd91b60ce6ff01f49b173b6b45e23ce94911b2a6 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:48:24 +0000
> -Subject: [PATCH 01/25] nativesdk-glibc: Look for host system ld.so.cache as
> +Subject: [PATCH 01/27] nativesdk-glibc: Look for host system ld.so.cache as
>   well
>
>  Upstream-Status: Inappropriate [embedded specific]
> @@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index c1b6d4ba0f..d7af9ebcbc 100644
> +index 7554a99b5a..a73d11a62f 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
> -@@ -2054,6 +2054,14 @@ _dl_map_object (struct link_map *loader, const char *name,
> +@@ -2007,6 +2007,14 @@ _dl_map_object (struct link_map *loader, const char *name,
>               }
>           }
>
> @@ -49,7 +49,7 @@ index c1b6d4ba0f..d7af9ebcbc 100644
>   #ifdef USE_LDCONFIG
>         if (fd == -1
>           && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
> -@@ -2112,14 +2120,6 @@ _dl_map_object (struct link_map *loader, const char *name,
> +@@ -2065,14 +2073,6 @@ _dl_map_object (struct link_map *loader, const char *name,
>         }
>   #endif
>
> @@ -65,5 +65,5 @@ index c1b6d4ba0f..d7af9ebcbc 100644
>         if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
>         _dl_debug_printf ("\n");
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> index 2ce240be6fe..899481f0570 100644
> --- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> +++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
> @@ -1,7 +1,7 @@
> -From 82f2e910ec0e2de6a9e2b007825bddfc5850575d Mon Sep 17 00:00:00 2001
> +From 50736f7fc1fdc9e1f7c05f1fec75c977d9be9228 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:50:00 +0000
> -Subject: [PATCH 02/25] nativesdk-glibc: Fix buffer overrun with a relocated
> +Subject: [PATCH 02/27] nativesdk-glibc: Fix buffer overrun with a relocated
>   SDK
>
>  When ld-linux-*.so.2 is relocated to a path that is longer than the
> @@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 12 insertions(+)
>
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index d7af9ebcbc..19c1db9948 100644
> +index a73d11a62f..62e3eee478 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
> -@@ -1753,7 +1753,19 @@ open_path (const char *name, size_t namelen, int mode,
> +@@ -1707,7 +1707,19 @@ open_path (const char *name, size_t namelen, int mode,
>          given on the command line when rtld is run directly.  */
>       return -1;
>
> @@ -46,5 +46,5 @@ index d7af9ebcbc..19c1db9948 100644
>       {
>         struct r_search_path_elem *this_dir = *dirs;
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> index 397e8b31695..03f99916fa6 100644
> --- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> +++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> @@ -1,7 +1,7 @@
> -From 490a0eb4da1af726ea5d68e3efc0d18ba94c4054 Mon Sep 17 00:00:00 2001
> +From 695e1cbff6ee6db3435c33e55311c67adf44476d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:51:38 +0000
> -Subject: [PATCH 03/25] nativesdk-glibc: Raise the size of arrays containing dl
> +Subject: [PATCH 03/27] nativesdk-glibc: Raise the size of arrays containing dl
>   paths
>
>  This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
> @@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   7 files changed, 14 insertions(+), 10 deletions(-)
>
>  diff --git a/elf/dl-cache.c b/elf/dl-cache.c
> -index e9632da0b3..4de529d2cf 100644
> +index 6ee5153ff9..37a5f701fa 100644
>  --- a/elf/dl-cache.c
>  +++ b/elf/dl-cache.c
>  @@ -133,6 +133,10 @@ do                                                                              \
> @@ -38,14 +38,14 @@ index e9632da0b3..4de529d2cf 100644
>  +
>  +
>   int
> - internal_function
>   _dl_cache_libcmp (const char *p1, const char *p2)
> + {
>  diff --git a/elf/dl-load.c b/elf/dl-load.c
> -index 19c1db9948..70c259b400 100644
> +index 62e3eee478..6ddba73650 100644
>  --- a/elf/dl-load.c
>  +++ b/elf/dl-load.c
> -@@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_relro;
> - /* Get the generated information about the trusted directories.  */
> +@@ -109,8 +109,8 @@ static size_t max_capstrlen attribute_relro;
> +    gen-trusted-dirs.awk.  */
>   #include "trusted-dirs.h"
>
>  -static const char system_dirs[] = SYSTEM_DIRS;
> @@ -56,7 +56,7 @@ index 19c1db9948..70c259b400 100644
>     SYSTEM_DIRS_LEN
>   };
>  diff --git a/elf/interp.c b/elf/interp.c
> -index b6e8f04444..47c20415bc 100644
> +index 9cd50c7291..fc2f39d73c 100644
>  --- a/elf/interp.c
>  +++ b/elf/interp.c
>  @@ -18,5 +18,5 @@
> @@ -67,7 +67,7 @@ index b6e8f04444..47c20415bc 100644
>  +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
>     = RUNTIME_LINKER;
>  diff --git a/elf/ldconfig.c b/elf/ldconfig.c
> -index 99caf9e9bb..36ea5df5f1 100644
> +index fbdd814edf..9f4d8d69b1 100644
>  --- a/elf/ldconfig.c
>  +++ b/elf/ldconfig.c
>  @@ -168,6 +168,9 @@ static struct argp argp =
> @@ -81,7 +81,7 @@ index 99caf9e9bb..36ea5df5f1 100644
>      a platform.  */
>   static int
>  diff --git a/elf/rtld.c b/elf/rtld.c
> -index 65647fb1c8..cd8381cb33 100644
> +index 453f56eb15..08e0c4c94b 100644
>  --- a/elf/rtld.c
>  +++ b/elf/rtld.c
>  @@ -128,6 +128,7 @@ dso_name_valid_for_suid (const char *p)
> @@ -92,7 +92,7 @@ index 65647fb1c8..cd8381cb33 100644
>
>   /* LD_AUDIT variable contents.  Must be processed before the
>      audit_list below.  */
> -@@ -999,12 +1000,12 @@ of this helper program; chances are you did not intend to run this program.\n\
> +@@ -1000,12 +1001,12 @@ of this helper program; chances are you did not intend to run this program.\n\
>     --list                list all dependencies and how they are resolved\n\
>     --verify              verify that given object really is a dynamically linked\n\
>                         object we can handle\n\
> @@ -108,7 +108,7 @@ index 65647fb1c8..cd8381cb33 100644
>         ++_dl_skip_args;
>         --_dl_argc;
>  diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
> -index 5aa055de6e..b9a14b9bd3 100644
> +index d6cf9d2a3e..9fcf970144 100644
>  --- a/iconv/gconv_conf.c
>  +++ b/iconv/gconv_conf.c
>  @@ -36,7 +36,7 @@
> @@ -121,7 +121,7 @@ index 5aa055de6e..b9a14b9bd3 100644
>   /* The path elements, as determined by the __gconv_get_path function.
>      All path elements end in a slash.  */
>  diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
> -index 1f0b8f629d..acbe68399d 100644
> +index cf43f1cf3b..7f07adde53 100644
>  --- a/sysdeps/generic/dl-cache.h
>  +++ b/sysdeps/generic/dl-cache.h
>  @@ -27,10 +27,6 @@
> @@ -136,5 +136,5 @@ index 1f0b8f629d..acbe68399d 100644
>   # define add_system_dir(dir) add_dir (dir)
>   #endif
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> index 8db47bca782..f9d70c2a095 100644
> --- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> +++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
> @@ -1,7 +1,7 @@
> -From 8fe1b56180c30d237cc2ab9a5a9c97a0311f41da Mon Sep 17 00:00:00 2001
> +From 2bafdbd7067794c6a24e5e85608c0ec4638c5667 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 31 Dec 2015 14:35:35 -0800
> -Subject: [PATCH 04/25] nativesdk-glibc: Allow 64 bit atomics for x86
> +Subject: [PATCH 04/27] nativesdk-glibc: Allow 64 bit atomics for x86
>
>  The fix consist of allowing 64bit atomic ops for x86.
>  This should be safe for i586 and newer CPUs.
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/sysdeps/i386/atomic-machine.h b/sysdeps/i386/atomic-machine.h
> -index 0e24200617..1532f52dec 100644
> +index 272da5dd8f..409c759f14 100644
>  --- a/sysdeps/i386/atomic-machine.h
>  +++ b/sysdeps/i386/atomic-machine.h
>  @@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
> @@ -30,5 +30,5 @@ index 0e24200617..1532f52dec 100644
>   #define ATOMIC_EXCHANGE_USES_CAS 0
>
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> index 956b2aae7a3..ad9106eefa1 100644
> --- a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> +++ b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
> @@ -1,7 +1,7 @@
> -From b9edcc845641956b7286c60c833f05a9f70cfab9 Mon Sep 17 00:00:00 2001
> +From 661adfe9c220d10617bf6bb283827471c3956b01 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:01:50 +0000
> -Subject: [PATCH 05/25] fsl e500/e5500/e6500/603e fsqrt implementation
> +Subject: [PATCH 05/27] fsl e500/e5500/e6500/603e fsqrt implementation
>
>  Upstream-Status: Pending
>  Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
> @@ -1580,5 +1580,5 @@ index 0000000000..04ff8cc181
>  @@ -0,0 +1 @@
>  +powerpc/powerpc64/e6500/fpu
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> index c74fead6255..a3d50fd0540 100644
> --- a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> +++ b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
> @@ -1,7 +1,7 @@
> -From 324202488a1c2439be345745722f5cb04c0e0847 Mon Sep 17 00:00:00 2001
> +From 615598fcca64461a71d84f756d75374f02d914ad Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:11:22 +0000
> -Subject: [PATCH 06/25] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
> +Subject: [PATCH 06/27] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
>   names
>
>  This bolts in a hook for OE to pass its own version of interpreter
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/elf/readlib.c b/elf/readlib.c
> -index d278a189b2..a84cb85158 100644
> +index 573c01476c..d8c7412287 100644
>  --- a/elf/readlib.c
>  +++ b/elf/readlib.c
>  @@ -51,6 +51,7 @@ static struct known_names interpreters[] =
> @@ -29,5 +29,5 @@ index d278a189b2..a84cb85158 100644
>
>   static struct known_names known_libs[] =
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> index b64327667cc..1234df0a099 100644
> --- a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> +++ b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
> @@ -1,7 +1,7 @@
> -From cf00bf9de8128171e79a019de809e35f3aeed281 Mon Sep 17 00:00:00 2001
> +From 804b73ae295bdfda29341e89f2d0c1b99492dc9a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:15:07 +0000
> -Subject: [PATCH 07/25] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
> +Subject: [PATCH 07/27] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
>
>  on ppc fixes the errors like below
>  | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
> @@ -204,5 +204,5 @@ index 26fa067abf..9d175122a8 100644
>   }
>  +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> index 3aeec5288bd..1b436475142 100644
> --- a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> +++ b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> @@ -1,7 +1,7 @@
> -From babe311deca9ee2730278f13b061b914b5286dc3 Mon Sep 17 00:00:00 2001
> +From 1a53084249d9dae1ef4281246efc899c8f9d63ed Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:16:38 +0000
> -Subject: [PATCH 08/25] __ieee754_sqrt{,f} are now inline functions and call
> +Subject: [PATCH 08/27] __ieee754_sqrt{,f} are now inline functions and call
>   out __slow versions
>
>  Upstream-Status: Pending
> @@ -383,5 +383,5 @@ index 9d175122a8..10de1f0cc3 100644
>  +
>   strong_alias (__ieee754_sqrtf, __sqrtf_finite)
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> index 7d5c2e31f5f..ea498569b3c 100644
> --- a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> +++ b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
> @@ -1,7 +1,7 @@
> -From 93b5d6bed19939039031c45b777d29619db06184 Mon Sep 17 00:00:00 2001
> +From 48262b6dda935278a40374ddf0080ab6cc999582 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:20:09 +0000
> -Subject: [PATCH 09/25] Quote from bug 1443 which explains what the patch does
> +Subject: [PATCH 09/27] Quote from bug 1443 which explains what the patch does
>   :
>
>    We build some random program and link it with -lust.  When we run it,
> @@ -45,10 +45,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
> -index 7053ead16e..0b1e1716b0 100644
> +index 8a00eab5e3..623edcb1bd 100644
>  --- a/sysdeps/arm/dl-machine.h
>  +++ b/sysdeps/arm/dl-machine.h
> -@@ -500,7 +500,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
> +@@ -510,7 +510,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
>
>         case R_ARM_TLS_DTPOFF32:
>           if (sym != NULL)
> @@ -58,5 +58,5 @@ index 7053ead16e..0b1e1716b0 100644
>
>         case R_ARM_TLS_TPOFF32:
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> index 7275c3e96d4..17513185da1 100644
> --- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> +++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
> @@ -1,7 +1,7 @@
> -From 1a6e0f4ee8584b04226156df1a3de3e467f0ef6f Mon Sep 17 00:00:00 2001
> +From 72ea5410909aef6b6aee70e7f9a88d534583aa00 Mon Sep 17 00:00:00 2001
>  From: Ting Liu <b28495@freescale.com>
>  Date: Wed, 19 Dec 2012 04:39:57 -0600
> -Subject: [PATCH 10/25] eglibc: run libm-err-tab.pl with specific dirs in ${S}
> +Subject: [PATCH 10/27] eglibc: run libm-err-tab.pl with specific dirs in ${S}
>
>  libm-err-tab.pl will parse all the files named "libm-test-ulps"
>  in the given dir recursively. To avoid parsing the one in
> @@ -18,10 +18,10 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/manual/Makefile b/manual/Makefile
> -index 4ed63a8ef3..e89919eb19 100644
> +index c2756640a7..1b5bb16a96 100644
>  --- a/manual/Makefile
>  +++ b/manual/Makefile
> -@@ -105,7 +105,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
> +@@ -102,7 +102,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
>   $(objpfx)stamp-libm-err: libm-err-tab.pl $(wildcard $(foreach dir,$(sysdirs),\
>                                                      $(dir)/libm-test-ulps))
>         pwd=`pwd`; \
> @@ -32,5 +32,5 @@ index 4ed63a8ef3..e89919eb19 100644
>         touch $@
>
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> index 84f2ca52347..1e70b2a30ef 100644
> --- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> +++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
> @@ -1,7 +1,7 @@
> -From 9b2af6cbf68d3353d72519e7f6c46becb7bd1d0f Mon Sep 17 00:00:00 2001
> +From 8ae998a10b24545e0c12f1f3d8be97b191178204 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:24:46 +0000
> -Subject: [PATCH 11/25] __ieee754_sqrt{,f} are now inline functions and call
> +Subject: [PATCH 11/27] __ieee754_sqrt{,f} are now inline functions and call
>   out __slow versions
>
>  Upstream-Status: Pending
> @@ -57,5 +57,5 @@ index 812653558f..10de1f0cc3 100644
>   #endif
>   {
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> index 2bf6b23ad1b..c35b759a283 100644
> --- a/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> +++ b/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
> @@ -1,7 +1,7 @@
> -From ffd3c5a04d8f2f26fea71fed4ce41e88b6f51086 Mon Sep 17 00:00:00 2001
> +From 4f9f39761909e67bd6d29b970b7165863e33e565 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:27:10 +0000
> -Subject: [PATCH 12/25] sysdeps/gnu/configure.ac: handle correctly
> +Subject: [PATCH 12/27] sysdeps/gnu/configure.ac: handle correctly
>   $libc_cv_rootsbindir
>
>  Upstream-Status:Pending
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
> -index 71243ad0c6..f578187576 100644
> +index c15d1087e8..37cc983f2a 100644
>  --- a/sysdeps/gnu/configure
>  +++ b/sysdeps/gnu/configure
>  @@ -32,6 +32,6 @@ case "$prefix" in
> @@ -38,5 +38,5 @@ index 634fe4de2a..3db1697f4f 100644
>     ;;
>   esac
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
> index 099fe50ee27..62c65253dd4 100644
> --- a/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
> +++ b/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
> @@ -1,7 +1,7 @@
> -From 049cce82f35e0d864d98075b83888dbba4d68afd Mon Sep 17 00:00:00 2001
> +From bba7a647b636618d5fd083e904f995f7736b9168 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:28:41 +0000
> -Subject: [PATCH 13/25] Add unused attribute
> +Subject: [PATCH 13/27] Add unused attribute
>
>  Helps in avoiding gcc warning when header is is included in
>  a source file which does not use both functions
> @@ -17,7 +17,7 @@ Upstream-Status: Pending
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
> -index 18d8bd6ae7..eb729da5d3 100644
> +index 123e2a62ce..63cc83ec84 100644
>  --- a/iconv/gconv_charset.h
>  +++ b/iconv/gconv_charset.h
>  @@ -21,7 +21,7 @@
> @@ -30,5 +30,5 @@ index 18d8bd6ae7..eb729da5d3 100644
>   {
>     int slash_count = 0;
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
> index ddc70e0e600..66911285a9c 100644
> --- a/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
> +++ b/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
> @@ -1,7 +1,7 @@
> -From 3b904bee81a1cfe81e3f437b5f3296efd54a51ac Mon Sep 17 00:00:00 2001
> +From 62f44ce3dd01a257cf67116e355492cb1659a917 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:31:06 +0000
> -Subject: [PATCH 14/25] 'yes' within the path sets wrong config variables
> +Subject: [PATCH 14/27] 'yes' within the path sets wrong config variables
>
>  It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
>  but being such a short word to grep it is likely to produce
> @@ -165,7 +165,7 @@ index f05f43802b..dc8639902d 100644
>     ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
>   if test $libc_cv_nios2_be = yes; then
>  diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
> -index a5513fad48..283b293ff3 100644
> +index 1ee7f41a36..77e38bebde 100644
>  --- a/sysdeps/unix/sysv/linux/mips/configure
>  +++ b/sysdeps/unix/sysv/linux/mips/configure
>  @@ -414,11 +414,11 @@ else
> @@ -199,7 +199,7 @@ index 9147aa4582..7898e24738 100644
>
>   libc_mips_nan=
>  diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
> -index 4e7fcf1d97..44a9cb3791 100644
> +index ae7f254da4..874519000b 100644
>  --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
>  +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
>  @@ -155,12 +155,12 @@ else
> @@ -259,5 +259,5 @@ index f9cba6e15d..b21f72f1e4 100644
>       ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
>     if test $libc_cv_ppc64_def_call_elf = no; then
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
> index b5feffa06a9..66bf4fdabdd 100644
> --- a/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
> +++ b/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
> @@ -1,7 +1,7 @@
> -From b8cb8cb242cb751d888feb1ada5c4d0f05cbc1d7 Mon Sep 17 00:00:00 2001
> +From ac240fb01f6470ac207968adfbe20ccc93b16f8b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:33:03 +0000
> -Subject: [PATCH 15/25] timezone: re-written tzselect as posix sh
> +Subject: [PATCH 15/27] timezone: re-written tzselect as posix sh
>
>  To avoid the bash dependency.
>
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/timezone/Makefile b/timezone/Makefile
> -index d6cc7ba357..e4ead6e1a7 100644
> +index 0194aba4a1..58e5405a05 100644
>  --- a/timezone/Makefile
>  +++ b/timezone/Makefile
>  @@ -122,7 +122,7 @@ $(testdata)/XT%: testdata/XT%
> @@ -41,5 +41,5 @@ index d2c3a6d1dd..089679f306 100755
>   # Output one argument as-is to standard output.
>   # Safer than 'echo', which can mishandle '\' or leading '-'.
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
> index 1d9983b8e55..0b1ee968713 100644
> --- a/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
> +++ b/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
> @@ -1,7 +1,7 @@
> -From 69d378001adfe9a359d2f4b069c1ed2d36de4480 Mon Sep 17 00:00:00 2001
> +From 790b133ff2bc5b77ed8533b8999abc65ed0da02b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 31 Dec 2015 14:33:02 -0800
> -Subject: [PATCH 16/25] Remove bash dependency for nscd init script
> +Subject: [PATCH 16/27] Remove bash dependency for nscd init script
>
>  The nscd init script uses #! /bin/bash but only really uses one bashism
>  (translated strings), so remove them and switch the shell to #!/bin/sh.
> @@ -71,5 +71,5 @@ index a882da7d8b..b02986ec15 100644
>         ;;
>   esac
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
> index 3e39d7458c6..fd821323d79 100644
> --- a/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
> +++ b/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
> @@ -1,7 +1,7 @@
> -From cdc88dffa226815e3a218604655459e33dc86483 Mon Sep 17 00:00:00 2001
> +From 897430bbb65a0f22284d7957206b5fd4efd6607f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:42:58 +0000
> -Subject: [PATCH 17/25] eglibc: Cross building and testing instructions
> +Subject: [PATCH 17/27] eglibc: Cross building and testing instructions
>
>  Ported from eglibc
>  Upstream-Status: Pending
> @@ -615,5 +615,5 @@ index 0000000000..b67b468466
>  +  simply place copies of these libraries in the top GLIBC build
>  +  directory.
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
> index 02f35f4e7b8..80d547c80d1 100644
> --- a/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
> +++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
> @@ -1,7 +1,7 @@
> -From 1161cd1c683547d29a03626d9d7de7f9cc03b74a Mon Sep 17 00:00:00 2001
> +From fcfa19b69e8749477022161a808a201807ef72ec Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:49:28 +0000
> -Subject: [PATCH 18/25] eglibc: Help bootstrap cross toolchain
> +Subject: [PATCH 18/27] eglibc: Help bootstrap cross toolchain
>
>  Taken from EGLIBC, r1484 + r1525
>
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   create mode 100644 include/stubs-bootstrap.h
>
>  diff --git a/Makefile b/Makefile
> -index 3e0ae6f43b..24dc66d17c 100644
> +index bea4e27f8d..8c83cfadc6 100644
>  --- a/Makefile
>  +++ b/Makefile
>  @@ -70,9 +70,18 @@ subdir-dirs = include
> @@ -96,5 +96,5 @@ index 0000000000..1d2b669aff
>  +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
>  +   an empty stubs.h like this will do fine for GCC.  */
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
> index adb28cfd34c..17bfe4fe840 100644
> --- a/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
> +++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
> @@ -1,7 +1,7 @@
> -From 1732c7f25453c879c17701839ef34876a7357008 Mon Sep 17 00:00:00 2001
> +From c6f2db0d7c5c65bfa19766a0e1ce8210111f9c7d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 31 Dec 2015 15:15:09 -0800
> -Subject: [PATCH 19/25] eglibc: Clear cache lines on ppc8xx
> +Subject: [PATCH 19/27] eglibc: Clear cache lines on ppc8xx
>
>  2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
>              Mark Shinwell  <shinwell@codesourcery.com>
> @@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 28 insertions(+), 2 deletions(-)
>
>  diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
> -index 23f5d5d388..7e45288db7 100644
> +index 78051bc7bc..e24f442320 100644
>  --- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
>  +++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
>  @@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
> @@ -48,7 +48,7 @@ index 23f5d5d388..7e45288db7 100644
>         break;
>
>  diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
> -index ad036c1e4b..afee56a3da 100644
> +index f2ad0c355d..3e6773795e 100644
>  --- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
>  +++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
>  @@ -73,11 +73,25 @@ __libc_start_main (int argc, char **argv,
> @@ -79,5 +79,5 @@ index ad036c1e4b..afee56a3da 100644
>         break;
>   #ifndef SHARED
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
> index f835d871aba..09f76707584 100644
> --- a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
> +++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
> @@ -1,7 +1,7 @@
> -From 108b3a1df96a85522c52a0dec032fc2c106f5f2d Mon Sep 17 00:00:00 2001
> +From 577085016bb926a687abec145557fe8cb8f5af0e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 00:55:53 +0000
> -Subject: [PATCH 20/25] eglibc: Resolve __fpscr_values on SH4
> +Subject: [PATCH 20/27] eglibc: Resolve __fpscr_values on SH4
>
>  2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
>              Andrew Stubbs  <ams@codesourcery.com>
> @@ -33,7 +33,7 @@ index e0938c4165..ca1d7da339 100644
>       # a*
>       alphasort64;
>  diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
> -index 5f11bc737b..2fd217b00b 100644
> +index c4e28ffb98..648bae03d5 100644
>  --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
>  +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
>  @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
> @@ -52,5 +52,5 @@ index 5f11bc737b..2fd217b00b 100644
>  +weak_alias (___fpscr_values, __fpscr_values)
>  +
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
> index 6ee397bf75e..530f4e10871 100644
> --- a/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
> +++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
> @@ -1,7 +1,7 @@
> -From 3392ee83b0132c089dffb1e9892b4b252ce1ec0e Mon Sep 17 00:00:00 2001
> +From c1beab8a11985f96f5eb644e7103d343b705afc6 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:57:01 +0000
> -Subject: [PATCH 21/25] eglibc: Install PIC archives
> +Subject: [PATCH 21/27] eglibc: Install PIC archives
>
>  Forward port from eglibc
>
> @@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 40 insertions(+), 2 deletions(-)
>
>  diff --git a/Makerules b/Makerules
> -index 9bb707c168..74cbefb9ba 100644
> +index ef6abeac6d..eeaa667f49 100644
>  --- a/Makerules
>  +++ b/Makerules
> -@@ -775,6 +775,9 @@ ifeq ($(build-shared),yes)
> +@@ -778,6 +778,9 @@ ifeq ($(build-shared),yes)
>   $(common-objpfx)libc.so: $(common-objpfx)libc.map
>   endif
>   common-generated += libc.so libc_pic.os
> @@ -42,7 +42,7 @@ index 9bb707c168..74cbefb9ba 100644
>   ifdef libc.so-version
>   $(common-objpfx)libc.so$(libc.so-version): $(common-objpfx)libc.so
>         $(make-link)
> -@@ -1026,6 +1029,7 @@ endif
> +@@ -1029,6 +1032,7 @@ endif
>
>   install: check-install-supported
>
> @@ -50,7 +50,7 @@ index 9bb707c168..74cbefb9ba 100644
>   install: $(installed-libcs)
>   $(installed-libcs): $(inst_libdir)/lib$(libprefix)%: lib $(+force)
>         $(make-target-directory)
> -@@ -1054,6 +1058,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
> +@@ -1057,6 +1061,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
>   install-lib.so-versioned := $(filter $(versioned), $(install-lib.so))
>   install-lib.so-unversioned := $(filter-out $(versioned), $(install-lib.so))
>
> @@ -73,7 +73,7 @@ index 9bb707c168..74cbefb9ba 100644
>   # For versioned libraries, we install three files:
>   #     $(inst_libdir)/libfoo.so        -- for linking, symlink or ld script
>   #     $(inst_slibdir)/libfoo.so.NN    -- for loading by SONAME, symlink
> -@@ -1298,9 +1318,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
> +@@ -1311,9 +1331,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
>   endif # headers-nonh
>   endif # headers
>
> @@ -97,7 +97,7 @@ index 9bb707c168..74cbefb9ba 100644
>   install-bin-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin))
>   install-bin-script-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin-script))
>   install-rootsbin-nosubdir: \
> -@@ -1313,6 +1346,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
> +@@ -1326,6 +1359,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
>   install-headers-nosubdir: $(addprefix $(inst_includedir)/,$(headers))
>   install-others-nosubdir: $(install-others)
>   install-others-programs-nosubdir: $(install-others-programs)
> @@ -108,7 +108,7 @@ index 9bb707c168..74cbefb9ba 100644
>
>   # We need all the `-nosubdir' targets so that `install' in the parent
>   # doesn't depend on several things which each iterate over the subdirs.
> -@@ -1322,7 +1359,8 @@ install-%:: install-%-nosubdir ;
> +@@ -1335,7 +1372,8 @@ install-%:: install-%-nosubdir ;
>
>   .PHONY: install install-no-libc.a-nosubdir
>   install-no-libc.a-nosubdir: install-headers-nosubdir install-data-nosubdir \
> @@ -119,5 +119,5 @@ index 9bb707c168..74cbefb9ba 100644
>   install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
>                             install-rootsbin-nosubdir install-sbin-nosubdir \
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> index 2a8a20ac8d9..a629ce141a0 100644
> --- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> +++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
> @@ -1,7 +1,7 @@
> -From d97533dc201cfd863765b1a67a27fde3e2622da7 Mon Sep 17 00:00:00 2001
> +From e019fe6a2b410db6043e21803f497b5cbdd90a83 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 18 Mar 2015 01:33:49 +0000
> -Subject: [PATCH 22/25] eglibc: Forward port cross locale generation support
> +Subject: [PATCH 22/27] eglibc: Forward port cross locale generation support
>
>  Upstream-Status: Pending
>
> @@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   create mode 100644 locale/catnames.c
>
>  diff --git a/locale/Makefile b/locale/Makefile
> -index 98ee76272d..bc3afb2248 100644
> +index fd9972279b..176b3946de 100644
>  --- a/locale/Makefile
>  +++ b/locale/Makefile
>  @@ -26,7 +26,8 @@ headers              = langinfo.h locale.h bits/locale.h \
> @@ -91,7 +91,7 @@ index 0000000000..9fad357db1
>  +    [LC_ALL] = sizeof ("LC_ALL") - 1
>  +  };
>  diff --git a/locale/localeinfo.h b/locale/localeinfo.h
> -index 4e1c8c568a..f7ed946f1c 100644
> +index 68822a6319..fa36123776 100644
>  --- a/locale/localeinfo.h
>  +++ b/locale/localeinfo.h
>  @@ -224,7 +224,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
> @@ -104,11 +104,11 @@ index 4e1c8c568a..f7ed946f1c 100644
>   # define NL_CURRENT_INDIRECT  1
>   #endif
>  diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
> -index e55ab86e28..0f87e6dd28 100644
> +index 34a8d32c92..cbb9436cd1 100644
>  --- a/locale/programs/charmap-dir.c
>  +++ b/locale/programs/charmap-dir.c
> -@@ -19,7 +19,9 @@
> - #include <error.h>
> +@@ -18,7 +18,9 @@
> + #include <errno.h>
>   #include <fcntl.h>
>   #include <libintl.h>
>  +#ifndef NO_UNCOMPRESS
> @@ -117,7 +117,7 @@ index e55ab86e28..0f87e6dd28 100644
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> -@@ -156,6 +158,7 @@ charmap_closedir (CHARMAP_DIR *cdir)
> +@@ -154,6 +156,7 @@ charmap_closedir (CHARMAP_DIR *cdir)
>     return closedir (dir);
>   }
>
> @@ -125,7 +125,7 @@ index e55ab86e28..0f87e6dd28 100644
>   /* Creates a subprocess decompressing the given pathname, and returns
>      a stream reading its output (the decompressed data).  */
>   static
> -@@ -204,6 +207,7 @@ fopen_uncompressed (const char *pathname, const char *compressor)
> +@@ -202,6 +205,7 @@ fopen_uncompressed (const char *pathname, const char *compressor)
>       }
>     return NULL;
>   }
> @@ -133,7 +133,7 @@ index e55ab86e28..0f87e6dd28 100644
>
>   /* Opens a charmap for reading, given its name (not an alias name).  */
>   FILE *
> -@@ -226,6 +230,7 @@ charmap_open (const char *directory, const char *name)
> +@@ -224,6 +228,7 @@ charmap_open (const char *directory, const char *name)
>     if (stream != NULL)
>       return stream;
>
> @@ -141,7 +141,7 @@ index e55ab86e28..0f87e6dd28 100644
>     memcpy (p, ".gz", 4);
>     stream = fopen_uncompressed (pathname, "gzip");
>     if (stream != NULL)
> -@@ -235,6 +240,7 @@ charmap_open (const char *directory, const char *name)
> +@@ -233,6 +238,7 @@ charmap_open (const char *directory, const char *name)
>     stream = fopen_uncompressed (pathname, "bzip2");
>     if (stream != NULL)
>       return stream;
> @@ -150,10 +150,10 @@ index e55ab86e28..0f87e6dd28 100644
>     return NULL;
>   }
>  diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
> -index cec848cb7c..fcd768eb7d 100644
> +index d2eebcfdbb..c3718d6589 100644
>  --- a/locale/programs/ld-collate.c
>  +++ b/locale/programs/ld-collate.c
> -@@ -350,7 +350,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
> +@@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
>       }
>     if (wcs != NULL)
>       {
> @@ -162,7 +162,7 @@ index cec848cb7c..fcd768eb7d 100644
>         uint32_t zero = 0;
>         /* Handle <U0000> as a single character.  */
>         if (nwcs == 0)
> -@@ -1776,8 +1776,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
> +@@ -1772,8 +1772,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
>
>               if ((*eptr)->nwcs == runp->nwcs)
>                 {
> @@ -172,7 +172,7 @@ index cec848cb7c..fcd768eb7d 100644
>
>                   if (c == 0)
>                     {
> -@@ -2010,9 +2009,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
> +@@ -2000,9 +1999,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
>              one consecutive entry.  */
>           if (runp->wcnext != NULL
>               && runp->nwcs == runp->wcnext->nwcs
> @@ -185,7 +185,7 @@ index cec848cb7c..fcd768eb7d 100644
>               && (runp->wcs[runp->nwcs - 1]
>                   == runp->wcnext->wcs[runp->nwcs - 1] + 1))
>             {
> -@@ -2036,9 +2035,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
> +@@ -2026,9 +2025,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
>                 runp = runp->wcnext;
>               while (runp->wcnext != NULL
>                      && runp->nwcs == runp->wcnext->nwcs
> @@ -199,10 +199,10 @@ index cec848cb7c..fcd768eb7d 100644
>                          == runp->wcnext->wcs[runp->nwcs - 1] + 1));
>
>  diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
> -index df266c20d6..05c0152ec9 100644
> +index f791e6b7e9..d809d6db7f 100644
>  --- a/locale/programs/ld-ctype.c
>  +++ b/locale/programs/ld-ctype.c
> -@@ -926,7 +926,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
> +@@ -915,7 +915,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
>     allocate_arrays (ctype, charmap, ctype->repertoire);
>
>     default_missing_len = (ctype->default_missing
> @@ -211,7 +211,7 @@ index df266c20d6..05c0152ec9 100644
>                          : 0);
>
>     init_locale_data (&file, nelems);
> -@@ -1937,7 +1937,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
> +@@ -1926,7 +1926,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
>             ignore = 1;
>           else
>             /* This value is usable.  */
> @@ -220,7 +220,7 @@ index df266c20d6..05c0152ec9 100644
>
>           first = 0;
>         }
> -@@ -2471,8 +2471,8 @@ with character code range values one must use the absolute ellipsis `...'"));
> +@@ -2460,8 +2460,8 @@ with character code range values one must use the absolute ellipsis `...'"));
>             }
>
>         handle_tok_digit:
> @@ -231,7 +231,7 @@ index df266c20d6..05c0152ec9 100644
>           handle_digits = 1;
>           goto read_charclass;
>
> -@@ -3929,8 +3929,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
> +@@ -3901,8 +3901,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
>
>           while (idx < number)
>             {
> @@ -241,7 +241,7 @@ index df266c20d6..05c0152ec9 100644
>               if (res == 0)
>                 {
>                   replace = 1;
> -@@ -3967,11 +3966,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
> +@@ -3939,11 +3938,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
>         for (size_t cnt = 0; cnt < number; ++cnt)
>         {
>           struct translit_to_t *srunp;
> @@ -255,7 +255,7 @@ index df266c20d6..05c0152ec9 100644
>               srunp = srunp->next;
>             }
>           /* Plus one for the extra NUL character marking the end of
> -@@ -3995,18 +3994,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
> +@@ -3967,18 +3966,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
>           ctype->translit_from_idx[cnt] = from_len;
>           ctype->translit_to_idx[cnt] = to_len;
>
> @@ -281,10 +281,10 @@ index df266c20d6..05c0152ec9 100644
>               srunp = srunp->next;
>             }
>  diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
> -index 32e9c41e35..6a61fcedeb 100644
> +index a755792363..e8b2f85522 100644
>  --- a/locale/programs/ld-time.c
>  +++ b/locale/programs/ld-time.c
> -@@ -215,8 +215,10 @@ No definition for %s category found"), "LC_TIME"));
> +@@ -220,8 +220,10 @@ No definition for %s category found"), "LC_TIME");
>         }
>         else
>         {
> @@ -296,7 +296,7 @@ index 32e9c41e35..6a61fcedeb 100644
>         }
>       }
>
> -@@ -226,7 +228,7 @@ No definition for %s category found"), "LC_TIME"));
> +@@ -231,7 +233,7 @@ No definition for %s category found"), "LC_TIME");
>         const int days_per_month[12] = { 31, 29, 31, 30, 31, 30,
>                                        31, 31, 30, 31 ,30, 31 };
>         size_t idx;
> @@ -305,7 +305,7 @@ index 32e9c41e35..6a61fcedeb 100644
>
>         time->era_entries =
>         (struct era_data *) xmalloc (time->num_era
> -@@ -464,18 +466,18 @@ No definition for %s category found"), "LC_TIME"));
> +@@ -457,18 +459,18 @@ No definition for %s category found"), "LC_TIME");
>             }
>
>           /* Now generate the wide character name and format.  */
> @@ -331,7 +331,7 @@ index 32e9c41e35..6a61fcedeb 100644
>                 }
>               else
>                 time->era_entries[idx].wname =
> -@@ -534,7 +536,16 @@ No definition for %s category found"), "LC_TIME"));
> +@@ -527,7 +529,16 @@ No definition for %s category found"), "LC_TIME");
>     if (time->date_fmt == NULL)
>       time->date_fmt = "%a %b %e %H:%M:%S %Z %Y";
>     if (time->wdate_fmt == NULL)
> @@ -350,7 +350,7 @@ index 32e9c41e35..6a61fcedeb 100644
>
>
>  diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
> -index 52b340963a..1a8bce17b4 100644
> +index 3525c8a43d..f8a7fd9c24 100644
>  --- a/locale/programs/linereader.c
>  +++ b/locale/programs/linereader.c
>  @@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
> @@ -363,18 +363,18 @@ index 52b340963a..1a8bce17b4 100644
>     size_t bufmax = 56;
>
>  diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
> -index 6acc1342c7..df87740f8b 100644
> +index d718d2e9f4..e0a3ad5a83 100644
>  --- a/locale/programs/localedef.c
>  +++ b/locale/programs/localedef.c
> -@@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
> - #define OPT_LIST_ARCHIVE 309
> - #define OPT_LITTLE_ENDIAN 400
> +@@ -105,6 +105,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
>   #define OPT_BIG_ENDIAN 401
> -+#define OPT_UINT32_ALIGN 402
> + #define OPT_NO_WARN 402
> + #define OPT_WARN 403
> ++#define OPT_UINT32_ALIGN 404
>
>   /* Definitions of arguments for argp functions.  */
>   static const struct argp_option options[] =
> -@@ -143,6 +144,8 @@ static const struct argp_option options[] =
> +@@ -147,6 +148,8 @@ static const struct argp_option options[] =
>       N_("Generate little-endian output") },
>     { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
>       N_("Generate big-endian output") },
> @@ -383,7 +383,7 @@ index 6acc1342c7..df87740f8b 100644
>     { NULL, 0, NULL, 0, NULL }
>   };
>
> -@@ -232,12 +235,14 @@ main (int argc, char *argv[])
> +@@ -236,12 +239,14 @@ main (int argc, char *argv[])
>        ctype locale.  (P1003.2 4.35.5.2)  */
>     setlocale (LC_CTYPE, "POSIX");
>
> @@ -392,15 +392,15 @@ index 6acc1342c7..df87740f8b 100644
>        defines error code 3 for this situation so I think it must be
>        a fatal error (see P1003.2 4.35.8).  */
>     if (sysconf (_SC_2_LOCALEDEF) < 0)
> -     WITH_CUR_LOCALE (error (3, 0, _("\
> - FATAL: system does not define `_POSIX2_LOCALEDEF'")));
> +     record_error (3, 0, _("\
> + FATAL: system does not define `_POSIX2_LOCALEDEF'"));
>  +#endif
>
>     /* Process charmap file.  */
>     charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
> -@@ -328,6 +333,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
> -     case OPT_BIG_ENDIAN:
> -       set_big_endian (true);
> +@@ -389,6 +394,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
> +       /* Enable the warnings.  */
> +       set_warnings (arg, true);
>         break;
>  +    case OPT_UINT32_ALIGN:
>  +      uint32_align_mask = strtol (arg, NULL, 0) - 1;
> @@ -409,7 +409,7 @@ index 6acc1342c7..df87740f8b 100644
>         force_output = 1;
>         break;
>  diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
> -index 0990ef11be..683422c908 100644
> +index 32e5f761f2..b41e77bd8d 100644
>  --- a/locale/programs/locfile.c
>  +++ b/locale/programs/locfile.c
>  @@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
> @@ -432,7 +432,7 @@ index 0990ef11be..683422c908 100644
>
>   /* Record that FILE's next element is the 32-bit integer VALUE.  */
>  diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
> -index 3407e13c13..0bb556caf8 100644
> +index 89b347c72d..a636fc2960 100644
>  --- a/locale/programs/locfile.h
>  +++ b/locale/programs/locfile.h
>  @@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
> @@ -521,7 +521,7 @@ index 3407e13c13..0bb556caf8 100644
>  +
>   #endif /* locfile.h */
>  diff --git a/locale/setlocale.c b/locale/setlocale.c
> -index 19acc4b2c7..c89d3b87ad 100644
> +index e4de907e1f..b5d8f5c17d 100644
>  --- a/locale/setlocale.c
>  +++ b/locale/setlocale.c
>  @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
> @@ -562,5 +562,5 @@ index 19acc4b2c7..c89d3b87ad 100644
>   # define WEAK_POSTLOAD(postload) weak_extern (postload)
>   #else
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> index 9e580d44b1f..ae708ef83e7 100644
> --- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> +++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
> @@ -1,7 +1,7 @@
> -From cb4d00eac7f84092314de593626eea40f9529038 Mon Sep 17 00:00:00 2001
> +From 9d71526be21abe68dd8ca3a5a219445851bbc2f4 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 20 Apr 2016 21:11:00 -0700
> -Subject: [PATCH 23/25] Define DUMMY_LOCALE_T if not defined
> +Subject: [PATCH 23/27] Define DUMMY_LOCALE_T if not defined
>
>  This is a hack to fix building the locale bits on an older
>  CentOs 5.X machine
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 3 insertions(+)
>
>  diff --git a/locale/programs/config.h b/locale/programs/config.h
> -index 5b416be0d8..79e66eed5e 100644
> +index 9956cd8446..04342f3644 100644
>  --- a/locale/programs/config.h
>  +++ b/locale/programs/config.h
>  @@ -19,6 +19,9 @@
> @@ -28,5 +28,5 @@ index 5b416be0d8..79e66eed5e 100644
>   #define PACKAGE _libc_intl_domainname
>   #ifndef VERSION
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> index 0b59352536d..42ff667811b 100644
> --- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> +++ b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> @@ -1,7 +1,7 @@
> -From a784742739c90eea0d4ccbbd073a067d55ca95e8 Mon Sep 17 00:00:00 2001
> +From 03873af286f1dab1062f598d6deb774ce513421d Mon Sep 17 00:00:00 2001
>  From: Mark Hatle <mark.hatle@windriver.com>
>  Date: Thu, 18 Aug 2016 14:07:58 -0500
> -Subject: [PATCH 24/25] elf/dl-deps.c: Make _dl_build_local_scope breadth first
> +Subject: [PATCH 24/27] elf/dl-deps.c: Make _dl_build_local_scope breadth first
>
>  According to the ELF specification:
>
> @@ -24,10 +24,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
>  diff --git a/elf/dl-deps.c b/elf/dl-deps.c
> -index 1b8bac6593..c616808f31 100644
> +index c975fcffd7..6ee58c74e0 100644
>  --- a/elf/dl-deps.c
>  +++ b/elf/dl-deps.c
> -@@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
> +@@ -72,13 +72,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
>   {
>     struct link_map **p = list;
>     struct link_map **q;
> @@ -52,5 +52,5 @@ index 1b8bac6593..c616808f31 100644
>   }
>
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
> index 09ad04a4d4d..7f5d1421d3c 100644
> --- a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
> +++ b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
> @@ -1,7 +1,7 @@
> -From f3a670496c8fe6d4acf045f5b167a19cf41b044e Mon Sep 17 00:00:00 2001
> +From 56dab024751941c07eb479f47ef6682e2168c86a Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
>  Date: Mon, 22 Aug 2016 16:09:25 +0200
> -Subject: [PATCH 25/25] locale: fix hard-coded reference to gcc -E
> +Subject: [PATCH 25/27] locale: fix hard-coded reference to gcc -E
>
>  When new version of compilers are published, they may not be compatible with
>  older versions of software. This is particularly common when software is built
> @@ -34,5 +34,5 @@ index 30d3f2f195..e97653017c 100644
>
>   sub cstrlen {
>  --
> -2.13.2
> +2.16.1
>
> diff --git a/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
> similarity index 63%
> rename from meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
> rename to meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
> index 777b253405c..eca1193dd37 100644
> --- a/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
> +++ b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
> @@ -1,7 +1,7 @@
> -From a6bb73d1cfd20a73fbbe6076008376fb87879d1b Mon Sep 17 00:00:00 2001
> -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> -Date: Thu, 18 Aug 2016 17:59:13 +0800
> -Subject: [PATCH] reset dl_load_write_lock after forking
> +From 847d37d5a34e4bf294de4ba98de3668950e28bc7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 27 Jan 2018 10:05:07 -0800
> +Subject: [PATCH 26/27] reset dl_load_write_lock after forking
>
>  The patch in this Bugzilla entry was requested by a customer:
>
> @@ -10,28 +10,31 @@ The patch in this Bugzilla entry was requested by a customer:
>  The __libc_fork() code reset dl_load_lock, but it also needed to reset
>  dl_load_write_lock.  The patch has not yet been integrated upstream.
>
> -Upstream-Status: Pending [ Not Author See bugzilla]
> +Upstream-Status: Pending [ No Author See bugzilla]
>
>  Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
>  Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - sysdeps/nptl/fork.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> + sysdeps/nptl/fork.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
> -index 2b9ae4b..3d0b8da 100644
> +index 846fa49ef2..f87506f398 100644
>  --- a/sysdeps/nptl/fork.c
>  +++ b/sysdeps/nptl/fork.c
> -@@ -174,8 +174,9 @@ __libc_fork (void)
> -       /* Reset locks in the I/O code.  */
> -       _IO_list_resetlock ();
> +@@ -194,9 +194,9 @@ __libc_fork (void)
> +         _IO_list_resetlock ();
> +       }
>
>  -      /* Reset the lock the dynamic loader uses to protect its data.  */
>  +      /* Reset the locks the dynamic loader uses to protect its data.  */
>         __rtld_lock_initialize (GL(dl_load_lock));
> +-
>  +      __rtld_lock_initialize (GL(dl_load_write_lock));
> -
>         /* Run the handlers registered for the child.  */
>         while (allp != NULL)
> +       {
>  --
> -1.9.1
> +2.16.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
> similarity index 76%
> rename from meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
> rename to meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
> index f76237a46e4..9ec234bd51b 100644
> --- a/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
> +++ b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
> @@ -1,4 +1,9 @@
> -The patch in this Bugzilla entry was requested by a customer:
> +From 94225ab4bcc1613531558a632270b5edce779bc9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 27 Jan 2018 10:08:04 -0800
> +Subject: [PATCH 27/27] Acquire ld.so lock before switching to malloc_atfork
> +
> +The patch is from
>    https://sourceware.org/bugzilla/show_bug.cgi?id=4578
>
>  If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
> @@ -13,6 +18,7 @@ from the parent path.  The child path is initialized as currently done.
>  This is essentially pthreads_atfork, but forced to be first because the
>  acquisition of dl_load_lock must happen before malloc_atfork is active
>  to avoid a deadlock.
> +
>  The patch has not yet been integrated upstream.
>
>  Upstream-Status: Pending [ Not Author See bugzilla]
> @@ -20,11 +26,15 @@ Upstream-Status: Pending [ Not Author See bugzilla]
>  Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
>  Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>  Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + sysdeps/nptl/fork.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
>
> -Index: git/sysdeps/nptl/fork.c
> -===================================================================
> ---- git.orig/sysdeps/nptl/fork.c       2017-08-03 16:02:15.674704080 +0800
> -+++ git/sysdeps/nptl/fork.c    2017-08-04 18:15:02.463362015 +0800
> +diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
> +index f87506f398..225e7b51f8 100644
> +--- a/sysdeps/nptl/fork.c
> ++++ b/sysdeps/nptl/fork.c
>  @@ -25,6 +25,7 @@
>   #include <tls.h>
>   #include <hp-timing.h>
> @@ -33,7 +43,7 @@ Index: git/sysdeps/nptl/fork.c
>   #include <stdio-lock.h>
>   #include <atomic.h>
>   #include <nptl/pthreadP.h>
> -@@ -60,6 +61,10 @@
> +@@ -60,6 +61,10 @@ __libc_fork (void)
>        but our current fork implementation is not.  */
>     bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
>
> @@ -44,7 +54,7 @@ Index: git/sysdeps/nptl/fork.c
>     /* Run all the registered preparation handlers.  In reverse order.
>        While doing this we build up a list of all the entries.  */
>     struct fork_handler *runp;
> -@@ -247,6 +252,10 @@
> +@@ -246,6 +251,10 @@ __libc_fork (void)
>
>           allp = allp->next;
>         }
> @@ -55,3 +65,6 @@ Index: git/sysdeps/nptl/fork.c
>       }
>
>     return pid;
> +--
> +2.16.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.27.bb
> similarity index 92%
> rename from meta/recipes-core/glibc/glibc_2.26.bb
> rename to meta/recipes-core/glibc/glibc_2.27.bb
> index 464b65434e2..e9d4117a470 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>
>  DEPENDS += "gperf-native bison-native"
>
> -SRCREV ?= "d300041c533a3d837c9f37a099bcc95466860e98"
> +SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
>
>  SRCBRANCH ?= "release/${PV}/master"
>
> @@ -40,8 +40,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
> -           file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
> -           file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> +           file://0026-reset-dl_load_write_lock-after-forking.patch \
> +           file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
>  "
>
>  NATIVESDKFIXES ?= ""
> @@ -102,10 +102,6 @@ do_configure () {
>  # version check and doesn't really help with anything
>          (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
>          find ${S} -name "configure" | xargs touch
> -        # "plural.c" may or may not get regenerated from "plural.y" so we
> -        # touch "plural.y" to make sure it does. (This should not be needed
> -        # for glibc version 2.26+)
> -        find ${S}/intl -name "plural.y" | xargs touch
>          CPPFLAGS="" oe_runconf
>  }
>
> --
> 2.11.0
>


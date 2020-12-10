Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.16956.1607620093276513707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 09:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hhy/K7h8;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id n7so4796162pgg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 09:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=q41nQlIhEr/5xghnRpATumHLi36WI1L7C45jXcsyL1s=;
        b=Hhy/K7h8dG+9+qb1ZgS0R9GebyDBd9638ciL0tkM2nS9ayJZLbCAIRWMneXL4+IEV9
         cvXpUwQh0x4qzsGE4L8jrzPXWSOXUAqU+2GLU31O8HnGqNIm3lHkqOMa6fWDUNmTORg5
         24QJsde/ILMGeEgOTE6tlnYLtHyTda/vMzcrC9ry87cHxSJrrlJQ+T/o64h7dayROHW7
         bKWwZdNCBbaSgOLkLo6IbCdXeuggOsaiw6Y3+NVss0uoOtvhajnIAGfTRHSPETA2sh9q
         Q9ityi+CxIb7SiqwEbHO6dffXiaOhKLZGsAKZggtKKDyFmGRNZbZ/IQ+hagE4yvD+ByV
         G2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q41nQlIhEr/5xghnRpATumHLi36WI1L7C45jXcsyL1s=;
        b=RzUk3XDXxN2MBXXoRRbqvPqtUjsD6WHQjRn5cuF4EYNelhtP8e+qb0Q+MjKehktNYe
         ll+v2QMVoYdC5ibhc15QUtFC3TKKsKF1RLof+ATy5NXqboOGrLJ874ky4bovfwikHPuc
         Nur3+lnNfEmX3lkCZhs9VqwrcJoUMJrZ7Ah1LHYDZwCpYdHDSdf5sGhO0ddEjdOC1gE5
         eCeGjLCMSFl3N4X4SC6n9HKzoVebDByyUDUsJuSDttNIUr1uihyU6VVjVCcCCmghm/e5
         FNGeLP7trKDxKhvDoxwvMMvHXFIdeBx/NnMGzKJwQUXjOzljFIXEU+c3wJLlBpTDyLQl
         b+wQ==
X-Gm-Message-State: AOAM5328cz5skioB2fIpST7ZovSNwqM6koM6G9Z7Z6J00L4u4j8sFio4
	lEC8TMAEDKj4ECbgoQ4uVDVNUveZ37vt5A==
X-Google-Smtp-Source: ABdhPJymwmVpppN/owzR/zeueUk4aW2qpuKNORD8KycE+Nrk0RUbCxo2AlMLSBn0GjXFJtohoUZaWg==
X-Received: by 2002:a63:ca49:: with SMTP id o9mr7399279pgi.439.1607620089499;
        Thu, 10 Dec 2020 09:08:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::5bf5? ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id x12sm6975071pfj.25.2020.12.10.09.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:08:08 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com>
Date: Thu, 10 Dec 2020 09:08:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201210125312.3302065-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/10/20 4:53 AM, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Update systemd to v247.1.
> Add rule for new oomd dbus conf and for new pam.d
> conf directory in /usr/lib.
> Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> merged upstream.
> Backport 0001-meson-set-cxx-variable-before-using-it.patch
> from v247-stable to fix builds without C++.
> Refresh musl patches.
> 

perhaps we need to update systemd-conf and systemd-boot recipes as well here

> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> NOTE: the musl build has only been build-tested, and only on x86_64.
> The glibc build has been built and runtime-tested on x86_64 and arm64.
> 
>   ...md-boot_246.6.bb => systemd-boot_247.1.bb} |   3 +
>   ...md-conf_246.1.bb => systemd-conf_247.1.bb} |   0
>   meta/recipes-core/systemd/systemd.inc         |   4 +-
>   ...tall-dependency-links-at-install-tim.patch |   8 +-
>   ...son-set-cxx-variable-before-using-it.patch |  35 +++
>   ...se-ROOTPREFIX-without-suffixed-slash.patch |   6 +-
>   ...002-don-t-use-glibc-specific-qsort_r.patch |  57 +++--
>   ...dd-__compare_fn_t-and-comparison_fn_.patch |  16 +-
>   ...k-parse_printf_format-implementation.patch |  60 ++---
>   ...missing.h-check-for-missing-strndupa.patch | 158 ++++++------
>   .../0006-Include-netinet-if_ether.h.patch     | 237 +++++++++++-------
>   ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  41 +--
>   ...008-add-missing-FTW_-macros-for-musl.patch |  10 +-
>   ...register_atfork-for-non-glibc-build.patch} |  16 +-
>   ...0-Use-uintmax_t-for-handling-rlim_t.patch} |  40 +--
>   ...able-tests-for-missing-typedefs-in-.patch} |  15 +-
>   ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  32 +--
>   ...atible-basename-for-non-glibc-syste.patch} |  17 +-
>   ...ffering-when-writing-to-oom_score_a.patch} |  16 +-
>   ...ompliant-strerror_r-from-GNU-specif.patch} |  28 ++-
>   ..._ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch} |  12 +-
>   ...pe.h-add-__compar_d_fn_t-definition.patch} |  10 +-
>   ...efinition-of-prctl_mm_map-structure.patch} |  12 +-
>   ...atch => 0019-Handle-missing-LOCK_EX.patch} |  11 +-
>   ...ble-pointer-type-struct-sockaddr_un.patch} |  11 +-
>   ...ch => 0021-test-json.c-define-M_PIl.patch} |  12 +-
>   ...not-disable-buffer-in-writing-files.patch} | 206 +++++++--------
>   ....h.patch => 0023-Include-sys-wait.h.patch} |  12 +-
>   ...al.h.patch => 0024-Include-signal.h.patch} |  10 +-
>   ...tch => 0025-Handle-__cpu_mask-usage.patch} |  14 +-
>   ...atch => 0026-Handle-missing-gshadow.patch} |  65 +++--
>   ...x-hook-handling-to-enumerate-nexthop.patch |  46 ----
>   .../{systemd_246.6.bb => systemd_247.1.bb}    |  42 ++--
>   33 files changed, 685 insertions(+), 577 deletions(-)
>   rename meta/recipes-core/systemd/{systemd-boot_246.6.bb => systemd-boot_247.1.bb} (96%)
>   rename meta/recipes-core/systemd/{systemd-conf_246.1.bb => systemd-conf_247.1.bb} (100%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-set-cxx-variable-before-using-it.patch
>   rename meta/recipes-core/systemd/systemd/{0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch => 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (80%)
>   rename meta/recipes-core/systemd/systemd/{0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch => 0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch} (77%)
>   rename meta/recipes-core/systemd/systemd/{0011-Use-uintmax_t-for-handling-rlim_t.patch => 0010-Use-uintmax_t-for-handling-rlim_t.patch} (77%)
>   rename meta/recipes-core/systemd/systemd/{0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (75%)
>   rename meta/recipes-core/systemd/systemd/{0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (83%)
>   rename meta/recipes-core/systemd/systemd/{0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch => 0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch} (64%)
>   rename meta/recipes-core/systemd/systemd/{0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch => 0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch} (76%)
>   rename meta/recipes-core/systemd/systemd/{0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch => 0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch} (67%)
>   rename meta/recipes-core/systemd/systemd/{0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch => 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch} (81%)
>   rename meta/recipes-core/systemd/systemd/{0020-missing_type.h-add-__compar_d_fn_t-definition.patch => 0017-missing_type.h-add-__compar_d_fn_t-definition.patch} (79%)
>   rename meta/recipes-core/systemd/systemd/{0021-avoid-redefinition-of-prctl_mm_map-structure.patch => 0018-avoid-redefinition-of-prctl_mm_map-structure.patch} (73%)
>   rename meta/recipes-core/systemd/systemd/{0021-Handle-missing-LOCK_EX.patch => 0019-Handle-missing-LOCK_EX.patch} (74%)
>   rename meta/recipes-core/systemd/systemd/{0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch => 0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch} (88%)
>   rename meta/recipes-core/systemd/systemd/{0024-test-json.c-define-M_PIl.patch => 0021-test-json.c-define-M_PIl.patch} (80%)
>   rename meta/recipes-core/systemd/systemd/{0001-do-not-disable-buffer-in-writing-files.patch => 0022-do-not-disable-buffer-in-writing-files.patch} (71%)
>   rename meta/recipes-core/systemd/systemd/{0002-src-login-brightness.c-include-sys-wait.h.patch => 0023-Include-sys-wait.h.patch} (81%)
>   rename meta/recipes-core/systemd/systemd/{0003-src-basic-copy.c-include-signal.h.patch => 0024-Include-signal.h.patch} (86%)
>   rename meta/recipes-core/systemd/systemd/{0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch => 0025-Handle-__cpu_mask-usage.patch} (87%)
>   rename meta/recipes-core/systemd/systemd/{0001-Handle-missing-gshadow.patch => 0026-Handle-missing-gshadow.patch} (67%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-nexthop.patch
>   rename meta/recipes-core/systemd/{systemd_246.6.bb => systemd_247.1.bb} (96%)
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot_246.6.bb b/meta/recipes-core/systemd/systemd-boot_247.1.bb
> similarity index 96%
> rename from meta/recipes-core/systemd/systemd-boot_246.6.bb
> rename to meta/recipes-core/systemd/systemd-boot_247.1.bb
> index f92c639810..383407864e 100644
> --- a/meta/recipes-core/systemd/systemd-boot_246.6.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_247.1.bb
> @@ -1,6 +1,9 @@
>   require systemd.inc
>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>   
> +SRC_URI += "file://0001-meson-set-cxx-variable-before-using-it.patch \
> +           "
> +
>   require conf/image-uefi.conf
>   
>   DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> diff --git a/meta/recipes-core/systemd/systemd-conf_246.1.bb b/meta/recipes-core/systemd/systemd-conf_247.1.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-conf_246.1.bb
> rename to meta/recipes-core/systemd/systemd-conf_247.1.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 1733565fc0..27c2ab394e 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                       file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRCREV = "2ee1c57c4ff4fd3349cf03c2e89fbd18ca0b3a4a"
> -SRCBRANCH = "v246-stable"
> +SRCREV = "dc057df84c93274283cd228bc56733bc03a54195"
> +SRCBRANCH = "v247-stable"
>   SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
>   
>   S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 2676c144f2..8dd22eeb7b 100644
> --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -29,7 +29,7 @@ Index: systemd-stable/units/meson.build
>   ===================================================================
>   --- systemd-stable.orig/units/meson.build
>   +++ systemd-stable/units/meson.build
> -@@ -54,8 +54,7 @@ units = [
> +@@ -55,8 +55,7 @@ units = [
>            ['poweroff.target',                     '',
>             (with_runlevels ? 'runlevel0.target' : '')],
>            ['printer.target',                      ''],
> @@ -38,8 +38,8 @@ Index: systemd-stable/units/meson.build
>   +        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
>            ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
>            ['reboot.target',                       '',
> -          (with_runlevels ? 'runlevel6.target ctrl-alt-del.target' : 'ctrl-alt-del.target')],
> -@@ -162,8 +161,7 @@ in_units = [
> +          'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
> +@@ -166,8 +165,7 @@ in_units = [
>            ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
>            ['rescue.service',                       ''],
>            ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
> @@ -64,7 +64,7 @@ Index: systemd-stable/units/systemd-binfmt.service.in
>   ===================================================================
>   --- systemd-stable.orig/units/systemd-binfmt.service.in
>   +++ systemd-stable/units/systemd-binfmt.service.in
> -@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc
> +@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
>    Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>    DefaultDependencies=no
>    Conflicts=shutdown.target
> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-set-cxx-variable-before-using-it.patch b/meta/recipes-core/systemd/systemd/0001-meson-set-cxx-variable-before-using-it.patch
> new file mode 100644
> index 0000000000..f2c4fef9d6
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-meson-set-cxx-variable-before-using-it.patch
> @@ -0,0 +1,35 @@
> +From a92e45545978c230f8cc5018b6a9e50219247bfe Mon Sep 17 00:00:00 2001
> +From: Luca Boccassi <luca.boccassi@microsoft.com>
> +Date: Thu, 3 Dec 2020 16:17:43 +0000
> +Subject: [PATCH] meson: set cxx variable before using it
> +
> +In some cases it is not defined. Eg in a yocto build:
> +
> +src/systemd/meson.build:61:15: ERROR: Unknown variable cxx.
> +
> +(cherry picked from commit 442bc2afee6c5f731c7b3e76ccab7301703a45a7)
> +(cherry picked from commit 4ef70ecefce071f2c2461984b347cdbafcce6f06)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> +---
> + src/systemd/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/systemd/meson.build b/src/systemd/meson.build
> +index c9c484b411..3d328e5fd3 100644
> +--- a/src/systemd/meson.build
> ++++ b/src/systemd/meson.build
> +@@ -54,7 +54,7 @@ if cc.has_argument('-std=iso9899:2017')
> +         opts += [['c', '-std=iso9899:2017']]
> + endif
> +
> +-if add_languages('cpp', required : false)
> ++if cxx_cmd != ''
> +         opts += [['c++'],
> +                  ['c++', '-std=c++98'],
> +                  ['c++', '-std=c++11']]
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
> index 622a4108bb..e49e06672e 100644
> --- a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
> @@ -14,8 +14,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   --- a/src/core/systemd.pc.in
>   +++ b/src/core/systemd.pc.in
> -@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_di
> - tmpfiles_dir=${prefix}/lib/tmpfiles.d
> +@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
> + tmpfiles_dir=/usr/lib/tmpfiles.d
>    tmpfilesdir=${tmpfiles_dir}
>    
>   -sysusers_dir=${rootprefix}/lib/sysusers.d
> @@ -34,4 +34,4 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   +modules_load_dir=${prefix}/lib/modules-load.d
>    modulesloaddir=${modules_load_dir}
>    
> - catalog_dir=${prefix}/lib/systemd/catalog
> + catalog_dir=/usr/lib/systemd/catalog
> diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> index 30fe9a14df..d856bcb583 100644
> --- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> @@ -1,7 +1,7 @@
> -From 3eb12a6ba0bce149717eaabeb1505d379b3d705a Mon Sep 17 00:00:00 2001
> +From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 13:41:41 +0800
> -Subject: [PATCH] don't use glibc-specific qsort_r
> +Subject: [PATCH 02/26] don't use glibc-specific qsort_r
>   
>   Upstream-Status: Inappropriate [musl specific]
>   
> @@ -10,18 +10,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [Rebased for v242]
>   Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> +[Rebased for v247]
> +Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   ---
>    src/basic/sort-util.h              | 14 ------------
>    src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
>    src/shared/format-table.c          | 36 ++++++++++++++++++++----------
>    3 files changed, 38 insertions(+), 31 deletions(-)
>   
> -Index: systemd-stable/src/basic/sort-util.h
> -===================================================================
> ---- systemd-stable.orig/src/basic/sort-util.h
> -+++ systemd-stable/src/basic/sort-util.h
> -@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *bas
> +diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
> +index 1d194a1f04..3394c9eb72 100644
> +--- a/src/basic/sort-util.h
> ++++ b/src/basic/sort-util.h
> +@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
>                    int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
>                    _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
>            })
> @@ -39,11 +40,11 @@ Index: systemd-stable/src/basic/sort-util.h
>   -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
>   -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
>   -        })
> -Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
> -===================================================================
> ---- systemd-stable.orig/src/libsystemd/sd-hwdb/hwdb-util.c
> -+++ systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
> -@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie)
> +diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
> +index 4c94ba9c88..95495dba6d 100644
> +--- a/src/libsystemd/sd-hwdb/hwdb-util.c
> ++++ b/src/libsystemd/sd-hwdb/hwdb-util.c
> +@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {
>    
>    DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
>    
> @@ -60,7 +61,7 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
>    }
>    
>    static int trie_node_add_value(struct trie *trie, struct trie_node *node,
> -@@ -158,7 +162,10 @@ static int trie_node_add_value(struct tr
> +@@ -156,7 +160,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>                            .value_off = v,
>                    };
>    
> @@ -72,7 +73,7 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
>                    if (val) {
>                            /* At this point we have 2 identical properties on the same match-string.
>                             * Since we process files in order, we just replace the previous value. */
> -@@ -184,7 +191,9 @@ static int trie_node_add_value(struct tr
> +@@ -182,7 +189,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>                    .line_number = line_number,
>            };
>            node->values_count++;
> @@ -83,11 +84,11 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
>            return 0;
>    }
>    
> -Index: systemd-stable/src/shared/format-table.c
> -===================================================================
> ---- systemd-stable.orig/src/shared/format-table.c
> -+++ systemd-stable/src/shared/format-table.c
> -@@ -1246,31 +1246,33 @@ static int cell_data_compare(TableData *
> +diff --git a/src/shared/format-table.c b/src/shared/format-table.c
> +index a13a198b7a..bce10bc607 100644
> +--- a/src/shared/format-table.c
> ++++ b/src/shared/format-table.c
> +@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
>            return CMP(index_a, index_b);
>    }
>    
> @@ -95,7 +96,6 @@ Index: systemd-stable/src/shared/format-table.c
>   +static Table *user_table;
>   +static int table_data_compare(const void *x, const void *y) {
>   +        const size_t *a = x, *b=y;
> -         size_t i;
>            int r;
>    
>   -        assert(t);
> @@ -115,8 +115,8 @@ Index: systemd-stable/src/shared/format-table.c
>                    return 1;
>    
>            /* Order other lines by the sorting map */
> --        for (i = 0; i < t->n_sort_map; i++) {
> -+        for (i = 0; i < user_table->n_sort_map; i++) {
> +-        for (size_t i = 0; i < t->n_sort_map; i++) {
> ++        for (size_t i = 0; i < user_table->n_sort_map; i++) {
>                    TableData *d, *dd;
>    
>   -                d = t->data[*a + t->sort_map[i]];
> @@ -131,8 +131,8 @@ Index: systemd-stable/src/shared/format-table.c
>            }
>    
>            /* Order identical lines by the order there were originally added in */
> -@@ -1798,7 +1800,12 @@ int table_print(Table *t, FILE *f) {
> -                 for (i = 0; i < n_rows; i++)
> +@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {
> +                 for (size_t i = 0; i < n_rows; i++)
>                            sorted[i] = i * t->n_columns;
>    
>   -                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
> @@ -145,8 +145,8 @@ Index: systemd-stable/src/shared/format-table.c
>            }
>    
>            if (t->display_map)
> -@@ -2375,7 +2382,12 @@ int table_to_json(Table *t, JsonVariant
> -                 for (i = 0; i < n_rows; i++)
> +@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
> +                 for (size_t i = 0; i < n_rows; i++)
>                            sorted[i] = i * t->n_columns;
>    
>   -                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
> @@ -159,3 +159,6 @@ Index: systemd-stable/src/shared/format-table.c
>            }
>    
>            if (t->display_map)
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> index 1404895143..f43a22aa8b 100644
> --- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> @@ -1,7 +1,7 @@
> -From 233de872b9b033ec842c2135152d2e006ac44c16 Mon Sep 17 00:00:00 2001
> +From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 13:55:12 +0800
> -Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
> +Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and comparison_fn_t
>   
>   Make it work with musl where comparison_fn_t and __compare_fn_t
>   is not provided.
> @@ -13,7 +13,6 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [Rebased for v242]
>   Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
>   ---
>    src/basic/missing_type.h | 9 +++++++++
>    src/basic/sort-util.h    | 1 +
> @@ -22,7 +21,7 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>    4 files changed, 12 insertions(+)
>   
>   diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
> -index bf8a6caa1b46..c487e65e7bde 100644
> +index f6233090a9..aeaf6ad5ec 100644
>   --- a/src/basic/missing_type.h
>   +++ b/src/basic/missing_type.h
>   @@ -10,3 +10,12 @@
> @@ -39,7 +38,7 @@ index bf8a6caa1b46..c487e65e7bde 100644
>   +typedef int (*__compar_fn_t)(const void *, const void *);
>   +#endif
>   diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
> -index 27d68b341cf3..307ea4ac0e8e 100644
> +index 3394c9eb72..d9cb2aecb6 100644
>   --- a/src/basic/sort-util.h
>   +++ b/src/basic/sort-util.h
>   @@ -4,6 +4,7 @@
> @@ -51,7 +50,7 @@ index 27d68b341cf3..307ea4ac0e8e 100644
>    void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
>                     __compar_d_fn_t compar, void *arg);
>   diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
> -index 128674327362..09ccd613e32c 100644
> +index 8a7f82812a..a56f12f47f 100644
>   --- a/src/core/kmod-setup.c
>   +++ b/src/core/kmod-setup.c
>   @@ -10,6 +10,7 @@
> @@ -63,7 +62,7 @@ index 128674327362..09ccd613e32c 100644
>    #if HAVE_KMOD
>    #include "module-util.h"
>   diff --git a/src/journal/catalog.c b/src/journal/catalog.c
> -index 70b2c8b46c4e..d574a64586f1 100644
> +index 0f6ad8a29e..4e1077ade4 100644
>   --- a/src/journal/catalog.c
>   +++ b/src/journal/catalog.c
>   @@ -28,6 +28,7 @@
> @@ -74,3 +73,6 @@ index 70b2c8b46c4e..d574a64586f1 100644
>    
>    const char * const catalog_file_dirs[] = {
>            "/usr/local/lib/systemd/catalog/",
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> index e65c543614..bdd64a0252 100644
> --- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> @@ -1,7 +1,7 @@
> -From 8af168cefca01f8f2da336f1c82620c284dc74f2 Mon Sep 17 00:00:00 2001
> +From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 14:04:21 +0800
> -Subject: [PATCH] add fallback parse_printf_format implementation
> +Subject: [PATCH 04/26] add fallback parse_printf_format implementation
>   
>   Upstream-Status: Inappropriate [musl specific]
>   
> @@ -10,7 +10,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [rebased for systemd 243]
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    meson.build                     |   1 +
>    src/basic/meson.build           |   5 +
> @@ -22,11 +21,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>    create mode 100644 src/basic/parse-printf-format.c
>    create mode 100644 src/basic/parse-printf-format.h
>   
> -Index: systemd-stable/meson.build
> -===================================================================
> ---- systemd-stable.orig/meson.build
> -+++ systemd-stable/meson.build
> -@@ -638,6 +638,7 @@ endif
> +diff --git a/meson.build b/meson.build
> +index f406d595e6..6aa47fc755 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -646,6 +646,7 @@ endif
>    foreach header : ['crypt.h',
>                      'linux/memfd.h',
>                      'linux/vm_sockets.h',
> @@ -34,11 +33,11 @@ Index: systemd-stable/meson.build
>                      'sys/auxv.h',
>                      'valgrind/memcheck.h',
>                      'valgrind/valgrind.h',
> -Index: systemd-stable/src/basic/meson.build
> -===================================================================
> ---- systemd-stable.orig/src/basic/meson.build
> -+++ systemd-stable/src/basic/meson.build
> -@@ -317,6 +317,11 @@ foreach item : [['af',     af_list_txt,
> +diff --git a/src/basic/meson.build b/src/basic/meson.build
> +index 1183ea83ad..aa5c958850 100644
> +--- a/src/basic/meson.build
> ++++ b/src/basic/meson.build
> +@@ -322,6 +322,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
>    endforeach
>    
>    basic_sources += generated_gperf_headers
> @@ -50,10 +49,11 @@ Index: systemd-stable/src/basic/meson.build
>    basic_gcrypt_sources = files(
>            'gcrypt-util.c',
>            'gcrypt-util.h')
> -Index: systemd-stable/src/basic/parse-printf-format.c
> -===================================================================
> +diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
> +new file mode 100644
> +index 0000000000..49437e5445
>   --- /dev/null
> -+++ systemd-stable/src/basic/parse-printf-format.c
> ++++ b/src/basic/parse-printf-format.c
>   @@ -0,0 +1,273 @@
>   +/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
>   +
> @@ -328,10 +328,11 @@ Index: systemd-stable/src/basic/parse-printf-format.c
>   +
>   +        return last;
>   +}
> -Index: systemd-stable/src/basic/parse-printf-format.h
> -===================================================================
> +diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
> +new file mode 100644
> +index 0000000000..47be7522d7
>   --- /dev/null
> -+++ systemd-stable/src/basic/parse-printf-format.h
> ++++ b/src/basic/parse-printf-format.h
>   @@ -0,0 +1,57 @@
>   +/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
>   +
> @@ -390,12 +391,12 @@ Index: systemd-stable/src/basic/parse-printf-format.h
>   +size_t parse_printf_format(const char *fmt, size_t n, int *types);
>   +
>   +#endif /* HAVE_PRINTF_H */
> -Index: systemd-stable/src/basic/stdio-util.h
> -===================================================================
> ---- systemd-stable.orig/src/basic/stdio-util.h
> -+++ systemd-stable/src/basic/stdio-util.h
> +diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
> +index 6dc1e72312..cea76b36cf 100644
> +--- a/src/basic/stdio-util.h
> ++++ b/src/basic/stdio-util.h
>   @@ -1,13 +1,13 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    #pragma once
>    
>   -#include <printf.h>
> @@ -409,10 +410,10 @@ Index: systemd-stable/src/basic/stdio-util.h
>    
>    #define snprintf_ok(buf, len, fmt, ...) \
>            ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
> -Index: systemd-stable/src/journal/journal-send.c
> -===================================================================
> ---- systemd-stable.orig/src/journal/journal-send.c
> -+++ systemd-stable/src/journal/journal-send.c
> +diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> +index fd3fd7ef9c..e8e6ad555b 100644
> +--- a/src/journal/journal-send.c
> ++++ b/src/journal/journal-send.c
>   @@ -2,7 +2,6 @@
>    
>    #include <errno.h>
> @@ -429,3 +430,6 @@ Index: systemd-stable/src/journal/journal-send.c
>    
>    #define SNDBUF_SIZE (8*1024*1024)
>    
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> index 8e7a2fb6e4..154e57b540 100644
> --- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> +++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> @@ -1,7 +1,7 @@
> -From 7e771de87cf728a8678f1f28f391bba3589e2496 Mon Sep 17 00:00:00 2001
> +From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 14:18:21 +0800
> -Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> +Subject: [PATCH 05/26] src/basic/missing.h: check for missing strndupa
>   
>   include missing.h  for definition of strndupa
>   
> @@ -15,7 +15,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>   [rebased for systemd 244]
> -
> +[Rebased for v247]
> +Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   ---
>    meson.build                                |  1 +
>    src/backlight/backlight.c                  |  1 +
> @@ -70,31 +71,31 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    50 files changed, 61 insertions(+)
>   
>   diff --git a/meson.build b/meson.build
> -index 9187439bdd..bea9935a91 100644
> +index 6aa47fc755..0d0fa4963c 100644
>   --- a/meson.build
>   +++ b/meson.build
> -@@ -527,6 +527,7 @@ foreach ident : [
> -                                  #include <unistd.h>
> -                                  #include <signal.h>
> +@@ -535,6 +535,7 @@ foreach ident : [
>                                     #include <sys/wait.h>'''],
> +         ['mallinfo',          '''#include <malloc.h>'''],
> +         ['close_range',       '''#include <unistd.h>'''],
>   +        ['strndupa' ,         '''#include <string.h>'''],
>    ]
>    
>            have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
>   diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
> -index 3a644363e1..73946a829b 100644
> +index d1b6a81e33..38b7008371 100644
>   --- a/src/backlight/backlight.c
>   +++ b/src/backlight/backlight.c
> -@@ -17,6 +17,7 @@
> +@@ -19,6 +19,7 @@
>    #include "string-util.h"
>    #include "strv.h"
>    #include "util.h"
>   +#include "missing_stdlib.h"
>    
> - static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
> -         const char *subsystem, *sysname, *value;
> + static int help(void) {
> +         _cleanup_free_ char *link = NULL;
>   diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> -index e94fcfad02..856a7068b0 100644
> +index f28bf1866a..bb960f183c 100644
>   --- a/src/basic/cgroup-util.c
>   +++ b/src/basic/cgroup-util.c
>   @@ -38,6 +38,7 @@
> @@ -106,7 +107,7 @@ index e94fcfad02..856a7068b0 100644
>    static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
>            _cleanup_free_ char *fs = NULL;
>   diff --git a/src/basic/env-util.c b/src/basic/env-util.c
> -index b8dc98915f..5049b37594 100644
> +index a84863ff22..d4f5d57231 100644
>   --- a/src/basic/env-util.c
>   +++ b/src/basic/env-util.c
>   @@ -15,6 +15,7 @@
> @@ -115,13 +116,13 @@ index b8dc98915f..5049b37594 100644
>    #include "utf8.h"
>   +#include "missing_stdlib.h"
>    
> - #define VALID_CHARS_ENV_NAME                    \
> -         DIGITS LETTERS                          \
> + /* We follow bash for the character set. Different shells have different rules. */
> + #define VALID_BASH_ENV_NAME_CHARS               \
>   diff --git a/src/basic/log.c b/src/basic/log.c
> -index c6fe203808..b7ef932d28 100644
> +index d4054cf46a..b608863e45 100644
>   --- a/src/basic/log.c
>   +++ b/src/basic/log.c
> -@@ -35,6 +35,7 @@
> +@@ -36,6 +36,7 @@
>    #include "terminal-util.h"
>    #include "time-util.h"
>    #include "utf8.h"
> @@ -130,7 +131,7 @@ index c6fe203808..b7ef932d28 100644
>    #define SNDBUF_SIZE (8*1024*1024)
>    
>   diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
> -index 188a8d4406..1e16ec287a 100644
> +index 8c76f93eb2..9068bfb4f0 100644
>   --- a/src/basic/missing_stdlib.h
>   +++ b/src/basic/missing_stdlib.h
>   @@ -11,3 +11,15 @@
> @@ -150,10 +151,10 @@ index 188a8d4406..1e16ec287a 100644
>   +  })
>   +#endif
>   diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> -index 6ebc2b95fd..88f4359bab 100644
> +index f91f8f7a08..fb31596216 100644
>   --- a/src/basic/mkdir.c
>   +++ b/src/basic/mkdir.c
> -@@ -13,6 +13,7 @@
> +@@ -14,6 +14,7 @@
>    #include "stat-util.h"
>    #include "stdio-util.h"
>    #include "user-util.h"
> @@ -162,10 +163,10 @@ index 6ebc2b95fd..88f4359bab 100644
>    int mkdir_safe_internal(
>                    const char *path,
>   diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> -index 44f0438cf4..54b4133343 100644
> +index 5d4dafe3a5..70749750d4 100644
>   --- a/src/basic/parse-util.c
>   +++ b/src/basic/parse-util.c
> -@@ -19,6 +19,7 @@
> +@@ -22,6 +22,7 @@
>    #include "stat-util.h"
>    #include "string-util.h"
>    #include "strv.h"
> @@ -174,7 +175,7 @@ index 44f0438cf4..54b4133343 100644
>    int parse_boolean(const char *v) {
>            if (!v)
>   diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
> -index 52968dee34..2f4f7e3dcd 100644
> +index 96b82170d0..71342b46af 100644
>   --- a/src/basic/path-lookup.c
>   +++ b/src/basic/path-lookup.c
>   @@ -15,6 +15,7 @@
> @@ -186,7 +187,7 @@ index 52968dee34..2f4f7e3dcd 100644
>    int xdg_user_runtime_dir(char **ret, const char *suffix) {
>            const char *e;
>   diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
> -index ba47ca5812..8baf728fde 100644
> +index 0b6fb137bd..e8e8c7b270 100644
>   --- a/src/basic/proc-cmdline.c
>   +++ b/src/basic/proc-cmdline.c
>   @@ -15,6 +15,7 @@
> @@ -198,7 +199,7 @@ index ba47ca5812..8baf728fde 100644
>    int proc_cmdline(char **ret) {
>            const char *e;
>   diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> -index 7aaf95bfce..da7e836f14 100644
> +index ccab71f7d2..8f9eee8d36 100644
>   --- a/src/basic/procfs-util.c
>   +++ b/src/basic/procfs-util.c
>   @@ -11,6 +11,7 @@
> @@ -210,7 +211,7 @@ index 7aaf95bfce..da7e836f14 100644
>    int procfs_tasks_get_limit(uint64_t *ret) {
>            _cleanup_free_ char *value = NULL;
>   diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
> -index c94ee26bd9..14e35b4653 100644
> +index 4989f4f37c..ca00bf99d8 100644
>   --- a/src/basic/selinux-util.c
>   +++ b/src/basic/selinux-util.c
>   @@ -27,6 +27,7 @@
> @@ -222,10 +223,10 @@ index c94ee26bd9..14e35b4653 100644
>    #if HAVE_SELINUX
>    DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
>   diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> -index 15cc1b8851..02bb3f01f9 100644
> +index 5318d6378d..23c2f77675 100644
>   --- a/src/basic/time-util.c
>   +++ b/src/basic/time-util.c
> -@@ -26,6 +26,7 @@
> +@@ -27,6 +27,7 @@
>    #include "string-util.h"
>    #include "strv.h"
>    #include "time-util.h"
> @@ -234,7 +235,7 @@ index 15cc1b8851..02bb3f01f9 100644
>    static clockid_t map_clock_id(clockid_t c) {
>    
>   diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
> -index b96e1f927f..cba979baca 100644
> +index cd34f88bb9..3a77b6f2ca 100644
>   --- a/src/boot/bless-boot.c
>   +++ b/src/boot/bless-boot.c
>   @@ -18,6 +18,7 @@
> @@ -246,10 +247,10 @@ index b96e1f927f..cba979baca 100644
>    static char **arg_path = NULL;
>    
>   diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
> -index b7d2e32639..fdbc1df95e 100644
> +index 37c581fb22..e02789d689 100644
>   --- a/src/core/dbus-cgroup.c
>   +++ b/src/core/dbus-cgroup.c
> -@@ -15,6 +15,7 @@
> +@@ -16,6 +16,7 @@
>    #include "fileio.h"
>    #include "limits-util.h"
>    #include "path-util.h"
> @@ -258,7 +259,7 @@ index b7d2e32639..fdbc1df95e 100644
>    BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
>    
>   diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
> -index 50f7ada8ce..5c760ee487 100644
> +index abe009c395..0451e58d1c 100644
>   --- a/src/core/dbus-execute.c
>   +++ b/src/core/dbus-execute.c
>   @@ -41,6 +41,7 @@
> @@ -270,7 +271,7 @@ index 50f7ada8ce..5c760ee487 100644
>    BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
>    static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
>   diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
> -index 951450e53d..50d134e9a1 100644
> +index d6223db305..3654c344ee 100644
>   --- a/src/core/dbus-util.c
>   +++ b/src/core/dbus-util.c
>   @@ -7,6 +7,7 @@
> @@ -282,10 +283,10 @@ index 951450e53d..50d134e9a1 100644
>    int bus_property_get_triggered_unit(
>                    sd_bus *bus,
>   diff --git a/src/core/execute.c b/src/core/execute.c
> -index 2a4840a3a9..d3f1e0e0f8 100644
> +index c992b8d5d3..89632e0582 100644
>   --- a/src/core/execute.c
>   +++ b/src/core/execute.c
> -@@ -89,6 +89,7 @@
> +@@ -96,6 +96,7 @@
>    #include "unit.h"
>    #include "user-util.h"
>    #include "utmp-wtmp.h"
> @@ -294,7 +295,7 @@ index 2a4840a3a9..d3f1e0e0f8 100644
>    #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
>    #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
>   diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
> -index 09ccd613e3..f4e64fa283 100644
> +index a56f12f47f..6b8729ef67 100644
>   --- a/src/core/kmod-setup.c
>   +++ b/src/core/kmod-setup.c
>   @@ -11,6 +11,7 @@
> @@ -306,7 +307,7 @@ index 09ccd613e3..f4e64fa283 100644
>    #if HAVE_KMOD
>    #include "module-util.h"
>   diff --git a/src/core/service.c b/src/core/service.c
> -index 00e61945ba..1ecab28354 100644
> +index d7bdeb7cca..bfd483b2c0 100644
>   --- a/src/core/service.c
>   +++ b/src/core/service.c
>   @@ -41,6 +41,7 @@
> @@ -318,7 +319,7 @@ index 00e61945ba..1ecab28354 100644
>    static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
>            [SERVICE_DEAD] = UNIT_INACTIVE,
>   diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
> -index 35885dfb47..bb9f0660a6 100644
> +index 30c67ffe7c..595bc30726 100644
>   --- a/src/coredump/coredump-vacuum.c
>   +++ b/src/coredump/coredump-vacuum.c
>   @@ -16,6 +16,7 @@
> @@ -330,7 +331,7 @@ index 35885dfb47..bb9f0660a6 100644
>    #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
>    #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
>   diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
> -index 77dfdefd64..e21ecbeff8 100644
> +index d2aa1815c2..a851aa203f 100644
>   --- a/src/journal-remote/journal-remote-main.c
>   +++ b/src/journal-remote/journal-remote-main.c
>   @@ -22,6 +22,7 @@
> @@ -342,10 +343,10 @@ index 77dfdefd64..e21ecbeff8 100644
>    #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
>    #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
>   diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
> -index 8d4897b942..15476b3c83 100644
> +index bcf2e01d5c..5394d1dc01 100644
>   --- a/src/journal/journalctl.c
>   +++ b/src/journal/journalctl.c
> -@@ -69,6 +69,7 @@
> +@@ -73,6 +73,7 @@
>    #include "unit-name.h"
>    #include "user-util.h"
>    #include "varlink.h"
> @@ -354,7 +355,7 @@ index 8d4897b942..15476b3c83 100644
>    #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
>    #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
>   diff --git a/src/journal/sd-journal.c b/src/journal/sd-journal.c
> -index 6fb0abb419..2d94d9938e 100644
> +index cb1ab88ca5..7f35759540 100644
>   --- a/src/journal/sd-journal.c
>   +++ b/src/journal/sd-journal.c
>   @@ -40,6 +40,7 @@
> @@ -366,7 +367,7 @@ index 6fb0abb419..2d94d9938e 100644
>    #define JOURNAL_FILES_MAX 7168
>    
>   diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
> -index 55e35cd902..0ed98f9224 100644
> +index 86ff5bdfa2..3fd053a358 100644
>   --- a/src/libsystemd/sd-bus/bus-message.c
>   +++ b/src/libsystemd/sd-bus/bus-message.c
>   @@ -21,6 +21,7 @@
> @@ -378,7 +379,7 @@ index 55e35cd902..0ed98f9224 100644
>    static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
>    
>   diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
> -index 6abac8822c..c74c9cd7fa 100644
> +index 275c4318a1..5ffee59d17 100644
>   --- a/src/libsystemd/sd-bus/bus-objects.c
>   +++ b/src/libsystemd/sd-bus/bus-objects.c
>   @@ -13,6 +13,7 @@
> @@ -390,7 +391,7 @@ index 6abac8822c..c74c9cd7fa 100644
>    static int node_vtable_get_userdata(
>                    sd_bus *bus,
>   diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
> -index fc7e8e844a..7af4dd2712 100644
> +index 4881fd0d32..c865f1133b 100644
>   --- a/src/libsystemd/sd-bus/bus-socket.c
>   +++ b/src/libsystemd/sd-bus/bus-socket.c
>   @@ -28,6 +28,7 @@
> @@ -402,7 +403,7 @@ index fc7e8e844a..7af4dd2712 100644
>    #define SNDBUF_SIZE (8*1024*1024)
>    
>   diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
> -index 9de5e454a6..fe86c93c63 100644
> +index b8d4dc8d95..a8bac2665d 100644
>   --- a/src/libsystemd/sd-bus/sd-bus.c
>   +++ b/src/libsystemd/sd-bus/sd-bus.c
>   @@ -41,6 +41,7 @@
> @@ -414,7 +415,7 @@ index 9de5e454a6..fe86c93c63 100644
>    #define log_debug_bus_message(m)                                         \
>            do {                                                             \
>   diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
> -index 8de0a859ee..58044b6ba9 100644
> +index 8c6711797a..fac178823a 100644
>   --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
>   +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
>   @@ -14,6 +14,7 @@
> @@ -426,7 +427,7 @@ index 8de0a859ee..58044b6ba9 100644
>    #define MAX_SIZE (2*1024*1024)
>    
>   diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
> -index 233d081300..40a32b9700 100644
> +index cb8153f4fe..d52a56019d 100644
>   --- a/src/locale/keymap-util.c
>   +++ b/src/locale/keymap-util.c
>   @@ -21,6 +21,7 @@
> @@ -438,7 +439,7 @@ index 233d081300..40a32b9700 100644
>    static bool startswith_comma(const char *s, const char *prefix) {
>            s = startswith(s, prefix);
>   diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
> -index 16f4289585..6c5e438b36 100644
> +index 8e7a94db55..b5c368c6d1 100644
>   --- a/src/login/pam_systemd.c
>   +++ b/src/login/pam_systemd.c
>   @@ -31,6 +31,7 @@
> @@ -450,7 +451,7 @@ index 16f4289585..6c5e438b36 100644
>    #include "parse-util.h"
>    #include "path-util.h"
>   diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
> -index bed1e42697..e4847c2bee 100644
> +index 2fa21a067a..2e9995aa62 100644
>   --- a/src/network/generator/network-generator.c
>   +++ b/src/network/generator/network-generator.c
>   @@ -13,6 +13,7 @@
> @@ -462,7 +463,7 @@ index bed1e42697..e4847c2bee 100644
>    /*
>      # .network
>   diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
> -index d341fa25aa..91646bc2c2 100644
> +index 92bb5120ab..eeca905c75 100644
>   --- a/src/nspawn/nspawn-settings.c
>   +++ b/src/nspawn/nspawn-settings.c
>   @@ -16,6 +16,7 @@
> @@ -474,7 +475,7 @@ index d341fa25aa..91646bc2c2 100644
>    Settings *settings_new(void) {
>            Settings *s;
>   diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
> -index 5db0dcef76..681f8677e4 100644
> +index 53f0492116..c71941fdd7 100644
>   --- a/src/nss-mymachines/nss-mymachines.c
>   +++ b/src/nss-mymachines/nss-mymachines.c
>   @@ -19,6 +19,7 @@
> @@ -486,7 +487,7 @@ index 5db0dcef76..681f8677e4 100644
>    NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
>    NSS_GETPW_PROTOTYPES(mymachines);
>   diff --git a/src/portable/portable.c b/src/portable/portable.c
> -index 3a1367ec2b..f29336cb1e 100644
> +index ed7eac0291..78986977f8 100644
>   --- a/src/portable/portable.c
>   +++ b/src/portable/portable.c
>   @@ -31,6 +31,7 @@
> @@ -498,31 +499,31 @@ index 3a1367ec2b..f29336cb1e 100644
>    static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
>    
>   diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
> -index 3072b984e5..c46ae374bf 100644
> +index b479335769..212d0bed20 100644
>   --- a/src/resolve/resolvectl.c
>   +++ b/src/resolve/resolvectl.c
> -@@ -36,6 +36,7 @@
> - #include "strv.h"
> +@@ -37,6 +37,7 @@
>    #include "terminal-util.h"
> + #include "utf8.h"
>    #include "verbs.h"
>   +#include "missing_stdlib.h"
>    
>    static int arg_family = AF_UNSPEC;
>    static int arg_ifindex = 0;
>   diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
> -index 8ad4694046..da5082c02a 100644
> +index 32f68d5e6a..bda1e1ef4f 100644
>   --- a/src/shared/bus-get-properties.c
>   +++ b/src/shared/bus-get-properties.c
> -@@ -3,6 +3,7 @@
> - #include "bus-get-properties.h"
> +@@ -4,6 +4,7 @@
>    #include "rlimit-util.h"
> + #include "stdio-util.h"
>    #include "string-util.h"
>   +#include "missing_stdlib.h"
>    
>    int bus_property_get_bool(
>                    sd_bus *bus,
>   diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
> -index b21fe39326..af2640005c 100644
> +index 3e97be9671..2b8ca838f7 100644
>   --- a/src/shared/bus-unit-procs.c
>   +++ b/src/shared/bus-unit-procs.c
>   @@ -10,6 +10,7 @@
> @@ -534,10 +535,10 @@ index b21fe39326..af2640005c 100644
>    struct CGroupInfo {
>            char *cgroup_path;
>   diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
> -index f2652ed9a5..eb019fc89f 100644
> +index 2bab2299fb..62afdc7973 100644
>   --- a/src/shared/bus-unit-util.c
>   +++ b/src/shared/bus-unit-util.c
> -@@ -39,6 +39,7 @@
> +@@ -44,6 +44,7 @@
>    #include "unit-def.h"
>    #include "user-util.h"
>    #include "utf8.h"
> @@ -546,22 +547,22 @@ index f2652ed9a5..eb019fc89f 100644
>    int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
>            assert(message);
>   diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
> -index 77c1c62182..5cd31f3c15 100644
> +index fbda218b3b..aae0be75c6 100644
>   --- a/src/shared/bus-util.c
>   +++ b/src/shared/bus-util.c
> -@@ -22,6 +22,7 @@
> +@@ -21,6 +21,7 @@
> + #include "path-util.h"
>    #include "socket-util.h"
>    #include "stdio-util.h"
> - /* #include "string-util.h" */
>   +#include "missing_stdlib.h"
>    
>    static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
>            sd_event *e = userdata;
>   diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
> -index b812665315..8e68f7f8fc 100644
> +index 8bd1e3a6ac..f8d6eab9bd 100644
>   --- a/src/shared/dns-domain.c
>   +++ b/src/shared/dns-domain.c
> -@@ -23,6 +23,7 @@
> +@@ -17,6 +17,7 @@
>    #include "string-util.h"
>    #include "strv.h"
>    #include "utf8.h"
> @@ -570,7 +571,7 @@ index b812665315..8e68f7f8fc 100644
>    int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
>            const char *n;
>   diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
> -index 7c4fc7021d..3fbaf5a639 100644
> +index e95b638f4d..a1bf15baa8 100644
>   --- a/src/shared/journal-importer.c
>   +++ b/src/shared/journal-importer.c
>   @@ -14,6 +14,7 @@
> @@ -582,7 +583,7 @@ index 7c4fc7021d..3fbaf5a639 100644
>    enum {
>            IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
>   diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
> -index 899e894ab7..628854ac9c 100644
> +index bf574d32a5..a09c79d2fb 100644
>   --- a/src/shared/logs-show.c
>   +++ b/src/shared/logs-show.c
>   @@ -41,6 +41,7 @@
> @@ -594,10 +595,10 @@ index 899e894ab7..628854ac9c 100644
>    /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
>    #define PRINT_LINE_THRESHOLD 3
>   diff --git a/src/shared/pager.c b/src/shared/pager.c
> -index e03be6d23b..50e3d1f75c 100644
> +index f689d9f28f..aae3957c2f 100644
>   --- a/src/shared/pager.c
>   +++ b/src/shared/pager.c
> -@@ -23,6 +23,7 @@
> +@@ -26,6 +26,7 @@
>    #include "strv.h"
>    #include "terminal-util.h"
>    #include "util.h"
> @@ -606,7 +607,7 @@ index e03be6d23b..50e3d1f75c 100644
>    static pid_t pager_pid = 0;
>    
>   diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
> -index 7cb7d8a477..8e7d7f9e7c 100644
> +index 5d5bf7f21d..f1002ffa6c 100644
>   --- a/src/shared/uid-range.c
>   +++ b/src/shared/uid-range.c
>   @@ -9,6 +9,7 @@
> @@ -618,7 +619,7 @@ index 7cb7d8a477..8e7d7f9e7c 100644
>    static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
>            assert(range);
>   diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
> -index b461aead60..9941695ed9 100644
> +index 4391d9f1f5..9b73cd0aeb 100644
>   --- a/src/socket-proxy/socket-proxyd.c
>   +++ b/src/socket-proxy/socket-proxyd.c
>   @@ -26,6 +26,7 @@
> @@ -630,7 +631,7 @@ index b461aead60..9941695ed9 100644
>    #define BUFFER_SIZE (256 * 1024)
>    
>   diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
> -index 52217429b1..70708dedf3 100644
> +index f0f9679769..128fc164da 100644
>   --- a/src/test/test-hexdecoct.c
>   +++ b/src/test/test-hexdecoct.c
>   @@ -6,6 +6,7 @@
> @@ -642,7 +643,7 @@ index 52217429b1..70708dedf3 100644
>    static void test_hexchar(void) {
>            assert_se(hexchar(0xa) == 'a');
>   diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
> -index 6c020ac0ed..10723ec46c 100644
> +index 0da59e2c75..66da3741ee 100644
>   --- a/src/udev/udev-builtin-path_id.c
>   +++ b/src/udev/udev-builtin-path_id.c
>   @@ -22,6 +22,7 @@
> @@ -654,7 +655,7 @@ index 6c020ac0ed..10723ec46c 100644
>    _printf_(2,3)
>    static void path_prepend(char **path, const char *fmt, ...) {
>   diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
> -index e1c2baf7f2..62d4086802 100644
> +index 5159d19a38..0ed5b65844 100644
>   --- a/src/udev/udev-event.c
>   +++ b/src/udev/udev-event.c
>   @@ -34,6 +34,7 @@
> @@ -666,7 +667,7 @@ index e1c2baf7f2..62d4086802 100644
>    typedef struct Spawn {
>            sd_device *device;
>   diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> -index c36f032f66..36970813d8 100644
> +index ef6a0c112c..422fc19127 100644
>   --- a/src/udev/udev-rules.c
>   +++ b/src/udev/udev-rules.c
>   @@ -30,6 +30,7 @@
> @@ -677,3 +678,6 @@ index c36f032f66..36970813d8 100644
>    
>    #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
>    
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> index abc438e4ba..b689cf1297 100644
> --- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> +++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> @@ -1,7 +1,7 @@
> -From 47818052121d135632f5e46c369e3e4706a0f9e0 Mon Sep 17 00:00:00 2001
> +From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 26 Oct 2017 22:10:42 -0700
> -Subject: [PATCH] Include netinet/if_ether.h
> +Subject: [PATCH 06/26] Include netinet/if_ether.h
>   
>   Fixes
>   /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
> @@ -29,7 +29,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [rebased for systemd 243]
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
> +[rebased for systemd 247]
> +Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   ---
>    src/libsystemd-network/sd-dhcp6-client.c  | 1 -
>    src/libsystemd/sd-netlink/netlink-types.c | 1 +
> @@ -52,10 +53,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>    src/udev/udev-builtin-net_setup_link.c    | 1 +
>    19 files changed, 18 insertions(+), 4 deletions(-)
>   
> -Index: systemd-stable/src/libsystemd-network/sd-dhcp6-client.c
> -===================================================================
> ---- systemd-stable.orig/src/libsystemd-network/sd-dhcp6-client.c
> -+++ systemd-stable/src/libsystemd-network/sd-dhcp6-client.c
> +diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
> +index 30ac526fc9..126077e13c 100644
> +--- a/src/libsystemd-network/sd-dhcp6-client.c
> ++++ b/src/libsystemd-network/sd-dhcp6-client.c
>   @@ -5,7 +5,6 @@
>    
>    #include <errno.h>
> @@ -64,10 +65,10 @@ Index: systemd-stable/src/libsystemd-network/sd-dhcp6-client.c
>    #include <linux/if_infiniband.h>
>    
>    #include "sd-dhcp6-client.h"
> -Index: systemd-stable/src/libsystemd/sd-netlink/netlink-types.c
> -===================================================================
> ---- systemd-stable.orig/src/libsystemd/sd-netlink/netlink-types.c
> -+++ systemd-stable/src/libsystemd/sd-netlink/netlink-types.c
> +diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
> +index 6fb6c147d9..8eda02d202 100644
> +--- a/src/libsystemd/sd-netlink/netlink-types.c
> ++++ b/src/libsystemd/sd-netlink/netlink-types.c
>   @@ -3,6 +3,7 @@
>    #include <netinet/in.h>
>    #include <stdint.h>
> @@ -76,10 +77,10 @@ Index: systemd-stable/src/libsystemd/sd-netlink/netlink-types.c
>    #include <linux/can/vxcan.h>
>    #include <linux/netlink.h>
>    #include <linux/rtnetlink.h>
> -Index: systemd-stable/src/machine/machine-dbus.c
> -===================================================================
> ---- systemd-stable.orig/src/machine/machine-dbus.c
> -+++ systemd-stable/src/machine/machine-dbus.c
> +diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> +index bb67beb665..f5780f1aec 100644
> +--- a/src/machine/machine-dbus.c
> ++++ b/src/machine/machine-dbus.c
>   @@ -3,6 +3,7 @@
>    #include <errno.h>
>    #include <sys/mount.h>
> @@ -88,66 +89,66 @@ Index: systemd-stable/src/machine/machine-dbus.c
>    
>    /* When we include libgen.h because we need dirname() we immediately
>     * undefine basename() since libgen.h defines it as a macro to the POSIX
> -Index: systemd-stable/src/network/netdev/bond.c
> -===================================================================
> ---- systemd-stable.orig/src/network/netdev/bond.c
> -+++ systemd-stable/src/network/netdev/bond.c
> +diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
> +index e27f36067b..8868f1da5d 100644
> +--- a/src/network/netdev/bond.c
> ++++ b/src/network/netdev/bond.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include "alloc-util.h"
>    #include "bond.h"
>    #include "bond-util.h"
> -Index: systemd-stable/src/network/netdev/bridge.c
> -===================================================================
> ---- systemd-stable.orig/src/network/netdev/bridge.c
> -+++ systemd-stable/src/network/netdev/bridge.c
> +diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
> +index 1f59cd8b42..5fdbae7e99 100644
> +--- a/src/network/netdev/bridge.c
> ++++ b/src/network/netdev/bridge.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <net/if.h>
>    
>    #include "bridge.h"
> -Index: systemd-stable/src/network/netdev/macsec.c
> -===================================================================
> ---- systemd-stable.orig/src/network/netdev/macsec.c
> -+++ systemd-stable/src/network/netdev/macsec.c
> +diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
> +index 82e71c3920..fbae86e216 100644
> +--- a/src/network/netdev/macsec.c
> ++++ b/src/network/netdev/macsec.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <netinet/in.h>
>    #include <linux/if_ether.h>
>    #include <linux/if_macsec.h>
> -Index: systemd-stable/src/network/netdev/netdev-gperf.gperf
> -===================================================================
> ---- systemd-stable.orig/src/network/netdev/netdev-gperf.gperf
> -+++ systemd-stable/src/network/netdev/netdev-gperf.gperf
> +diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
> +index 4e89761f2c..91251fa6ec 100644
> +--- a/src/network/netdev/netdev-gperf.gperf
> ++++ b/src/network/netdev/netdev-gperf.gperf
>   @@ -2,6 +2,7 @@
>    #if __GNUC__ >= 7
>    _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
>    #endif
>   +#include <netinet/if_ether.h>
>    #include <stddef.h>
> + #include "bareudp.h"
>    #include "bond.h"
> - #include "bridge.h"
> -Index: systemd-stable/src/network/netdev/netdev.c
> -===================================================================
> ---- systemd-stable.orig/src/network/netdev/netdev.c
> -+++ systemd-stable/src/network/netdev/netdev.c
> +diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
> +index 9f390b5781..62aeafb1e4 100644
> +--- a/src/network/netdev/netdev.c
> ++++ b/src/network/netdev/netdev.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <net/if.h>
>    #include <netinet/in.h>
>    #include <unistd.h>
> -Index: systemd-stable/src/network/networkd-brvlan.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-brvlan.c
> -+++ systemd-stable/src/network/networkd-brvlan.c
> +diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
> +index e53c73c30c..9bf0771b84 100644
> +--- a/src/network/networkd-brvlan.c
> ++++ b/src/network/networkd-brvlan.c
>   @@ -4,6 +4,7 @@
>    ***/
>    
> @@ -156,24 +157,49 @@ Index: systemd-stable/src/network/networkd-brvlan.c
>    #include <linux/if_bridge.h>
>    #include <stdbool.h>
>    
> -Index: systemd-stable/src/network/networkd-dhcp-common.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-dhcp-common.c
> -+++ systemd-stable/src/network/networkd-dhcp-common.c
> -@@ -5,6 +5,7 @@
> - #include "escape.h"
> - #include "in-addr-util.h"
> +diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
> +index c338c775a7..ab35d65c53 100644
> +--- a/src/network/networkd-dhcp-common.c
> ++++ b/src/network/networkd-dhcp-common.c
> +@@ -1,7 +1,8 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +
> + #include <netinet/in.h>
> +-#include <linux/if_arp.h>
> ++#include <net/if_arp.h>
> ++#include <net/if.h>
> +
> + #include "dhcp-internal.h"
> + #include "dhcp6-internal.h"
> +@@ -10,6 +10,7 @@
>    #include "networkd-dhcp-common.h"
> + #include "networkd-link.h"
> + #include "networkd-manager.h"
>   +#include <netinet/if_ether.h>
>    #include "networkd-network.h"
>    #include "parse-util.h"
> - #include "string-table.h"
> -Index: systemd-stable/src/network/networkd-dhcp4.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-dhcp4.c
> -+++ systemd-stable/src/network/networkd-dhcp4.c
> + #include "socket-util.h"
> +diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
> +index cf279c640d..bae541029b 100644
> +--- a/src/network/networkd-dhcp-server.c
> ++++ b/src/network/networkd-dhcp-server.c
> +@@ -1,8 +1,8 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +
> + #include <netinet/in.h>
> +-#include <linux/if_arp.h>
> +-#include <linux/if.h>
> ++#include <net/if_arp.h>
> ++#include <net/if.h>
> +
> + #include "sd-dhcp-server.h"
> +
> +diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
> +index 02d33841b6..a30d8dd82c 100644
> +--- a/src/network/networkd-dhcp4.c
> ++++ b/src/network/networkd-dhcp4.c
>   @@ -1,9 +1,9 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <netinet/in.h>
> @@ -183,10 +209,10 @@ Index: systemd-stable/src/network/networkd-dhcp4.c
>    
>    #include "escape.h"
>    #include "alloc-util.h"
> -Index: systemd-stable/src/network/networkd-dhcp6.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-dhcp6.c
> -+++ systemd-stable/src/network/networkd-dhcp6.c
> +diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
> +index d4d4182ee5..635d08f7d5 100644
> +--- a/src/network/networkd-dhcp6.c
> ++++ b/src/network/networkd-dhcp6.c
>   @@ -3,9 +3,9 @@
>      Copyright © 2014 Intel Corporation. All rights reserved.
>    ***/
> @@ -198,12 +224,12 @@ Index: systemd-stable/src/network/networkd-dhcp6.c
>    
>    #include "sd-dhcp6-client.h"
>    
> -Index: systemd-stable/src/network/networkd-link.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-link.c
> -+++ systemd-stable/src/network/networkd-link.c
> +diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
> +index ced18de425..07b43770de 100644
> +--- a/src/network/networkd-link.c
> ++++ b/src/network/networkd-link.c
>   @@ -1,8 +1,8 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <netinet/in.h>
> @@ -212,41 +238,59 @@ Index: systemd-stable/src/network/networkd-link.c
>    #include <linux/if_link.h>
>    #include <unistd.h>
>    
> -Index: systemd-stable/src/network/networkd-network.c
> -===================================================================
> ---- systemd-stable.orig/src/network/networkd-network.c
> -+++ systemd-stable/src/network/networkd-network.c
> +diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
> +index 3254641461..f0ada419fd 100644
> +--- a/src/network/networkd-network.c
> ++++ b/src/network/networkd-network.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <net/if.h>
>    #include <netinet/in.h>
>    #include <linux/netdevice.h>
> -Index: systemd-stable/src/network/test-network-tables.c
> -===================================================================
> ---- systemd-stable.orig/src/network/test-network-tables.c
> -+++ systemd-stable/src/network/test-network-tables.c
> -@@ -1,3 +1,4 @@
> +diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
> +index 10f30c1a7e..579885726c 100644
> +--- a/src/network/networkd-route.c
> ++++ b/src/network/networkd-route.c
> +@@ -1,7 +1,10 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +
> + #include <linux/icmpv6.h>
> +-#include <linux/ipv6_route.h>
> ++/* linux/ipv6_route.h conflicts with netinet/in.h so define manually */
> ++#ifndef IP6_RT_PRIO_USER
> ++#define IP6_RT_PRIO_USER       1024
> ++#endif
> +
> + #include "alloc-util.h"
> + #include "netlink-util.h"
> +diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
> +index 475cac7527..9bae6eda16 100644
> +--- a/src/network/test-network-tables.c
> ++++ b/src/network/test-network-tables.c
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +
>   +#include <netinet/if_ether.h>
>    #include "bond.h"
>    #include "dhcp6-internal.h"
>    #include "dhcp6-protocol.h"
> -Index: systemd-stable/src/shared/ethtool-util.c
> -===================================================================
> ---- systemd-stable.orig/src/shared/ethtool-util.c
> -+++ systemd-stable/src/shared/ethtool-util.c
> +diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
> +index e6fab262f2..41dd3d7df7 100644
> +--- a/src/shared/ethtool-util.c
> ++++ b/src/shared/ethtool-util.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <net/if.h>
>    #include <sys/ioctl.h>
>    #include <linux/ethtool.h>
> -Index: systemd-stable/src/shared/ethtool-util.h
> -===================================================================
> ---- systemd-stable.orig/src/shared/ethtool-util.h
> -+++ systemd-stable/src/shared/ethtool-util.h
> +diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
> +index f94b3e15bf..08a7e4fa09 100644
> +--- a/src/shared/ethtool-util.h
> ++++ b/src/shared/ethtool-util.h
>   @@ -3,6 +3,7 @@
>    
>    #include <macro.h>
> @@ -255,25 +299,28 @@ Index: systemd-stable/src/shared/ethtool-util.h
>    #include <linux/ethtool.h>
>    
>    #include "conf-parser.h"
> -Index: systemd-stable/src/udev/net/link-config.c
> -===================================================================
> ---- systemd-stable.orig/src/udev/net/link-config.c
> -+++ systemd-stable/src/udev/net/link-config.c
> +diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
> +index d12fd0e299..636806dc23 100644
> +--- a/src/udev/net/link-config.c
> ++++ b/src/udev/net/link-config.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include <linux/netdevice.h>
>    #include <netinet/ether.h>
>    #include <unistd.h>
> -Index: systemd-stable/src/udev/udev-builtin-net_setup_link.c
> -===================================================================
> ---- systemd-stable.orig/src/udev/udev-builtin-net_setup_link.c
> -+++ systemd-stable/src/udev/udev-builtin-net_setup_link.c
> +diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
> +index cb12b943fe..5a28c8b563 100644
> +--- a/src/udev/udev-builtin-net_setup_link.c
> ++++ b/src/udev/udev-builtin-net_setup_link.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <netinet/if_ether.h>
>    #include "device-util.h"
>    #include "alloc-util.h"
>    #include "link-config.h"
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> similarity index 80%
> rename from meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
> rename to meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> index dd6ecebeb4..6865421586 100644
> --- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
> +++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> @@ -1,7 +1,8 @@
> -From 77f98727f1d19a8fb327b55c92f1a9ee7b859e9f Mon Sep 17 00:00:00 2001
> +From 87a14dde13c8fa68239a4ab62914a093062b3b29 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 14:56:21 +0800
> -Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
> +Subject: [PATCH 07/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
> + defined
>   
>   If the standard library doesn't provide brace
>   expansion users just won't get it.
> @@ -16,17 +17,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [rebased for systemd 243]
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/basic/glob-util.c     | 12 ++++++++++++
>    src/test/test-glob-util.c | 16 ++++++++++++++++
>    src/tmpfiles/tmpfiles.c   | 10 ++++++++++
>    3 files changed, 38 insertions(+)
>   
> -Index: systemd-stable/src/basic/glob-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/glob-util.c
> -+++ systemd-stable/src/basic/glob-util.c
> +diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
> +index bc0278e57f..c973f82e54 100644
> +--- a/src/basic/glob-util.c
> ++++ b/src/basic/glob-util.c
>   @@ -12,6 +12,12 @@
>    #include "path-util.h"
>    #include "strv.h"
> @@ -48,7 +48,7 @@ Index: systemd-stable/src/basic/glob-util.c
>            /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
>            assert(!(flags & GLOB_ALTDIRFUNC));
>    
> -@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
> +@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
>                    pglob->gl_lstat = lstat;
>            if (!pglob->gl_stat)
>                    pglob->gl_stat = stat;
> @@ -63,10 +63,10 @@ Index: systemd-stable/src/basic/glob-util.c
>            if (k == GLOB_NOMATCH)
>                    return -ENOENT;
>            if (k == GLOB_NOSPACE)
> -Index: systemd-stable/src/test/test-glob-util.c
> -===================================================================
> ---- systemd-stable.orig/src/test/test-glob-util.c
> -+++ systemd-stable/src/test/test-glob-util.c
> +diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
> +index df6444c433..79a692046e 100644
> +--- a/src/test/test-glob-util.c
> ++++ b/src/test/test-glob-util.c
>   @@ -12,6 +12,12 @@
>    #include "rm-rf.h"
>    #include "tmpfile-util.h"
> @@ -114,11 +114,11 @@ Index: systemd-stable/src/test/test-glob-util.c
>            assert_se(r == GLOB_NOMATCH);
>    
>            (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
> -Index: systemd-stable/src/tmpfiles/tmpfiles.c
> -===================================================================
> ---- systemd-stable.orig/src/tmpfiles/tmpfiles.c
> -+++ systemd-stable/src/tmpfiles/tmpfiles.c
> -@@ -59,6 +59,12 @@
> +diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
> +index 9906c70eef..5eb63b1d57 100644
> +--- a/src/tmpfiles/tmpfiles.c
> ++++ b/src/tmpfiles/tmpfiles.c
> +@@ -63,6 +63,12 @@
>    #include "umask-util.h"
>    #include "user-util.h"
>    
> @@ -131,7 +131,7 @@ Index: systemd-stable/src/tmpfiles/tmpfiles.c
>    /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>     * them in the file system. This is intended to be used to create
>     * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -1867,7 +1873,9 @@ finish:
> +@@ -1936,7 +1942,9 @@ finish:
>    
>    static int glob_item(Item *i, action_t action) {
>            _cleanup_globfree_ glob_t g = {
> @@ -141,7 +141,7 @@ Index: systemd-stable/src/tmpfiles/tmpfiles.c
>            };
>            int r = 0, k;
>            char **fn;
> -@@ -1887,7 +1895,9 @@ static int glob_item(Item *i, action_t a
> +@@ -1956,7 +1964,9 @@ static int glob_item(Item *i, action_t action) {
>    
>    static int glob_item_recursively(Item *i, fdaction_t action) {
>            _cleanup_globfree_ glob_t g = {
> @@ -151,3 +151,6 @@ Index: systemd-stable/src/tmpfiles/tmpfiles.c
>            };
>            int r = 0, k;
>            char **fn;
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> index 1f618932ea..94cdc2efde 100644
> --- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> @@ -1,7 +1,7 @@
> -From 7c440cfc53aa52c9dc91c3a8c105bcf314c53af6 Mon Sep 17 00:00:00 2001
> +From 8caea3fe87d55fd16de7d1b8266239fa954cb498 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:00:06 +0800
> -Subject: [PATCH] add missing FTW_ macros for musl
> +Subject: [PATCH 08/26] add missing FTW_ macros for musl
>   
>   This is to avoid build failures like below for musl.
>   
> @@ -10,13 +10,12 @@ This is to avoid build failures like below for musl.
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/basic/missing_type.h | 20 ++++++++++++++++++++
>    1 file changed, 20 insertions(+)
>   
>   diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
> -index c487e65e7bde..23602ebbd533 100644
> +index aeaf6ad5ec..3df1084ef2 100644
>   --- a/src/basic/missing_type.h
>   +++ b/src/basic/missing_type.h
>   @@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
> @@ -43,3 +42,6 @@ index c487e65e7bde..23602ebbd533 100644
>   +#ifndef FTW_SKIP_SIBLINGS
>   +#define FTW_SKIP_SIBLINGS 3
>   +#endif
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> similarity index 77%
> rename from meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> rename to meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> index 15055161fc..76cc75cf6a 100644
> --- a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> +++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> @@ -1,20 +1,19 @@
> -From eed7427db98cc01db7e9b3479655d68b044bc85b Mon Sep 17 00:00:00 2001
> +From d8e4f0aa1760e4c7bb8476beecd35025c9cbb95a Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:03:47 +0800
> -Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
> +Subject: [PATCH 09/26] fix missing of __register_atfork for non-glibc builds
>   
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/basic/process-util.c | 7 +++++++
>    1 file changed, 7 insertions(+)
>   
> -Index: systemd-stable/src/basic/process-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/process-util.c
> -+++ systemd-stable/src/basic/process-util.c
> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> +index 0851613fc9..4417101569 100644
> +--- a/src/basic/process-util.c
> ++++ b/src/basic/process-util.c
>   @@ -18,6 +18,9 @@
>    #if HAVE_VALGRIND_VALGRIND_H
>    #include <valgrind/valgrind.h>
> @@ -41,3 +40,6 @@ Index: systemd-stable/src/basic/process-util.c
>    
>    pid_t getpid_cached(void) {
>            static bool installed = false;
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> similarity index 77%
> rename from meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
> rename to meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> index a6fcd2f5da..aeacd865ae 100644
> --- a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> @@ -1,7 +1,7 @@
> -From 4aa91347ae975051dbe4dd2f98a1f4f459f2604f Mon Sep 17 00:00:00 2001
> +From e45bb02174812e4935214f42a18725be320770d5 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:12:41 +0800
> -Subject: [PATCH] Use uintmax_t for handling rlim_t
> +Subject: [PATCH 10/26] Use uintmax_t for handling rlim_t
>   
>   PRIu{32,64} is not right format to represent rlim_t type
>   therefore use %ju and typecast the rlim_t variables to
> @@ -20,18 +20,17 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   [Rebased for v241]
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/basic/format-util.h |  8 +-------
>    src/basic/rlimit-util.c | 10 +++++-----
>    src/core/execute.c      |  4 ++--
>    3 files changed, 8 insertions(+), 14 deletions(-)
>   
> -Index: systemd-stable/src/basic/format-util.h
> -===================================================================
> ---- systemd-stable.orig/src/basic/format-util.h
> -+++ systemd-stable/src/basic/format-util.h
> -@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
> +diff --git a/src/basic/format-util.h b/src/basic/format-util.h
> +index b7e18768e3..3195ab205d 100644
> +--- a/src/basic/format-util.h
> ++++ b/src/basic/format-util.h
> +@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
>    #  define PRI_TIMEX "li"
>    #endif
>    
> @@ -46,11 +45,11 @@ Index: systemd-stable/src/basic/format-util.h
>    
>    #if SIZEOF_DEV_T == 8
>    #  define DEV_FMT "%" PRIu64
> -Index: systemd-stable/src/basic/rlimit-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/rlimit-util.c
> -+++ systemd-stable/src/basic/rlimit-util.c
> -@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *r
> +diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
> +index 880976312c..9e1b61cd4a 100644
> +--- a/src/basic/rlimit-util.c
> ++++ b/src/basic/rlimit-util.c
> +@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
>            if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
>                    s = strdup("infinity");
>            else if (rl->rlim_cur >= RLIM_INFINITY)
> @@ -77,12 +76,12 @@ Index: systemd-stable/src/basic/rlimit-util.c
>    
>            return 1;
>    }
> -Index: systemd-stable/src/core/execute.c
> -===================================================================
> ---- systemd-stable.orig/src/core/execute.c
> -+++ systemd-stable/src/core/execute.c
> -@@ -4686,9 +4686,9 @@ void exec_context_dump(const ExecContext
> -         for (i = 0; i < RLIM_NLIMITS; i++)
> +diff --git a/src/core/execute.c b/src/core/execute.c
> +index 89632e0582..335283776c 100644
> +--- a/src/core/execute.c
> ++++ b/src/core/execute.c
> +@@ -5288,9 +5288,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
> +         for (unsigned i = 0; i < RLIM_NLIMITS; i++)
>                    if (c->rlimit[i]) {
>                            fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
>   -                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
> @@ -93,3 +92,6 @@ Index: systemd-stable/src/core/execute.c
>                    }
>    
>            if (c->ioprio_set) {
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> similarity index 75%
> rename from meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> rename to meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> index 049096d2a9..6d7fdbcb64 100644
> --- a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> +++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> @@ -1,22 +1,22 @@
> -From 62fac5e3ff0fccd329cdc49605258b6d0e573a3e Mon Sep 17 00:00:00 2001
> +From d1db531ddd3bbf94d5e764b7917bcc8684ff6357 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Wed, 28 Feb 2018 21:25:22 -0800
> -Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
> +Subject: [PATCH 11/26] test-sizeof.c: Disable tests for missing typedefs in
> + musl
>   
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/test/test-sizeof.c | 4 ++++
>    1 file changed, 4 insertions(+)
>   
>   diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index 1020e0cb3153..c65062d2562c 100644
> +index 3c9dc180fa..e1a59d408c 100644
>   --- a/src/test/test-sizeof.c
>   +++ b/src/test/test-sizeof.c
> -@@ -44,8 +44,10 @@ int main(void) {
> +@@ -55,8 +55,10 @@ int main(void) {
>            info(unsigned);
>            info(long unsigned);
>            info(long long unsigned);
> @@ -27,7 +27,7 @@ index 1020e0cb3153..c65062d2562c 100644
>    
>            info(float);
>            info(double);
> -@@ -63,7 +65,9 @@ int main(void) {
> +@@ -74,7 +76,9 @@ int main(void) {
>            info(ssize_t);
>            info(time_t);
>            info(usec_t);
> @@ -37,3 +37,6 @@ index 1020e0cb3153..c65062d2562c 100644
>            info(pid_t);
>            info(uid_t);
>            info(gid_t);
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> similarity index 83%
> rename from meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> rename to meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> index 0a7594c068..c15b6e7d82 100644
> --- a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> +++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> @@ -1,7 +1,7 @@
> -From e6f871078d8d6f076c84f908fa57af15417ab87d Mon Sep 17 00:00:00 2001
> +From 03e89da266edf70121a19ffc32a78cc3b97585ef Mon Sep 17 00:00:00 2001
>   From: Andre McCurdy <armccurdy@gmail.com>
>   Date: Tue, 10 Oct 2017 14:33:30 -0700
> -Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
> +Subject: [PATCH 12/26] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
>   
>   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
>   thing to do and it's not portable (not supported by musl). See:
> @@ -25,17 +25,16 @@ just historical and not actually necessary or desired behaviour?
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
>   ---
>    src/basic/fs-util.h          | 22 +++++++++++++++++++++-
>    src/shared/base-filesystem.c |  6 +++---
>    2 files changed, 24 insertions(+), 4 deletions(-)
>   
> -Index: systemd-stable/src/basic/fs-util.h
> -===================================================================
> ---- systemd-stable.orig/src/basic/fs-util.h
> -+++ systemd-stable/src/basic/fs-util.h
> -@@ -42,7 +42,27 @@ int fchmod_opath(int fd, mode_t m);
> +diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> +index 5dc8853eac..0491b3dae2 100644
> +--- a/src/basic/fs-util.h
> ++++ b/src/basic/fs-util.h
> +@@ -43,7 +43,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
>    int fd_warn_permissions(const char *path, int fd);
>    int stat_warn_permissions(const char *path, const struct stat *st);
>    
> @@ -64,11 +63,11 @@ Index: systemd-stable/src/basic/fs-util.h
>    
>    int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
>    int touch(const char *path);
> -Index: systemd-stable/src/shared/base-filesystem.c
> -===================================================================
> ---- systemd-stable.orig/src/shared/base-filesystem.c
> -+++ systemd-stable/src/shared/base-filesystem.c
> -@@ -54,7 +54,7 @@ int base_filesystem_create(const char *r
> +diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
> +index 1d05409086..1ed06c31ab 100644
> +--- a/src/shared/base-filesystem.c
> ++++ b/src/shared/base-filesystem.c
> +@@ -54,7 +54,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>                    return log_error_errno(errno, "Failed to open root file system: %m");
>    
>            for (i = 0; i < ELEMENTSOF(table); i ++) {
> @@ -77,7 +76,7 @@ Index: systemd-stable/src/shared/base-filesystem.c
>                            continue;
>    
>                    if (table[i].target) {
> -@@ -62,7 +62,7 @@ int base_filesystem_create(const char *r
> +@@ -62,7 +62,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>    
>                            /* check if one of the targets exists */
>                            NULSTR_FOREACH(s, table[i].target) {
> @@ -86,7 +85,7 @@ Index: systemd-stable/src/shared/base-filesystem.c
>                                            continue;
>    
>                                    /* check if a specific file exists at the target path */
> -@@ -73,7 +73,7 @@ int base_filesystem_create(const char *r
> +@@ -73,7 +73,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>                                            if (!p)
>                                                    return log_oom();
>    
> @@ -95,3 +94,6 @@ Index: systemd-stable/src/shared/base-filesystem.c
>                                                    continue;
>                                    }
>    
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> similarity index 64%
> rename from meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> rename to meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> index 67d5041917..89736bcfde 100644
> --- a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> @@ -1,7 +1,8 @@
> -From ec335ef3bb903a7eaf054103cc51411e71e6448c Mon Sep 17 00:00:00 2001
> +From dd134880e9a16595ab473934577e873c748e9c7a Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 27 May 2018 08:36:44 -0700
> -Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
> +Subject: [PATCH 13/26] Define glibc compatible basename() for non-glibc
> + systems
>   
>   Fixes builds with musl, even though systemd is adamant about
>   using non-posix basename implementation, we have a way out
> @@ -9,15 +10,14 @@ using non-posix basename implementation, we have a way out
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>   ---
>    src/machine/machine-dbus.c | 5 +++++
>    1 file changed, 5 insertions(+)
>   
> -Index: systemd-stable/src/machine/machine-dbus.c
> -===================================================================
> ---- systemd-stable.orig/src/machine/machine-dbus.c
> -+++ systemd-stable/src/machine/machine-dbus.c
> +diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> +index f5780f1aec..aec5825b3e 100644
> +--- a/src/machine/machine-dbus.c
> ++++ b/src/machine/machine-dbus.c
>   @@ -11,6 +11,11 @@
>    #include <libgen.h>
>    #undef basename
> @@ -30,3 +30,6 @@ Index: systemd-stable/src/machine/machine-dbus.c
>    #include "alloc-util.h"
>    #include "bus-common-errors.h"
>    #include "bus-get-properties.h"
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> similarity index 76%
> rename from meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> rename to meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> index 3d456ec83a..e95d2ae078 100644
> --- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> +++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> @@ -1,7 +1,7 @@
> -From bb28a9c870bb47dcdb1ccebaa8e3a5a86730a244 Mon Sep 17 00:00:00 2001
> +From 55af446156da863b5b36a1109845858956a4c274 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Wed, 4 Jul 2018 15:00:44 +0800
> -Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
> +Subject: [PATCH 14/26] Do not disable buffering when writing to oom_score_adj
>   
>   On musl, disabling buffering when writing to oom_score_adj will
>   cause the following error.
> @@ -19,15 +19,14 @@ Upstream-Status: Inappropriate [musl specific]
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   [rebased for systemd 243]
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/basic/process-util.c | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
> -Index: systemd-stable/src/basic/process-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/process-util.c
> -+++ systemd-stable/src/basic/process-util.c
> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> +index 4417101569..556dab8ebf 100644
> +--- a/src/basic/process-util.c
> ++++ b/src/basic/process-util.c
>   @@ -1536,7 +1536,7 @@ int set_oom_score_adjust(int value) {
>            sprintf(t, "%i", value);
>    
> @@ -37,3 +36,6 @@ Index: systemd-stable/src/basic/process-util.c
>    }
>    
>    int pidfd_get_pid(int fd, pid_t *ret) {
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> similarity index 67%
> rename from meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> rename to meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> index 48fd007e11..5cdcf84dc1 100644
> --- a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> +++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> @@ -1,7 +1,7 @@
> -From 4938705454cf46cfe8deac8ce457d5d2432cbead Mon Sep 17 00:00:00 2001
> +From e382845aed90cfe4496a8351d57d4466dd2e9a9c Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Tue, 10 Jul 2018 15:40:17 +0800
> -Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
> +Subject: [PATCH 15/26] distinguish XSI-compliant strerror_r from GNU-specifi
>    strerror_r
>   
>   XSI-compliant strerror_r and GNU-specifi strerror_r are different.
> @@ -18,17 +18,16 @@ assigned to (char *) variable, resulting in segment fault.
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/journal/journal-send.c        | 5 +++++
>    src/libsystemd/sd-bus/bus-error.c | 5 +++++
>    2 files changed, 10 insertions(+)
>   
> -Index: systemd-stable/src/journal/journal-send.c
> -===================================================================
> ---- systemd-stable.orig/src/journal/journal-send.c
> -+++ systemd-stable/src/journal/journal-send.c
> -@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(co
> +diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> +index e8e6ad555b..8ca5271d02 100644
> +--- a/src/journal/journal-send.c
> ++++ b/src/journal/journal-send.c
> +@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
>                    char* j;
>    
>                    errno = 0;
> @@ -41,11 +40,11 @@ Index: systemd-stable/src/journal/journal-send.c
>                    if (errno == 0) {
>                            char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
>    
> -Index: systemd-stable/src/libsystemd/sd-bus/bus-error.c
> -===================================================================
> ---- systemd-stable.orig/src/libsystemd/sd-bus/bus-error.c
> -+++ systemd-stable/src/libsystemd/sd-bus/bus-error.c
> -@@ -379,7 +379,12 @@ static void bus_error_strerror(sd_bus_er
> +diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
> +index 8da2024a50..9605a9b869 100644
> +--- a/src/libsystemd/sd-bus/bus-error.c
> ++++ b/src/libsystemd/sd-bus/bus-error.c
> +@@ -392,7 +392,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
>                            return;
>    
>                    errno = 0;
> @@ -58,3 +57,6 @@ Index: systemd-stable/src/libsystemd/sd-bus/bus-error.c
>                    if (errno == ERANGE || strlen(x) >= k - 1) {
>                            free(m);
>                            k *= 2;
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> similarity index 81%
> rename from meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> rename to meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> index 3b8064677f..9a125de638 100644
> --- a/meta/recipes-core/systemd/systemd/0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> +++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> @@ -1,7 +1,7 @@
> -From 1c4c73a7cc0fb59eb68ab70699f7f51af5c163b2 Mon Sep 17 00:00:00 2001
> +From 0c7af5f288231a8c0545e169e01ba5ee173cafe7 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:18:00 +0800
> -Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
> +Subject: [PATCH 16/26] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
>   
>   for currently unknown reasons they get exported to the shared libries
>   even without being listed in the sym file
> @@ -11,16 +11,15 @@ Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   [Rebased for v241]
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/libsystemd/sd-bus/bus-error.c | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
> -index 28a5159c4480..962a4de10c56 100644
> +index 9605a9b869..38b6cf90c3 100644
>   --- a/src/libsystemd/sd-bus/bus-error.c
>   +++ b/src/libsystemd/sd-bus/bus-error.c
> -@@ -54,8 +54,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
> +@@ -55,8 +55,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
>    };
>    
>    /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
> @@ -31,3 +30,6 @@ index 28a5159c4480..962a4de10c56 100644
>    
>    /* Additional maps registered with sd_bus_error_add_map() are in this
>     * NULL terminated array */
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> similarity index 79%
> rename from meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
> rename to meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> index db4041bbb1..31747c6b40 100644
> --- a/meta/recipes-core/systemd/systemd/0020-missing_type.h-add-__compar_d_fn_t-definition.patch
> +++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> @@ -1,7 +1,7 @@
> -From 8303d49cabaf3ab8890ba1d266972c721dfe6ee8 Mon Sep 17 00:00:00 2001
> +From 32dd7a47b87793cd836ab4bb776d1524f24c2d58 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:27:54 +0800
> -Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
> +Subject: [PATCH 17/26] missing_type.h: add __compar_d_fn_t definition
>   
>   Fix the following compile failure:
>   src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
> @@ -9,13 +9,12 @@ src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/basic/missing_type.h | 1 +
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
> -index 23602ebbd533..917d314a81bf 100644
> +index 3df1084ef2..697aa7f58a 100644
>   --- a/src/basic/missing_type.h
>   +++ b/src/basic/missing_type.h
>   @@ -13,6 +13,7 @@
> @@ -26,3 +25,6 @@ index 23602ebbd533..917d314a81bf 100644
>    #endif
>    
>    #ifndef __COMPAR_FN_T
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> similarity index 73%
> rename from meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
> rename to meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> index 7dacc36837..56d361a213 100644
> --- a/meta/recipes-core/systemd/systemd/0021-avoid-redefinition-of-prctl_mm_map-structure.patch
> +++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> @@ -1,7 +1,7 @@
> -From 6364ff5534678c158a7fb8d4e50d0a6ce72c1ad8 Mon Sep 17 00:00:00 2001
> +From bfc3416edeb69082ac9b9c9e844f12d7b45bb006 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 15:44:54 +0800
> -Subject: [PATCH] avoid redefinition of prctl_mm_map structure
> +Subject: [PATCH 18/26] avoid redefinition of prctl_mm_map structure
>   
>   Fix the following compile failure:
>   error: redefinition of 'struct prctl_mm_map'
> @@ -9,17 +9,16 @@ error: redefinition of 'struct prctl_mm_map'
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/basic/missing_prctl.h | 2 ++
>    1 file changed, 2 insertions(+)
>   
>   diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
> -index f80cd17f346b..47e489354053 100644
> +index ab851306ba..5547cad875 100644
>   --- a/src/basic/missing_prctl.h
>   +++ b/src/basic/missing_prctl.h
>   @@ -1,7 +1,9 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    #pragma once
>    
>   +#ifdef __GLIBC__
> @@ -28,3 +27,6 @@ index f80cd17f346b..47e489354053 100644
>    
>    /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
>    #ifndef PR_CAP_AMBIENT
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> similarity index 74%
> rename from meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch
> rename to meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> index 67d9162c08..6ca196489b 100644
> --- a/meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch
> +++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> @@ -1,7 +1,7 @@
> -From 190854c2114dc6e74c8859dc251e3737e3c0f353 Mon Sep 17 00:00:00 2001
> +From e427f03de2c56e868bb0f24aa231315b2dae1b71 Mon Sep 17 00:00:00 2001
>   From: Alex Kiernan <alex.kiernan@gmail.com>
>   Date: Fri, 7 Aug 2020 15:19:27 +0000
> -Subject: [PATCH] Handle missing LOCK_EX
> +Subject: [PATCH 19/26] Handle missing LOCK_EX
>   
>   Upstream-Status: Inappropriate [musl specific]
>   Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> @@ -10,10 +10,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/partition/makefs.c b/src/partition/makefs.c
> -index 97f50c9033..7f55acd229 100644
> +index fd924d2231..b97580fdcc 100644
>   --- a/src/partition/makefs.c
>   +++ b/src/partition/makefs.c
> -@@ -5,6 +5,7 @@
> +@@ -6,6 +6,7 @@
>    #include <sys/stat.h>
>    #include <sys/types.h>
>    #include <unistd.h>
> @@ -21,3 +21,6 @@ index 97f50c9033..7f55acd229 100644
>    
>    #include "alloc-util.h"
>    #include "blockdev-util.h"
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> similarity index 88%
> rename from meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> rename to meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> index d57ca1fd39..f74de43849 100644
> --- a/meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> +++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> @@ -1,7 +1,7 @@
> -From 328c39fae2631deb5737dd56f46159dd6b4cdbed Mon Sep 17 00:00:00 2001
> +From 9abbc5e69e21aef0d4d4567e69302fa660b76c53 Mon Sep 17 00:00:00 2001
>   From: Alex Kiernan <alex.kiernan@gmail.com>
>   Date: Fri, 7 Aug 2020 15:20:17 +0000
> -Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
> +Subject: [PATCH 20/26] Fix incompatible pointer type struct sockaddr_un *
>   
>   | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In function 'cant_be_in_netns':
>   | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Werror=incompatible-pointer-types]
> @@ -23,10 +23,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> -index 0450c9f795..7305db04ef 100644
> +index 0842731c18..3528b7ff14 100644
>   --- a/src/nspawn/nspawn.c
>   +++ b/src/nspawn/nspawn.c
> -@@ -4890,7 +4890,7 @@ static int cant_be_in_netns(void) {
> +@@ -5084,7 +5084,7 @@ static int cant_be_in_netns(void) {
>            if (fd < 0)
>                    return log_error_errno(errno, "Failed to allocate udev control socket: %m");
>    
> @@ -35,3 +35,6 @@ index 0450c9f795..7305db04ef 100644
>    
>                    if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
>                            return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> similarity index 80%
> rename from meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
> rename to meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> index 80beada3d3..fa6652a5bf 100644
> --- a/meta/recipes-core/systemd/systemd/0024-test-json.c-define-M_PIl.patch
> +++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> @@ -1,7 +1,7 @@
> -From a05cc5fb3dc0e51682c40196285cdda34ec90783 Mon Sep 17 00:00:00 2001
> +From 1f5bc54bed0b365e7e448c26f6c792dbe8b3b198 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Mon, 25 Feb 2019 16:53:06 +0800
> -Subject: [PATCH] test-json.c: define M_PIl
> +Subject: [PATCH 21/26] test-json.c: define M_PIl
>   
>   Fix the following compile failure:
>   src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
> @@ -9,16 +9,15 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/test/test-json.c | 4 ++++
>    1 file changed, 4 insertions(+)
>   
>   diff --git a/src/test/test-json.c b/src/test/test-json.c
> -index a6613043b924..ca823ea79f05 100644
> +index 1d4b11945e..572c8cf9d0 100644
>   --- a/src/test/test-json.c
>   +++ b/src/test/test-json.c
> -@@ -12,6 +12,10 @@
> +@@ -13,6 +13,10 @@
>    #include "tests.h"
>    #include "util.h"
>    
> @@ -29,3 +28,6 @@ index a6613043b924..ca823ea79f05 100644
>    static void test_tokenizer(const char *data, ...) {
>            unsigned line = 0, column = 0;
>            void *state = NULL;
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> similarity index 71%
> rename from meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
> rename to meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> index 39a975319b..675fd20f11 100644
> --- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
> +++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> @@ -1,7 +1,7 @@
> -From f92fd7e77ed5aab2dda01a20e6891c37f09415d3 Mon Sep 17 00:00:00 2001
> +From 564dba5ad0cd884e3f69fa19ca64095413578ea5 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Fri, 1 Mar 2019 15:22:15 +0800
> -Subject: [PATCH] do not disable buffer in writing files
> +Subject: [PATCH 22/26] do not disable buffer in writing files
>   
>   Do not disable buffer in writing files, otherwise we get
>   failure at boot for musl like below.
> @@ -18,7 +18,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>   [rebased for systemd 243]
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/basic/cgroup-util.c                 | 10 +++++-----
>    src/basic/procfs-util.c                 |  4 ++--
> @@ -40,11 +39,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>    src/vconsole/vconsole-setup.c           |  2 +-
>    18 files changed, 35 insertions(+), 35 deletions(-)
>   
> -Index: systemd-stable/src/basic/cgroup-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/cgroup-util.c
> -+++ systemd-stable/src/basic/cgroup-util.c
> -@@ -769,7 +769,7 @@ int cg_install_release_agent(const char
> +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> +index bb960f183c..cb804c5f4b 100644
> +--- a/src/basic/cgroup-util.c
> ++++ b/src/basic/cgroup-util.c
> +@@ -759,7 +759,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
>    
>            sc = strstrip(contents);
>            if (isempty(sc)) {
> @@ -53,7 +52,7 @@ Index: systemd-stable/src/basic/cgroup-util.c
>                    if (r < 0)
>                            return r;
>            } else if (!path_equal(sc, agent))
> -@@ -787,7 +787,7 @@ int cg_install_release_agent(const char
> +@@ -777,7 +777,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
>    
>            sc = strstrip(contents);
>            if (streq(sc, "0")) {
> @@ -62,7 +61,7 @@ Index: systemd-stable/src/basic/cgroup-util.c
>                    if (r < 0)
>                            return r;
>    
> -@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const cha
> +@@ -804,7 +804,7 @@ int cg_uninstall_release_agent(const char *controller) {
>            if (r < 0)
>                    return r;
>    
> @@ -71,7 +70,7 @@ Index: systemd-stable/src/basic/cgroup-util.c
>            if (r < 0)
>                    return r;
>    
> -@@ -824,7 +824,7 @@ int cg_uninstall_release_agent(const cha
> +@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const char *controller) {
>            if (r < 0)
>                    return r;
>    
> @@ -80,7 +79,7 @@ Index: systemd-stable/src/basic/cgroup-util.c
>            if (r < 0)
>                    return r;
>    
> -@@ -1656,7 +1656,7 @@ int cg_set_attribute(const char *control
> +@@ -1646,7 +1646,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
>            if (r < 0)
>                    return r;
>    
> @@ -89,11 +88,11 @@ Index: systemd-stable/src/basic/cgroup-util.c
>    }
>    
>    int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
> -Index: systemd-stable/src/basic/procfs-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/procfs-util.c
> -+++ systemd-stable/src/basic/procfs-util.c
> -@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
> +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> +index 8f9eee8d36..480f8cc0b4 100644
> +--- a/src/basic/procfs-util.c
> ++++ b/src/basic/procfs-util.c
> +@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
>             * decrease it, as threads-max is the much more relevant sysctl. */
>            if (limit > pid_max-1) {
>                    sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
> @@ -109,11 +108,11 @@ Index: systemd-stable/src/basic/procfs-util.c
>            if (r < 0) {
>                    uint64_t threads_max;
>    
> -Index: systemd-stable/src/basic/smack-util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/smack-util.c
> -+++ systemd-stable/src/basic/smack-util.c
> -@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
> +diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
> +index 3362ee3924..80c0f2a52e 100644
> +--- a/src/basic/smack-util.c
> ++++ b/src/basic/smack-util.c
> +@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
>                    return 0;
>    
>            p = procfs_file_alloca(pid, "attr/current");
> @@ -122,10 +121,10 @@ Index: systemd-stable/src/basic/smack-util.c
>            if (r < 0)
>                    return r;
>    
> -Index: systemd-stable/src/basic/util.c
> -===================================================================
> ---- systemd-stable.orig/src/basic/util.c
> -+++ systemd-stable/src/basic/util.c
> +diff --git a/src/basic/util.c b/src/basic/util.c
> +index f98ecf3858..13e0f7431f 100644
> +--- a/src/basic/util.c
> ++++ b/src/basic/util.c
>   @@ -267,7 +267,7 @@ void disable_coredumps(void) {
>            if (detect_container() > 0)
>                    return;
> @@ -135,11 +134,11 @@ Index: systemd-stable/src/basic/util.c
>            if (r < 0)
>                    log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
>    }
> -Index: systemd-stable/src/binfmt/binfmt.c
> -===================================================================
> ---- systemd-stable.orig/src/binfmt/binfmt.c
> -+++ systemd-stable/src/binfmt/binfmt.c
> -@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
> +diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
> +index 43ed2f385b..37a6f578f7 100644
> +--- a/src/binfmt/binfmt.c
> ++++ b/src/binfmt/binfmt.c
> +@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
>            if (!fn)
>                    return log_oom();
>    
> @@ -148,7 +147,7 @@ Index: systemd-stable/src/binfmt/binfmt.c
>    }
>    
>    static int apply_rule(const char *rule) {
> -@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
> +@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
>    
>            (void) delete_rule(rule);
>    
> @@ -166,11 +165,11 @@ Index: systemd-stable/src/binfmt/binfmt.c
>    
>                    STRV_FOREACH(f, files) {
>                            k = apply_file(*f, true);
> -Index: systemd-stable/src/core/main.c
> -===================================================================
> ---- systemd-stable.orig/src/core/main.c
> -+++ systemd-stable/src/core/main.c
> -@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void
> +diff --git a/src/core/main.c b/src/core/main.c
> +index a280b756ff..334532cd42 100644
> +--- a/src/core/main.c
> ++++ b/src/core/main.c
> +@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void) {
>            if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
>                    return 0;
>    
> @@ -179,7 +178,7 @@ Index: systemd-stable/src/core/main.c
>            if (r < 0)
>                    return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
>                                          "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
> -@@ -1668,7 +1668,7 @@ static void initialize_core_pattern(bool
> +@@ -1666,7 +1666,7 @@ static void initialize_core_pattern(bool skip_setup) {
>            if (getpid_cached() != 1)
>                    return;
>    
> @@ -188,11 +187,11 @@ Index: systemd-stable/src/core/main.c
>            if (r < 0)
>                    log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
>    }
> -Index: systemd-stable/src/core/smack-setup.c
> -===================================================================
> ---- systemd-stable.orig/src/core/smack-setup.c
> -+++ systemd-stable/src/core/smack-setup.c
> -@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy)
> +diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
> +index 1fe592af70..603942a000 100644
> +--- a/src/core/smack-setup.c
> ++++ b/src/core/smack-setup.c
> +@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
>            }
>    
>    #ifdef SMACK_RUN_LABEL
> @@ -214,10 +213,10 @@ Index: systemd-stable/src/core/smack-setup.c
>            if (r < 0)
>                    log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
>    #endif
> -Index: systemd-stable/src/hibernate-resume/hibernate-resume.c
> -===================================================================
> ---- systemd-stable.orig/src/hibernate-resume/hibernate-resume.c
> -+++ systemd-stable/src/hibernate-resume/hibernate-resume.c
> +diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
> +index d8f91f4e66..a088e6e2d8 100644
> +--- a/src/hibernate-resume/hibernate-resume.c
> ++++ b/src/hibernate-resume/hibernate-resume.c
>   @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
>                    return EXIT_FAILURE;
>            }
> @@ -227,11 +226,11 @@ Index: systemd-stable/src/hibernate-resume/hibernate-resume.c
>            if (r < 0) {
>                    log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
>                    return EXIT_FAILURE;
> -Index: systemd-stable/src/libsystemd/sd-device/sd-device.c
> -===================================================================
> ---- systemd-stable.orig/src/libsystemd/sd-device/sd-device.c
> -+++ systemd-stable/src/libsystemd/sd-device/sd-device.c
> -@@ -1877,7 +1877,7 @@ _public_ int sd_device_set_sysattr_value
> +diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
> +index d06f90ce1d..43d0a58750 100644
> +--- a/src/libsystemd/sd-device/sd-device.c
> ++++ b/src/libsystemd/sd-device/sd-device.c
> +@@ -1976,7 +1976,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
>            if (!value)
>                    return -ENOMEM;
>    
> @@ -240,11 +239,11 @@ Index: systemd-stable/src/libsystemd/sd-device/sd-device.c
>            if (r < 0) {
>                    if (r == -ELOOP)
>                            return -EINVAL;
> -Index: systemd-stable/src/login/logind-dbus.c
> -===================================================================
> ---- systemd-stable.orig/src/login/logind-dbus.c
> -+++ systemd-stable/src/login/logind-dbus.c
> -@@ -1341,7 +1341,7 @@ static int trigger_device(Manager *m, sd
> +diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
> +index 7d757aa286..a5d9da5b7e 100644
> +--- a/src/login/logind-dbus.c
> ++++ b/src/login/logind-dbus.c
> +@@ -1330,7 +1330,7 @@ static int trigger_device(Manager *m, sd_device *d) {
>                    if (!t)
>                            return -ENOMEM;
>    
> @@ -253,11 +252,11 @@ Index: systemd-stable/src/login/logind-dbus.c
>            }
>    
>            return 0;
> -Index: systemd-stable/src/nspawn/nspawn-cgroup.c
> -===================================================================
> ---- systemd-stable.orig/src/nspawn/nspawn-cgroup.c
> -+++ systemd-stable/src/nspawn/nspawn-cgroup.c
> -@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
> +diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
> +index cb01b25bc6..e92051268b 100644
> +--- a/src/nspawn/nspawn-cgroup.c
> ++++ b/src/nspawn/nspawn-cgroup.c
> +@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
>            fn = strjoina(tree, cgroup, "/cgroup.procs");
>    
>            sprintf(pid_string, PID_FMT, pid);
> @@ -266,11 +265,11 @@ Index: systemd-stable/src/nspawn/nspawn-cgroup.c
>            if (r < 0) {
>                    log_error_errno(r, "Failed to move process: %m");
>                    goto finish;
> -Index: systemd-stable/src/nspawn/nspawn.c
> -===================================================================
> ---- systemd-stable.orig/src/nspawn/nspawn.c
> -+++ systemd-stable/src/nspawn/nspawn.c
> -@@ -2493,7 +2493,7 @@ static int reset_audit_loginuid(void) {
> +diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> +index 3528b7ff14..11b0c20f95 100644
> +--- a/src/nspawn/nspawn.c
> ++++ b/src/nspawn/nspawn.c
> +@@ -2667,7 +2667,7 @@ static int reset_audit_loginuid(void) {
>            if (streq(p, "4294967295"))
>                    return 0;
>    
> @@ -279,7 +278,7 @@ Index: systemd-stable/src/nspawn/nspawn.c
>            if (r < 0) {
>                    log_error_errno(r,
>                                    "Failed to reset audit login UID. This probably means that your kernel is too\n"
> -@@ -3726,13 +3726,13 @@ static int setup_uid_map(pid_t pid) {
> +@@ -3920,13 +3920,13 @@ static int setup_uid_map(pid_t pid) {
>    
>            xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
>            xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
> @@ -295,11 +294,11 @@ Index: systemd-stable/src/nspawn/nspawn.c
>            if (r < 0)
>                    return log_error_errno(r, "Failed to write GID map: %m");
>    
> -Index: systemd-stable/src/shared/cgroup-setup.c
> -===================================================================
> ---- systemd-stable.orig/src/shared/cgroup-setup.c
> -+++ systemd-stable/src/shared/cgroup-setup.c
> -@@ -267,7 +267,7 @@ int cg_attach(const char *controller, co
> +diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
> +index f197f715c7..077f893177 100644
> +--- a/src/shared/cgroup-setup.c
> ++++ b/src/shared/cgroup-setup.c
> +@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
>    
>            xsprintf(c, PID_FMT "\n", pid);
>    
> @@ -308,7 +307,7 @@ Index: systemd-stable/src/shared/cgroup-setup.c
>            if (r < 0)
>                    return r;
>    
> -@@ -817,7 +817,7 @@ int cg_enable_everywhere(
> +@@ -799,7 +799,7 @@ int cg_enable_everywhere(
>                                            return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
>                            }
>    
> @@ -317,11 +316,11 @@ Index: systemd-stable/src/shared/cgroup-setup.c
>                            if (r < 0) {
>                                    log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
>                                                    FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
> -Index: systemd-stable/src/shared/sysctl-util.c
> -===================================================================
> ---- systemd-stable.orig/src/shared/sysctl-util.c
> -+++ systemd-stable/src/shared/sysctl-util.c
> -@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, con
> +diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
> +index 670c33108b..7c7c3dcfb6 100644
> +--- a/src/shared/sysctl-util.c
> ++++ b/src/shared/sysctl-util.c
> +@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
>    
>            log_debug("Setting '%s' to '%s'", p, value);
>    
> @@ -330,11 +329,11 @@ Index: systemd-stable/src/shared/sysctl-util.c
>    }
>    
>    int sysctl_read(const char *property, char **content) {
> -Index: systemd-stable/src/sleep/sleep.c
> -===================================================================
> ---- systemd-stable.orig/src/sleep/sleep.c
> -+++ systemd-stable/src/sleep/sleep.c
> -@@ -48,7 +48,7 @@ static int write_hibernate_location_info
> +diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
> +index 39ab554290..d0e566645d 100644
> +--- a/src/sleep/sleep.c
> ++++ b/src/sleep/sleep.c
> +@@ -48,7 +48,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
>            assert(hibernate_location->swap);
>    
>            xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
> @@ -343,7 +342,7 @@ Index: systemd-stable/src/sleep/sleep.c
>            if (r < 0)
>                    return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
>                                           hibernate_location->swap->device, resume_str);
> -@@ -75,7 +75,7 @@ static int write_hibernate_location_info
> +@@ -75,7 +75,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
>            }
>    
>            xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
> @@ -361,7 +360,7 @@ Index: systemd-stable/src/sleep/sleep.c
>                    if (k >= 0)
>                            return 0;
>    
> -@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **
> +@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
>            STRV_FOREACH(state, states) {
>                    int k;
>    
> @@ -370,24 +369,24 @@ Index: systemd-stable/src/sleep/sleep.c
>                    if (k >= 0)
>                            return 0;
>                    log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
> -Index: systemd-stable/src/udev/udevadm-trigger.c
> -===================================================================
> ---- systemd-stable.orig/src/udev/udevadm-trigger.c
> -+++ systemd-stable/src/udev/udevadm-trigger.c
> -@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerato
> +diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
> +index 5c74184c33..65f528314e 100644
> +--- a/src/udev/udevadm-trigger.c
> ++++ b/src/udev/udevadm-trigger.c
> +@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set **settle_s
>                    if (!filename)
>                            return log_oom();
>    
>   -                r = write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);
>   +                r = write_string_file(filename, action, 0);
>                    if (r < 0) {
> -                         bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
> +                         bool ignore = IN_SET(r, -ENOENT, -ENODEV);
>    
> -Index: systemd-stable/src/udev/udevd.c
> -===================================================================
> ---- systemd-stable.orig/src/udev/udevd.c
> -+++ systemd-stable/src/udev/udevd.c
> -@@ -1153,7 +1153,7 @@ static int synthesize_change_one(sd_devi
> +diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> +index d24b8d4398..d123a43904 100644
> +--- a/src/udev/udevd.c
> ++++ b/src/udev/udevd.c
> +@@ -1192,7 +1192,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
>    
>            filename = strjoina(syspath, "/uevent");
>            log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
> @@ -396,11 +395,11 @@ Index: systemd-stable/src/udev/udevd.c
>            if (r < 0)
>                    return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
>            return 0;
> -Index: systemd-stable/src/vconsole/vconsole-setup.c
> -===================================================================
> ---- systemd-stable.orig/src/vconsole/vconsole-setup.c
> -+++ systemd-stable/src/vconsole/vconsole-setup.c
> -@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *na
> +diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
> +index b28e2853e1..115b7233a0 100644
> +--- a/src/vconsole/vconsole-setup.c
> ++++ b/src/vconsole/vconsole-setup.c
> +@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
>    static int toggle_utf8_sysfs(bool utf8) {
>            int r;
>    
> @@ -409,3 +408,6 @@ Index: systemd-stable/src/vconsole/vconsole-setup.c
>            if (r < 0)
>                    return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
>    
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
> similarity index 81%
> rename from meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch
> rename to meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
> index ba7424d876..ea4a024b82 100644
> --- a/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-sys-wait.h.patch
> +++ b/meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
> @@ -1,7 +1,7 @@
> -From 106922335ec502bcb4451c54a89be49f88fa54de Mon Sep 17 00:00:00 2001
> +From 359e7a38824a906b0a24f5775f41a2ae3358bf06 Mon Sep 17 00:00:00 2001
>   From: Scott Murray <scott.murray@konsulko.com>
>   Date: Fri, 13 Sep 2019 19:26:27 -0400
> -Subject: [PATCH] Include sys/wait.h
> +Subject: [PATCH 23/26] Include sys/wait.h
>   
>   Fixes:
>   src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
> @@ -11,19 +11,21 @@ src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in
>   Upstream-Status: Pending
>   
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/login/logind-brightness.c | 1 +
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/login/logind-brightness.c b/src/login/logind-brightness.c
> -index 3f4b65e1fdf1..5af7e3d5ce3f 100644
> +index a6a1603396..54848ce209 100644
>   --- a/src/login/logind-brightness.c
>   +++ b/src/login/logind-brightness.c
>   @@ -1,5 +1,6 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   +#include <sys/wait.h>
>    #include "bus-util.h"
>    #include "device-util.h"
>    #include "hash-funcs.h"
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch b/meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch
> similarity index 86%
> rename from meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
> rename to meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch
> index 538a99c7d7..2820d7b322 100644
> --- a/meta/recipes-core/systemd/systemd/0003-src-basic-copy.c-include-signal.h.patch
> +++ b/meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch
> @@ -1,7 +1,7 @@
> -From 082d2eb2a65525890a913723764e67a36ee75384 Mon Sep 17 00:00:00 2001
> +From 0592da08e16a17ceef0949ec9901397d8ec5af92 Mon Sep 17 00:00:00 2001
>   From: Scott Murray <scott.murray@konsulko.com>
>   Date: Fri, 13 Sep 2019 19:26:27 -0400
> -Subject: [PATCH] Include signal.h
> +Subject: [PATCH 24/26] Include signal.h
>   
>   Fixes several signal set related errors:
>   src/basic/copy.c:92:19: error: implicit declaration of function 'sigemptyset' [-Werror=implicit-function-declaration]
> @@ -12,13 +12,12 @@ src/basic/copy.c:95:13: error: implicit declaration of function 'sigtimedwait' [
>   Upstream-Status: Pending
>   
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/basic/copy.c | 1 +
>    1 file changed, 1 insertion(+)
>   
>   diff --git a/src/basic/copy.c b/src/basic/copy.c
> -index 9028868f696d..5168586fa522 100644
> +index 6a9c3a396f..8948bb4013 100644
>   --- a/src/basic/copy.c
>   +++ b/src/basic/copy.c
>   @@ -8,6 +8,7 @@
> @@ -29,3 +28,6 @@ index 9028868f696d..5168586fa522 100644
>    
>    #include "alloc-util.h"
>    #include "btrfs-util.h"
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> similarity index 87%
> rename from meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
> rename to meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> index d394444c1c..1cc3985d12 100644
> --- a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
> +++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> @@ -1,7 +1,7 @@
> -From dbe8b3ee45580defeefcac929b897c5437ffc50b Mon Sep 17 00:00:00 2001
> +From bbda4a48a34662393117fc677c3a678d4ce4c2ec Mon Sep 17 00:00:00 2001
>   From: Scott Murray <scott.murray@konsulko.com>
>   Date: Fri, 13 Sep 2019 19:26:27 -0400
> -Subject: [PATCH] Handle __cpu_mask usage
> +Subject: [PATCH 25/26] Handle __cpu_mask usage
>   
>   Fixes errors:
>   
> @@ -18,14 +18,13 @@ add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
>   Upstream-Status: Inappropriate [musl specific]
>   
>   Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>   ---
>    src/shared/cpu-set-util.h | 2 ++
>    src/test/test-sizeof.c    | 2 +-
>    2 files changed, 3 insertions(+), 1 deletion(-)
>   
>   diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
> -index 27812dfd5923..0ab40731ea93 100644
> +index 3c63a58826..4c2d4347fc 100644
>   --- a/src/shared/cpu-set-util.h
>   +++ b/src/shared/cpu-set-util.h
>   @@ -6,6 +6,8 @@
> @@ -38,11 +37,11 @@ index 27812dfd5923..0ab40731ea93 100644
>    typedef struct CPUSet {
>            cpu_set_t *set;
>   diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index c65062d2562c..8b6eefa9cdae 100644
> +index e1a59d408c..c269ea6e8c 100644
>   --- a/src/test/test-sizeof.c
>   +++ b/src/test/test-sizeof.c
>   @@ -1,6 +1,5 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
>    
>   -#include <sched.h>
>    #include <stdio.h>
> @@ -56,3 +55,6 @@ index c65062d2562c..8b6eefa9cdae 100644
>    
>    /* Print information about various types. Useful when diagnosing
>     * gcc diagnostics on an unfamiliar architecture. */
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> similarity index 67%
> rename from meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
> rename to meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> index c5960a0d60..4180afb08e 100644
> --- a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
> +++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> @@ -1,22 +1,26 @@
> -From ef9580ea1e2f1e57af3c7dcb0ec392ba8dbb5c8d Mon Sep 17 00:00:00 2001
> +From 47bf88f74717b417e4adbcc04256334b2335c873 Mon Sep 17 00:00:00 2001
>   From: Alex Kiernan <alex.kiernan@gmail.com>
>   Date: Tue, 10 Mar 2020 11:05:20 +0000
> -Subject: [PATCH] Handle missing gshadow
> +Subject: [PATCH 26/26] Handle missing gshadow
>   
>   gshadow usage is now present in the userdb code. Mask all uses of it to
>   allow compilation on musl
>   
>   Upstream-Status: Inappropriate [musl specific]
>   Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +[Rebased for v247]
> +Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   ---
> - src/shared/group-record-nss.c | 20 ++++++++++++++++++++
> - src/shared/group-record-nss.h |  4 ++++
> - src/shared/userdb.c           |  6 ++++++
> + src/shared/user-record-nss.c | 20 ++++++++++++++++++++
> + src/shared/user-record-nss.h |  4 ++++
> + src/shared/userdb.c          |  6 ++++++
>    3 files changed, 30 insertions(+)
>   
> ---- a/src/shared/group-record-nss.c
> -+++ b/src/shared/group-record-nss.c
> -@@ -19,8 +19,10 @@ int nss_group_to_group_record(
> +diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
> +index 88b8fc2f8f..a819d41bac 100644
> +--- a/src/shared/user-record-nss.c
> ++++ b/src/shared/user-record-nss.c
> +@@ -331,8 +331,10 @@ int nss_group_to_group_record(
>            if (isempty(grp->gr_name))
>                    return -EINVAL;
>    
> @@ -27,23 +31,23 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    
>            g = group_record_new();
>            if (!g)
> -@@ -36,6 +38,7 @@ int nss_group_to_group_record(
> +@@ -348,6 +350,7 @@ int nss_group_to_group_record(
>    
>            g->gid = grp->gr_gid;
>    
>   +#if ENABLE_GSHADOW
>            if (sgrp) {
> -                 if (looks_like_hashed_password(sgrp->sg_passwd)) {
> +                 if (looks_like_hashed_password(utf8_only(sgrp->sg_passwd))) {
>                            g->hashed_password = strv_new(sgrp->sg_passwd);
> -@@ -51,6 +54,7 @@ int nss_group_to_group_record(
> -                 if (!g->administrators)
> -                         return -ENOMEM;
> +@@ -363,6 +366,7 @@ int nss_group_to_group_record(
> +                 if (r < 0)
> +                         return r;
>            }
>   +#endif
>    
>            r = json_build(&g->json, JSON_BUILD_OBJECT(
>                                           JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
> -@@ -76,6 +80,7 @@ int nss_sgrp_for_group(const struct grou
> +@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
>            assert(ret_sgrp);
>            assert(ret_buffer);
>    
> @@ -51,7 +55,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            for (;;) {
>                    _cleanup_free_ char *buf = NULL;
>                    struct sgrp sgrp, *result;
> -@@ -104,6 +109,9 @@ int nss_sgrp_for_group(const struct grou
> +@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
>                    buflen *= 2;
>                    buf = mfree(buf);
>            }
> @@ -61,7 +65,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    }
>    
>    int nss_group_record_by_name(
> -@@ -115,7 +123,9 @@ int nss_group_record_by_name(
> +@@ -427,7 +435,9 @@ int nss_group_record_by_name(
>            struct group grp, *result;
>            bool incomplete = false;
>            size_t buflen = 4096;
> @@ -71,7 +75,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            int r;
>    
>            assert(name);
> -@@ -145,6 +155,7 @@ int nss_group_record_by_name(
> +@@ -457,6 +467,7 @@ int nss_group_record_by_name(
>                    buf = mfree(buf);
>            }
>    
> @@ -79,7 +83,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            if (with_shadow) {
>                    r = nss_sgrp_for_group(result, &sgrp, &sbuf);
>                    if (r < 0) {
> -@@ -156,6 +167,9 @@ int nss_group_record_by_name(
> +@@ -468,6 +479,9 @@ int nss_group_record_by_name(
>                    incomplete = true;
>    
>            r = nss_group_to_group_record(result, sresult, ret);
> @@ -89,7 +93,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            if (r < 0)
>                    return r;
>    
> -@@ -172,7 +186,9 @@ int nss_group_record_by_gid(
> +@@ -484,7 +498,9 @@ int nss_group_record_by_gid(
>            struct group grp, *result;
>            bool incomplete = false;
>            size_t buflen = 4096;
> @@ -99,7 +103,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            int r;
>    
>            assert(ret);
> -@@ -200,6 +216,7 @@ int nss_group_record_by_gid(
> +@@ -512,6 +528,7 @@ int nss_group_record_by_gid(
>                    buf = mfree(buf);
>            }
>    
> @@ -107,7 +111,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            if (with_shadow) {
>                    r = nss_sgrp_for_group(result, &sgrp, &sbuf);
>                    if (r < 0) {
> -@@ -211,6 +228,9 @@ int nss_group_record_by_gid(
> +@@ -523,6 +540,9 @@ int nss_group_record_by_gid(
>                    incomplete = true;
>    
>            r = nss_group_to_group_record(result, sresult, ret);
> @@ -117,8 +121,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>            if (r < 0)
>                    return r;
>    
> ---- a/src/shared/group-record-nss.h
> -+++ b/src/shared/group-record-nss.h
> +diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
> +index 22ab04d6ee..4e52e7a911 100644
> +--- a/src/shared/user-record-nss.h
> ++++ b/src/shared/user-record-nss.h
>   @@ -2,7 +2,11 @@
>    #pragma once
>    
> @@ -128,12 +134,14 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>   +#else
>   +struct sgrp;
>   +#endif
> + #include <pwd.h>
> + #include <shadow.h>
>    
> - #include "group-record.h"
> -
> +diff --git a/src/shared/userdb.c b/src/shared/userdb.c
> +index 2d480283d1..0d19764f2e 100644
>   --- a/src/shared/userdb.c
>   +++ b/src/shared/userdb.c
> -@@ -930,13 +930,16 @@ int groupdb_iterator_get(UserDBIterator
> +@@ -929,13 +929,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
>                    if (gr) {
>                            _cleanup_free_ char *buffer = NULL;
>                            bool incomplete = false;
> @@ -150,7 +158,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>                            r = nss_sgrp_for_group(gr, &sgrp, &buffer);
>                            if (r < 0) {
>                                    log_debug_errno(r, "Failed to acquire shadow entry for group %s, ignoring: %m", gr->gr_name);
> -@@ -944,6 +947,9 @@ int groupdb_iterator_get(UserDBIterator
> +@@ -943,6 +946,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
>                            }
>    
>                            r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
> @@ -160,3 +168,6 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>                            if (r < 0)
>                                    return r;
>    
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-nexthop.patch b/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-nexthop.patch
> deleted file mode 100644
> index b1c92ed713..0000000000
> --- a/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-nexthop.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 92b555aaabf710e0a672a7244e8c0e3963075133 Mon Sep 17 00:00:00 2001
> -From: Purushottam choudhary <purushottam.choudhary@kpit.com>
> -Date: Wed, 28 Oct 2020 22:11:49 +0530
> -Subject: [PATCH] network: selinux hook handling to enumerate nexthop
> -
> -When selinux is enabled, the call of
> -manager_rtnl_enumerate_nexthop() fails.
> -
> -This fix is to facilitate selinux hook handling for enumerating
> -nexthop.
> -
> -In manager_rtnl_enumerate_nexthop() there is a check
> -if "Not supported" is returned by the send_netlink() call.
> -
> -This check expects that -EOPNOTSUPP is returned,
> -the selinux hook seems to return -EINVAL instead.
> -
> -This happens in kernel older than 5.3
> -(more specificallytorvalds/linux@65ee00a) as it does not support
> -nexthop handling through netlink.
> -
> -And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP
> -returns -EINVAL.
> -
> -Thus adding a call in the manager_rtnl_enumerate_nexthop for the
> -extra return -EINVAL.
> -
> -Upstream-Status: Backport
> -https://github.com/systemd/systemd/commit/92b555aaabf710e0a672a7244e8c0e3963075133
> ----
> - src/network/networkd-manager.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager.c
> -index a6c1a39..2a9be85 100644
> ---- a/src/network/networkd-manager.c
> -+++ b/src/network/networkd-manager.c
> -@@ -2121,7 +2121,7 @@ int manager_rtnl_enumerate_nexthop(Manager *m) {
> -
> -         r = sd_netlink_call(m->rtnl, req, 0, &reply);
> -         if (r < 0) {
> --                if (r == -EOPNOTSUPP) {
> -+                if (r == -EOPNOTSUPP || r == -EINVAL) {
> -                         log_debug("Nexthop are not supported by the kernel. Ignoring.");
> -                         return 0;
> -                 }
> diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_247.1.bb
> similarity index 96%
> rename from meta/recipes-core/systemd/systemd_246.6.bb
> rename to meta/recipes-core/systemd/systemd_247.1.bb
> index d9e7b1a00c..bf73630569 100644
> --- a/meta/recipes-core/systemd/systemd_246.6.bb
> +++ b/meta/recipes-core/systemd/systemd_247.1.bb
> @@ -22,8 +22,8 @@ SRC_URI += "file://touchscreen.rules \
>              file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>              file://0003-implment-systemd-sysv-install-for-OE.patch \
>              file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
> -           file://selinux-hook-handling-to-enumerate-nexthop.patch \
>              file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
> +           file://0001-meson-set-cxx-variable-before-using-it.patch \
>              "
>   
>   # patches needed by musl
> @@ -34,26 +34,26 @@ SRC_URI_MUSL = "\
>                  file://0004-add-fallback-parse_printf_format-implementation.patch \
>                  file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
>                  file://0006-Include-netinet-if_ether.h.patch \
> -               file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch \
> +               file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
>                  file://0008-add-missing-FTW_-macros-for-musl.patch \
> -               file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
> -               file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
> -               file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
> -               file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> -               file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> -               file://0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
> -               file://0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
> -               file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
> -               file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
> -               file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
> -               file://0021-Handle-missing-LOCK_EX.patch \
> -               file://0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
> -               file://0024-test-json.c-define-M_PIl.patch \
> -               file://0001-do-not-disable-buffer-in-writing-files.patch \
> -               file://0002-src-login-brightness.c-include-sys-wait.h.patch \
> -               file://0003-src-basic-copy.c-include-signal.h.patch \
> -               file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
> -               file://0001-Handle-missing-gshadow.patch \
> +               file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
> +               file://0010-Use-uintmax_t-for-handling-rlim_t.patch \
> +               file://0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
> +               file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> +               file://0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> +               file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
> +               file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
> +               file://0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
> +               file://0017-missing_type.h-add-__compar_d_fn_t-definition.patch \
> +               file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
> +               file://0019-Handle-missing-LOCK_EX.patch \
> +               file://0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
> +               file://0021-test-json.c-define-M_PIl.patch \
> +               file://0022-do-not-disable-buffer-in-writing-files.patch \
> +               file://0023-Include-sys-wait.h.patch \
> +               file://0024-Include-signal.h.patch \
> +               file://0025-Handle-__cpu_mask-usage.patch \
> +               file://0026-Handle-missing-gshadow.patch \
>                  "
>   
>   PAM_PLUGINS = " \
> @@ -553,6 +553,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   ${sysconfdir}/resolv-conf.systemd \
>                   ${sysconfdir}/X11/xinit/xinitrc.d/* \
>                   ${rootlibexecdir}/systemd/* \
> +                ${libdir}/pam.d/ \
>                   ${systemd_unitdir}/* \
>                   ${base_libdir}/security/*.so \
>                   /cgroup \
> @@ -581,6 +582,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf \
>                   ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.conf \
>                   ${datadir}/dbus-1/system.d/org.freedesktop.portable1.conf \
> +                ${datadir}/dbus-1/system.d/org.freedesktop.oom1.conf \
>                  "
>   
>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> 
> 
> 
> 
> 

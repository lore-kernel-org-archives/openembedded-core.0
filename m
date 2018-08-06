Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD1974CB8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:59:10 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so21570723oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M/nIeEQm/GqjFGEZZ7QJdQvrv7yJQUkGJT4Bhojx32c=;
	b=P+kqwJEYVYHIUGq/DhqWQARETvXSnXTqKL/YCJ4fP//wnCZ7ByC+gVOUBgTskE02ip
	nGhKNhLKcIuasN84Q1B2eqwz2sgpNk7T69HtQPu4vZdmt3y/YRFSQa5FBraZQqgVFKKt
	qBnmjZCk06nSHe3iMGxqaxwKYzscRjMbEMIMCegMHrF6J0oUhlU9rh0IV1dZv5POzL2m
	XMF0bW/G6JTFzN7T1qvxVmcKL+crb9F2b0GdjmgWxRLHU8SqY4y4LILpiSQkP7RLQvLR
	F1oo0aMgTuSQDhBRFNC3DsI9nhBNAVv3Th36eumJyfX5l+VlNxiksVVL7PumRbiWYEYQ
	Oblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M/nIeEQm/GqjFGEZZ7QJdQvrv7yJQUkGJT4Bhojx32c=;
	b=Phnr+1LpPL/F8M12hj/xxT7QsSnxCReWfnte9iXBuOXzmuEVPUJxvuLrBHEOQM2gSq
	9CZL4vkF71fl2M/VAxjodJUzFK7m3xKkuSwwt0JvYePKHcFMuymK7vhCnzgS+pXEf06n
	tzRqLYRaNqOnDNl3sL4S+JuAhzimDH4JQ7N9iGGogBBf3NNFkMqKCEZ31igAumHtK18Y
	48Fou1jmouQYwtwYNodk3jhyriMBPntAeKpszWG2wJRxKBwWAbB8qSuR38QdHuu4F9kX
	dbfUKd/4ZtH22IHKaubwoEmUyYwA5Wv5JCfE36MHDt7sMpwiMxxJK5lRUF6qUa9wesmY
	ebhg==
X-Gm-Message-State: AOUpUlFXRLlyKN19sd+os7igIJjQA+WgaJ9rmO4Tsh4NtieHVHAJp5zn
	Rfbox7Xqd4ercEKZ9YJSCVCxJWh0kHzERDCXHeqDsuOFEso=
X-Google-Smtp-Source: AAOMgpdnWKfi/9jq1YzMeCetTPNNUQWQ5qFh7FTIHSEIvShLK26tvj0NmRBsW9vnYkvUR1o9hkcv0kdRIQVj/lNMhPo=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr7949289oia.18.1533556751955; 
	Mon, 06 Aug 2018 04:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 04:58:51 -0700 (PDT)
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 12:58:51 +0100
Message-ID: <CAJTo0LbJC8WMp=T-9PTHF3Ld2eV2t_oUkqfTGq4Ew7gH10bKvA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Update to glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 11:59:11 -0000
Content-Type: text/plain; charset="UTF-8"

Apart from all the failures from make, some other failures:

sysvinit doesn't like glibc 2.28.
http://errors.yoctoproject.org/Errors/Details/185058/
ld: /usr/src/debug/sysvinit/2.88dsf-r14/sysvinit-2.88dsf/src/mountpoint.c:123:
undefined reference to `major'

glibc/xcrypt are conflicting in nativesdk-perl builds:
ERROR: The file
/opt/poky/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libcrypt.so
is installed by both nativesdk-glibc and nativesdk-libxcrypt, aborting

Ross

On 5 August 2018 at 03:06, Khem Raj <raj.khem@gmail.com> wrote:
> There are few changes which results in fixing gnulib pieces and some header includes
> for statx
>
> The following changes since commit 1c4d9f46d5d94ea15d0c0d68c412ec05b9f51820:
>
>   machine: remove kernel-modules from RRECOMMENDS (2018-08-02 09:30:06 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.28
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.28
>
> Khem Raj (10):
>   glibc: Upgrade to 2.28
>   systemd: Detect if statx struct is defined in sys/stat.h
>   m4: Workaround gnulib's fseeko.c implementation
>   findutils: Fix build with glibc 2.28
>   bootchart2: Update to master-tip
>   gzip: Fix build with glibc 2.28
>   bison: Fix build break with glibc 2.28
>   strace: Fix build with glibc 2.28
>   blktool: Fix build with glibc 2.28
>   ppp: Use openssl for the DES instead of the libcrypt / glibc
>
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       |  84 ++++
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   5 +-
>  ...2.27.bb => cross-localedef-native_2.28.bb} |  18 +-
>  ...-initial_2.27.bb => glibc-initial_2.28.bb} |   0
>  ...bc-locale_2.27.bb => glibc-locale_2.28.bb} |   0
>  ...bc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} |   0
>  ...-scripts_2.27.bb => glibc-scripts_2.28.bb} |   0
>  ...Look-for-host-system-ld.so.cache-as-.patch |  12 +-
>  ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
>  ...Raise-the-size-of-arrays-containing-.patch |  18 +-
>  ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   6 +-
>  ...ake-relocatable-install-for-locales.patch} |  45 +-
>  ...500-e6500-603e-fsqrt-implementation.patch} |  44 +-
>  ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   6 +-
>  ...ndefined-reference-to-__sqrt_finite.patch} |   6 +-
>  ...are-now-inline-functions-and-call-o.patch} |   6 +-
>  ...43-which-explains-what-the-patch-do.patch} |   8 +-
>  ...-err-tab.pl-with-specific-dirs-in-S.patch} |   6 +-
>  ...are-now-inline-functions-and-call-o.patch} |   6 +-
>  ...gure.ac-handle-correctly-libc_cv_ro.patch} |   6 +-
>  ....patch => 0014-Add-unused-attribute.patch} |   6 +-
>  ...he-path-sets-wrong-config-variables.patch} |   6 +-
>  ...one-re-written-tzselect-as-posix-sh.patch} |   6 +-
>  ...ash-dependency-for-nscd-init-script.patch} |   6 +-
>  ...s-building-and-testing-instructions.patch} |  10 +-
>  ...libc-Help-bootstrap-cross-toolchain.patch} |  12 +-
>  ...-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   6 +-
>  ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   6 +-
>  ...port-cross-locale-generation-support.patch |  28 +-
>  ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
>  ...ke-_dl_build_local_scope-breadth-fir.patch |  10 +-
>  ...le-fix-hard-coded-reference-to-gcc-E.patch |   6 +-
>  ...set-dl_load_write_lock-after-forking.patch |  14 +-
>  ...ck-before-switching-to-malloc_atfork.patch |  30 +-
>  ...sts.h-enum-definition-for-TRAP_HWBKP.patch |  14 +-
>  ...with-memccpy-to-fix-Wstringop-trunca.patch |  40 --
>  ...archive-uses-a-hard-coded-locale-pa.patch} |  23 +-
>  ...t-no-lines-in-bison-generated-files.patch} |  17 +-
>  .../0031-nativesdk-deprecate-libcrypt.patch   | 419 ------------------
>  .../glibc/glibc/CVE-2017-18269.patch          | 178 --------
>  .../glibc/glibc/CVE-2018-11236.patch          | 164 -------
>  .../glibc/glibc/CVE-2018-11237.patch          |  82 ----
>  .../glibc/{glibc_2.27.bb => glibc_2.28.bb}    |  46 +-
>  ...-whether-struct-statx-is-defined-in-.patch | 109 +++++
>  meta/recipes-core/systemd/systemd_239.bb      |   1 +
>  .../recipes-devtools/bison/bison/gnulib.patch |  21 +
>  meta/recipes-devtools/bison/bison_3.0.4.bb    |   1 +
>  ...ssing-default-value-for-BOOTLOG_DEST.patch |  30 --
>  .../bootchart2/bootchart2_0.14.8.bb           |   4 +-
>  meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
>  .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++
>  .../0001-tests-Include-linux-stat.h.patch     |  76 ++++
>  meta/recipes-devtools/strace/strace_4.23.bb   |   1 +
>  .../blktool/blktool-gnulib-makedev.patch      |  23 +
>  meta/recipes-extended/blktool/blktool_4-7.bb  |   1 +
>  .../findutils-4.6.0-gnulib-fflush.patch       | 140 ++++++
>  .../findutils-4.6.0-gnulib-makedev.patch      |  78 ++++
>  .../findutils/findutils_4.6.0.bb              |   2 +
>  .../gzip/gzip-1.9/gnulib.patch                | 189 ++++++++
>  meta/recipes-extended/gzip/gzip_1.9.bb        |   4 +-
>  61 files changed, 1108 insertions(+), 1125 deletions(-)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
>  rename meta/recipes-core/glibc/{cross-localedef-native_2.27.bb => cross-localedef-native_2.28.bb} (70%)
>  rename meta/recipes-core/glibc/{glibc-initial_2.27.bb => glibc-initial_2.28.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-locale_2.27.bb => glibc-locale_2.28.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-scripts_2.27.bb => glibc-scripts_2.28.bb} (100%)
>  rename meta/recipes-core/glibc/glibc/{relocate-locales.patch => 0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch} (80%)
>  rename meta/recipes-core/glibc/glibc/{0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch => 0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (97%)
>  rename meta/recipes-core/glibc/glibc/{0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (85%)
>  rename meta/recipes-core/glibc/glibc/{0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (98%)
>  rename meta/recipes-core/glibc/glibc/{0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (98%)
>  rename meta/recipes-core/glibc/glibc/{0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (93%)
>  rename meta/recipes-core/glibc/glibc/{0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (89%)
>  rename meta/recipes-core/glibc/glibc/{0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (93%)
>  rename meta/recipes-core/glibc/glibc/{0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (88%)
>  rename meta/recipes-core/glibc/glibc/{0013-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (86%)
>  rename meta/recipes-core/glibc/glibc/{0014-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
>  rename meta/recipes-core/glibc/glibc/{0015-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (90%)
>  rename meta/recipes-core/glibc/glibc/{0016-Remove-bash-dependency-for-nscd-init-script.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (92%)
>  rename meta/recipes-core/glibc/glibc/{0017-eglibc-Cross-building-and-testing-instructions.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (99%)
>  rename meta/recipes-core/glibc/glibc/{0018-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (91%)
>  rename meta/recipes-core/glibc/glibc/{0019-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0020-eglibc-Clear-cache-lines-on-ppc8xx.patch} (96%)
>  rename meta/recipes-core/glibc/glibc/{0020-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0021-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
>  delete mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
>  rename meta/recipes-core/glibc/glibc/{archive-path.patch => 0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (69%)
>  rename meta/recipes-core/glibc/glibc/{0030-plural_c_no_preprocessor_lines.patch => 0030-intl-Emit-no-lines-in-bison-generated-files.patch} (59%)
>  delete mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
>  rename meta/recipes-core/glibc/{glibc_2.27.bb => glibc_2.28.bb} (72%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
>  create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
>  delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
>  create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
>  create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
>  create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
>  create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
>  create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
>  create mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


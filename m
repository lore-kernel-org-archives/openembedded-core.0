Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB199771B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 19:12:20 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id s198-v6so24121525oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DfVSk+aW4aAAWxAHILJP1LuyeBXBw1+F/zeEnkwOrTM=;
	b=giGH+SXg0CwKu8lR5c++ecT/v7om8oHDcLjtI42LDHIlNKPxaZm00lMTmoxHnYbBou
	c90Ml5P6g1o3bRdQ3YadL2iv4mE/2hBdVQXHtXkQqvB2aSc6+YhX/pMjbE64dR4pYzmF
	ScaldE8hjtbtJITbYNnjyXQjPA7d3TdKSSTAHM6zfWWqNNUDpqAkLEZbBFvgMrAAVSG8
	x9/vujXf2dZVX1bMzxmspQojcOjaYrPzTYGRaM6L37Q7BpYhpTn85cAm7EIqToKDXDiN
	bCd1VeNKBa9zTtmVYGJDyuKn4mg96X1rv6y7rMvb9SAVRloeXWBs+BAHQ0/aBzPy4ZuK
	Hhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DfVSk+aW4aAAWxAHILJP1LuyeBXBw1+F/zeEnkwOrTM=;
	b=nkrgU0ze3JQ+K6z7YBStV/loyBUgxX44EbsWpRVkeWrQQyY6K2KZvlQm1xOzsgz5CK
	UWs0WGlm0Sc7k5gPpEz/Au31Rtvg4dyRF/8pkGDwAA+avd6DtKCdxeKL2WDoCTm6l9lr
	MZrMV8XYdZ7wNFh52QIBlAmOg36lMM2j8124y9Uc1XH+uzhq51mzM1XCOhVoSh/g9VjV
	5NjK0bFvWR06FyAn1ftGJf5Qn9zr7VCHxGFi4i23d/3ynGw6LOkjI5HuuypZYCQXxcO+
	okv+65u9lw5KFV5lM+4xok520VcUf3rhT8U5VaY87p2/vCSFzJAezlAaXlpDrjpKGWPx
	gl7A==
X-Gm-Message-State: AOUpUlGr5qxbCJdlI0xTF+8Y/aeFBiAGIY+n+sLgtd24rewpuUrEAGz5
	5FrTBFE4UneZ0CrrGKSKA+sDopR6x80M54IZxN/nPgmHjqE=
X-Google-Smtp-Source: AAOMgpcmvV/WFwpdYL6i8NZ6a3LlzDvOvUnQp95E1JHieyv95qGoDClOXtJ/oWBHSBkQ1G2tn/dkczuN2SycjmDmEmo=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr16791369oif.235.1533582741535; 
	Mon, 06 Aug 2018 12:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 12:12:00 -0700 (PDT)
In-Reply-To: <CAJTo0LbJC8WMp=T-9PTHF3Ld2eV2t_oUkqfTGq4Ew7gH10bKvA@mail.gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
	<CAJTo0LbJC8WMp=T-9PTHF3Ld2eV2t_oUkqfTGq4Ew7gH10bKvA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 20:12:00 +0100
Message-ID: <CAJTo0La4P9FL=9iVahH8fyy67MWNsZzdnbpvPPt3O0_FzANUfg@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Aug 2018 19:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

Added a make-native dependency and respun it.

xf86-video-intel:
../../git/tools/backlight_helper.c:54:34: error: implicit declaration
of function 'major' [-Werror=implicit-function-declaration]
(haven't check but maybe
https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=aa40f990142eb165ee7f60f08e9616bc5bebdebe)

Ross

On 6 August 2018 at 12:58, Burton, Ross <ross.burton@intel.com> wrote:
> Apart from all the failures from make, some other failures:
>
> sysvinit doesn't like glibc 2.28.
> http://errors.yoctoproject.org/Errors/Details/185058/
> ld: /usr/src/debug/sysvinit/2.88dsf-r14/sysvinit-2.88dsf/src/mountpoint.c:123:
> undefined reference to `major'
>
> glibc/xcrypt are conflicting in nativesdk-perl builds:
> ERROR: The file
> /opt/poky/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libcrypt.so
> is installed by both nativesdk-glibc and nativesdk-libxcrypt, aborting
>
> Ross
>
> On 5 August 2018 at 03:06, Khem Raj <raj.khem@gmail.com> wrote:
>> There are few changes which results in fixing gnulib pieces and some header includes
>> for statx
>>
>> The following changes since commit 1c4d9f46d5d94ea15d0c0d68c412ec05b9f51820:
>>
>>   machine: remove kernel-modules from RRECOMMENDS (2018-08-02 09:30:06 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.28
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.28
>>
>> Khem Raj (10):
>>   glibc: Upgrade to 2.28
>>   systemd: Detect if statx struct is defined in sys/stat.h
>>   m4: Workaround gnulib's fseeko.c implementation
>>   findutils: Fix build with glibc 2.28
>>   bootchart2: Update to master-tip
>>   gzip: Fix build with glibc 2.28
>>   bison: Fix build break with glibc 2.28
>>   strace: Fix build with glibc 2.28
>>   blktool: Fix build with glibc 2.28
>>   ppp: Use openssl for the DES instead of the libcrypt / glibc
>>
>>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>>  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       |  84 ++++
>>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   5 +-
>>  ...2.27.bb => cross-localedef-native_2.28.bb} |  18 +-
>>  ...-initial_2.27.bb => glibc-initial_2.28.bb} |   0
>>  ...bc-locale_2.27.bb => glibc-locale_2.28.bb} |   0
>>  ...bc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} |   0
>>  ...-scripts_2.27.bb => glibc-scripts_2.28.bb} |   0
>>  ...Look-for-host-system-ld.so.cache-as-.patch |  12 +-
>>  ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
>>  ...Raise-the-size-of-arrays-containing-.patch |  18 +-
>>  ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   6 +-
>>  ...ake-relocatable-install-for-locales.patch} |  45 +-
>>  ...500-e6500-603e-fsqrt-implementation.patch} |  44 +-
>>  ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   6 +-
>>  ...ndefined-reference-to-__sqrt_finite.patch} |   6 +-
>>  ...are-now-inline-functions-and-call-o.patch} |   6 +-
>>  ...43-which-explains-what-the-patch-do.patch} |   8 +-
>>  ...-err-tab.pl-with-specific-dirs-in-S.patch} |   6 +-
>>  ...are-now-inline-functions-and-call-o.patch} |   6 +-
>>  ...gure.ac-handle-correctly-libc_cv_ro.patch} |   6 +-
>>  ....patch => 0014-Add-unused-attribute.patch} |   6 +-
>>  ...he-path-sets-wrong-config-variables.patch} |   6 +-
>>  ...one-re-written-tzselect-as-posix-sh.patch} |   6 +-
>>  ...ash-dependency-for-nscd-init-script.patch} |   6 +-
>>  ...s-building-and-testing-instructions.patch} |  10 +-
>>  ...libc-Help-bootstrap-cross-toolchain.patch} |  12 +-
>>  ...-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   6 +-
>>  ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   6 +-
>>  ...port-cross-locale-generation-support.patch |  28 +-
>>  ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
>>  ...ke-_dl_build_local_scope-breadth-fir.patch |  10 +-
>>  ...le-fix-hard-coded-reference-to-gcc-E.patch |   6 +-
>>  ...set-dl_load_write_lock-after-forking.patch |  14 +-
>>  ...ck-before-switching-to-malloc_atfork.patch |  30 +-
>>  ...sts.h-enum-definition-for-TRAP_HWBKP.patch |  14 +-
>>  ...with-memccpy-to-fix-Wstringop-trunca.patch |  40 --
>>  ...archive-uses-a-hard-coded-locale-pa.patch} |  23 +-
>>  ...t-no-lines-in-bison-generated-files.patch} |  17 +-
>>  .../0031-nativesdk-deprecate-libcrypt.patch   | 419 ------------------
>>  .../glibc/glibc/CVE-2017-18269.patch          | 178 --------
>>  .../glibc/glibc/CVE-2018-11236.patch          | 164 -------
>>  .../glibc/glibc/CVE-2018-11237.patch          |  82 ----
>>  .../glibc/{glibc_2.27.bb => glibc_2.28.bb}    |  46 +-
>>  ...-whether-struct-statx-is-defined-in-.patch | 109 +++++
>>  meta/recipes-core/systemd/systemd_239.bb      |   1 +
>>  .../recipes-devtools/bison/bison/gnulib.patch |  21 +
>>  meta/recipes-devtools/bison/bison_3.0.4.bb    |   1 +
>>  ...ssing-default-value-for-BOOTLOG_DEST.patch |  30 --
>>  .../bootchart2/bootchart2_0.14.8.bb           |   4 +-
>>  meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
>>  .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++
>>  .../0001-tests-Include-linux-stat.h.patch     |  76 ++++
>>  meta/recipes-devtools/strace/strace_4.23.bb   |   1 +
>>  .../blktool/blktool-gnulib-makedev.patch      |  23 +
>>  meta/recipes-extended/blktool/blktool_4-7.bb  |   1 +
>>  .../findutils-4.6.0-gnulib-fflush.patch       | 140 ++++++
>>  .../findutils-4.6.0-gnulib-makedev.patch      |  78 ++++
>>  .../findutils/findutils_4.6.0.bb              |   2 +
>>  .../gzip/gzip-1.9/gnulib.patch                | 189 ++++++++
>>  meta/recipes-extended/gzip/gzip_1.9.bb        |   4 +-
>>  61 files changed, 1108 insertions(+), 1125 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
>>  rename meta/recipes-core/glibc/{cross-localedef-native_2.27.bb => cross-localedef-native_2.28.bb} (70%)
>>  rename meta/recipes-core/glibc/{glibc-initial_2.27.bb => glibc-initial_2.28.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-locale_2.27.bb => glibc-locale_2.28.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-scripts_2.27.bb => glibc-scripts_2.28.bb} (100%)
>>  rename meta/recipes-core/glibc/glibc/{relocate-locales.patch => 0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch} (80%)
>>  rename meta/recipes-core/glibc/glibc/{0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch => 0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (97%)
>>  rename meta/recipes-core/glibc/glibc/{0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (85%)
>>  rename meta/recipes-core/glibc/glibc/{0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (98%)
>>  rename meta/recipes-core/glibc/glibc/{0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (98%)
>>  rename meta/recipes-core/glibc/glibc/{0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (93%)
>>  rename meta/recipes-core/glibc/glibc/{0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (89%)
>>  rename meta/recipes-core/glibc/glibc/{0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (93%)
>>  rename meta/recipes-core/glibc/glibc/{0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (88%)
>>  rename meta/recipes-core/glibc/glibc/{0013-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (86%)
>>  rename meta/recipes-core/glibc/glibc/{0014-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
>>  rename meta/recipes-core/glibc/glibc/{0015-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (90%)
>>  rename meta/recipes-core/glibc/glibc/{0016-Remove-bash-dependency-for-nscd-init-script.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (92%)
>>  rename meta/recipes-core/glibc/glibc/{0017-eglibc-Cross-building-and-testing-instructions.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (99%)
>>  rename meta/recipes-core/glibc/glibc/{0018-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (91%)
>>  rename meta/recipes-core/glibc/glibc/{0019-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0020-eglibc-Clear-cache-lines-on-ppc8xx.patch} (96%)
>>  rename meta/recipes-core/glibc/glibc/{0020-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0021-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
>>  rename meta/recipes-core/glibc/glibc/{archive-path.patch => 0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (69%)
>>  rename meta/recipes-core/glibc/glibc/{0030-plural_c_no_preprocessor_lines.patch => 0030-intl-Emit-no-lines-in-bison-generated-files.patch} (59%)
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
>>  rename meta/recipes-core/glibc/{glibc_2.27.bb => glibc_2.28.bb} (72%)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
>>  create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
>>  delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
>>  create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
>>  create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
>>  create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
>>  create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
>>  create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
>>  create mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
>>
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4487893A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 03:14:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so8191995pfw.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 19:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttqmVhiZ042ykFyX0oF97pGwF+N1BDZ1+Chifii0kR8=;
	b=gU78dCvEQI9CmfqWMQ9ZWZWGjELQXqDd6fpyeOc8NEiXd6yCcdLh6l0rSctiknh+x6
	miesGoDi5UrPuIwePVqVj8Ue0JsqaYR/x6KHvFPFEDxiSIiH4vIGhqfSJIXt4K1wuA6z
	e+ew7c6YqagUrr9DqYQiD/EB+3OHsIX28X1CevUZ9PrXS7shcvvC81/NGI+z1ixltLZu
	sujGjKYQP7w97W5zjDMpk80h1qjXd9SKitPjOWm13dCEKwqymqMvzTXiDUP3oIao6Bq1
	hHeW4ve7ihi9viqc96R9XL0m8rV8g5/vfMd9DXGV/BTTIW83ZRKP0YFKYGJQzcwF3jUb
	07wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttqmVhiZ042ykFyX0oF97pGwF+N1BDZ1+Chifii0kR8=;
	b=VgaX7lWTGFhGCRt/8NUo9qoNAZ3wJUI++NOqqjCCJ+IflSNm6RHeq/aGuSFFrc4p6Q
	yUv4JzmV4/4NmyTkwHaHVSVohv40D8ItBx9iufPY5VII73ylk6tCMPNyWPekjHFcwGdB
	QYir9TeXtv1Vl9iYPUEWt5RlPYkGMTP3nzzdtkLsOLVFJiSgwJUuzrltXLUUDTF+4QTp
	tBeqWP8RU9DB/mldZIlSpBn47lXqppZoLGOv4yyP/GIMqhr6CCrDT2l9CyVh26BDj23j
	Y0aghXr6fSnqXyNMY4r6rNHac5xmKZ0C07+rqvWbw9DqaC1GTZ6acAvd36PzZbTmkKp3
	r0vQ==
X-Gm-Message-State: APf1xPBY4TgDyr97MgLnxUNjDjoXHpsiL5JLlwxny8bK2x3ZE9D3W/uG
	owLvRVRVNFGKH1wtdxCpwEk17+4j7UgSgNuNFOU=
X-Google-Smtp-Source: AG47ELtaypOpCR1DJ9o+Mt9P2r5qZCT0EvbrWIPeS/SEsAIwtPahTMAKjpguJ0QW346sbu+sTZPU/tMCUpfxgyjeBAY=
X-Received: by 10.98.229.21 with SMTP id n21mr17296889pff.158.1520306058192;
	Mon, 05 Mar 2018 19:14:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 19:13:47 -0800 (PST)
In-Reply-To: <cover.1520213817.git.Qi.Chen@windriver.com>
References: <cover.1520213817.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 19:13:47 -0800
Message-ID: <CAMKF1srWB7AK=oJd-HpKB8_5eD0zQ0KUSaGnkL_JR5KwSpr-Yw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] systemd & systemd-boot: upgrade to 237
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
X-List-Received-Date: Tue, 06 Mar 2018 03:14:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 4, 2018 at 6:02 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Changes from last patchset (236 upgrading):
> 1. Use more vars (AR, NM, etc.) than just CC and LD in meson.bbclass.
> 2. Keep the PACKAGECONFIG item's name 'manpages' for compatibility.
> 3. Make it check for all i*86 archs instead of just i586 for systemd-boot.
> 4. Fix the '==' bashism in systemd-boot.
> 5. Rebase patches for 237.
>

before I try it out wanted to know if you tested it on musl targets ?

>
> The following changes since commit bd5424f5b05a0a65471a77632efe7b9907370217:
>
>   maintainers.inc: add myself as maintainer for the new busybox-inittab (2018-03-04 21:23:03 +0000)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237
>
> Chen Qi (4):
>   meson.bbclass: fix to build for more projects
>   systemd: upgrade to 237
>   systemd: fix build failure for qemux86 and qemuppc with musl
>   systemd-boot: upgrade to 237
>
>  meta/classes/meson.bbclass                         |  20 +-
>  .../{systemd-boot_234.bb => systemd-boot_237.bb}   |  32 ++-
>  meta/recipes-core/systemd/systemd.inc              |   2 +-
>  ...01-Also-check-i386-i586-and-i686-for-ia32.patch |  28 +++
>  ...efi_cc-and-efi_ld-correctly-when-cross-co.patch |  62 +++++
>  ...ck-protector-flags-to-workaround-musl-bui.patch |  33 +++
>  ...v-when-secure-versions-are-not-available.patch} |  21 +-
>  ...te-presets-after-generators-have-run-6526.patch |  69 ------
>  ...any-initialization-steps-when-running-in-.patch | 163 -------------
>  ...update-header-file-to-detect-memfd_create.patch |  28 ---
>  ...t-install-dependency-links-at-install-tim.patch |  81 +++++++
>  ...c-Check-if-memfd_create-is-already-define.patch |  27 ---
>  .../systemd/0003-fileio-include-sys-mman.h.patch   |  26 --
>  ...pper-instead-of-looking-for-relative-opti.patch |  64 +++++
>  ...004-implment-systemd-sysv-install-for-OE.patch} |   8 +-
>  ...t-install-dependency-links-at-install-tim.patch |  74 ------
>  ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
>  ...6-Make-root-s-home-directory-configurable.patch |  78 ++++++
>  ...vert-rules-remove-firmware-loading-rules.patch} |   8 +-
>  ...-check-for-missing-canonicalize_file_name.patch |  63 -----
>  ...pper-instead-of-looking-for-relative-opti.patch |  40 ---
>  .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ---
>  ...remove-userspace-firmware-loading-suppor.patch} | 204 +++++++++-------
>  ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
>  .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ++++
>  ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ---
>  ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  26 +-
>  ...es-watch-metadata-changes-in-ide-devices.patch} |   8 +-
>  ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
>  ...lback-parse_printf_format-implementation.patch} |  86 ++++---
>  ...sic-missing.h-check-for-missing-strndupa.patch} |  96 ++++----
>  ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  30 +--
>  ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  18 +-
>  ...patch => 0017-Include-netinet-if_ether.h.patch} |  55 +++--
>  ...-check-for-missing-canonicalize_file_name.patch |  47 ++++
>  .../0018-check-for-uchar.h-in-configure.patch      |  44 ----
>  ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 +++
>  ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  15 +-
>  ...c-Disable-tests-for-missing-typedefs-in-.patch} |  39 ++-
>  ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
>  ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  22 +-
>  ...n_t-is-glibc-specific-use-raw-signature-.patch} |  14 +-
>  ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} |  16 +-
>  ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
>  .../0027-remove-nobody-user-group-checking.patch   |  63 +++++
>  .../0028-add-missing-FTW_-macros-for-musl.patch    |  50 ++++
>  ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 ++++
>  ...-of-__register_atfork-for-non-glibc-build.patch |  45 ++++
>  ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 +++
>  meta/recipes-core/systemd/systemd/run-ptest        |   6 -
>  .../systemd/{systemd_234.bb => systemd_237.bb}     | 270 +++++++++------------
>  51 files changed, 1220 insertions(+), 1307 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_234.bb => systemd-boot_237.bb} (41%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>  rename meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secure-versions-are-not-available.patch => 0001-Use-getenv-when-secure-versions-are-not-available.patch} (53%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>  rename meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>  rename meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch => 0005-rules-whitelist-hd-devices.patch} (89%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>  rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>  rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (63%)
>  rename meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch => 0009-remove-duplicate-include-uchar.h.patch} (78%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>  rename meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (58%)
>  rename meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>  rename meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_printf_format-implementation.patch => 0013-add-fallback-parse_printf_format-implementation.patch} (88%)
>  rename meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-check-for-missing-strndupa.patch => 0014-src-basic-missing.h-check-for-missing-strndupa.patch} (47%)
>  rename meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
>  rename meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (77%)
>  rename meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch => 0017-Include-netinet-if_ether.h.patch} (67%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>  rename meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (68%)
>  rename meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (49%)
>  rename meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
>  rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (90%)
>  rename meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (77%)
>  rename meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch => 0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} (80%)
>  rename meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
>  create mode 100644 meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
>  rename meta/recipes-core/systemd/{systemd_234.bb => systemd_237.bb} (71%)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADC078A09
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 08:11:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w278BYta032727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Mar 2018 00:11:34 -0800
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 7 Mar 2018 00:11:00 -0800
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1520213817.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <bf69c172-e313-5dd0-4ad0-39d9358f1df8@windriver.com>
Date: Wed, 7 Mar 2018 16:11:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1520213817.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.197]
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
X-List-Received-Date: Wed, 07 Mar 2018 08:11:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

I've rebased the following patch against latest master and updated 
remote branch.

   systemd-boot: upgrade to 237

   git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237



Best Regards,
Chen Qi

On 03/05/2018 10:02 AM, Chen Qi wrote:
> Changes from last patchset (236 upgrading):
> 1. Use more vars (AR, NM, etc.) than just CC and LD in meson.bbclass.
> 2. Keep the PACKAGECONFIG item's name 'manpages' for compatibility.
> 3. Make it check for all i*86 archs instead of just i586 for systemd-boot.
> 4. Fix the '==' bashism in systemd-boot.
> 5. Rebase patches for 237.
>
>
> The following changes since commit bd5424f5b05a0a65471a77632efe7b9907370217:
>
>    maintainers.inc: add myself as maintainer for the new busybox-inittab (2018-03-04 21:23:03 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237
>
> Chen Qi (4):
>    meson.bbclass: fix to build for more projects
>    systemd: upgrade to 237
>    systemd: fix build failure for qemux86 and qemuppc with musl
>    systemd-boot: upgrade to 237
>
>   meta/classes/meson.bbclass                         |  20 +-
>   .../{systemd-boot_234.bb => systemd-boot_237.bb}   |  32 ++-
>   meta/recipes-core/systemd/systemd.inc              |   2 +-
>   ...01-Also-check-i386-i586-and-i686-for-ia32.patch |  28 +++
>   ...efi_cc-and-efi_ld-correctly-when-cross-co.patch |  62 +++++
>   ...ck-protector-flags-to-workaround-musl-bui.patch |  33 +++
>   ...v-when-secure-versions-are-not-available.patch} |  21 +-
>   ...te-presets-after-generators-have-run-6526.patch |  69 ------
>   ...any-initialization-steps-when-running-in-.patch | 163 -------------
>   ...update-header-file-to-detect-memfd_create.patch |  28 ---
>   ...t-install-dependency-links-at-install-tim.patch |  81 +++++++
>   ...c-Check-if-memfd_create-is-already-define.patch |  27 ---
>   .../systemd/0003-fileio-include-sys-mman.h.patch   |  26 --
>   ...pper-instead-of-looking-for-relative-opti.patch |  64 +++++
>   ...004-implment-systemd-sysv-install-for-OE.patch} |   8 +-
>   ...t-install-dependency-links-at-install-tim.patch |  74 ------
>   ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
>   ...6-Make-root-s-home-directory-configurable.patch |  78 ++++++
>   ...vert-rules-remove-firmware-loading-rules.patch} |   8 +-
>   ...-check-for-missing-canonicalize_file_name.patch |  63 -----
>   ...pper-instead-of-looking-for-relative-opti.patch |  40 ---
>   .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ---
>   ...remove-userspace-firmware-loading-suppor.patch} | 204 +++++++++-------
>   ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
>   .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ++++
>   ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ---
>   ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  26 +-
>   ...es-watch-metadata-changes-in-ide-devices.patch} |   8 +-
>   ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
>   ...lback-parse_printf_format-implementation.patch} |  86 ++++---
>   ...sic-missing.h-check-for-missing-strndupa.patch} |  96 ++++----
>   ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  30 +--
>   ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  18 +-
>   ...patch => 0017-Include-netinet-if_ether.h.patch} |  55 +++--
>   ...-check-for-missing-canonicalize_file_name.patch |  47 ++++
>   .../0018-check-for-uchar.h-in-configure.patch      |  44 ----
>   ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 +++
>   ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  15 +-
>   ...c-Disable-tests-for-missing-typedefs-in-.patch} |  39 ++-
>   ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
>   ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  22 +-
>   ...n_t-is-glibc-specific-use-raw-signature-.patch} |  14 +-
>   ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} |  16 +-
>   ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
>   .../0027-remove-nobody-user-group-checking.patch   |  63 +++++
>   .../0028-add-missing-FTW_-macros-for-musl.patch    |  50 ++++
>   ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 ++++
>   ...-of-__register_atfork-for-non-glibc-build.patch |  45 ++++
>   ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 +++
>   meta/recipes-core/systemd/systemd/run-ptest        |   6 -
>   .../systemd/{systemd_234.bb => systemd_237.bb}     | 270 +++++++++------------
>   51 files changed, 1220 insertions(+), 1307 deletions(-)
>   rename meta/recipes-core/systemd/{systemd-boot_234.bb => systemd-boot_237.bb} (41%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>   rename meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secure-versions-are-not-available.patch => 0001-Use-getenv-when-secure-versions-are-not-available.patch} (53%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>   rename meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>   rename meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch => 0005-rules-whitelist-hd-devices.patch} (89%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>   rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>   rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (63%)
>   rename meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch => 0009-remove-duplicate-include-uchar.h.patch} (78%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>   rename meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (58%)
>   rename meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>   rename meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_printf_format-implementation.patch => 0013-add-fallback-parse_printf_format-implementation.patch} (88%)
>   rename meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-check-for-missing-strndupa.patch => 0014-src-basic-missing.h-check-for-missing-strndupa.patch} (47%)
>   rename meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
>   rename meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (77%)
>   rename meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch => 0017-Include-netinet-if_ether.h.patch} (67%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>   rename meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (68%)
>   rename meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (49%)
>   rename meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
>   rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (90%)
>   rename meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (77%)
>   rename meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch => 0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} (80%)
>   rename meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
>   rename meta/recipes-core/systemd/{systemd_234.bb => systemd_237.bb} (71%)
>



Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAC6A7881E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 03:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w213FMwY025414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Feb 2018 19:15:22 -0800
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Feb 2018 19:15:21 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<17b1cd0eb9a731bdf5049a60bb8efd00614f8edd.1519797175.git.Qi.Chen@windriver.com>
	<CAJTo0LZ3d68OW-6t4wTreW5jeAGZaPMeXwvfOeufcqYVZRBzvA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <660e2c8a-8f4d-40af-443b-63d016a7d3fc@windriver.com>
Date: Thu, 1 Mar 2018 11:15:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ3d68OW-6t4wTreW5jeAGZaPMeXwvfOeufcqYVZRBzvA@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: upgrade to 236
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
X-List-Received-Date: Thu, 01 Mar 2018 03:15:49 -0000
Content-Type: multipart/alternative;
	boundary="------------C9011CB4348048E2C5755D89"

--------------C9011CB4348048E2C5755D89
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2018 09:50 PM, Burton, Ross wrote:
> WARNING: systemd-1_236-r0 do_configure: QA Issue: systemd: invalid 
> PACKAGECONFIG: manpages [invalid-packageconfig]
>
> I see the man pages don't get built now, but this isn't documented 
> anywhere in changelog.
>
> Ross
>

The PACKAGECONFIG 'manpages' is now renamed to 'man'. I forgot to 
mention this in commit message.

I renamed it to 'man' because in meson_options.txt, we have:
option('man', type : 'combo', choices : ['auto', 'true', 'false'],
        description : 'build and install man pages')

I'll add this info in commit message in V2.

Best Regards,
Chen Qi

> On 28 February 2018 at 05:56, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Upgrade systemd to 236.
>
>     Note that this version has dropped autotools support.
>
>     The following patches are rebased:
>     0004-Use-getenv-when-secure-versions-are-not-available.patch
>     0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     0018-check-for-uchar.h-in-configure.patch
>     0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     0001-add-fallback-parse_printf_format-implementation.patch
>     0002-src-basic-missing.h-check-for-missing-strndupa.patch
>     0007-check-for-missing-canonicalize_file_name.patch
>     0008-Do-not-enable-nss-tests.patch
>     0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>     0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>
>     The following backported patches are dropped:
>     0001-core-evaluate-presets-after-generators-have-run-6526.patch
>     0001-main-skip-many-initialization-steps-when-running-in-.patch
>     0001-meson-update-header-file-to-detect-memfd_create.patch
>     0003-fileio-include-sys-mman.h.patch
>
>     The following patch is dropped as autotools support is dropped:
>     0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>
>     The following patches are newly added to fix problems:
>     0027-remove-nobody-user-group-checking.patch
>     0028-src-resolve-test-dnssec.c-fix-build-without-gcrypt.patch
>     0029-add-missing-FTW_-macros-for-musl.patch
>     0031-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>     0032-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>
>     Other changes are mostly autotools/meson related.
>
>     This new version has dropped ptest support, as there's no easy
>     way to do this in the framework of meson.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta/recipes-core/systemd/systemd.inc              |  2 +-
>      ...v-when-secure-versions-are-not-available.patch} | 21 +-
>      ...te-presets-after-generators-have-run-6526.patch | 69 ------
>      ...any-initialization-steps-when-running-in-.patch | 163
>     -------------
>      ...update-header-file-to-detect-memfd_create.patch | 28 ---
>      ...t-install-dependency-links-at-install-tim.patch | 81 +++++++
>      ...c-Check-if-memfd_create-is-already-define.patch | 27 ---
>      .../systemd/0003-fileio-include-sys-mman.h.patch   | 26 --
>      ...pper-instead-of-looking-for-relative-opti.patch | 64 +++++
>      ...004-implment-systemd-sysv-install-for-OE.patch} |  8 +-
>      ...t-install-dependency-links-at-install-tim.patch | 74 ------
>      ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
>      ...6-Make-root-s-home-directory-configurable.patch | 78 ++++++
>      ...vert-rules-remove-firmware-loading-rules.patch} |  8 +-
>      ...-check-for-missing-canonicalize_file_name.patch | 63 -----
>      ...pper-instead-of-looking-for-relative-opti.patch | 40 ---
>      .../systemd/0008-Do-not-enable-nss-tests.patch     | 35 ---
>      ...remove-userspace-firmware-loading-suppor.patch} | 201
>     +++++++++-------
>      ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
>      .../0010-check-for-uchar.h-in-meson.build.patch    | 45 ++++
>      ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch | 38 ---
>      ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} | 26 +-
>      ...es-watch-metadata-changes-in-ide-devices.patch} |  8 +-
>      ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
>      ...lback-parse_printf_format-implementation.patch} | 86 ++++---
>      ...sic-missing.h-check-for-missing-strndupa.patch} | 71 +++---
>      ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} | 30 +--
>      ...ssing.h-check-for-missing-__compar_fn_t-.patch} | 18 +-
>      ...patch => 0017-Include-netinet-if_ether.h.patch} |  32 +--
>      ...-check-for-missing-canonicalize_file_name.patch | 47 ++++
>      .../0018-check-for-uchar.h-in-configure.patch      | 44 ----
>      ...le-nss-tests-if-nss-systemd-is-not-enable.patch | 29 +++
>      ...xdecoct.c-Include-missing.h-for-strndupa.patch} | 15 +-
>      ...c-Disable-tests-for-missing-typedefs-in-.patch} | 37 ++-
>      ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
>      ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} | 22 +-
>      ...n_t-is-glibc-specific-use-raw-signature-.patch} | 14 +-
>      ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} | 16 +-
>      ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
>      .../0027-remove-nobody-user-group-checking.patch   | 63 +++++
>      ...ve-test-dnssec.c-fix-build-without-gcrypt.patch | 36 +++
>      .../0029-add-missing-FTW_-macros-for-musl.patch    | 50 ++++
>      ...nes-Build-conditionally-when-ENABLE_MYHOS.patch | 43 ++++
>      ...-of-__register_atfork-for-non-glibc-build.patch | 45 ++++
>      ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch | 30 +++
>      meta/recipes-core/systemd/systemd/run-ptest        |  6 -
>      .../systemd/{systemd_234.bb <http://systemd_234.bb> =>
>     systemd_236.bb <http://systemd_236.bb>}     | 267
>     ++++++++-------------
>      47 files changed, 1071 insertions(+), 1261 deletions(-)
>      rename
>     meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secure-versions-are-not-available.patch
>     => 0001-Use-getenv-when-secure-versions-are-not-available.patch} (53%)
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch
>     => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch
>     => 0005-rules-whitelist-hd-devices.patch} (89%)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch
>     => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     =>
>     0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (65%)
>      rename
>     meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch
>     => 0009-remove-duplicate-include-uchar.h.patch} (78%)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     => 0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch}
>     (58%)
>      rename
>     meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch
>     => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_printf_format-implementation.patch
>     => 0013-add-fallback-parse_printf_format-implementation.patch} (88%)
>      rename
>     meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-check-for-missing-strndupa.patch
>     => 0014-src-basic-missing.h-check-for-missing-strndupa.patch} (60%)
>      rename
>     meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     =>
>     0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
>      rename
>     meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     =>
>     0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (77%)
>      rename
>     meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch
>     => 0017-Include-netinet-if_ether.h.patch} (81%)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>      delete mode 100644
>     meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>      rename
>     meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
>     => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (68%)
>      rename
>     meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>     =>
>     0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (49%)
>      rename
>     meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch
>     => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
>      rename
>     meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>     => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (90%)
>      rename
>     meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>     =>
>     0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (77%)
>      rename
>     meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>     => 0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} (80%)
>      rename
>     meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch
>     => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0028-src-resolve-test-dnssec.c-fix-build-without-gcrypt.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0029-add-missing-FTW_-macros-for-musl.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0030-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0031-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0032-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>      delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
>      rename meta/recipes-core/systemd/{systemd_234.bb
>     <http://systemd_234.bb> => systemd_236.bb <http://systemd_236.bb>}
>     (71%)
>
>     diff --git a/meta/recipes-core/systemd/systemd.inc
>     b/meta/recipes-core/systemd/systemd.inc
>     index d99d150..9ecd992 100644
>     --- a/meta/recipes-core/systemd/systemd.inc
>     +++ b/meta/recipes-core/systemd/systemd.inc
>     @@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                        
>      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
>     -SRCREV = "c1edab7ad1e7ccc9be693bedfd464cd1cbffb395"
>     +SRCREV = "a1b2c92d8290c76a29ccd0887a92ac064e1bb5a1"
>
>      SRC_URI = "git://github.com/systemd/systemd.git;protocol=git
>     <http://github.com/systemd/systemd.git;protocol=git>"
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
>     b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>     similarity index 53%
>     rename from
>     meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>     index ab2cbe0..6693b4a 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>     @@ -1,23 +1,26 @@
>     -From 5765cda4f7243e240b1e8723dc536fb20503d544 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Wed, 9 Nov 2016 19:28:32 -0800
>     -Subject: [PATCH 04/19] Use getenv when secure versions are not
>     available
>     +From 768742b1b5af5563897fe89399f6cf580b83137c Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Fri, 23 Feb 2018 10:04:48 +0800
>     +Subject: [PATCH 01/32] Use getenv when secure versions are not
>     available
>
>      musl doesnt implement secure version, so we default
>     -to it if configure does not detect a secure imeplementation
>     +to it if configure does not detect a secure implementation
>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +
>      Upstream-Status: Denied
>     +
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>      ---
>       src/basic/missing.h | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>      diff --git a/src/basic/missing.h b/src/basic/missing.h
>     -index 4a3fd9c..4936873 100644
>     +index 790f9f55a..5a602e9a6 100644
>      --- a/src/basic/missing.h
>      +++ b/src/basic/missing.h
>     -@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {
>     - #  ifdef HAVE___SECURE_GETENV
>     +@@ -547,7 +547,7 @@ struct btrfs_ioctl_quota_ctl_args {
>     + #  if HAVE___SECURE_GETENV
>       #    define secure_getenv __secure_getenv
>       #  else
>      -#    error "neither secure_getenv nor __secure_getenv are available"
>     @@ -26,5 +29,5 @@ index 4a3fd9c..4936873 100644
>       #endif
>
>      --
>     -2.10.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>     b/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>     deleted file mode 100644
>     index df100e5..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>     +++ /dev/null
>     @@ -1,69 +0,0 @@
>     -From 28dd66ecfce743b1ea9046c7bb501e0fcaeff724 Mon Sep 17 00:00:00
>     2001
>     -From: Luca Bruno <luca.bruno@coreos.com
>     <mailto:luca.bruno@coreos.com>>
>     -Date: Sun, 6 Aug 2017 13:24:24 +0000
>     -Subject: [PATCH] core: evaluate presets after generators have run
>     (#6526)
>     -
>     -This commit moves the first-boot system preset-settings
>     evaluation out
>     -of main and into the manager startup logic itself. Notably, it
>     reverses
>     -the order between generators and presets evaluation, so that any
>     changes
>     -performed by first-boot generators are taken into the account by
>     presets
>     -logic.
>     -
>     -After this change, units created by a generator can be enabled as
>     part
>     -of a preset.
>     -
>     -Upstream-Status: Backport
>     -
>     -Signed-off-by: Catalin Enache <catalin.enache@windriver.com
>     <mailto:catalin.enache@windriver.com>>
>     ----
>     - src/core/main.c    | 12 ++----------
>     - src/core/manager.c |  8 ++++++++
>     - 2 files changed, 10 insertions(+), 10 deletions(-)
>     -
>     -diff --git a/src/core/main.c b/src/core/main.c
>     -index dfedc3d..11ac9cf 100644
>     ---- a/src/core/main.c
>     -+++ b/src/core/main.c
>     -@@ -1809,18 +1809,10 @@ int main(int argc, char *argv[]) {
>     -                 if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
>     -                         log_warning_errno(errno, "Failed to make
>     us a subreaper: %m");
>     -
>     --        if (arg_system) {
>     -+        if (arg_system)
>     -+                /* Bump up RLIMIT_NOFILE for systemd itself */
>     -                 (void) bump_rlimit_nofile(&saved_rlimit_nofile);
>     -
>     --                if (empty_etc) {
>     --                        r =
>     unit_file_preset_all(UNIT_FILE_SYSTEM, 0, NULL,
>     UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
>     --                        if (r < 0)
>     --                                log_full_errno(r == -EEXIST ?
>     LOG_NOTICE : LOG_WARNING, r, "Failed to populate /etc with preset
>     unit settings, ignoring: %m");
>     --                        else
>     --                                log_info("Populated /etc with
>     preset unit settings.");
>     --                }
>     --        }
>     --
>     -         r = manager_new(arg_system ? UNIT_FILE_SYSTEM :
>     UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
>     -         if (r < 0) {
>     -                 log_emergency_errno(r, "Failed to allocate
>     manager object: %m");
>     -diff --git a/src/core/manager.c b/src/core/manager.c
>     -index 1aadb70..fb5e2b5 100644
>     ---- a/src/core/manager.c
>     -+++ b/src/core/manager.c
>     -@@ -1328,6 +1328,14 @@ int manager_startup(Manager *m, FILE
>     *serialization, FDSet *fds) {
>     -         if (r < 0)
>     -                 return r;
>     -
>     -+        if (m->first_boot && m->unit_file_scope ==
>     UNIT_FILE_SYSTEM) {
>     -+                q = unit_file_preset_all(UNIT_FILE_SYSTEM, 0,
>     NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
>     -+                if (q < 0)
>     -+                        log_full_errno(q == -EEXIST ? LOG_NOTICE
>     : LOG_WARNING, q, "Failed to populate /etc with preset unit
>     settings, ignoring: %m");
>     -+                else
>     -+                        log_info("Populated /etc with preset
>     unit settings.");
>     -+        }
>     -+
>     -         lookup_paths_reduce(&m->lookup_paths);
>     -         manager_build_unit_path_cache(m);
>     -
>     ---
>     -2.10.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>     b/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>     deleted file mode 100644
>     index a033b04..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>     +++ /dev/null
>     @@ -1,163 +0,0 @@
>     -From dea374e898a749a0474b72b2015cca9009b1432b Mon Sep 17 00:00:00
>     2001
>     -From: Lennart Poettering <lennart@poettering.net
>     <mailto:lennart@poettering.net>>
>     -Date: Wed, 13 Sep 2017 10:31:40 +0200
>     -Subject: [PATCH] main: skip many initialization steps when
>     running in --test
>     - mode
>     -
>     -Most importantly, don't collect open socket activation fds when in
>     ---test mode. This specifically created a problem because we invoke
>     -pager_open() beforehand (which these days makes copies of the
>     original
>     -stdout/stderr in order to be able to restore them when the pager goes
>     -away) and we might mistakenly the fd copies it creates as socket
>     -activation fds.
>     -
>     -Fixes: #6383
>     -
>     -Upstream-Status: Backport
>     -
>     -Signed-off-by: Catalin Enache <catalin.enache@windriver.com
>     <mailto:catalin.enache@windriver.com>>
>     ----
>     - src/core/main.c | 108
>     +++++++++++++++++++++++++++++---------------------------
>     - 1 file changed, 56 insertions(+), 52 deletions(-)
>     -
>     -diff --git a/src/core/main.c b/src/core/main.c
>     -index 11ac9cf..d1a53a5 100644
>     ---- a/src/core/main.c
>     -+++ b/src/core/main.c
>     -@@ -1679,20 +1679,22 @@ int main(int argc, char *argv[]) {
>     -         log_close();
>     -
>     -         /* Remember open file descriptors for later
>     deserialization */
>     --        r = fdset_new_fill(&fds);
>     --        if (r < 0) {
>     --                log_emergency_errno(r, "Failed to allocate fd
>     set: %m");
>     --                error_message = "Failed to allocate fd set";
>     --                goto finish;
>     --        } else
>     --                fdset_cloexec(fds, true);
>     -+        if (arg_action == ACTION_RUN) {
>     -+                r = fdset_new_fill(&fds);
>     -+                if (r < 0) {
>     -+                        log_emergency_errno(r, "Failed to
>     allocate fd set: %m");
>     -+                        error_message = "Failed to allocate fd set";
>     -+                        goto finish;
>     -+                } else
>     -+                        fdset_cloexec(fds, true);
>     -
>     --        if (arg_serialization)
>     --                assert_se(fdset_remove(fds,
>     fileno(arg_serialization)) >= 0);
>     -+                if (arg_serialization)
>     -+                        assert_se(fdset_remove(fds,
>     fileno(arg_serialization)) >= 0);
>     -
>     --        if (arg_system)
>     --                /* Become a session leader if we aren't one yet. */
>     --                setsid();
>     -+                if (arg_system)
>     -+                        /* Become a session leader if we aren't
>     one yet. */
>     -+                        setsid();
>     -+        }
>     -
>     -         /* Move out of the way, so that we won't block unmounts */
>     -         assert_se(chdir("/") == 0);
>     -@@ -1762,56 +1764,58 @@ int main(int argc, char *argv[]) {
>     -                           arg_action == ACTION_TEST ? " test" :
>     "", getuid(), t);
>     -         }
>     -
>     --        if (arg_system && !skip_setup) {
>     --                if (arg_show_status > 0)
>     --                        status_welcome();
>     -+        if (arg_action == ACTION_RUN) {
>     -+                if (arg_system && !skip_setup) {
>     -+                        if (arg_show_status > 0)
>     -+                                status_welcome();
>     -
>     --                hostname_setup();
>     --                machine_id_setup(NULL, arg_machine_id, NULL);
>     --                loopback_setup();
>     --                bump_unix_max_dgram_qlen();
>     -+                        hostname_setup();
>     -+                        machine_id_setup(NULL, arg_machine_id,
>     NULL);
>     -+                        loopback_setup();
>     -+                        bump_unix_max_dgram_qlen();
>     -
>     --                test_usr();
>     --        }
>     -+                        test_usr();
>     -+                }
>     -
>     --        if (arg_system && arg_runtime_watchdog > 0 &&
>     arg_runtime_watchdog != USEC_INFINITY)
>     --                watchdog_set_timeout(&arg_runtime_watchdog);
>     -+                if (arg_system && arg_runtime_watchdog > 0 &&
>     arg_runtime_watchdog != USEC_INFINITY)
>     -+                        watchdog_set_timeout(&arg_runtime_watchdog);
>     -
>     --        if (arg_timer_slack_nsec != NSEC_INFINITY)
>     --                if (prctl(PR_SET_TIMERSLACK,
>     arg_timer_slack_nsec) < 0)
>     --                        log_error_errno(errno, "Failed to adjust
>     timer slack: %m");
>     -+                if (arg_timer_slack_nsec != NSEC_INFINITY)
>     -+                        if (prctl(PR_SET_TIMERSLACK,
>     arg_timer_slack_nsec) < 0)
>     -+                                log_error_errno(errno, "Failed
>     to adjust timer slack: %m");
>     -
>     --        if (arg_system &&
>     !cap_test_all(arg_capability_bounding_set)) {
>     --                r =
>     capability_bounding_set_drop_usermode(arg_capability_bounding_set);
>     --                if (r < 0) {
>     --                        log_emergency_errno(r, "Failed to drop
>     capability bounding set of usermode helpers: %m");
>     --                        error_message = "Failed to drop
>     capability bounding set of usermode helpers";
>     --                        goto finish;
>     --                }
>     --                r =
>     capability_bounding_set_drop(arg_capability_bounding_set, true);
>     --                if (r < 0) {
>     --                        log_emergency_errno(r, "Failed to drop
>     capability bounding set: %m");
>     --                        error_message = "Failed to drop
>     capability bounding set";
>     --                        goto finish;
>     -+                if (arg_system &&
>     !cap_test_all(arg_capability_bounding_set)) {
>     -+                        r =
>     capability_bounding_set_drop_usermode(arg_capability_bounding_set);
>     -+                        if (r < 0) {
>     -+                                log_emergency_errno(r, "Failed
>     to drop capability bounding set of usermode helpers: %m");
>     -+                                error_message = "Failed to drop
>     capability bounding set of usermode helpers";
>     -+                                goto finish;
>     -+                        }
>     -+                        r =
>     capability_bounding_set_drop(arg_capability_bounding_set, true);
>     -+                        if (r < 0) {
>     -+                                log_emergency_errno(r, "Failed
>     to drop capability bounding set: %m");
>     -+                                error_message = "Failed to drop
>     capability bounding set";
>     -+                                goto finish;
>     -+                        }
>     -                 }
>     --        }
>     -
>     --        if (arg_syscall_archs) {
>     --                r = enforce_syscall_archs(arg_syscall_archs);
>     --                if (r < 0) {
>     --                        error_message = "Failed to set syscall
>     architectures";
>     --                        goto finish;
>     -+                if (arg_syscall_archs) {
>     -+                        r =
>     enforce_syscall_archs(arg_syscall_archs);
>     -+                        if (r < 0) {
>     -+                                error_message = "Failed to set
>     syscall architectures";
>     -+                                goto finish;
>     -+                        }
>     -                 }
>     --        }
>     -
>     --        if (!arg_system)
>     --                /* Become reaper of our children */
>     --                if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
>     --                        log_warning_errno(errno, "Failed to make
>     us a subreaper: %m");
>     -+                if (!arg_system)
>     -+                        /* Become reaper of our children */
>     -+                        if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
>     -+                                log_warning_errno(errno, "Failed
>     to make us a subreaper: %m");
>     -
>     --        if (arg_system)
>     --                /* Bump up RLIMIT_NOFILE for systemd itself */
>     --                (void) bump_rlimit_nofile(&saved_rlimit_nofile);
>     -+                if (arg_system)
>     -+                        /* Bump up RLIMIT_NOFILE for systemd
>     itself */
>     -+                        (void)
>     bump_rlimit_nofile(&saved_rlimit_nofile);
>     -+        }
>     -
>     -         r = manager_new(arg_system ? UNIT_FILE_SYSTEM :
>     UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
>     -         if (r < 0) {
>     ---
>     -2.10.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>     b/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>     deleted file mode 100644
>     index c643120..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
>     +++ /dev/null
>     @@ -1,28 +0,0 @@
>     -From 2207e1ffe4f7e2dcc5e745dadb48738aa1048d63 Mon Sep 17 00:00:00
>     2001
>     -From: Yu Watanabe <watanabe.yu+github@gmail.com
>     <mailto:watanabe.yu%2Bgithub@gmail.com>>
>     -Date: Sun, 26 Nov 2017 02:17:06 +0900
>     -Subject: [PATCH 1/3] meson: update header file to detect
>     memfd_create()
>     -
>     ----
>     -Upstream-Status: Backport
>     -
>     - meson.build | 3 ++-
>     - 1 file changed, 2 insertions(+), 1 deletion(-)
>     -
>     -diff --git a/meson.build b/meson.build
>     -index 20b27c860..550dd4ad8 100644
>     ---- a/meson.build
>     -+++ b/meson.build
>     -@@ -414,7 +414,8 @@ foreach ident : ['secure_getenv',
>     '__secure_getenv']
>     - endforeach
>     -
>     - foreach ident : [
>     --        ['memfd_create',      '''#include <sys/memfd.h>'''],
>     -+        ['memfd_create',      '''#define _GNU_SOURCE
>     -+                                 #include <sys/mman.h>'''],
>     -         ['gettid',            '''#include <sys/types.h>'''],
>     -         ['pivot_root',        '''#include <stdlib.h>'''],     #
>     no known header declares pivot_root
>     -         ['name_to_handle_at', '''#define _GNU_SOURCE
>     ---
>     -2.16.1
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     new file mode 100644
>     index 0000000..dd63a16
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     @@ -0,0 +1,81 @@
>     +From ca6eced0161fb7282e926cf3afc9bd9c772235ef Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Fri, 23 Feb 2018 10:23:40 +0800
>     +Subject: [PATCH 02/32] binfmt: Don't install dependency links at
>     install time
>     + for the binfmt services
>     +
>     +use [Install] blocks so that they get created when the service is
>     enabled
>     +like a traditional service.
>     +
>     +The [Install] blocks were rejected upstream as they don't have a
>     way to
>     +"enable" it on install without static symlinks which can't be
>     disabled,
>     +only masked. We however can do that in a postinst.
>     +
>     +Upstream-Status: Denied
>     +
>     +Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + units/meson.build                       | 6 ++----
>     + units/proc-sys-fs-binfmt_misc.automount | 3 +++
>     + units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>  | 4 ++++
>     + 3 files changed, 9 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/units/meson.build b/units/meson.build
>     +index 814ee7885..49ace0d0f 100644
>     +--- a/units/meson.build
>     ++++ b/units/meson.build
>     +@@ -60,8 +60,7 @@ units = [
>     +         ['poweroff.target',                     '',
>     +          'runlevel0.target'],
>     +         ['printer.target',                      ''],
>     +-        ['proc-sys-fs-binfmt_misc.automount',  'ENABLE_BINFMT',
>     +-         'sysinit.target.wants/'],
>     ++        ['proc-sys-fs-binfmt_misc.automount',  'ENABLE_BINFMT'],
>     +         ['proc-sys-fs-binfmt_misc.mount',  'ENABLE_BINFMT'],
>     +         ['reboot.target',                       '',
>     +          'runlevel6.target ctrl-alt-del.target'],
>     +@@ -144,8 +143,7 @@ in_units = [
>     +         ['systemd-ask-password-console.service', ''],
>     +         ['systemd-ask-password-wall.service',    ''],
>     +         ['systemd-backlight@.service',  'ENABLE_BACKLIGHT'],
>     +-        ['systemd-binfmt.service',  'ENABLE_BINFMT',
>     +-         'sysinit.target.wants/'],
>     ++        ['systemd-binfmt.service',  'ENABLE_BINFMT'],
>     +         ['systemd-coredump@.service', 'ENABLE_COREDUMP'],
>     +         ['systemd-exit.service',                 ''],
>     +         ['systemd-firstboot.service', 'ENABLE_FIRSTBOOT',
>     +diff --git a/units/proc-sys-fs-binfmt_misc.automount
>     b/units/proc-sys-fs-binfmt_misc.automount
>     +index 30a6bc991..4231f3b70 100644
>     +--- a/units/proc-sys-fs-binfmt_misc.automount
>     ++++ b/units/proc-sys-fs-binfmt_misc.automount
>     +@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
>     +
>     + [Automount]
>     + Where=/proc/sys/fs/binfmt_misc
>     ++
>     ++[Install]
>     ++WantedBy=sysinit.target
>     +diff --git a/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     b/units/systemd-binfmt.service.in <http://systemd-binfmt.service.in>
>     +index df9396d89..0687f4648 100644
>     +--- a/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     ++++ b/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     +@@ -13,6 +13,7 @@ Documentation=man:systemd-binfmt.service(8)
>     man:binfmt.d(5)
>     +
>     Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
>     <https://www.kernel.org/doc/Documentation/binfmt_misc.txt>
>     + DefaultDependencies=no
>     + Conflicts=shutdown.target
>     ++Wants=proc-sys-fs-binfmt_misc.automount
>     + After=proc-sys-fs-binfmt_misc.automount
>     + Before=sysinit.target shutdown.target
>     + ConditionPathIsReadWrite=/proc/sys/
>     +@@ -27,3 +28,6 @@ Type=oneshot
>     + RemainAfterExit=yes
>     + ExecStart=@rootlibexecdir@/systemd-binfmt
>     + TimeoutSec=90s
>     ++
>     ++[Install]
>     ++WantedBy=sysinit.target
>     +--
>     +2.11.0
>     +
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>     b/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>     deleted file mode 100644
>     index da798a7..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>     +++ /dev/null
>     @@ -1,27 +0,0 @@
>     -From 025408c87869962f511de044dd41a1f4b1d80165 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Sat, 27 Jan 2018 11:53:38 -0800
>     -Subject: [PATCH 2/3] configure.ac <http://configure.ac>: Check if
>     memfd_create is already defined
>     -
>     -Upstream-Status: Inappropriate [upstream systemd uses meson]
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     - configure.ac <http://configure.ac> | 1 +
>     - 1 file changed, 1 insertion(+)
>     -
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 3674190fb..c7a184d72 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -340,6 +340,7 @@ AC_CHECK_DECLS([
>     -         [], [], [[
>     - #include <sys/types.h>
>     - #include <unistd.h>
>     -+#include <sys/mman.h>
>     - #include <sys/mount.h>
>     - #include <fcntl.h>
>     - #include <sched.h>
>     ---
>     -2.16.1
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>     b/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>     deleted file mode 100644
>     index c466d0d..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
>     +++ /dev/null
>     @@ -1,26 +0,0 @@
>     -From 52e922343faaa87b9efb8aa9ea578399ccc9bec9 Mon Sep 17 00:00:00
>     2001
>     -From: Yu Watanabe <watanabe.yu+github@gmail.com
>     <mailto:watanabe.yu%2Bgithub@gmail.com>>
>     -Date: Sun, 26 Nov 2017 02:40:23 +0900
>     -Subject: [PATCH 3/3] fileio: include sys/mman.h
>     -
>     ----
>     -Upstream-Status: Backport
>     -
>     - src/basic/fileio.c | 1 +
>     - 1 file changed, 1 insertion(+)
>     -
>     -diff --git a/src/basic/fileio.c b/src/basic/fileio.c
>     -index 9a185e3e6..1015afd29 100644
>     ---- a/src/basic/fileio.c
>     -+++ b/src/basic/fileio.c
>     -@@ -24,6 +24,7 @@
>     - #include <stdint.h>
>     - #include <stdlib.h>
>     - #include <string.h>
>     -+#include <sys/mman.h>
>     - #include <sys/stat.h>
>     - #include <sys/types.h>
>     - #include <unistd.h>
>     ---
>     -2.16.1
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     new file mode 100644
>     index 0000000..0a27162
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     @@ -0,0 +1,64 @@
>     +From 2bde78f2d94065ced26376ddc5b038c941e2ef90 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Fri, 23 Feb 2018 10:40:39 +0800
>     +Subject: [PATCH 03/32] use lnr wrapper instead of looking for
>     --relative
>     + option for ln
>     +
>     +Remove file manually to avoid the 'File Exists' error when creating
>     +symlink. This is because the original 'ln' command uses '-f' option.
>     +
>     +Upstream-Status: Inappropriate [OE-Specific]
>     +
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + meson.build                 | 4 ----
>     + tools/meson-make-symlink.sh | 3 ++-
>     + units/meson-add-wants.sh    | 7 ++++++-
>     + 3 files changed, 8 insertions(+), 6 deletions(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index ddc061c12..4b5ef376f 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -530,10 +530,6 @@ foreach prog : progs
>     +         substs.set(name, path)
>     + endforeach
>     +
>     +-if run_command('ln', '--relative', '--help').returncode() != 0
>     +-        error('ln does not support --relative')
>     +-endif
>     +-
>     + ############################################################
>     +
>     + gperf = find_program('gperf')
>     +diff --git a/tools/meson-make-symlink.sh
>     b/tools/meson-make-symlink.sh
>     +index 47a5e70ae..271edf9bc 100755
>     +--- a/tools/meson-make-symlink.sh
>     ++++ b/tools/meson-make-symlink.sh
>     +@@ -7,5 +7,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
>     + if [ "$(dirname $1)" = . ]; then
>     +         ln -vfs -T "$1" "${DESTDIR:-}$2"
>     + else
>     +-        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
>     ++        rm -f "${DESTDIR:-}$2"
>     ++        lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
>     + fi
>     +diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
>     +index dfd287e17..11d30c9b2 100755
>     +--- a/units/meson-add-wants.sh
>     ++++ b/units/meson-add-wants.sh
>     +@@ -24,4 +24,9 @@ case "$target" in
>     +                 ;;
>     + esac
>     +
>     +-ln -vfs --relative "$unitpath" "$dir"
>     ++if [ -d "$dir" ]; then
>     ++        rm -f "$dir/$unit"
>     ++        lnr "$unitpath" "$dir/$unit"
>     ++else
>     ++        lnr "$unitpath" "$dir"
>     ++fi
>     +--
>     +2.11.0
>     +
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
>     b/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
>     similarity index 89%
>     rename from
>     meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
>     index 8828d6e..48d53fb 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
>     @@ -1,7 +1,7 @@
>     -From 52726be92e2b841f744a96c378cc872ae0033a2b Mon Sep 17 00:00:00
>     2001
>     +From eebe61ed26692def6ecdfdc8fd656c04d639a8a1 Mon Sep 17 00:00:00
>     2001
>      From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>      Date: Sat, 5 Sep 2015 06:31:47 +0000
>     -Subject: [PATCH 10/19] implment systemd-sysv-install for OE
>     +Subject: [PATCH 04/32] implment systemd-sysv-install for OE
>
>      Use update-rc.d for enabling/disabling and status command
>      to check the status of the sysv service
>     @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>       1 file changed, 3 insertions(+), 3 deletions(-)
>
>      diff --git a/src/systemctl/systemd-sysv-install.SKELETON
>     b/src/systemctl/systemd-sysv-install.SKELETON
>     -index a53a3e6..5d877b0 100755
>     +index a53a3e622..5d877b06e 100755
>      --- a/src/systemctl/systemd-sysv-install.SKELETON
>      +++ b/src/systemctl/systemd-sysv-install.SKELETON
>      @@ -30,17 +30,17 @@ case "$1" in
>     @@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755
>           *)
>               usage ;;
>      --
>     -2.10.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     deleted file mode 100644
>     index 7016e98..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>     +++ /dev/null
>     @@ -1,74 +0,0 @@
>     -From 74450f0dbad2f8478c26eeaa46d4e4a987858f45 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Fri, 20 Feb 2015 05:03:44 +0000
>     -Subject: [PATCH 05/19] binfmt: Don't install dependency links at
>     install time
>     - for the binfmt services
>     -
>     -use [Install] blocks so that they get created when the service is
>     enabled
>     -like a traditional service.
>     -
>     -The [Install] blocks were rejected upstream as they don't have a
>     way to
>     -"enable"
>     -it on install without static symlinks which can't be disabled, only
>     -masked.  We
>     -however can do that in a postinst.
>     -
>     -Upstream-Status: Denied
>     -
>     -Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     - Makefile.am                             | 4 ----
>     - units/proc-sys-fs-binfmt_misc.automount | 3 +++
>     - units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>  | 5 +++++
>     - 3 files changed, 8 insertions(+), 4 deletions(-)
>     -
>     -diff --git a/Makefile.am b/Makefile.am
>     -index 50da458..29ed1dd 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -4635,10 +4635,6 @@ INSTALL_DIRS += \
>     -       $(prefix)/lib/binfmt.d \
>     -       $(sysconfdir)/binfmt.d
>     -
>     --SYSINIT_TARGET_WANTS += \
>     --      systemd-binfmt.service \
>     --      proc-sys-fs-binfmt_misc.automount
>     --
>     - endif
>     -
>     - EXTRA_DIST += \
>     -diff --git a/units/proc-sys-fs-binfmt_misc.automount
>     b/units/proc-sys-fs-binfmt_misc.automount
>     -index 6be3893..709adef 100644
>     ---- a/units/proc-sys-fs-binfmt_misc.automount
>     -+++ b/units/proc-sys-fs-binfmt_misc.automount
>     -@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
>     -
>     - [Automount]
>     - Where=/proc/sys/fs/binfmt_misc
>     -+
>     -+[Install]
>     -+WantedBy=sysinit.target
>     -diff --git a/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     b/units/systemd-binfmt.service.in <http://systemd-binfmt.service.in>
>     -index d53073e..8c57ee0 100644
>     ---- a/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     -+++ b/units/systemd-binfmt.service.in
>     <http://systemd-binfmt.service.in>
>     -@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service(8)
>     man:binfmt.d(5)
>     -
>     Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
>     <https://www.kernel.org/doc/Documentation/binfmt_misc.txt>
>     - DefaultDependencies=no
>     - Conflicts=shutdown.target
>     -+Wants=proc-sys-fs-binfmt_misc.automount
>     -+
>     - After=proc-sys-fs-binfmt_misc.automount
>     - Before=sysinit.target shutdown.target
>     - ConditionPathIsReadWrite=/proc/sys/
>     -@@ -25,3 +27,6 @@ Type=oneshot
>     - RemainAfterExit=yes
>     - ExecStart=@rootlibexecdir@/systemd-binfmt
>     - TimeoutSec=90s
>     -+
>     -+[Install]
>     -+WantedBy=sysinit.target
>     ---
>     -2.10.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
>     b/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
>     similarity index 89%
>     rename from
>     meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
>     index eb380ce..5b8510b 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
>     @@ -1,7 +1,7 @@
>     -From ab5a27040133f7cdf062ac8cfeb94e081d3567b3 Mon Sep 17 00:00:00
>     2001
>     +From 792582d2b3cf1af4d22288d853a737ec4478357b Mon Sep 17 00:00:00
>     2001
>      From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>      Date: Wed, 9 Nov 2016 19:41:13 -0800
>     -Subject: [PATCH 07/14] rules: whitelist hd* devices
>     +Subject: [PATCH 05/32] rules: whitelist hd* devices
>
>      qemu by default emulates IDE and the linux-yocto kernel(s) use
>      CONFIG_IDE instead of the more modern libsata, so disks appear as
>     @@ -11,13 +11,12 @@ Upstream-Status: Denied
>     [https://github.com/systemd/systemd/pull/1276
>     <https://github.com/systemd/systemd/pull/1276>]
>
>      Signed-off-by: Patrick Ohly <patrick.ohly@intel.com
>     <mailto:patrick.ohly@intel.com>>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     -
>      ---
>       rules/60-persistent-storage.rules | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>      diff --git a/rules/60-persistent-storage.rules
>     b/rules/60-persistent-storage.rules
>     -index d2745f65f..63f472be8 100644
>     +index 0de8cf3a1..d3f58f153 100644
>      --- a/rules/60-persistent-storage.rules
>      +++ b/rules/60-persistent-storage.rules
>      @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
>     @@ -30,5 +29,5 @@ index d2745f65f..63f472be8 100644
>       # ignore partitions that span the entire disk
>       TEST=="whole_disk", GOTO="persistent_storage_end"
>      --
>     -2.13.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>     b/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>     new file mode 100644
>     index 0000000..9dc994b
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>     @@ -0,0 +1,78 @@
>     +From c702a0579a73e9e4589d009493f3d7231a9b3986 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Fri, 23 Feb 2018 13:47:37 +0800
>     +Subject: [PATCH 06/32] Make root's home directory configurable
>     +
>     +OpenEmbedded has a configurable home directory for root. Allow
>     +systemd to be built using its idea of what root's home directory
>     +should be.
>     +
>     +Upstream-Status: Denied
>     +Upstream wants to have a unified hierarchy where everyone is
>     +using the same root folder.
>     +https://github.com/systemd/systemd/issues/541
>     <https://github.com/systemd/systemd/issues/541>
>     +
>     +Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca
>     <mailto:dan.mcgregor@usask.ca>>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + meson.build       | 8 ++++++++
>     + meson_options.txt | 2 ++
>     + 2 files changed, 10 insertions(+)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 4b5ef376f..7df4f7a33 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -94,6 +94,11 @@ if rootlibdir == ''
>     +         rootlibdir = join_paths(rootprefixdir,
>     libdir.split('/')[-1])
>     + endif
>     +
>     ++roothomedir = get_option('roothomedir')
>     ++if roothomedir == ''
>     ++        roothomedir = '/root'
>     ++endif
>     ++
>     + # Dirs of external packages
>     + pkgconfigdatadir = join_paths(datadir, 'pkgconfig')
>     + pkgconfiglibdir = join_paths(libdir, 'pkgconfig')
>     +@@ -205,6 +210,7 @@ conf.set_quoted('UDEVLIBEXECDIR',            
>                    udevlibexecdir)
>     + conf.set_quoted('POLKIT_AGENT_BINARY_PATH',        
>      join_paths(bindir, 'pkttyagent'))
>     + conf.set_quoted('LIBDIR',    libdir)
>     + conf.set_quoted('ROOTLIBDIR',    rootlibdir)
>     ++conf.set_quoted('ROOTHOMEDIR',         roothomedir)
>     + conf.set_quoted('ROOTLIBEXECDIR',          rootlibexecdir)
>     + conf.set_quoted('BOOTLIBDIR',    bootlibdir)
>     + conf.set_quoted('SYSTEMD_PULL_PATH',        
>     join_paths(rootlibexecdir, 'systemd-pull'))
>     +@@ -221,6 +227,7 @@ substs.set('prefix',                      
>     prefixdir)
>     + substs.set('exec_prefix',    prefixdir)
>     + substs.set('libdir',     libdir)
>     + substs.set('rootlibdir',     rootlibdir)
>     ++substs.set('roothomedir',    roothomedir)
>     + substs.set('includedir',     includedir)
>     + substs.set('pkgsysconfdir',    pkgsysconfdir)
>     + substs.set('bindir',     bindir)
>     +@@ -2559,6 +2566,7 @@ status = [
>     +         'include directory:  @0@'.format(includedir),
>     +         'lib directory:  @0@'.format(libdir),
>     +         'rootlib directory:  @0@'.format(rootlibdir),
>     ++        'roothome directory: @0@'.format(roothomedir),
>     +         'SysV init scripts:  @0@'.format(sysvinit_path),
>     +         'SysV rc?.d directories: @0@'.format(sysvrcnd_path),
>     +         'PAM modules directory:  @0@'.format(pamlibdir),
>     +diff --git a/meson_options.txt b/meson_options.txt
>     +index f0c0506ff..7bd8845ce 100644
>     +--- a/meson_options.txt
>     ++++ b/meson_options.txt
>     +@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',
>     +        description : '''[/usr]/lib/x86_64-linux-gnu or such''')
>     + option('rootprefix', type : 'string',
>     +        description : '''override the root prefix''')
>     ++option('roothomedir', type : 'string',
>     ++       description : '''override the root home directory''')
>     + option('link-udev-shared', type : 'boolean',
>     +        description : 'link systemd-udev and its helpers to
>     libsystemd-shared.so')
>     +
>     +--
>     +2.11.0
>     +
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
>     b/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>     similarity index 81%
>     rename from
>     meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>     index ed7c68f..a47101d 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>     @@ -1,7 +1,7 @@
>     -From 0f47cfcb16e8e40a90a9221f9995f8cd8a915c22 Mon Sep 17 00:00:00
>     2001
>     +From b5a7ee09a4a3eea4d6ba3e4f96e27a1ec6658525 Mon Sep 17 00:00:00
>     2001
>      From: Jonathan Liu <net147@gmail.com <mailto:net147@gmail.com>>
>      Date: Thu, 19 Mar 2015 15:01:29 +1100
>     -Subject: [PATCH 14/19] Revert "rules: remove firmware loading rules"
>     +Subject: [PATCH 07/32] Revert "rules: remove firmware loading rules"
>
>      This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
>      Userspace firmware loading support is needed for Linux < 3.7.
>     @@ -16,7 +16,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>>
>
>      diff --git a/rules/50-firmware.rules b/rules/50-firmware.rules
>      new file mode 100644
>     -index 0000000..f0ae684
>     +index 000000000..f0ae68451
>      --- /dev/null
>      +++ b/rules/50-firmware.rules
>      @@ -0,0 +1,3 @@
>     @@ -24,5 +24,5 @@ index 0000000..f0ae684
>      +
>      +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
>      --
>     -2.10.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>     b/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>     deleted file mode 100644
>     index 5234c59..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
>     +++ /dev/null
>     @@ -1,63 +0,0 @@
>     -From 05dffe67919ffc72be5c017bc6cf82f164b2e8f9 Mon Sep 17 00:00:00
>     2001
>     -From: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>     -Date: Mon, 23 Oct 2017 11:42:03 -0700
>     -Subject: [PATCH 07/12] check for missing canonicalize_file_name
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     -Upstream-Status: Pending
>     -
>     - configure.ac <http://configure.ac>       | 2 ++
>     - src/basic/missing.h         | 1 +
>     - src/basic/missing_syscall.h | 6 ++++++
>     - 3 files changed, 9 insertions(+)
>     -
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index cd035a971..3674190fb 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -333,6 +333,7 @@ AC_CHECK_DECLS([
>     -         renameat2,
>     -         kcmp,
>     -         keyctl,
>     -+        canonicalize_file_name,
>     -         LO_FLAGS_PARTSCAN,
>     -         copy_file_range,
>     -         explicit_bzero],
>     -@@ -343,6 +344,7 @@ AC_CHECK_DECLS([
>     - #include <fcntl.h>
>     - #include <sched.h>
>     - #include <string.h>
>     -+#include <stdlib.h>
>     - #include <linux/loop.h>
>     - ]])
>     -
>     -diff --git a/src/basic/missing.h b/src/basic/missing.h
>     -index 671f341c6..8ae4964e1 100644
>     ---- a/src/basic/missing.h
>     -+++ b/src/basic/missing.h
>     -@@ -1246,3 +1246,4 @@ struct ethtool_link_settings {
>     - #endif
>     -
>     - #include "missing_syscall.h"
>     -+
>     -diff --git a/src/basic/missing_syscall.h
>     b/src/basic/missing_syscall.h
>     -index 898116c7b..4d44ee4fa 100644
>     ---- a/src/basic/missing_syscall.h
>     -+++ b/src/basic/missing_syscall.h
>     -@@ -28,6 +28,12 @@ static inline int pivot_root(const char
>     *new_root, const char *put_old) {
>     - }
>     - #endif
>     -
>     -+#if !HAVE_DECL_CANONICALIZE_FILE_NAME
>     -+static inline char *canonicalize_file_name(const char *path) {
>     -+        return realpath(path, NULL);
>     -+}
>     -+#endif
>     -+
>     - /*
>     =======================================================================
>     */
>     -
>     - #if !HAVE_DECL_MEMFD_CREATE
>     ---
>     -2.14.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     deleted file mode 100644
>     index bc92db7..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     +++ /dev/null
>     @@ -1,40 +0,0 @@
>     -From a3482c91642cf568b3ac27fa6c0cb3c6b30669b7 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Wed, 9 Nov 2016 19:32:14 -0800
>     -Subject: [PATCH 07/19] use lnr wrapper instead of looking for
>     --relative
>     - option for ln
>     -
>     -Upstream-Status: Inappropriate [OE-Specific]
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     - Makefile.am  | 2 +-
>     - configure.ac <http://configure.ac> | 2 --
>     - 2 files changed, 1 insertion(+), 3 deletions(-)
>     -
>     -Index: git/Makefile.am
>     -===================================================================
>     ---- git.orig/Makefile.am
>     -+++ git/Makefile.am
>     -@@ -320,7 +320,7 @@ define install-relative-aliases
>     -       while [ -n "$$1" ]; do \
>     -               $(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
>     -               rm -f $(DESTDIR)$$dir/$$2 && \
>     --              $(LN_S) --relative $(DESTDIR)$$1
>     $(DESTDIR)$$dir/$$2 && \
>     -+              lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
>     -               shift 2 || exit $$?; \
>     -       done
>     - endef
>     -Index: git/configure.ac <http://configure.ac>
>     -===================================================================
>     ---- git.orig/configure.ac <http://configure.ac>
>     -+++ git/configure.ac <http://configure.ac>
>     -@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr
>     - AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount],
>     [$PATH:/usr/sbin:/sbin])
>     - AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount],
>     [$PATH:/usr/sbin:/sbin])
>     -
>     --AS_IF([! ln --relative --help > /dev/null 2>&1],
>     [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
>     --
>     - M4_DEFINES=
>     -
>     - AC_CHECK_TOOL(OBJCOPY, objcopy)
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>     b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>     deleted file mode 100644
>     index 67a4f8e..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
>     +++ /dev/null
>     @@ -1,35 +0,0 @@
>     -From 48e7c0f5b2f5d777a16ac5584dc4f50f1dfa832c Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Mon, 23 Oct 2017 12:27:53 -0700
>     -Subject: [PATCH 08/12] Do not enable nss tests
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     -Upstream-Status: Pending
>     -
>     - Makefile.am | 2 +-
>     - 1 file changed, 1 insertion(+), 1 deletion(-)
>     -
>     -diff --git a/Makefile.am b/Makefile.am
>     -index 3cc8f3451..df20a9a11 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -5290,6 +5290,7 @@ EXTRA_DIST += \
>     -       src/timesync/timesyncd.conf.in <http://timesyncd.conf.in>
>     -
>     - #
>     ------------------------------------------------------------------------------
>     -+if ENABLE_NSS_SYSTEMD
>     - test_nss_SOURCES = \
>     -       src/test/test-nss.c
>     -
>     -@@ -5302,7 +5303,6 @@ manual_tests += \
>     -       test-nss
>     -
>     - #
>     ------------------------------------------------------------------------------
>     --if ENABLE_NSS_SYSTEMD
>     - libnss_systemd_la_SOURCES = \
>     -       src/nss-systemd/nss-systemd.sym \
>     -       src/nss-systemd/nss-systemd.c
>     ---
>     -2.14.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     b/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     similarity index 65%
>     rename from
>     meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     index 95871bb..fdbf341 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     @@ -1,7 +1,7 @@
>     -From 7883985a3a78677e9a1d5d61fe7fa8badf39f565 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Wed, 9 Nov 2016 20:45:23 -0800
>     -Subject: [PATCH 10/14] Revert "udev: remove userspace firmware
>     loading
>     +From 93f35c7d6abf6925392f53af595c84f4b6b3b2e4 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Mon, 26 Feb 2018 13:07:54 +0800
>     +Subject: [PATCH 08/32] Revert "udev: remove userspace firmware
>     loading
>       support"
>
>      This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
>     @@ -11,47 +11,26 @@ Upstream-Status: Inappropriate [OE specific]
>
>      Signed-off-by: Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     -
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>      ---
>     - Makefile.am                      |  12 +++
>       README                           |   4 +-
>       TODO                             |   1 +
>     - configure.ac <http://configure.ac>            |  18 +++++
>     + meson.build                      |   8 ++
>     + meson_options.txt                |   2 +
>     + rules/meson.build                |   4 +
>     + src/udev/meson.build             |   5 ++
>       src/udev/udev-builtin-firmware.c | 154
>     +++++++++++++++++++++++++++++++++++++++
>       src/udev/udev-builtin.c          |   3 +
>       src/udev/udev.h                  |   6 ++
>       src/udev/udevd.c                 |  13 ++++
>     - 8 files changed, 209 insertions(+), 2 deletions(-)
>     + 10 files changed, 198 insertions(+), 2 deletions(-)
>       create mode 100644 src/udev/udev-builtin-firmware.c
>
>     -diff --git a/Makefile.am b/Makefile.am
>     -index c2b4a99d2..692d7bb95 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -3985,6 +3985,18 @@ libudev_core_la_LIBADD = \
>     -       $(BLKID_LIBS) \
>     -       $(KMOD_LIBS)
>     -
>     -+libudev_core_la_CPPFLAGS = \
>     -+      $(AM_CPPFLAGS) \
>     -+      -DFIRMWARE_PATH="$(FIRMWARE_PATH)"
>     -+
>     -+if ENABLE_FIRMWARE
>     -+libudev_core_la_SOURCES += \
>     -+      src/udev/udev-builtin-firmware.c
>     -+
>     -+dist_udevrules_DATA += \
>     -+      rules/50-firmware.rules
>     -+endif
>     -+
>     - if HAVE_KMOD
>     - libudev_core_la_SOURCES += \
>     -       src/udev/udev-builtin-kmod.c
>      diff --git a/README b/README
>     -index 60388eebe..e21976393 100644
>     +index b245564f5..8396a0f6e 100644
>      --- a/README
>      +++ b/README
>     -@@ -61,8 +61,8 @@ REQUIREMENTS:
>     +@@ -58,8 +58,8 @@ REQUIREMENTS:
>               Legacy hotplug slows down the system and confuses udev:
>                 CONFIG_UEVENT_HELPER_PATH=""
>
>     @@ -63,10 +42,10 @@ index 60388eebe..e21976393 100644
>
>               Some udev rules and virtualization detection relies on it:
>      diff --git a/TODO b/TODO
>     -index 61efa5e9f..67ccac224 100644
>     +index 0c20012b2..93788122c 100644
>      --- a/TODO
>      +++ b/TODO
>     -@@ -740,6 +740,7 @@ Features:
>     +@@ -769,6 +769,7 @@ Features:
>       * initialize the hostname from the fs label of /, if
>     /etc/hostname does not exist?
>
>       * udev:
>     @@ -74,42 +53,90 @@ index 61efa5e9f..67ccac224 100644
>         - move to LGPL
>         - kill scsi_id
>         - add trigger --subsystem-match=usb/usb_device device
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index b53ca1f1a..1150ca50e 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -1522,6 +1522,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test
>     "$have_myhostname" = "yes"])
>     - AC_ARG_ENABLE(hwdb, [AS_HELP_STRING([--disable-hwdb], [disable
>     hardware database support])],
>     -        enable_hwdb=$enableval, enable_hwdb=yes)
>     - AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
>     -+AC_ARG_WITH(firmware-path,
>     -+       AS_HELP_STRING([--with-firmware-path=DIR[[[:DIR[...]]]]],
>     -+          [Firmware search path (default="")]),
>     -+       [], [with_firmware_path=""])
>     -+OLD_IFS=$IFS
>     -+IFS=:
>     -+for i in $with_firmware_path; do
>     -+       if test "x${FIRMWARE_PATH}" = "x"; then
>     -+              FIRMWARE_PATH="\\\"${i}/\\\""
>     -+       else
>     -+              FIRMWARE_PATH="${FIRMWARE_PATH}, \\\"${i}/\\\""
>     -+       fi
>     -+done
>     -+IFS=$OLD_IFS
>     -+AC_SUBST(FIRMWARE_PATH)
>     -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [
>     AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
>     -+AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
>     +diff --git a/meson.build b/meson.build
>     +index 7df4f7a33..85c2ee6aa 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -72,6 +72,12 @@ conf.set10('HAVE_SYSV_COMPAT', have,
>     +            description : 'SysV init scripts and rcN.d links are
>     supported')
>     + m4_defines += have ? ['-DHAVE_SYSV_COMPAT'] : []
>     +
>     ++firmware_path = get_option('firmware-path')
>     ++have = firmware_path != ''
>     ++conf.set10('HAVE_FIRMWARE', have,
>     ++           description : 'Userspace firmware loading is supported')
>     ++m4_defines += have ? ['-DHAVE_FIRMWARE'] : []
>     ++
>     + # join_paths ignore the preceding arguments if an absolute
>     component is
>     + # encountered, so this should canonicalize various paths when
>     they are
>     + # absolute or relative.
>     +@@ -258,6 +264,7 @@ substs.set('SYSTEMCTL',                      
>      join_paths(rootbin
>     + substs.set('RANDOM_SEED',    join_paths(randomseeddir,
>     'random-seed'))
>     + substs.set('SYSTEM_SYSVINIT_PATH',         sysvinit_path)
>     + substs.set('SYSTEM_SYSVRCND_PATH',         sysvrcnd_path)
>     ++substs.set('FIRMWARE_PATH',    firmware_path)
>     + substs.set('RC_LOCAL_SCRIPT_PATH_START',        
>     get_option('rc-local'))
>     + substs.set('RC_LOCAL_SCRIPT_PATH_STOP',        
>      get_option('halt-local'))
>     +
>     +@@ -2569,6 +2576,7 @@ status = [
>     +         'roothome directory: @0@'.format(roothomedir),
>     +         'SysV init scripts:  @0@'.format(sysvinit_path),
>     +         'SysV rc?.d directories: @0@'.format(sysvrcnd_path),
>     ++        'firmware path:  @0@'.format(firmware_path),
>     +         'PAM modules directory:  @0@'.format(pamlibdir),
>     +         'PAM configuration directory:  @0@'.format(pamconfdir),
>     +         'RPM macros directory: @0@'.format(rpmmacrosdir),
>     +diff --git a/meson_options.txt b/meson_options.txt
>     +index 7bd8845ce..412d9af04 100644
>     +--- a/meson_options.txt
>     ++++ b/meson_options.txt
>     +@@ -107,6 +107,8 @@ option('tmpfiles', type : 'boolean',
>     +        description : 'support for tmpfiles.d')
>     + option('importd', type : 'combo', choices : ['auto', 'true',
>     'false'],
>     +        description : 'install the systemd-importd daemon')
>     ++option('firmware-path', type : 'string', value : '',
>     ++       description : 'Firmware search path')
>     + option('hwdb', type : 'boolean',
>     +        description : 'support for the hardware database')
>     + option('rfkill', type : 'boolean',
>     +diff --git a/rules/meson.build b/rules/meson.build
>     +index e253b9f59..5eee5fbca 100644
>     +--- a/rules/meson.build
>     ++++ b/rules/meson.build
>     +@@ -41,6 +41,10 @@ rules = files('''
>     + install_data(rules,
>     +              install_dir : udevrulesdir)
>     +
>     ++if conf.get('HAVE_FIRMWARE') == 1
>     ++        install_data('50-firmware.rules', install_dir :
>     udevrulesdir)
>     ++endif
>     ++
>     + all_rules = rules
>     +
>     + rules_in = '''
>     +diff --git a/src/udev/meson.build b/src/udev/meson.build
>     +index d01cf8f19..3e3de05bd 100644
>     +--- a/src/udev/meson.build
>     ++++ b/src/udev/meson.build
>     +@@ -67,6 +67,10 @@ if conf.get('HAVE_ACL') == 1
>     +                                  sd_login_c]
>     + endif
>     +
>     ++if conf.get('HAVE_FIRMWARE') == 1
>     ++        libudev_core_sources += ['udev-builtin-firmware.c']
>     ++endif
>     ++
>     + ############################################################
>     +
>     + generate_keyboard_keys_list =
>     find_program('generate-keyboard-keys-list.sh')
>     +@@ -130,6 +134,7 @@ libudev_core = static_library(
>     +         link_config_gperf_c,
>     +         keyboard_keys_from_name_h,
>     +         include_directories : libudev_core_includes,
>     ++        c_args : ['-DFIRMWARE_PATH="@0@"'.format(firmware_path)],
>     +         link_with : udev_link_with,
>     +         dependencies : [libblkid, libkmod])
>
>     - #
>     ------------------------------------------------------------------------------
>     - have_manpages=no
>     -@@ -1839,6 +1856,7 @@ AC_MSG_RESULT([
>     -         SysV init scripts:  ${SYSTEM_SYSVINIT_PATH}
>     -         SysV rc?.d directories: ${SYSTEM_SYSVRCND_PATH}
>     -         build Python:                      ${PYTHON}
>     -+        firmware path:  ${FIRMWARE_PATH}
>     -         PAM modules dir:  ${with_pamlibdir}
>     -         PAM configuration dir:  ${with_pamconfdir}
>     -         RPM macros dir: ${with_rpmmacrosdir}
>      diff --git a/src/udev/udev-builtin-firmware.c
>     b/src/udev/udev-builtin-firmware.c
>      new file mode 100644
>      index 000000000..bd8c2fb96
>     @@ -271,73 +298,73 @@ index 000000000..bd8c2fb96
>      +        .run_once = true,
>      +};
>      diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
>     -index e6b36f124..cd9947e2a 100644
>     +index db2b6874f..ccd88638c 100644
>      --- a/src/udev/udev-builtin.c
>      +++ b/src/udev/udev-builtin.c
>     -@@ -31,6 +31,9 @@ static const struct udev_builtin *builtins[] = {
>     +@@ -32,6 +32,9 @@ static const struct udev_builtin *builtins[] = {
>               [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
>       #endif
>               [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +        [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
>      +#endif
>               [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
>               [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
>               [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
>      diff --git a/src/udev/udev.h b/src/udev/udev.h
>     -index c0cb7eae8..9f0f1cf13 100644
>     +index ea11c2d29..c47dd3d88 100644
>      --- a/src/udev/udev.h
>      +++ b/src/udev/udev.h
>     -@@ -150,6 +150,9 @@ enum udev_builtin_cmd {
>     +@@ -151,6 +151,9 @@ enum udev_builtin_cmd {
>               UDEV_BUILTIN_BLKID,
>       #endif
>               UDEV_BUILTIN_BTRFS,
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +        UDEV_BUILTIN_FIRMWARE,
>      +#endif
>               UDEV_BUILTIN_HWDB,
>               UDEV_BUILTIN_INPUT_ID,
>               UDEV_BUILTIN_KEYBOARD,
>     -@@ -178,6 +181,9 @@ struct udev_builtin {
>     +@@ -179,6 +182,9 @@ struct udev_builtin {
>       extern const struct udev_builtin udev_builtin_blkid;
>       #endif
>       extern const struct udev_builtin udev_builtin_btrfs;
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +extern const struct udev_builtin udev_builtin_firmware;
>      +#endif
>       extern const struct udev_builtin udev_builtin_hwdb;
>       extern const struct udev_builtin udev_builtin_input_id;
>       extern const struct udev_builtin udev_builtin_keyboard;
>      diff --git a/src/udev/udevd.c b/src/udev/udevd.c
>     -index acbddd418..20347b402 100644
>     +index 1644935ff..7eb4b9374 100644
>      --- a/src/udev/udevd.c
>      +++ b/src/udev/udevd.c
>     -@@ -125,6 +125,9 @@ struct event {
>     +@@ -127,6 +127,9 @@ struct event {
>               bool is_block;
>               sd_event_source *timeout_warning;
>               sd_event_source *timeout;
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +        bool nodelay;
>      +#endif
>       };
>
>     - static inline struct event *node_to_event(struct udev_list_node
>     *node) {
>     -@@ -613,6 +616,10 @@ static int event_queue_insert(Manager
>     *manager, struct udev_device *dev) {
>     + static void event_queue_cleanup(Manager *manager, enum
>     event_state type);
>     +@@ -609,6 +612,10 @@ static int event_queue_insert(Manager
>     *manager, struct udev_device *dev) {
>               event->devnum = udev_device_get_devnum(dev);
>               event->is_block = streq("block",
>     udev_device_get_subsystem(dev));
>               event->ifindex = udev_device_get_ifindex(dev);
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +        if (streq(udev_device_get_subsystem(dev), "firmware"))
>      +                event->nodelay = true;
>      +#endif
>
>               log_debug("seq %llu queued, '%s' '%s'",
>     udev_device_get_seqnum(dev),
>                    udev_device_get_action(dev),
>     udev_device_get_subsystem(dev));
>     -@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager
>     *manager, struct event *event) {
>     +@@ -692,6 +699,12 @@ static bool is_devpath_busy(Manager
>     *manager, struct event *event) {
>                               return true;
>                       }
>
>     -+#ifdef HAVE_FIRMWARE
>     ++#if HAVE_FIRMWARE
>      +                /* allow to bypass the dependency tracking */
>      +                if (event->nodelay)
>      +                        continue;
>     @@ -347,5 +374,5 @@ index acbddd418..20347b402 100644
>                       if (event->devpath[common] == '/') {
>                               event->delaying_seqnum = loop_event->seqnum;
>      --
>     -2.13.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
>     b/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>     similarity index 78%
>     rename from
>     meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>     index d200635..d91c689 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>     @@ -1,7 +1,7 @@
>     -From e78af874fc9f3d3af49498b8207109993d93a596 Mon Sep 17 00:00:00
>     2001
>     +From 55517716b078424541b6cd4423504322eb5d7589 Mon Sep 17 00:00:00
>     2001
>      From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>      Date: Mon, 22 Feb 2016 05:59:01 +0000
>     -Subject: [PATCH 17/19] remove duplicate include uchar.h
>     +Subject: [PATCH 09/32] remove duplicate include uchar.h
>
>      missing.h already includes it
>
>     @@ -13,10 +13,10 @@ Upstream-Status: Pending
>       2 files changed, 2 deletions(-)
>
>      diff --git a/src/basic/escape.h b/src/basic/escape.h
>     -index deaa4de..36d437c 100644
>     +index de89f43a8..9921ccbbd 100644
>      --- a/src/basic/escape.h
>      +++ b/src/basic/escape.h
>     -@@ -23,7 +23,6 @@
>     +@@ -24,7 +24,6 @@
>       #include <stddef.h>
>       #include <stdint.h>
>       #include <sys/types.h>
>     @@ -25,10 +25,10 @@ index deaa4de..36d437c 100644
>       #include "string-util.h"
>       #include "missing.h"
>      diff --git a/src/basic/utf8.h b/src/basic/utf8.h
>     -index f9b9c94..6ac9a3c 100644
>     +index b0a7485ae..fa06d2906 100644
>      --- a/src/basic/utf8.h
>      +++ b/src/basic/utf8.h
>     -@@ -22,7 +22,6 @@
>     +@@ -23,7 +23,6 @@
>       #include <stdbool.h>
>       #include <stddef.h>
>       #include <stdint.h>
>     @@ -37,5 +37,5 @@ index f9b9c94..6ac9a3c 100644
>       #include "macro.h"
>       #include "missing.h"
>      --
>     -2.10.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>     b/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>     new file mode 100644
>     index 0000000..ac77ca5
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>     @@ -0,0 +1,45 @@
>     +From acf11f1ac360717cb192166a72350f69ebed92e9 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Mon, 26 Feb 2018 15:34:52 +0800
>     +Subject: [PATCH 10/32] check for uchar.h in meson.build
>     +
>     +Use #if HAVE_UCHAR_H to include uchar.h conditionally.
>     +
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + meson.build         | 1 +
>     + src/basic/missing.h | 2 ++
>     + 2 files changed, 3 insertions(+)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 85c2ee6aa..a5e249dc7 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -581,6 +581,7 @@ foreach header : ['linux/btrfs.h',
>     +                   'sys/auxv.h',
>     +                   'valgrind/memcheck.h',
>     +                   'valgrind/valgrind.h',
>     ++                  'uchar.h',
>     +                  ]
>     +
>     +         conf.set10('HAVE_' + header.underscorify().to_upper(),
>     +diff --git a/src/basic/missing.h b/src/basic/missing.h
>     +index 5a602e9a6..cdb4eb4be 100644
>     +--- a/src/basic/missing.h
>     ++++ b/src/basic/missing.h
>     +@@ -38,7 +38,9 @@
>     + #include <sys/resource.h>
>     + #include <sys/socket.h>
>     + #include <sys/syscall.h>
>     ++#if HAVE_UCHAR_H
>     + #include <uchar.h>
>     ++#endif
>     + #include <unistd.h>
>     +
>     + #if HAVE_AUDIT
>     +--
>     +2.11.0
>     +
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>     b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>     deleted file mode 100644
>     index b01ae97..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>     +++ /dev/null
>     @@ -1,38 +0,0 @@
>     -From 3f6f45578b828e414f50c6822375073e7174236a Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Mon, 14 Dec 2015 00:50:01 +0000
>     -Subject: [PATCH 11/19] nss-mymachines: Build conditionally when
>     - HAVE_MYHOSTNAME is set
>     -
>     -Fixes build failures when building with --disable-myhostname
>     -
>     -Upstream-Status: Pending
>     -
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     - Makefile.am | 2 ++
>     - 1 file changed, 2 insertions(+)
>     -
>     -diff --git a/Makefile.am b/Makefile.am
>     -index 02f4017..420e0e0 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES += \
>     - BUSNAMES_TARGET_WANTS += \
>     -       org.freedesktop.machine1.busname
>     -
>     -+if HAVE_MYHOSTNAME
>     - libnss_mymachines_la_SOURCES = \
>     -       src/nss-mymachines/nss-mymachines.sym \
>     -       src/nss-mymachines/nss-mymachines.c
>     -@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES += \
>     - libnss_mymachines.la <http://libnss_mymachines.la>
>     -
>     - endif
>     -+endif
>     -
>     - polkitpolicy_in_files += \
>     -       src/machine/org.freedesktop.machine1.policy.in
>     <http://org.freedesktop.machine1.policy.in>
>     ---
>     -2.10.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     b/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     similarity index 58%
>     rename from
>     meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     index b609276..de6804d 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>     @@ -1,25 +1,26 @@
>     -From b7c6bfe2ec5ae426e586e1d6ecadb52a97128a3f Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Wed, 9 Nov 2016 20:49:53 -0800
>     -Subject: [PATCH 13/14] socket-util: don't fail if libc doesn't
>     support IDN
>     +From 2dd6f45e4578e5ae405508f4fba07c69d5ab3307 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Mon, 26 Feb 2018 15:46:05 +0800
>     +Subject: [PATCH 11/32] socket-util: don't fail if libc doesn't
>     support IDN
>
>      Upstream-Status: Pending
>
>      Signed-off-by: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>      ---
>     - src/basic/socket-util.c | 9 +++++++++
>     - 1 file changed, 9 insertions(+)
>     + src/basic/socket-util.c | 10 ++++++++++
>     + 1 file changed, 10 insertions(+)
>
>      diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
>     -index 016e64aa0..d4658826e 100644
>     +index a458fc290..b74649e78 100644
>      --- a/src/basic/socket-util.c
>      +++ b/src/basic/socket-util.c
>     -@@ -47,6 +47,15 @@
>     - #include "user-util.h"
>     +@@ -49,6 +49,16 @@
>       #include "utf8.h"
>       #include "util.h"
>     +
>      +/* Don't fail if the standard library
>      + * doesn't support IDN */
>      +#ifndef NI_IDN
>     @@ -29,9 +30,10 @@ index 016e64aa0..d4658826e 100644
>      +#ifndef NI_IDN_USE_STD3_ASCII_RULES
>      +#define NI_IDN_USE_STD3_ASCII_RULES 0
>      +#endif
>     -
>     - #ifdef ENABLE_IDN
>     ++
>     + #if ENABLE_IDN
>       #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
>     + #else
>      --
>     -2.13.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
>     b/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
>     similarity index 90%
>     rename from
>     meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
>     index 17d698a..ba53aae 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
>     @@ -1,7 +1,7 @@
>     -From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00
>     2001
>     +From 6aabb5129bc350854a837440ab1974e9b1daba44 Mon Sep 17 00:00:00
>     2001
>      From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>      Date: Fri, 17 Nov 2017 09:46:00 +0800
>     -Subject: [PATCH] rules: watch metadata changes in ide devices
>     +Subject: [PATCH 12/32] rules: watch metadata changes in ide devices
>
>      Formatting IDE storage does not trigger "change" uevents. As a result
>      clients using udev API don't get any updates afterwards and get
>     outdated
>     @@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia
>     <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>      diff --git a/rules/60-block.rules b/rules/60-block.rules
>     -index 343fc06..b5237da 100644
>     +index 343fc06f8..b5237dac4 100644
>      --- a/rules/60-block.rules
>      +++ b/rules/60-block.rules
>      @@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
>     KERNEL=="block", ATTR{parameters/events_dfl_
>     @@ -39,5 +39,5 @@ index 343fc06..b5237da 100644
>      -ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
>      +ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
>      --
>     -1.8.3.1
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>     b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>     deleted file mode 100644
>     index aeebbfb..0000000
>     ---
>     a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
>     +++ /dev/null
>     @@ -1,155 +0,0 @@
>     -From 479e1f4aa2b9f1c911a4d0dd18e222d241a978ea Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Wed, 9 Nov 2016 20:35:30 -0800
>     -Subject: [PATCH 42/48] Make root's home directory configurable
>     -
>     -OpenEmbedded has a configurable home directory for root. Allow
>     -systemd to be built using its idea of what root's home directory
>     -should be.
>     -
>     -Upstream-Status: Denied
>     -Upstream wants to have a unified hierarchy where everyone is
>     -using the same root folder.
>     -https://github.com/systemd/systemd/issues/541
>     <https://github.com/systemd/systemd/issues/541>
>     -
>     -Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca
>     <mailto:dan.mcgregor@usask.ca>>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     -
>     ----
>     - Makefile.am                | 2 ++
>     - configure.ac <http://configure.ac>      | 7 +++++++
>     - src/basic/user-util.c      | 4 ++--
>     - src/nspawn/nspawn.c        | 4 ++--
>     - units/emergency.service.in <http://emergency.service.in> | 4 ++--
>     - units/rescue.service.in <http://rescue.service.in>    | 4 ++--
>     - 6 files changed, 17 insertions(+), 8 deletions(-)
>     -
>     -diff --git a/Makefile.am b/Makefile.am
>     -index 1bcd932c2..c2b4a99d2 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -226,6 +226,7 @@ AM_CPPFLAGS = \
>     -       -DLIBDIR=\"$(libdir)\" \
>     -       -DROOTLIBDIR=\"$(rootlibdir)\" \
>     -       -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>     -+      -DROOTHOMEDIR=\"$(roothomedir)\" \
>     -       -I $(top_srcdir)/src \
>     -       -I $(top_builddir)/src/basic \
>     -       -I $(top_srcdir)/src/basic \
>     -@@ -6356,6 +6357,7 @@ substitutions = \
>     -        '|rootlibdir=$(rootlibdir)|' \
>     -        '|rootlibexecdir=$(rootlibexecdir)|' \
>     -        '|rootbindir=$(rootbindir)|' \
>     -+       '|roothomedir=$(roothomedir)|' \
>     -        '|bindir=$(bindir)|' \
>     -        '|SYSTEMCTL=$(rootbindir)/systemctl|' \
>     -        '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 0354ffe6a..b53ca1f1a 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -1641,6 +1641,11 @@ AC_ARG_WITH([rootlibdir],
>     -         [with_rootlibdir=${libdir}])
>     - AX_NORMALIZE_PATH([with_rootlibdir])
>     -
>     -+AC_ARG_WITH([roothomedir],
>     -+        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory
>     for the root user]),
>     -+        [],
>     -+        [with_roothomedir=/root])
>     -+
>     - AC_ARG_WITH([pamlibdir],
>     -         AS_HELP_STRING([--with-pamlibdir=DIR], [directory for
>     PAM modules]),
>     -         [],
>     -@@ -1733,6 +1738,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
>     - AC_SUBST([rpmmacrosdir], [$with_rpmmacrosdir])
>     - AC_SUBST([rootprefix], [$with_rootprefix])
>     - AC_SUBST([rootlibdir], [$with_rootlibdir])
>     -+AC_SUBST([roothomedir], [$with_roothomedir])
>     -
>     - AC_CONFIG_FILES([
>     -         Makefile
>     -@@ -1829,6 +1835,7 @@ AC_MSG_RESULT([
>     -         includedir:                        ${includedir}
>     -         lib dir:                           ${libdir}
>     -         rootlib dir:  ${with_rootlibdir}
>     -+        root home dir:  ${with_roothomedir}
>     -         SysV init scripts:  ${SYSTEM_SYSVINIT_PATH}
>     -         SysV rc?.d directories: ${SYSTEM_SYSVRCND_PATH}
>     -         build Python:                      ${PYTHON}
>     -diff --git a/src/basic/user-util.c b/src/basic/user-util.c
>     -index c619dad52..662682adf 100644
>     ---- a/src/basic/user-util.c
>     -+++ b/src/basic/user-util.c
>     -@@ -129,7 +129,7 @@ int get_user_creds(
>     -                         *gid = 0;
>     -
>     -                 if (home)
>     --                        *home = "/root";
>     -+                        *home = ROOTHOMEDIR;
>     -
>     -                 if (shell)
>     -                         *shell = "/bin/sh";
>     -@@ -389,7 +389,7 @@ int get_home_dir(char **_h) {
>     -         /* Hardcode home directory for root to avoid NSS */
>     -         u = getuid();
>     -         if (u == 0) {
>     --                h = strdup("/root");
>     -+                h = strdup(ROOTHOMEDIR);
>     -                 if (!h)
>     -                         return -ENOMEM;
>     -
>     -diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
>     -index 8a5fedd4b..7b01ec078 100644
>     ---- a/src/nspawn/nspawn.c
>     -+++ b/src/nspawn/nspawn.c
>     -@@ -2291,7 +2291,7 @@ static int inner_child(
>     -         if (envp[n_env])
>     -                 n_env++;
>     -
>     --        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home
>     ? home: "/root") < 0) ||
>     -+        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home
>     ? home: ROOTHOMEDIR) < 0) ||
>     -             (asprintf((char**)(envp + n_env++), "USER=%s",
>     arg_user ? arg_user : "root") < 0) ||
>     -             (asprintf((char**)(envp + n_env++), "LOGNAME=%s",
>     arg_user ? arg_user : "root") < 0))
>     -                 return log_oom();
>     -@@ -2373,7 +2373,7 @@ static int inner_child(
>     -         } else {
>     -                 if (!arg_chdir)
>     -                         /* If we cannot change the directory,
>     we'll end up in /, that is expected. */
>     --                        (void) chdir(home ?: "/root");
>     -+                        (void) chdir(home ?: ROOTHOMEDIR);
>     -
>     -                 execle("/bin/bash", "-bash", NULL, env_use);
>     -                 execle("/bin/sh", "-sh", NULL, env_use);
>     -diff --git a/units/emergency.service.in
>     <http://emergency.service.in> b/units/emergency.service.in
>     <http://emergency.service.in>
>     -index e9eb238b9..32588e48a 100644
>     ---- a/units/emergency.service.in <http://emergency.service.in>
>     -+++ b/units/emergency.service.in <http://emergency.service.in>
>     -@@ -15,8 +15,8 @@ Conflicts=syslog.socket
>     - Before=shutdown.target
>     -
>     - [Service]
>     --Environment=HOME=/root
>     --WorkingDirectory=-/root
>     -+Environment=HOME=@roothomedir@
>     -+WorkingDirectory=-@roothomedir@
>     - ExecStart=-@rootlibexecdir@/systemd-sulogin-shell emergency
>     - Type=idle
>     - StandardInput=tty-force
>     -diff --git a/units/rescue.service.in <http://rescue.service.in>
>     b/units/rescue.service.in <http://rescue.service.in>
>     -index 4ab66f485..bd9898f2c 100644
>     ---- a/units/rescue.service.in <http://rescue.service.in>
>     -+++ b/units/rescue.service.in <http://rescue.service.in>
>     -@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
>     - Before=shutdown.target
>     -
>     - [Service]
>     --Environment=HOME=/root
>     --WorkingDirectory=-/root
>     -+Environment=HOME=@roothomedir@
>     -+WorkingDirectory=-@roothomedir@
>     - ExecStart=-@rootlibexecdir@/systemd-sulogin-shell rescue
>     - Type=idle
>     - StandardInput=tty-force
>     ---
>     -2.13.2
>     -
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
>     b/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
>     similarity index 88%
>     rename from
>     meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
>     index e2f7458..2bb1663 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
>     @@ -1,53 +1,51 @@
>     -From 0933ca6251808f856b92b0ce8da8696d5febc333 Mon Sep 17 00:00:00
>     2001
>     -From: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>     -Date: Mon, 23 Oct 2017 10:41:39 -0700
>     -Subject: [PATCH 01/12] add fallback parse_printf_format
>     implementation
>     +From 3ba72b753294d9dec47d5cf8b6f2dbb8812cae06 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Mon, 26 Feb 2018 16:25:30 +0800
>     +Subject: [PATCH 13/32] add fallback parse_printf_format
>     implementation
>     +
>     +Upstream-Status: Pending
>
>      Signed-off-by: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>      ---
>     -Upstream-Status: Pending
>     -
>     - Makefile.am                     |   4 +
>     - configure.ac <http://configure.ac>           |   2 +
>     + meson.build                     |   1 +
>     + src/basic/meson.build           |   4 +
>       src/basic/parse-printf-format.c | 273
>     ++++++++++++++++++++++++++++++++++++++++
>       src/basic/parse-printf-format.h |  57 +++++++++
>       src/basic/stdio-util.h          |   2 +-
>       src/journal/journal-send.c      |   2 +-
>     - 6 files changed, 338 insertions(+), 2 deletions(-)
>     + 6 files changed, 337 insertions(+), 2 deletions(-)
>       create mode 100644 src/basic/parse-printf-format.c
>       create mode 100644 src/basic/parse-printf-format.h
>
>     -diff --git a/Makefile.am b/Makefile.am
>     -index 692d7bb95..3cc8f3451 100644
>     ---- a/Makefile.am
>     -+++ b/Makefile.am
>     -@@ -997,6 +997,10 @@ libbasic_la_SOURCES = \
>     -       src/basic/journal-importer.h \
>     -       src/basic/journal-importer.c
>     +diff --git a/meson.build b/meson.build
>     +index a5e249dc7..9ca9ba23a 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -578,6 +578,7 @@ endif
>     + foreach header : ['linux/btrfs.h',
>     +                   'linux/memfd.h',
>     +                   'linux/vm_sockets.h',
>     ++                  'printf.h',
>     +                   'sys/auxv.h',
>     +                   'valgrind/memcheck.h',
>     +                   'valgrind/valgrind.h',
>     +diff --git a/src/basic/meson.build b/src/basic/meson.build
>     +index a37e279e5..a674cc14f 100644
>     +--- a/src/basic/meson.build
>     ++++ b/src/basic/meson.build
>     +@@ -296,6 +296,10 @@ endforeach
>
>     -+if !HAVE_PRINTF_H
>     -+libbasic_la_SOURCES += src/basic/parse-printf-format.c
>     + basic_sources = basic_sources_plain + [missing_h] +
>     generated_gperf_headers
>     +
>     ++if conf.get('HAVE_PRINTF_H') != 1
>     ++        basic_sources += [files('parse-printf-format.c')]
>      +endif
>      +
>     - nodist_libbasic_la_SOURCES = \
>     -       src/basic/errno-from-name.h \
>     -       src/basic/errno-to-name.h \
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 60e7df5ee..efcdc6c16 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -308,8 +308,10 @@ AC_CHECK_HEADERS([uchar.h], [], [])
>     - AC_CHECK_HEADERS([sys/capability.h], [], [AC_MSG_ERROR([***
>     POSIX caps headers not found])])
>     - AC_CHECK_HEADERS([linux/btrfs.h], [], [])
>     - AC_CHECK_HEADERS([linux/memfd.h], [], [])
>     -+AC_CHECK_HEADERS([printf.h], [], [])
>     - AC_CHECK_HEADERS([linux/vm_sockets.h], [], [], [#include
>     <sys/socket.h>])
>     -
>     -+AM_CONDITIONAL(HAVE_PRINTF_H, [test "x$ac_cv_header_printf_h" =
>     xyes])
>     - # unconditionally pull-in librt with old glibc versions
>     - AC_SEARCH_LIBS([clock_gettime], [rt], [], [])
>     -
>     + libbasic = static_library(
>     +         'basic',
>     +         basic_sources,
>      diff --git a/src/basic/parse-printf-format.c
>     b/src/basic/parse-printf-format.c
>      new file mode 100644
>      index 000000000..49437e544
>     @@ -329,7 +327,7 @@ index 000000000..49437e544
>      +}
>      diff --git a/src/basic/parse-printf-format.h
>     b/src/basic/parse-printf-format.h
>      new file mode 100644
>     -index 000000000..4371177b0
>     +index 000000000..47be7522d
>      --- /dev/null
>      +++ b/src/basic/parse-printf-format.h
>      @@ -0,0 +1,57 @@
>     @@ -361,7 +359,7 @@ index 000000000..4371177b0
>      +
>      +#include "config.h"
>      +
>     -+#ifdef HAVE_PRINTF_H
>     ++#if HAVE_PRINTF_H
>      +#include <printf.h>
>      +#else
>      +
>     @@ -391,10 +389,10 @@ index 000000000..4371177b0
>      +
>      +#endif /* HAVE_PRINTF_H */
>      diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
>     -index bd1144b4c..c9c95eb54 100644
>     +index dbfafba26..8038380d6 100644
>      --- a/src/basic/stdio-util.h
>      +++ b/src/basic/stdio-util.h
>     -@@ -19,12 +19,12 @@
>     +@@ -20,12 +20,12 @@
>         along with systemd; If not, see <http://www.gnu.org/licenses/>.
>       ***/
>
>     @@ -409,10 +407,10 @@ index bd1144b4c..c9c95eb54 100644
>       #define xsprintf(buf, fmt, ...) \
>               assert_message_se((size_t) snprintf(buf,
>     ELEMENTSOF(buf), fmt, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: "
>     #buf "[] must be big enough")
>      diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
>     -index 440fba67c..0236c43c4 100644
>     +index a78aa0703..97fc29d01 100644
>      --- a/src/journal/journal-send.c
>      +++ b/src/journal/journal-send.c
>     -@@ -19,7 +19,6 @@
>     +@@ -20,7 +20,6 @@
>
>       #include <errno.h>
>       #include <fcntl.h>
>     @@ -420,7 +418,7 @@ index 440fba67c..0236c43c4 100644
>       #include <stddef.h>
>       #include <sys/socket.h>
>       #include <sys/un.h>
>     -@@ -38,6 +37,7 @@
>     +@@ -39,6 +38,7 @@
>       #include "stdio-util.h"
>       #include "string-util.h"
>       #include "util.h"
>     @@ -429,5 +427,5 @@ index 440fba67c..0236c43c4 100644
>       #define SNDBUF_SIZE (8*1024*1024)
>
>      --
>     -2.14.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
>     b/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
>     similarity index 60%
>     rename from
>     meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
>     index 94c136b..8d4537c 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
>     @@ -1,15 +1,16 @@
>     -From 585abd891a56409915314304101cac26b42c076b Mon Sep 17 00:00:00
>     2001
>     -From: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>     -Date: Mon, 23 Oct 2017 10:45:46 -0700
>     -Subject: [PATCH 02/12] src/basic/missing.h: check for missing
>     strndupa
>     +From 72d7c9aaf2f4af1ac21caa8703d183715d143e8f Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Mon, 26 Feb 2018 16:41:36 +0800
>     +Subject: [PATCH 14/32] src/basic/missing.h: check for missing
>     strndupa
>
>      include missing.h  for definition of strndupa
>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>      Upstream-Status: Pending
>
>     - configure.ac <http://configure.ac>  |  1 +
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + meson.build            |  1 +
>       src/basic/missing.h    | 11 +++++++++++
>       src/basic/mkdir.c      |  1 +
>       src/basic/parse-util.c |  1 +
>     @@ -17,27 +18,27 @@ Upstream-Status: Pending
>       src/shared/uid-range.c |  1 +
>       6 files changed, 16 insertions(+)
>
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index efcdc6c16..cd035a971 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -329,6 +329,7 @@ AC_CHECK_DECLS([
>     -         pivot_root,
>     -         name_to_handle_at,
>     -         setns,
>     -+        strndupa,
>     -         renameat2,
>     -         kcmp,
>     -         keyctl,
>     +diff --git a/meson.build b/meson.build
>     +index 9ca9ba23a..47a170c08 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -486,6 +486,7 @@ foreach ident : [
>     +         ['bpf',               '''#include <sys/syscall.h>
>     +                                  #include <unistd.h>'''],
>     +         ['explicit_bzero' ,   '''#include <string.h>'''],
>     ++        ['strndupa' ,         '''#include <string.h>'''],
>     + ]
>     +
>     +         have = cc.has_function(ident[0], prefix : ident[1])
>      diff --git a/src/basic/missing.h b/src/basic/missing.h
>     -index 04912bf52..8009888ad 100644
>     +index cdb4eb4be..1d4a70f25 100644
>      --- a/src/basic/missing.h
>      +++ b/src/basic/missing.h
>     -@@ -1104,6 +1104,17 @@ typedef int32_t key_serial_t;
>     - #define KEYCTL_DESCRIBE 6
>     +@@ -1115,6 +1115,17 @@ struct input_mask {
>     + typedef int32_t key_serial_t;
>       #endif
>
>     -+#if !HAVE_DECL_STRNDUPA
>     ++#if ! HAVE_STRNDUPA
>      +#define strndupa(s, n) \
>      +  ({ \
>      +    const char *__old = (s); \
>     @@ -48,26 +49,26 @@ index 04912bf52..8009888ad 100644
>      +  })
>      +#endif
>      +
>     - #ifndef KEYCTL_READ
>     - #define KEYCTL_READ 11
>     + #ifndef KEYCTL_JOIN_SESSION_KEYRING
>     + #define KEYCTL_JOIN_SESSION_KEYRING 1
>       #endif
>      diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
>     -index 6b1a98402..d1388df48 100644
>     +index 4386b38c4..de2077cf8 100644
>      --- a/src/basic/mkdir.c
>      +++ b/src/basic/mkdir.c
>     -@@ -28,6 +28,7 @@
>     +@@ -30,6 +30,7 @@
>       #include "path-util.h"
>       #include "stat-util.h"
>       #include "user-util.h"
>      +#include "missing.h"
>
>     - int mkdir_safe_internal(const char *path, mode_t mode, uid_t
>     uid, gid_t gid, mkdir_func_t _mkdir) {
>     + int mkdir_safe_internal(const char *path, mode_t mode, uid_t
>     uid, gid_t gid, bool follow_symlink, mkdir_func_t _mkdir) {
>               struct stat st;
>      diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
>     -index 4532f222c..7a30a0e06 100644
>     +index d03f60e01..4117a94c3 100644
>      --- a/src/basic/parse-util.c
>      +++ b/src/basic/parse-util.c
>     -@@ -30,6 +30,7 @@
>     +@@ -32,6 +32,7 @@
>       #include "parse-util.h"
>       #include "process-util.h"
>       #include "string-util.h"
>     @@ -76,10 +77,10 @@ index 4532f222c..7a30a0e06 100644
>       int parse_boolean(const char *v) {
>               assert(v);
>      diff --git a/src/shared/pager.c b/src/shared/pager.c
>     -index 4d7b02c63..854efc0c9 100644
>     +index 39997278f..6767c7d71 100644
>      --- a/src/shared/pager.c
>      +++ b/src/shared/pager.c
>     -@@ -38,6 +38,7 @@
>     +@@ -39,6 +39,7 @@
>       #include "string-util.h"
>       #include "strv.h"
>       #include "terminal-util.h"
>     @@ -88,10 +89,10 @@ index 4d7b02c63..854efc0c9 100644
>       static pid_t pager_pid = 0;
>
>      diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
>     -index b6ec47439..91ce9fb7f 100644
>     +index c38b7cc98..8ec6bf08d 100644
>      --- a/src/shared/uid-range.c
>      +++ b/src/shared/uid-range.c
>     -@@ -24,6 +24,7 @@
>     +@@ -25,6 +25,7 @@
>       #include "macro.h"
>       #include "uid-range.h"
>       #include "user-util.h"
>     @@ -100,5 +101,5 @@ index b6ec47439..91ce9fb7f 100644
>       static bool uid_range_intersect(UidRange *range, uid_t start,
>     uid_t nr) {
>               assert(range);
>      --
>     -2.14.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     b/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     similarity index 88%
>     rename from
>     meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     index 9a2d2c8..00ff925 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>     @@ -1,7 +1,7 @@
>     -From 5bbbc2a08a3b4283ec04af0e77e25fb205aa8b82 Mon Sep 17 00:00:00
>     2001
>     +From 860b4c4d9156b398ccb5450cb1f42f0f711f7b5d Mon Sep 17 00:00:00
>     2001
>      From: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>      Date: Mon, 23 Oct 2017 10:50:14 -0700
>     -Subject: [PATCH 03/12] don't fail if GLOB_BRACE and
>     GLOB_ALTDIRFUNC is not
>     +Subject: [PATCH 15/32] don't fail if GLOB_BRACE and
>     GLOB_ALTDIRFUNC is not
>       defined
>
>      If the standard library doesn't provide brace
>     @@ -11,20 +11,20 @@ Dont use GNU GLOB extentions on non-glibc systems
>
>      Conditionalize use of GLOB_ALTDIRFUNC
>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>      Upstream-Status: Pending
>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>       src/basic/glob-util.c     | 20 +++++++++++++++++---
>       src/test/test-glob-util.c | 17 +++++++++++++++--
>       src/tmpfiles/tmpfiles.c   |  8 ++++++++
>       3 files changed, 40 insertions(+), 5 deletions(-)
>
>      diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
>     -index f611c42e4..ad6e2be8d 100644
>     +index 6e80a1e23..312bb3fd1 100644
>      --- a/src/basic/glob-util.c
>      +++ b/src/basic/glob-util.c
>     -@@ -27,13 +27,18 @@
>     +@@ -28,13 +28,18 @@
>       #include "macro.h"
>       #include "path-util.h"
>       #include "strv.h"
>     @@ -44,7 +44,7 @@ index f611c42e4..ad6e2be8d 100644
>               if (!pglob->gl_closedir)
>                       pglob->gl_closedir = (void (*)(void *)) closedir;
>               if (!pglob->gl_readdir)
>     -@@ -44,10 +49,13 @@ int safe_glob(const char *path, int flags,
>     glob_t *pglob) {
>     +@@ -45,10 +50,13 @@ int safe_glob(const char *path, int flags,
>     glob_t *pglob) {
>                       pglob->gl_lstat = lstat;
>               if (!pglob->gl_stat)
>                       pglob->gl_stat = stat;
>     @@ -60,7 +60,7 @@ index f611c42e4..ad6e2be8d 100644
>               if (k == GLOB_NOMATCH)
>                       return -ENOENT;
>               if (k == GLOB_NOSPACE)
>     -@@ -60,6 +68,12 @@ int safe_glob(const char *path, int flags,
>     glob_t *pglob) {
>     +@@ -61,6 +69,12 @@ int safe_glob(const char *path, int flags,
>     glob_t *pglob) {
>               return 0;
>       }
>
>     @@ -74,10 +74,10 @@ index f611c42e4..ad6e2be8d 100644
>               _cleanup_globfree_ glob_t g = {};
>               int k;
>      diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
>     -index af866e004..3afa09ada 100644
>     +index bd2f8fcfd..a10c77427 100644
>      --- a/src/test/test-glob-util.c
>      +++ b/src/test/test-glob-util.c
>     -@@ -29,6 +29,11 @@
>     +@@ -30,6 +30,11 @@
>       #include "glob-util.h"
>       #include "macro.h"
>       #include "rm-rf.h"
>     @@ -89,7 +89,7 @@ index af866e004..3afa09ada 100644
>
>       static void test_glob_exists(void) {
>               char name[] = "/tmp/test-glob_exists.XXXXXX";
>     -@@ -51,25 +56,33 @@ static void test_glob_exists(void) {
>     +@@ -52,25 +57,33 @@ static void test_glob_exists(void) {
>       static void test_glob_no_dot(void) {
>               char template[] = "/tmp/test-glob-util.XXXXXXX";
>               const char *fn;
>     @@ -126,10 +126,10 @@ index af866e004..3afa09ada 100644
>
>               (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
>      diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
>     -index 9419c99e2..07027a765 100644
>     +index a7ce1a804..bb0d62858 100644
>      --- a/src/tmpfiles/tmpfiles.c
>      +++ b/src/tmpfiles/tmpfiles.c
>     -@@ -71,6 +71,12 @@
>     +@@ -76,6 +76,12 @@
>       #include "umask-util.h"
>       #include "user-util.h"
>       #include "util.h"
>     @@ -142,7 +142,7 @@ index 9419c99e2..07027a765 100644
>
>       /* This reads all files listed in /etc/tmpfiles.d/?*.conf and
>     creates
>        * them in the file system. This is intended to be used to create
>     -@@ -1092,7 +1098,9 @@ static int item_do_children(Item *i, const
>     char *path, action_t action) {
>     +@@ -1229,7 +1235,9 @@ static int item_do_children(Item *i, const
>     char *path, action_t action) {
>
>       static int glob_item(Item *i, action_t action, bool recursive) {
>               _cleanup_globfree_ glob_t g = {
>     @@ -153,5 +153,5 @@ index 9419c99e2..07027a765 100644
>               int r = 0, k;
>               char **fn;
>      --
>     -2.14.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     b/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     similarity index 77%
>     rename from
>     meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     index cb5ae99..5021bea 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>     @@ -1,24 +1,24 @@
>     -From c850b654e71677e0d6292f1345207b9b5acffc33 Mon Sep 17 00:00:00
>     2001
>     +From 55416ee5068cf8aeb35294adebfe151ace6ae71d Mon Sep 17 00:00:00
>     2001
>      From: Emil Renner Berthing <systemd@esmil.dk
>     <mailto:systemd@esmil.dk>>
>      Date: Mon, 23 Oct 2017 11:31:03 -0700
>     -Subject: [PATCH 04/12] src/basic/missing.h: check for missing
>     __compar_fn_t
>     +Subject: [PATCH 16/32] src/basic/missing.h: check for missing
>     __compar_fn_t
>       typedef
>
>      include missing.h for missing __compar_fn_t
>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>      Upstream-Status: Pending
>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>       src/basic/missing.h | 5 +++++
>       src/basic/strbuf.c  | 1 +
>       2 files changed, 6 insertions(+)
>
>      diff --git a/src/basic/missing.h b/src/basic/missing.h
>     -index 8009888ad..671f341c6 100644
>     +index 1d4a70f25..8b6353f39 100644
>      --- a/src/basic/missing.h
>      +++ b/src/basic/missing.h
>     -@@ -1063,6 +1063,11 @@ struct input_mask {
>     +@@ -1090,6 +1090,11 @@ struct input_mask {
>       #define RENAME_NOREPLACE (1 << 0)
>       #endif
>
>     @@ -31,10 +31,10 @@ index 8009888ad..671f341c6 100644
>       #define KCMP_FILE 0
>       #endif
>      diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
>     -index 00aaf9e62..9dc4a584a 100644
>     +index 8befffa66..bcb860f95 100644
>      --- a/src/basic/strbuf.c
>      +++ b/src/basic/strbuf.c
>     -@@ -23,6 +23,7 @@
>     +@@ -24,6 +24,7 @@
>
>       #include "alloc-util.h"
>       #include "strbuf.h"
>     @@ -43,5 +43,5 @@ index 00aaf9e62..9dc4a584a 100644
>       /*
>        * Strbuf stores given strings in a single continuous allocated
>     memory
>      --
>     -2.14.2
>     +2.11.0
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
>     b/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
>     similarity index 81%
>     rename from
>     meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
>     rename to
>     meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
>     index 55887ee..c230127 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
>     @@ -1,17 +1,17 @@
>     -From 21080b6a40d0a4ddd2db8f0fa37686f6fa885d1c Mon Sep 17 00:00:00
>     2001
>     +From b8bac091279f255aafdba251f8ccc5f6afb2cd5c Mon Sep 17 00:00:00
>     2001
>      From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>      Date: Mon, 23 Oct 2017 11:38:33 -0700
>     -Subject: [PATCH 06/12] Include netinet/if_ether.h
>     +Subject: [PATCH 17/32] Include netinet/if_ether.h
>
>      Fixes
>     -/mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/systemd/1_234-r0/recipe-sysroot/usr/include/netinet/if_ether.h:101:8:
>     error: redefinition of 'struct ethhdr'
>     +/path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8:
>     error: redefinition of 'struct ethhdr'
>       struct ethhdr {
>              ^~~~~~
>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>      Upstream-Status: Pending
>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>       src/libsystemd/sd-netlink/netlink-types.c | 1 +
>       src/network/netdev/tuntap.c               | 1 +
>       src/network/networkd-brvlan.c             | 1 +
>     @@ -20,10 +20,10 @@ Upstream-Status: Pending
>       5 files changed, 5 insertions(+), 2 deletions(-)
>
>      diff --git a/src/libsystemd/sd-netlink/netlink-types.c
>     b/src/libsystemd/sd-netlink/netlink-types.c
>     -index 923f7dd10..b95b1e4b2 100644
>     +index f8be296d3..46737b558 100644
>      --- a/src/libsystemd/sd-netlink/netlink-types.c
>      +++ b/src/libsystemd/sd-netlink/netlink-types.c
>     -@@ -19,6 +19,7 @@
>     +@@ -20,6 +20,7 @@
>
>       #include <stdint.h>
>       #include <sys/socket.h>
>     @@ -32,10 +32,10 @@ index 923f7dd10..b95b1e4b2 100644
>       #include <linux/rtnetlink.h>
>       #include <linux/can/netlink.h>
>      diff --git a/src/network/netdev/tuntap.c
>     b/src/network/netdev/tuntap.c
>     -index 3d6280884..40e58c38f 100644
>     +index 4597a7fee..941f2a324 100644
>      --- a/src/network/netdev/tuntap.c
>      +++ b/src/network/netdev/tuntap.c
>     -@@ -18,6 +18,7 @@
>     +@@ -19,6 +19,7 @@
>       ***/
>
>       #include <fcntl.h>
>     @@ -44,10 +44,10 @@ index 3d6280884..40e58c38f 100644
>       #include <net/if.h>
>       #include <netinet/if_ether.h>
>      diff --git a/src/network/networkd-brvlan.c
>     b/src/network/networkd-brvlan.c
>     -index fa5d3ee7f..e0828962a 100644
>     +index 99dd41629..90407c9d8 100644
>      --- a/src/network/networkd-brvlan.c
>      +++ b/src/network/networkd-brvlan.c
>     -@@ -18,6 +18,7 @@
>     +@@ -19,6 +19,7 @@
>       ***/
>
>       #include <netinet/in.h>
>     @@ -56,10 +56,10 @@ index fa5d3ee7f..e0828962a 100644
>       #include <stdbool.h>
>
>      diff --git a/src/udev/net/ethtool-util.c
>     b/src/udev/net/ethtool-util.c
>     -index 201fc2343..5f7cc2a0a 100644
>     +index 3ed8a51fd..cfb39ba59 100644
>      --- a/src/udev/net/ethtool-util.c
>      +++ b/src/udev/net/ethtool-util.c
>     -@@ -16,7 +16,7 @@
>     +@@ -17,7 +17,7 @@
>         You should have received a copy of the GNU Lesser General
>     Public License
>         along with systemd; If not, see <http://www.gnu.org/licenses/>.
>       ***/
>     @@ -69,10 +69,10 @@ index 201fc2343..5f7cc2a0a 100644
>       #include <sys/ioctl.h>
>       #include <linux/ethtool.h>
>      diff --git a/src/udev/udev-builtin-net_setup_link.c
>     b/src/udev/udev-builtin-net_setup_link.c
>     -index 8e4777513..d01fff2a4 100644
>     +index 40158e0af..fbead3a7b 100644
>      --- a/src/udev/udev-builtin-net_setup_link.c
>      +++ b/src/udev/udev-builtin-net_setup_link.c
>     -@@ -16,7 +16,7 @@
>     +@@ -17,7 +17,7 @@
>         You should have received a copy of the GNU Lesser General
>     Public License
>         al...
>
>     [Message clipped] 
>
>


--------------C9011CB4348048E2C5755D89
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/28/2018 09:50 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ3d68OW-6t4wTreW5jeAGZaPMeXwvfOeufcqYVZRBzvA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">WARNING: systemd-1_236-r0 do_configure: QA Issue:
        systemd: invalid PACKAGECONFIG: manpages [invalid-packageconfig]<br>
        <div><br>
        </div>
        <div>I see the man pages don't get built now, but this isn't
          documented anywhere in changelog.</div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    The PACKAGECONFIG 'manpages' is now renamed to 'man'. I forgot to
    mention this in commit message.<br>
    <br>
    I renamed it to 'man' because in meson_options.txt, we have:<br>
    option('man', type : 'combo', choices : ['auto', 'true', 'false'],<br>
           description : 'build and install man pages')<br>
    <br>
    I'll add this info in commit message in V2.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ3d68OW-6t4wTreW5jeAGZaPMeXwvfOeufcqYVZRBzvA@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">On 28 February 2018 at 05:56, Chen Qi <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade
            systemd to 236.<br>
            <br>
            Note that this version has dropped autotools support.<br>
            <br>
            The following patches are rebased:<br>
            0004-Use-getenv-when-secure-<wbr>versions-are-not-available.<wbr>patch<br>
            0005-binfmt-Don-t-install-<wbr>dependency-links-at-install-<wbr>tim.patch<br>
            0007-use-lnr-wrapper-instead-<wbr>of-looking-for-relative-opti.<wbr>patch<br>
            0015-Revert-udev-remove-<wbr>userspace-firmware-loading-<wbr>suppor.patch<br>
            0018-check-for-uchar.h-in-<wbr>configure.patch<br>
            0019-socket-util-don-t-fail-<wbr>if-libc-doesn-t-support-IDN.<wbr>patch<br>
            0001-add-fallback-parse_<wbr>printf_format-implementation.<wbr>patch<br>
            0002-src-basic-missing.h-<wbr>check-for-missing-strndupa.<wbr>patch<br>
            0007-check-for-missing-<wbr>canonicalize_file_name.patch<br>
            0008-Do-not-enable-nss-tests.<wbr>patch<br>
            0010-test-sizeof.c-Disable-<wbr>tests-for-missing-typedefs-in-<wbr>.patch<br>
            0011-nss-mymachines-Build-<wbr>conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
            <br>
            The following backported patches are dropped:<br>
            0001-core-evaluate-presets-<wbr>after-generators-have-run-<wbr>6526.patch<br>
            0001-main-skip-many-<wbr>initialization-steps-when-<wbr>running-in-.patch<br>
            0001-meson-update-header-file-<wbr>to-detect-memfd_create.patch<br>
            0003-fileio-include-sys-mman.<wbr>h.patch<br>
            <br>
            The following patch is dropped as autotools support is
            dropped:<br>
            0002-configure.ac-Check-if-<wbr>memfd_create-is-already-<wbr>define.patch<br>
            <br>
            The following patches are newly added to fix problems:<br>
            0027-remove-nobody-user-group-<wbr>checking.patch<br>
            0028-src-resolve-test-dnssec.<wbr>c-fix-build-without-gcrypt.<wbr>patch<br>
            0029-add-missing-FTW_-macros-<wbr>for-musl.patch<br>
            0031-fix-missing-of-__<wbr>register_atfork-for-non-glibc-<wbr>build.patch<br>
            0032-fix-missing-ULONG_LONG_<wbr>MAX-definition-in-case-of-mus.<wbr>patch<br>
            <br>
            Other changes are mostly autotools/meson related.<br>
            <br>
            This new version has dropped ptest support, as there's no
            easy<br>
            way to do this in the framework of meson.<br>
            <br>
            Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-core/systemd/<wbr>systemd.inc              | 
             2 +-<br>
             ...v-when-secure-versions-are-<wbr>not-available.patch} | 
            21 +-<br>
             ...te-presets-after-<wbr>generators-have-run-6526.patch | 
            69 ------<br>
             ...any-initialization-steps-<wbr>when-running-in-.patch |
            163 -------------<br>
             ...update-header-file-to-<wbr>detect-memfd_create.patch | 
            28 ---<br>
             ...t-install-dependency-links-<wbr>at-install-tim.patch | 
            81 +++++++<br>
             ...c-Check-if-memfd_create-is-<wbr>already-define.patch | 
            27 ---<br>
             .../systemd/0003-fileio-<wbr>include-sys-mman.h.patch   | 
            26 --<br>
             ...pper-instead-of-looking-<wbr>for-relative-opti.patch | 
            64 +++++<br>
             ...004-implment-systemd-sysv-<wbr>install-for-OE.patch} | 
             8 +-<br>
             ...t-install-dependency-links-<wbr>at-install-tim.patch | 
            74 ------<br>
             ...patch =&gt; 0005-rules-whitelist-hd-<wbr>devices.patch}
            |   9 +-<br>
             ...6-Make-root-s-home-<wbr>directory-configurable.patch | 
            78 ++++++<br>
             ...vert-rules-remove-firmware-<wbr>loading-rules.patch} | 
             8 +-<br>
             ...-check-for-missing-<wbr>canonicalize_file_name.patch | 
            63 -----<br>
             ...pper-instead-of-looking-<wbr>for-relative-opti.patch | 
            40 ---<br>
             .../systemd/0008-Do-not-<wbr>enable-nss-tests.patch     | 
            35 ---<br>
             ...remove-userspace-firmware-<wbr>loading-suppor.patch} |
            201 +++++++++-------<br>
             ...=&gt; 0009-remove-duplicate-include-<wbr>uchar.h.patch}
            |  14 +-<br>
             .../0010-check-for-uchar.h-in-<wbr>meson.build.patch    | 
            45 ++++<br>
             ...nes-Build-conditionally-<wbr>when-HAVE_MYHOSTN.patch | 
            38 ---<br>
             ...l-don-t-fail-if-libc-doesn-<wbr>t-support-IDN.patch} | 
            26 +-<br>
             ...es-watch-metadata-changes-<wbr>in-ide-devices.patch} | 
             8 +-<br>
             ...3-Make-root-s-home-<wbr>directory-configurable.patch |
            155 ------------<br>
             ...lback-parse_printf_format-<wbr>implementation.patch} | 
            86 ++++---<br>
             ...sic-missing.h-check-for-<wbr>missing-strndupa.patch} | 
            71 +++---<br>
             ...f-GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch} | 
            30 +--<br>
             ...ssing.h-check-for-missing-_<wbr>_compar_fn_t-.patch} | 
            18 +-<br>
             ...patch =&gt; 0017-Include-netinet-if_ether.<wbr>h.patch}
            |  32 +--<br>
             ...-check-for-missing-<wbr>canonicalize_file_name.patch | 
            47 ++++<br>
             .../0018-check-for-uchar.h-in-<wbr>configure.patch      | 
            44 ----<br>
             ...le-nss-tests-if-nss-<wbr>systemd-is-not-enable.patch | 
            29 +++<br>
             ...xdecoct.c-Include-missing.<wbr>h-for-strndupa.patch} | 
            15 +-<br>
             ...c-Disable-tests-for-<wbr>missing-typedefs-in-.patch} | 
            37 ++-<br>
             ...=&gt; 0022-don-t-use-glibc-specific-<wbr>qsort_r.patch}
            |  26 +-<br>
             ...ss-AT_SYMLINK_NOFOLLOW-<wbr>flag-to-faccessat.patch} | 
            22 +-<br>
             ...n_t-is-glibc-specific-use-<wbr>raw-signature-.patch} | 
            14 +-<br>
             ...ATH_WTMPX-and-_PATH_UTMPX-<wbr>if-not-defined.patch} | 
            16 +-<br>
             ...&gt; 0026-Use-uintmax_t-for-<wbr>handling-rlim_t.patch}
            |  22 +-<br>
             .../0027-remove-nobody-user-<wbr>group-checking.patch   | 
            63 +++++<br>
             ...ve-test-dnssec.c-fix-build-<wbr>without-gcrypt.patch | 
            36 +++<br>
             .../0029-add-missing-FTW_-<wbr>macros-for-musl.patch    | 
            50 ++++<br>
             ...nes-Build-conditionally-<wbr>when-ENABLE_MYHOS.patch | 
            43 ++++<br>
             ...-of-__register_atfork-for-<wbr>non-glibc-build.patch | 
            45 ++++<br>
             ...-ULONG_LONG_MAX-definition-<wbr>in-case-of-mus.patch | 
            30 +++<br>
             meta/recipes-core/systemd/<wbr>systemd/run-ptest        | 
             6 -<br>
             .../systemd/{<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">systemd_234.bb</a> =&gt; <a
              moz-do-not-send="true" href="http://systemd_236.bb"
              rel="noreferrer" target="_blank">systemd_236.bb</a>}     |
            267 ++++++++-------------<br>
             47 files changed, 1071 insertions(+), 1261 deletions(-)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0004-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch
            =&gt; 0001-Use-getenv-when-secure-<wbr>versions-are-not-available.<wbr>patch}
            (53%)<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-core-evaluate-<wbr>presets-after-generators-have-<wbr>run-6526.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-main-skip-many-<wbr>initialization-steps-when-<wbr>running-in-.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-meson-update-<wbr>header-file-to-detect-memfd_<wbr>create.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0002-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0002-configure.ac-<wbr>Check-if-memfd_create-is-<wbr>already-define.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0003-fileio-include-<wbr>sys-mman.h.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0003-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0010-implment-<wbr>systemd-sysv-install-for-OE.<wbr>patch
            =&gt; 0004-implment-systemd-sysv-<wbr>install-for-OE.patch}
            (89%)<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0012-rules-whitelist-<wbr>hd-devices.patch
            =&gt; 0005-rules-whitelist-hd-<wbr>devices.patch} (89%)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0006-Make-root-s-home-<wbr>directory-configurable.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0014-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch
            =&gt; 0007-Revert-rules-remove-<wbr>firmware-loading-rules.patch}
            (81%)<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0007-check-for-<wbr>missing-canonicalize_file_<wbr>name.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0008-Do-not-enable-<wbr>nss-tests.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0015-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch
            =&gt; 0008-Revert-udev-remove-<wbr>userspace-firmware-loading-<wbr>suppor.patch}
            (65%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0017-remove-<wbr>duplicate-include-uchar.h.<wbr>patch
            =&gt; 0009-remove-duplicate-include-<wbr>uchar.h.patch}
            (78%)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0010-check-for-uchar.<wbr>h-in-meson.build.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build-conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0019-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch
            =&gt; 0011-socket-util-don-t-fail-<wbr>if-libc-doesn-t-support-IDN.<wbr>patch}
            (58%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0020-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch
            =&gt; 0012-rules-watch-metadata-<wbr>changes-in-ide-devices.patch}
            (90%)<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr>directory-configurable.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0001-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch
            =&gt; 0013-add-fallback-parse_<wbr>printf_format-implementation.<wbr>patch}
            (88%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0002-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch
            =&gt; 0014-src-basic-missing.h-<wbr>check-for-missing-strndupa.<wbr>patch}
            (60%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0003-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch
            =&gt; 0015-don-t-fail-if-GLOB_BRACE-<wbr>and-GLOB_ALTDIRFUNC-is-not-.<wbr>patch}
            (88%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0004-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch
            =&gt; 0016-src-basic-missing.h-<wbr>check-for-missing-__compar_fn_<wbr>t-.patch}
            (77%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0006-Include-netinet-<wbr>if_ether.h.patch
            =&gt; 0017-Include-netinet-if_ether.<wbr>h.patch} (81%)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0018-check-for-<wbr>missing-canonicalize_file_<wbr>name.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0018-check-for-uchar.<wbr>h-in-configure.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0019-Do-not-enable-<wbr>nss-tests-if-nss-systemd-is-<wbr>not-enable.patch<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0009-test-hexdecoct.<wbr>c-Include-missing.h-form-<wbr>strndupa.patch
            =&gt; 0020-test-hexdecoct.c-Include-<wbr>missing.h-for-strndupa.patch}
            (68%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0010-test-sizeof.c-<wbr>Disable-tests-for-missing-<wbr>typedefs-in-.patch
            =&gt; 0021-test-sizeof.c-Disable-<wbr>tests-for-missing-typedefs-in-<wbr>.patch}
            (49%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0011-don-t-use-glibc-<wbr>specific-qsort_r.patch
            =&gt; 0022-don-t-use-glibc-specific-<wbr>qsort_r.patch}
            (88%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0012-don-t-pass-AT_<wbr>SYMLINK_NOFOLLOW-flag-to-<wbr>faccessat.patch
            =&gt; 0023-don-t-pass-AT_SYMLINK_<wbr>NOFOLLOW-flag-to-faccessat.<wbr>patch}
            (90%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0013-comparison_fn_t-<wbr>is-glibc-specific-use-raw-<wbr>signature-.patch
            =&gt; 0024-comparison_fn_t-is-glibc-<wbr>specific-use-raw-signature-.<wbr>patch}
            (77%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0001-Define-_PATH_<wbr>WTMPX-and-_PATH_UTMPX-if-not-<wbr>defined.patch
            =&gt; 0025-Define-_PATH_WTMPX-and-_<wbr>PATH_UTMPX-if-not-defined.<wbr>patch}
            (80%)<br>
             rename meta/recipes-core/systemd/<wbr>systemd/{0001-Use-uintmax_t-<wbr>for-handling-rlim_t.patch
            =&gt; 0026-Use-uintmax_t-for-<wbr>handling-rlim_t.patch}
            (89%)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0027-remove-nobody-<wbr>user-group-checking.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0028-src-resolve-test-<wbr>dnssec.c-fix-build-without-<wbr>gcrypt.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0029-add-missing-FTW_-<wbr>macros-for-musl.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0030-nss-mymachines-<wbr>Build-conditionally-when-<wbr>ENABLE_MYHOS.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0031-fix-missing-of-__<wbr>register_atfork-for-non-glibc-<wbr>build.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0032-fix-missing-<wbr>ULONG_LONG_MAX-definition-in-<wbr>case-of-mus.patch<br>
             delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/run-ptest<br>
             rename meta/recipes-core/systemd/{<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">sys<wbr>temd_234.bb</a> =&gt; <a
              moz-do-not-send="true" href="http://systemd_236.bb"
              rel="noreferrer" target="_blank">systemd_236.bb</a>} (71%)<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd.inc
            b/meta/recipes-core/systemd/<wbr>systemd.inc<br>
            index d99d150..9ecd992 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd.inc<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd.inc<br>
            @@ -14,7 +14,7 @@ LICENSE = "GPLv2 &amp; LGPLv2.1"<br>
             LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://LICENSE.GPL2;md5=">file://LICENSE.GPL2;md5=</a><wbr>751419260aa954499f7abaabaa882b<wbr>be
            \<br>
                                 <a class="moz-txt-link-freetext" href="file://LICENSE.LGPL2.1;md5=">file://LICENSE.LGPL2.1;md5=</a><wbr>4fbd65380cdd255951079008b36451<wbr>6c"<br>
            <br>
            -SRCREV = "<wbr>c1edab7ad1e7ccc9be693bedfd464c<wbr>d1cbffb395"<br>
            +SRCREV = "<wbr>a1b2c92d8290c76a29ccd0887a92ac<wbr>064e1bb5a1"<br>
            <br>
             SRC_URI = "git://<a moz-do-not-send="true"
              href="http://github.com/systemd/systemd.git;protocol=git"
              rel="noreferrer" target="_blank">github.com/systemd/<wbr>systemd.git;protocol=git</a>"<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch<br>
            similarity index 53%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0001-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch<br>
            index ab2cbe0..6693b4a 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>available.patch<br>
            @@ -1,23 +1,26 @@<br>
            -From 5765cda4f7243e240b1e8723dc536f<wbr>b20503d544 Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Nov 2016 19:28:32 -0800<br>
            -Subject: [PATCH 04/19] Use getenv when secure versions are
            not available<br>
            +From 768742b1b5af5563897fe89399f6cf<wbr>580b83137c Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Fri, 23 Feb 2018 10:04:48 +0800<br>
            +Subject: [PATCH 01/32] Use getenv when secure versions are
            not available<br>
            <br>
             musl doesnt implement secure version, so we default<br>
            -to it if configure does not detect a secure imeplementation<br>
            +to it if configure does not detect a secure implementation<br>
            <br>
             Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +<br>
             Upstream-Status: Denied<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
             ---<br>
              src/basic/missing.h | 2 +-<br>
              1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
             diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
            -index 4a3fd9c..4936873 100644<br>
            +index 790f9f55a..5a602e9a6 100644<br>
             --- a/src/basic/missing.h<br>
             +++ b/src/basic/missing.h<br>
            -@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {<br>
            - #  ifdef HAVE___SECURE_GETENV<br>
            +@@ -547,7 +547,7 @@ struct btrfs_ioctl_quota_ctl_args {<br>
            + #  if HAVE___SECURE_GETENV<br>
              #    define secure_getenv __secure_getenv<br>
              #  else<br>
             -#    error "neither secure_getenv nor __secure_getenv are
            available"<br>
            @@ -26,5 +29,5 @@ index 4a3fd9c..4936873 100644<br>
              #endif<br>
            <br>
             --<br>
            -2.10.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-core-evaluate-<wbr>presets-after-generators-have-<wbr>run-6526.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-core-evaluate-<wbr>presets-after-generators-have-<wbr>run-6526.patch<br>
            deleted file mode 100644<br>
            index df100e5..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0001-core-evaluate-<wbr>presets-after-generators-have-<wbr>run-6526.patch<br>
            +++ /dev/null<br>
            @@ -1,69 +0,0 @@<br>
            -From 28dd66ecfce743b1ea9046c7bb501e<wbr>0fcaeff724 Mon Sep
            17 00:00:00 2001<br>
            -From: Luca Bruno &lt;<a moz-do-not-send="true"
              href="mailto:luca.bruno@coreos.com">luca.bruno@coreos.com</a>&gt;<br>
            -Date: Sun, 6 Aug 2017 13:24:24 +0000<br>
            -Subject: [PATCH] core: evaluate presets after generators
            have run (#6526)<br>
            -<br>
            -This commit moves the first-boot system preset-settings
            evaluation out<br>
            -of main and into the manager startup logic itself. Notably,
            it reverses<br>
            -the order between generators and presets evaluation, so
            that any changes<br>
            -performed by first-boot generators are taken into the
            account by presets<br>
            -logic.<br>
            -<br>
            -After this change, units created by a generator can be
            enabled as part<br>
            -of a preset.<br>
            -<br>
            -Upstream-Status: Backport<br>
            -<br>
            -Signed-off-by: Catalin Enache &lt;<a moz-do-not-send="true"
              href="mailto:catalin.enache@windriver.com">catalin.enache@windriver.com</a>&gt;<br>
            ----<br>
            - src/core/main.c    | 12 ++----------<br>
            - src/core/manager.c |  8 ++++++++<br>
            - 2 files changed, 10 insertions(+), 10 deletions(-)<br>
            -<br>
            -diff --git a/src/core/main.c b/src/core/main.c<br>
            -index dfedc3d..11ac9cf 100644<br>
            ---- a/src/core/main.c<br>
            -+++ b/src/core/main.c<br>
            -@@ -1809,18 +1809,10 @@ int main(int argc, char *argv[]) {<br>
            -                 if (prctl(PR_SET_CHILD_SUBREAPER, 1) &lt;
            0)<br>
            -                         log_warning_errno(errno, "Failed
            to make us a subreaper: %m");<br>
            -<br>
            --        if (arg_system) {<br>
            -+        if (arg_system)<br>
            -+                /* Bump up RLIMIT_NOFILE for systemd
            itself */<br>
            -                 (void) bump_rlimit_nofile(&amp;saved_<wbr>rlimit_nofile);<br>
            -<br>
            --                if (empty_etc) {<br>
            --                        r = unit_file_preset_all(UNIT_<wbr>FILE_SYSTEM,
            0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);<br>
            --                        if (r &lt; 0)<br>
            --                                log_full_errno(r ==
            -EEXIST ? LOG_NOTICE : LOG_WARNING, r, "Failed to populate
            /etc with preset unit settings, ignoring: %m");<br>
            --                        else<br>
            --                                log_info("Populated /etc
            with preset unit settings.");<br>
            --                }<br>
            --        }<br>
            --<br>
            -         r = manager_new(arg_system ? UNIT_FILE_SYSTEM :
            UNIT_FILE_USER, arg_action == ACTION_TEST, &amp;m);<br>
            -         if (r &lt; 0) {<br>
            -                 log_emergency_errno(r, "Failed to allocate
            manager object: %m");<br>
            -diff --git a/src/core/manager.c b/src/core/manager.c<br>
            -index 1aadb70..fb5e2b5 100644<br>
            ---- a/src/core/manager.c<br>
            -+++ b/src/core/manager.c<br>
            -@@ -1328,6 +1328,14 @@ int manager_startup(Manager *m, FILE
            *serialization, FDSet *fds) {<br>
            -         if (r &lt; 0)<br>
            -                 return r;<br>
            -<br>
            -+        if (m-&gt;first_boot &amp;&amp;
            m-&gt;unit_file_scope == UNIT_FILE_SYSTEM) {<br>
            -+                q = unit_file_preset_all(UNIT_<wbr>FILE_SYSTEM,
            0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);<br>
            -+                if (q &lt; 0)<br>
            -+                        log_full_errno(q == -EEXIST ?
            LOG_NOTICE : LOG_WARNING, q, "Failed to populate /etc with
            preset unit settings, ignoring: %m");<br>
            -+                else<br>
            -+                        log_info("Populated /etc with
            preset unit settings.");<br>
            -+        }<br>
            -+<br>
            -         lookup_paths_reduce(&amp;m-&gt;<wbr>lookup_paths);<br>
            -         manager_build_unit_path_cache(<wbr>m);<br>
            -<br>
            ---<br>
            -2.10.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-main-skip-many-<wbr>initialization-steps-when-<wbr>running-in-.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-main-skip-many-<wbr>initialization-steps-when-<wbr>running-in-.patch<br>
            deleted file mode 100644<br>
            index a033b04..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0001-main-skip-many-<wbr>initialization-steps-when-<wbr>running-in-.patch<br>
            +++ /dev/null<br>
            @@ -1,163 +0,0 @@<br>
            -From dea374e898a749a0474b72b2015cca<wbr>9009b1432b Mon Sep
            17 00:00:00 2001<br>
            -From: Lennart Poettering &lt;<a moz-do-not-send="true"
              href="mailto:lennart@poettering.net">lennart@poettering.net</a>&gt;<br>
            -Date: Wed, 13 Sep 2017 10:31:40 +0200<br>
            -Subject: [PATCH] main: skip many initialization steps when
            running in --test<br>
            - mode<br>
            -<br>
            -Most importantly, don't collect open socket activation fds
            when in<br>
            ---test mode. This specifically created a problem because we
            invoke<br>
            -pager_open() beforehand (which these days makes copies of
            the original<br>
            -stdout/stderr in order to be able to restore them when the
            pager goes<br>
            -away) and we might mistakenly the fd copies it creates as
            socket<br>
            -activation fds.<br>
            -<br>
            -Fixes: #6383<br>
            -<br>
            -Upstream-Status: Backport<br>
            -<br>
            -Signed-off-by: Catalin Enache &lt;<a moz-do-not-send="true"
              href="mailto:catalin.enache@windriver.com">catalin.enache@windriver.com</a>&gt;<br>
            ----<br>
            - src/core/main.c | 108 +++++++++++++++++++++++++++++-<wbr>--------------------------<br>
            - 1 file changed, 56 insertions(+), 52 deletions(-)<br>
            -<br>
            -diff --git a/src/core/main.c b/src/core/main.c<br>
            -index 11ac9cf..d1a53a5 100644<br>
            ---- a/src/core/main.c<br>
            -+++ b/src/core/main.c<br>
            -@@ -1679,20 +1679,22 @@ int main(int argc, char *argv[]) {<br>
            -         log_close();<br>
            -<br>
            -         /* Remember open file descriptors for later
            deserialization */<br>
            --        r = fdset_new_fill(&amp;fds);<br>
            --        if (r &lt; 0) {<br>
            --                log_emergency_errno(r, "Failed to allocate
            fd set: %m");<br>
            --                error_message = "Failed to allocate fd
            set";<br>
            --                goto finish;<br>
            --        } else<br>
            --                fdset_cloexec(fds, true);<br>
            -+        if (arg_action == ACTION_RUN) {<br>
            -+                r = fdset_new_fill(&amp;fds);<br>
            -+                if (r &lt; 0) {<br>
            -+                        log_emergency_errno(r, "Failed to
            allocate fd set: %m");<br>
            -+                        error_message = "Failed to
            allocate fd set";<br>
            -+                        goto finish;<br>
            -+                } else<br>
            -+                        fdset_cloexec(fds, true);<br>
            -<br>
            --        if (arg_serialization)<br>
            --                assert_se(fdset_remove(fds,
            fileno(arg_serialization)) &gt;= 0);<br>
            -+                if (arg_serialization)<br>
            -+                        assert_se(fdset_remove(fds,
            fileno(arg_serialization)) &gt;= 0);<br>
            -<br>
            --        if (arg_system)<br>
            --                /* Become a session leader if we aren't
            one yet. */<br>
            --                setsid();<br>
            -+                if (arg_system)<br>
            -+                        /* Become a session leader if we
            aren't one yet. */<br>
            -+                        setsid();<br>
            -+        }<br>
            -<br>
            -         /* Move out of the way, so that we won't block
            unmounts */<br>
            -         assert_se(chdir("/") == 0);<br>
            -@@ -1762,56 +1764,58 @@ int main(int argc, char *argv[]) {<br>
            -                           arg_action == ACTION_TEST ? "
            test" : "", getuid(), t);<br>
            -         }<br>
            -<br>
            --        if (arg_system &amp;&amp; !skip_setup) {<br>
            --                if (arg_show_status &gt; 0)<br>
            --                        status_welcome();<br>
            -+        if (arg_action == ACTION_RUN) {<br>
            -+                if (arg_system &amp;&amp; !skip_setup) {<br>
            -+                        if (arg_show_status &gt; 0)<br>
            -+                                status_welcome();<br>
            -<br>
            --                hostname_setup();<br>
            --                machine_id_setup(NULL, arg_machine_id,
            NULL);<br>
            --                loopback_setup();<br>
            --                bump_unix_max_dgram_qlen();<br>
            -+                        hostname_setup();<br>
            -+                        machine_id_setup(NULL,
            arg_machine_id, NULL);<br>
            -+                        loopback_setup();<br>
            -+                        bump_unix_max_dgram_qlen();<br>
            -<br>
            --                test_usr();<br>
            --        }<br>
            -+                        test_usr();<br>
            -+                }<br>
            -<br>
            --        if (arg_system &amp;&amp; arg_runtime_watchdog
            &gt; 0 &amp;&amp; arg_runtime_watchdog != USEC_INFINITY)<br>
            --                watchdog_set_timeout(&amp;arg_<wbr>runtime_watchdog);<br>
            -+                if (arg_system &amp;&amp;
            arg_runtime_watchdog &gt; 0 &amp;&amp; arg_runtime_watchdog
            != USEC_INFINITY)<br>
            -+                        watchdog_set_timeout(&amp;arg_<wbr>runtime_watchdog);<br>
            -<br>
            --        if (arg_timer_slack_nsec != NSEC_INFINITY)<br>
            --                if (prctl(PR_SET_TIMERSLACK,
            arg_timer_slack_nsec) &lt; 0)<br>
            --                        log_error_errno(errno, "Failed to
            adjust timer slack: %m");<br>
            -+                if (arg_timer_slack_nsec != NSEC_INFINITY)<br>
            -+                        if (prctl(PR_SET_TIMERSLACK,
            arg_timer_slack_nsec) &lt; 0)<br>
            -+                                log_error_errno(errno,
            "Failed to adjust timer slack: %m");<br>
            -<br>
            --        if (arg_system &amp;&amp;
            !cap_test_all(arg_capability_<wbr>bounding_set)) {<br>
            --                r = capability_bounding_set_drop_<wbr>usermode(arg_capability_<wbr>bounding_set);<br>
            --                if (r &lt; 0) {<br>
            --                        log_emergency_errno(r, "Failed to
            drop capability bounding set of usermode helpers: %m");<br>
            --                        error_message = "Failed to drop
            capability bounding set of usermode helpers";<br>
            --                        goto finish;<br>
            --                }<br>
            --                r = capability_bounding_set_drop(<wbr>arg_capability_bounding_set,
            true);<br>
            --                if (r &lt; 0) {<br>
            --                        log_emergency_errno(r, "Failed to
            drop capability bounding set: %m");<br>
            --                        error_message = "Failed to drop
            capability bounding set";<br>
            --                        goto finish;<br>
            -+                if (arg_system &amp;&amp;
            !cap_test_all(arg_capability_<wbr>bounding_set)) {<br>
            -+                        r = capability_bounding_set_drop_<wbr>usermode(arg_capability_<wbr>bounding_set);<br>
            -+                        if (r &lt; 0) {<br>
            -+                                log_emergency_errno(r,
            "Failed to drop capability bounding set of usermode helpers:
            %m");<br>
            -+                                error_message = "Failed to
            drop capability bounding set of usermode helpers";<br>
            -+                                goto finish;<br>
            -+                        }<br>
            -+                        r = capability_bounding_set_drop(<wbr>arg_capability_bounding_set,
            true);<br>
            -+                        if (r &lt; 0) {<br>
            -+                                log_emergency_errno(r,
            "Failed to drop capability bounding set: %m");<br>
            -+                                error_message = "Failed to
            drop capability bounding set";<br>
            -+                                goto finish;<br>
            -+                        }<br>
            -                 }<br>
            --        }<br>
            -<br>
            --        if (arg_syscall_archs) {<br>
            --                r = enforce_syscall_archs(arg_<wbr>syscall_archs);<br>
            --                if (r &lt; 0) {<br>
            --                        error_message = "Failed to set
            syscall architectures";<br>
            --                        goto finish;<br>
            -+                if (arg_syscall_archs) {<br>
            -+                        r = enforce_syscall_archs(arg_<wbr>syscall_archs);<br>
            -+                        if (r &lt; 0) {<br>
            -+                                error_message = "Failed to
            set syscall architectures";<br>
            -+                                goto finish;<br>
            -+                        }<br>
            -                 }<br>
            --        }<br>
            -<br>
            --        if (!arg_system)<br>
            --                /* Become reaper of our children */<br>
            --                if (prctl(PR_SET_CHILD_SUBREAPER, 1) &lt;
            0)<br>
            --                        log_warning_errno(errno, "Failed
            to make us a subreaper: %m");<br>
            -+                if (!arg_system)<br>
            -+                        /* Become reaper of our children
            */<br>
            -+                        if (prctl(PR_SET_CHILD_SUBREAPER,
            1) &lt; 0)<br>
            -+                                log_warning_errno(errno,
            "Failed to make us a subreaper: %m");<br>
            -<br>
            --        if (arg_system)<br>
            --                /* Bump up RLIMIT_NOFILE for systemd
            itself */<br>
            --                (void) bump_rlimit_nofile(&amp;saved_<wbr>rlimit_nofile);<br>
            -+                if (arg_system)<br>
            -+                        /* Bump up RLIMIT_NOFILE for
            systemd itself */<br>
            -+                        (void)
            bump_rlimit_nofile(&amp;saved_<wbr>rlimit_nofile);<br>
            -+        }<br>
            -<br>
            -         r = manager_new(arg_system ? UNIT_FILE_SYSTEM :
            UNIT_FILE_USER, arg_action == ACTION_TEST, &amp;m);<br>
            -         if (r &lt; 0) {<br>
            ---<br>
            -2.10.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-meson-update-<wbr>header-file-to-detect-memfd_<wbr>create.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-meson-update-<wbr>header-file-to-detect-memfd_<wbr>create.patch<br>
            deleted file mode 100644<br>
            index c643120..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0001-meson-update-<wbr>header-file-to-detect-memfd_<wbr>create.patch<br>
            +++ /dev/null<br>
            @@ -1,28 +0,0 @@<br>
            -From 2207e1ffe4f7e2dcc5e745dadb4873<wbr>8aa1048d63 Mon Sep
            17 00:00:00 2001<br>
            -From: Yu Watanabe &lt;<a moz-do-not-send="true"
              href="mailto:watanabe.yu%2Bgithub@gmail.com">watanabe.yu+github@gmail.com</a>&gt;<br>
            -Date: Sun, 26 Nov 2017 02:17:06 +0900<br>
            -Subject: [PATCH 1/3] meson: update header file to detect
            memfd_create()<br>
            -<br>
            ----<br>
            -Upstream-Status: Backport<br>
            -<br>
            - meson.build | 3 ++-<br>
            - 1 file changed, 2 insertions(+), 1 deletion(-)<br>
            -<br>
            -diff --git a/meson.build b/meson.build<br>
            -index 20b27c860..550dd4ad8 100644<br>
            ---- a/meson.build<br>
            -+++ b/meson.build<br>
            -@@ -414,7 +414,8 @@ foreach ident : ['secure_getenv',
            '__secure_getenv']<br>
            - endforeach<br>
            -<br>
            - foreach ident : [<br>
            --        ['memfd_create',      '''#include
            &lt;sys/memfd.h&gt;'''],<br>
            -+        ['memfd_create',      '''#define _GNU_SOURCE<br>
            -+                                 #include
            &lt;sys/mman.h&gt;'''],<br>
            -         ['gettid',            '''#include
            &lt;sys/types.h&gt;'''],<br>
            -         ['pivot_root',        '''#include
            &lt;stdlib.h&gt;'''],     # no known header declares
            pivot_root<br>
            -         ['name_to_handle_at', '''#define _GNU_SOURCE<br>
            ---<br>
            -2.16.1<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0002-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0002-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
            new file mode 100644<br>
            index 0000000..dd63a16<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0002-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
            @@ -0,0 +1,81 @@<br>
            +From ca6eced0161fb7282e926cf3afc9bd<wbr>9c772235ef Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Fri, 23 Feb 2018 10:23:40 +0800<br>
            +Subject: [PATCH 02/32] binfmt: Don't install dependency
            links at install time<br>
            + for the binfmt services<br>
            +<br>
            +use [Install] blocks so that they get created when the
            service is enabled<br>
            +like a traditional service.<br>
            +<br>
            +The [Install] blocks were rejected upstream as they don't
            have a way to<br>
            +"enable" it on install without static symlinks which can't
            be disabled,<br>
            +only masked. We however can do that in a postinst.<br>
            +<br>
            +Upstream-Status: Denied<br>
            +<br>
            +Signed-off-by: Ross Burton &lt;<a moz-do-not-send="true"
              href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + units/meson.build                       | 6 ++----<br>
            + units/proc-sys-fs-binfmt_misc.<wbr>automount | 3 +++<br>
            + units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.service.<wbr>in</a>       
             | 4 ++++<br>
            + 3 files changed, 9 insertions(+), 4 deletions(-)<br>
            +<br>
            +diff --git a/units/meson.build b/units/meson.build<br>
            +index 814ee7885..49ace0d0f 100644<br>
            +--- a/units/meson.build<br>
            ++++ b/units/meson.build<br>
            +@@ -60,8 +60,7 @@ units = [<br>
            +         ['poweroff.target',                     '',<br>
            +          'runlevel0.target'],<br>
            +         ['printer.target',                      ''],<br>
            +-        ['proc-sys-fs-binfmt_misc.<wbr>automount', 
             'ENABLE_BINFMT',<br>
            +-         'sysinit.target.wants/'],<br>
            ++        ['proc-sys-fs-binfmt_misc.<wbr>automount', 
             'ENABLE_BINFMT'],<br>
            +         ['proc-sys-fs-binfmt_misc.<wbr>mount',     
             'ENABLE_BINFMT'],<br>
            +         ['reboot.target',                       '',<br>
            +          'runlevel6.target ctrl-alt-del.target'],<br>
            +@@ -144,8 +143,7 @@ in_units = [<br>
            +         ['systemd-ask-password-<wbr>console.service', ''],<br>
            +         ['systemd-ask-password-wall.<wbr>service',    ''],<br>
            +         ['<a class="moz-txt-link-abbreviated" href="mailto:systemd-backlight@.service">systemd-backlight@.service</a>',         
             'ENABLE_BACKLIGHT'],<br>
            +-        ['systemd-binfmt.service',             
             'ENABLE_BINFMT',<br>
            +-         'sysinit.target.wants/'],<br>
            ++        ['systemd-binfmt.service',             
             'ENABLE_BINFMT'],<br>
            +         ['<a class="moz-txt-link-abbreviated" href="mailto:systemd-coredump@.service">systemd-coredump@.service</a>',           
            'ENABLE_COREDUMP'],<br>
            +         ['systemd-exit.service',                 ''],<br>
            +         ['systemd-firstboot.service',           
            'ENABLE_FIRSTBOOT',<br>
            +diff --git a/units/proc-sys-fs-binfmt_<wbr>misc.automount
            b/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            +index 30a6bc991..4231f3b70 100644<br>
            +--- a/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            ++++ b/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            +@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/<wbr>proc/sys/<br>
            +<br>
            + [Automount]<br>
            + Where=/proc/sys/fs/binfmt_misc<br>
            ++<br>
            ++[Install]<br>
            ++WantedBy=sysinit.target<br>
            +diff --git a/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a>
            b/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            +index df9396d89..0687f4648 100644<br>
            +--- a/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            ++++ b/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            +@@ -13,6 +13,7 @@ Documentation=<a class="moz-txt-link-freetext" href="man:systemd">man:systemd</a>-<wbr>binfmt.service(8)
            <a class="moz-txt-link-freetext" href="man:binfmt.d(5)">man:binfmt.d(5)</a><br>
            + Documentation=<a moz-do-not-send="true"
              href="https://www.kernel.org/doc/Documentation/binfmt_misc.txt"
              rel="noreferrer" target="_blank">https://www.<wbr>kernel.org/doc/Documentation/<wbr>binfmt_misc.txt</a><br>
            + DefaultDependencies=no<br>
            + Conflicts=shutdown.target<br>
            ++Wants=proc-sys-fs-binfmt_<wbr>misc.automount<br>
            + After=proc-sys-fs-binfmt_misc.<wbr>automount<br>
            + Before=sysinit.target shutdown.target<br>
            + ConditionPathIsReadWrite=/<wbr>proc/sys/<br>
            +@@ -27,3 +28,6 @@ Type=oneshot<br>
            + RemainAfterExit=yes<br>
            + ExecStart=@rootlibexecdir@/<wbr>systemd-binfmt<br>
            + TimeoutSec=90s<br>
            ++<br>
            ++[Install]<br>
            ++WantedBy=sysinit.target<br>
            +--<br>
            +2.11.0<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0002-configure.ac-<wbr>Check-if-memfd_create-is-<wbr>already-define.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0002-configure.ac-<wbr>Check-if-memfd_create-is-<wbr>already-define.patch<br>
            deleted file mode 100644<br>
            index da798a7..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0002-configure.ac-<wbr>Check-if-memfd_create-is-<wbr>already-define.patch<br>
            +++ /dev/null<br>
            @@ -1,27 +0,0 @@<br>
            -From 025408c87869962f511de044dd41a1<wbr>f4b1d80165 Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Sat, 27 Jan 2018 11:53:38 -0800<br>
            -Subject: [PATCH 2/3] <a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a>: Check if memfd_create is
            already defined<br>
            -<br>
            -Upstream-Status: Inappropriate [upstream systemd uses
            meson]<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a> | 1 +<br>
            - 1 file changed, 1 insertion(+)<br>
            -<br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index 3674190fb..c7a184d72 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -340,6 +340,7 @@ AC_CHECK_DECLS([<br>
            -         [], [], [[<br>
            - #include &lt;sys/types.h&gt;<br>
            - #include &lt;unistd.h&gt;<br>
            -+#include &lt;sys/mman.h&gt;<br>
            - #include &lt;sys/mount.h&gt;<br>
            - #include &lt;fcntl.h&gt;<br>
            - #include &lt;sched.h&gt;<br>
            ---<br>
            -2.16.1<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0003-fileio-include-<wbr>sys-mman.h.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0003-fileio-include-<wbr>sys-mman.h.patch<br>
            deleted file mode 100644<br>
            index c466d0d..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0003-fileio-include-<wbr>sys-mman.h.patch<br>
            +++ /dev/null<br>
            @@ -1,26 +0,0 @@<br>
            -From 52e922343faaa87b9efb8aa9ea5783<wbr>99ccc9bec9 Mon Sep
            17 00:00:00 2001<br>
            -From: Yu Watanabe &lt;<a moz-do-not-send="true"
              href="mailto:watanabe.yu%2Bgithub@gmail.com">watanabe.yu+github@gmail.com</a>&gt;<br>
            -Date: Sun, 26 Nov 2017 02:40:23 +0900<br>
            -Subject: [PATCH 3/3] fileio: include sys/mman.h<br>
            -<br>
            ----<br>
            -Upstream-Status: Backport<br>
            -<br>
            - src/basic/fileio.c | 1 +<br>
            - 1 file changed, 1 insertion(+)<br>
            -<br>
            -diff --git a/src/basic/fileio.c b/src/basic/fileio.c<br>
            -index 9a185e3e6..1015afd29 100644<br>
            ---- a/src/basic/fileio.c<br>
            -+++ b/src/basic/fileio.c<br>
            -@@ -24,6 +24,7 @@<br>
            - #include &lt;stdint.h&gt;<br>
            - #include &lt;stdlib.h&gt;<br>
            - #include &lt;string.h&gt;<br>
            -+#include &lt;sys/mman.h&gt;<br>
            - #include &lt;sys/stat.h&gt;<br>
            - #include &lt;sys/types.h&gt;<br>
            - #include &lt;unistd.h&gt;<br>
            ---<br>
            -2.16.1<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0003-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0003-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
            new file mode 100644<br>
            index 0000000..0a27162<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0003-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
            @@ -0,0 +1,64 @@<br>
            +From 2bde78f2d94065ced26376ddc5b038<wbr>c941e2ef90 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Fri, 23 Feb 2018 10:40:39 +0800<br>
            +Subject: [PATCH 03/32] use lnr wrapper instead of looking
            for --relative<br>
            + option for ln<br>
            +<br>
            +Remove file manually to avoid the 'File Exists' error when
            creating<br>
            +symlink. This is because the original 'ln' command uses
            '-f' option.<br>
            +<br>
            +Upstream-Status: Inappropriate [OE-Specific]<br>
            +<br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + meson.build                 | 4 ----<br>
            + tools/meson-make-symlink.sh | 3 ++-<br>
            + units/meson-add-wants.sh    | 7 ++++++-<br>
            + 3 files changed, 8 insertions(+), 6 deletions(-)<br>
            +<br>
            +diff --git a/meson.build b/meson.build<br>
            +index ddc061c12..4b5ef376f 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -530,10 +530,6 @@ foreach prog : progs<br>
            +         substs.set(name, path)<br>
            + endforeach<br>
            +<br>
            +-if run_command('ln', '--relative', '--help').returncode()
            != 0<br>
            +-        error('ln does not support --relative')<br>
            +-endif<br>
            +-<br>
            + ##############################<wbr>##############################<br>
            +<br>
            + gperf = find_program('gperf')<br>
            +diff --git a/tools/meson-make-symlink.sh
            b/tools/meson-make-symlink.sh<br>
            +index 47a5e70ae..271edf9bc 100755<br>
            +--- a/tools/meson-make-symlink.sh<br>
            ++++ b/tools/meson-make-symlink.sh<br>
            +@@ -7,5 +7,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"<br>
            + if [ "$(dirname $1)" = . ]; then<br>
            +         ln -vfs -T "$1" "${DESTDIR:-}$2"<br>
            + else<br>
            +-        ln -vfs -T --relative "${DESTDIR:-}$1"
            "${DESTDIR:-}$2"<br>
            ++        rm -f "${DESTDIR:-}$2"<br>
            ++        lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"<br>
            + fi<br>
            +diff --git a/units/meson-add-wants.sh
            b/units/meson-add-wants.sh<br>
            +index dfd287e17..11d30c9b2 100755<br>
            +--- a/units/meson-add-wants.sh<br>
            ++++ b/units/meson-add-wants.sh<br>
            +@@ -24,4 +24,9 @@ case "$target" in<br>
            +                 ;;<br>
            + esac<br>
            +<br>
            +-ln -vfs --relative "$unitpath" "$dir"<br>
            ++if [ -d "$dir" ]; then<br>
            ++        rm -f "$dir/$unit"<br>
            ++        lnr "$unitpath" "$dir/$unit"<br>
            ++else<br>
            ++        lnr "$unitpath" "$dir"<br>
            ++fi<br>
            +--<br>
            +2.11.0<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<wbr>sysv-install-for-OE.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0004-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
            similarity index 89%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0004-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
            index 8828d6e..48d53fb 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0004-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From 52726be92e2b841f744a96c378cc87<wbr>2ae0033a2b Mon Sep
            17 00:00:00 2001<br>
            +From eebe61ed26692def6ecdfdc8fd656c<wbr>04d639a8a1 Mon Sep
            17 00:00:00 2001<br>
             From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
             Date: Sat, 5 Sep 2015 06:31:47 +0000<br>
            -Subject: [PATCH 10/19] implment systemd-sysv-install for OE<br>
            +Subject: [PATCH 04/32] implment systemd-sysv-install for OE<br>
            <br>
             Use update-rc.d for enabling/disabling and status command<br>
             to check the status of the sysv service<br>
            @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a
              moz-do-not-send="true" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
              1 file changed, 3 insertions(+), 3 deletions(-)<br>
            <br>
             diff --git a/src/systemctl/systemd-sysv-<wbr>install.SKELETON
            b/src/systemctl/systemd-sysv-<wbr>install.SKELETON<br>
            -index a53a3e6..5d877b0 100755<br>
            +index a53a3e622..5d877b06e 100755<br>
             --- a/src/systemctl/systemd-sysv-<wbr>install.SKELETON<br>
             +++ b/src/systemctl/systemd-sysv-<wbr>install.SKELETON<br>
             @@ -30,17 +30,17 @@ case "$1" in<br>
            @@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755<br>
                  *)<br>
                      usage ;;<br>
             --<br>
            -2.10.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
            deleted file mode 100644<br>
            index 7016e98..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>install-tim.patch<br>
            +++ /dev/null<br>
            @@ -1,74 +0,0 @@<br>
            -From 74450f0dbad2f8478c26eeaa46d4e4<wbr>a987858f45 Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Fri, 20 Feb 2015 05:03:44 +0000<br>
            -Subject: [PATCH 05/19] binfmt: Don't install dependency
            links at install time<br>
            - for the binfmt services<br>
            -<br>
            -use [Install] blocks so that they get created when the
            service is enabled<br>
            -like a traditional service.<br>
            -<br>
            -The [Install] blocks were rejected upstream as they don't
            have a way to<br>
            -"enable"<br>
            -it on install without static symlinks which can't be
            disabled, only<br>
            -masked.  We<br>
            -however can do that in a postinst.<br>
            -<br>
            -Upstream-Status: Denied<br>
            -<br>
            -Signed-off-by: Ross Burton &lt;<a moz-do-not-send="true"
              href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            - Makefile.am                             | 4 ----<br>
            - units/proc-sys-fs-binfmt_misc.<wbr>automount | 3 +++<br>
            - units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.service.<wbr>in</a>       
             | 5 +++++<br>
            - 3 files changed, 8 insertions(+), 4 deletions(-)<br>
            -<br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index 50da458..29ed1dd 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -4635,10 +4635,6 @@ INSTALL_DIRS += \<br>
            -       $(prefix)/lib/binfmt.d \<br>
            -       $(sysconfdir)/binfmt.d<br>
            -<br>
            --SYSINIT_TARGET_WANTS += \<br>
            --      systemd-binfmt.service \<br>
            --      proc-sys-fs-binfmt_misc.<wbr>automount<br>
            --<br>
            - endif<br>
            -<br>
            - EXTRA_DIST += \<br>
            -diff --git a/units/proc-sys-fs-binfmt_<wbr>misc.automount
            b/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            -index 6be3893..709adef 100644<br>
            ---- a/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            -+++ b/units/proc-sys-fs-binfmt_<wbr>misc.automount<br>
            -@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/<wbr>proc/sys/<br>
            -<br>
            - [Automount]<br>
            - Where=/proc/sys/fs/binfmt_misc<br>
            -+<br>
            -+[Install]<br>
            -+WantedBy=sysinit.target<br>
            -diff --git a/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a>
            b/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            -index d53073e..8c57ee0 100644<br>
            ---- a/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            -+++ b/units/<a moz-do-not-send="true"
              href="http://systemd-binfmt.service.in" rel="noreferrer"
              target="_blank">systemd-binfmt.<wbr>service.in</a><br>
            -@@ -11,6 +11,8 @@ Documentation=<a class="moz-txt-link-freetext" href="man:systemd">man:systemd</a>-<wbr>binfmt.service(8)
            <a class="moz-txt-link-freetext" href="man:binfmt.d(5)">man:binfmt.d(5)</a><br>
            - Documentation=<a moz-do-not-send="true"
              href="https://www.kernel.org/doc/Documentation/binfmt_misc.txt"
              rel="noreferrer" target="_blank">https://www.<wbr>kernel.org/doc/Documentation/<wbr>binfmt_misc.txt</a><br>
            - DefaultDependencies=no<br>
            - Conflicts=shutdown.target<br>
            -+Wants=proc-sys-fs-binfmt_<wbr>misc.automount<br>
            -+<br>
            - After=proc-sys-fs-binfmt_misc.<wbr>automount<br>
            - Before=sysinit.target shutdown.target<br>
            - ConditionPathIsReadWrite=/<wbr>proc/sys/<br>
            -@@ -25,3 +27,6 @@ Type=oneshot<br>
            - RemainAfterExit=yes<br>
            - ExecStart=@rootlibexecdir@/<wbr>systemd-binfmt<br>
            - TimeoutSec=90s<br>
            -+<br>
            -+[Install]<br>
            -+WantedBy=sysinit.target<br>
            ---<br>
            -2.10.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<wbr>hd-devices.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0005-rules-whitelist-<wbr>hd-devices.patch<br>
            similarity index 89%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<wbr>hd-devices.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0005-rules-whitelist-<wbr>hd-devices.patch<br>
            index eb380ce..5b8510b 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<wbr>hd-devices.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0005-rules-whitelist-<wbr>hd-devices.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From ab5a27040133f7cdf062ac8cfeb94e<wbr>081d3567b3 Mon Sep
            17 00:00:00 2001<br>
            +From 792582d2b3cf1af4d22288d853a737<wbr>ec4478357b Mon Sep
            17 00:00:00 2001<br>
             From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
             Date: Wed, 9 Nov 2016 19:41:13 -0800<br>
            -Subject: [PATCH 07/14] rules: whitelist hd* devices<br>
            +Subject: [PATCH 05/32] rules: whitelist hd* devices<br>
            <br>
             qemu by default emulates IDE and the linux-yocto kernel(s)
            use<br>
             CONFIG_IDE instead of the more modern libsata, so disks
            appear as<br>
            @@ -11,13 +11,12 @@ Upstream-Status: Denied [<a
              moz-do-not-send="true"
              href="https://github.com/systemd/systemd/pull/1276"
              rel="noreferrer" target="_blank">https://github.com/systemd/<wbr>systemd/pull/1276</a>]<br>
            <br>
             Signed-off-by: Patrick Ohly &lt;<a moz-do-not-send="true"
              href="mailto:patrick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
             Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -<br>
             ---<br>
              rules/60-persistent-storage.<wbr>rules | 2 +-<br>
              1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
             diff --git a/rules/60-persistent-storage.<wbr>rules
            b/rules/60-persistent-storage.<wbr>rules<br>
            -index d2745f65f..63f472be8 100644<br>
            +index 0de8cf3a1..d3f58f153 100644<br>
             --- a/rules/60-persistent-storage.<wbr>rules<br>
             +++ b/rules/60-persistent-storage.<wbr>rules<br>
             @@ -7,7 +7,7 @@ ACTION=="remove",
            GOTO="persistent_storage_end"<br>
            @@ -30,5 +29,5 @@ index d2745f65f..63f472be8 100644<br>
              # ignore partitions that span the entire disk<br>
              TEST=="whole_disk", GOTO="persistent_storage_end"<br>
             --<br>
            -2.13.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0006-Make-root-s-home-<wbr>directory-configurable.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0006-Make-root-s-home-<wbr>directory-configurable.patch<br>
            new file mode 100644<br>
            index 0000000..9dc994b<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0006-Make-root-s-home-<wbr>directory-configurable.patch<br>
            @@ -0,0 +1,78 @@<br>
            +From c702a0579a73e9e4589d009493f3d7<wbr>231a9b3986 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Fri, 23 Feb 2018 13:47:37 +0800<br>
            +Subject: [PATCH 06/32] Make root's home directory
            configurable<br>
            +<br>
            +OpenEmbedded has a configurable home directory for root.
            Allow<br>
            +systemd to be built using its idea of what root's home
            directory<br>
            +should be.<br>
            +<br>
            +Upstream-Status: Denied<br>
            +Upstream wants to have a unified hierarchy where everyone
            is<br>
            +using the same root folder.<br>
            +<a moz-do-not-send="true"
              href="https://github.com/systemd/systemd/issues/541"
              rel="noreferrer" target="_blank">https://github.com/systemd/<wbr>systemd/issues/541</a><br>
            +<br>
            +Signed-off-by: Dan McGregor &lt;<a moz-do-not-send="true"
              href="mailto:dan.mcgregor@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + meson.build       | 8 ++++++++<br>
            + meson_options.txt | 2 ++<br>
            + 2 files changed, 10 insertions(+)<br>
            +<br>
            +diff --git a/meson.build b/meson.build<br>
            +index 4b5ef376f..7df4f7a33 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -94,6 +94,11 @@ if rootlibdir == ''<br>
            +         rootlibdir = join_paths(rootprefixdir,
            libdir.split('/')[-1])<br>
            + endif<br>
            +<br>
            ++roothomedir = get_option('roothomedir')<br>
            ++if roothomedir == ''<br>
            ++        roothomedir = '/root'<br>
            ++endif<br>
            ++<br>
            + # Dirs of external packages<br>
            + pkgconfigdatadir = join_paths(datadir, 'pkgconfig')<br>
            + pkgconfiglibdir = join_paths(libdir, 'pkgconfig')<br>
            +@@ -205,6 +210,7 @@ conf.set_quoted('<wbr>UDEVLIBEXECDIR', 
                                       udevlibexecdir)<br>
            + conf.set_quoted('POLKIT_AGENT_<wbr>BINARY_PATH',         
                     join_paths(bindir, 'pkttyagent'))<br>
            + conf.set_quoted('LIBDIR',                                 
               libdir)<br>
            + conf.set_quoted('ROOTLIBDIR',                             
               rootlibdir)<br>
            ++conf.set_quoted('<wbr>ROOTHOMEDIR',                       
                    roothomedir)<br>
            + conf.set_quoted('<wbr>ROOTLIBEXECDIR',                   
                     rootlibexecdir)<br>
            + conf.set_quoted('BOOTLIBDIR',                             
               bootlibdir)<br>
            + conf.set_quoted('SYSTEMD_PULL_<wbr>PATH',                 
                    join_paths(rootlibexecdir, 'systemd-pull'))<br>
            +@@ -221,6 +227,7 @@ substs.set('prefix',                   
                                  prefixdir)<br>
            + substs.set('exec_prefix',                                 
               prefixdir)<br>
            + substs.set('libdir',                                     
                libdir)<br>
            + substs.set('rootlibdir',                                 
                rootlibdir)<br>
            ++substs.set('roothomedir',                                 
               roothomedir)<br>
            + substs.set('includedir',                                 
                includedir)<br>
            + substs.set('pkgsysconfdir',                               
               pkgsysconfdir)<br>
            + substs.set('bindir',                                     
                bindir)<br>
            +@@ -2559,6 +2566,7 @@ status = [<br>
            +         'include directory:               
             @0@'.format(includedir),<br>
            +         'lib directory:                   
             @0@'.format(libdir),<br>
            +         'rootlib directory:               
             @0@'.format(rootlibdir),<br>
            ++        'roothome directory:               
            @0@'.format(roothomedir),<br>
            +         'SysV init scripts:               
             @0@'.format(sysvinit_path),<br>
            +         'SysV rc?.d directories:           
            @0@'.format(sysvrcnd_path),<br>
            +         'PAM modules directory:           
             @0@'.format(pamlibdir),<br>
            +diff --git a/meson_options.txt b/meson_options.txt<br>
            +index f0c0506ff..7bd8845ce 100644<br>
            +--- a/meson_options.txt<br>
            ++++ b/meson_options.txt<br>
            +@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',<br>
            +        description : '''[/usr]/lib/x86_64-linux-gnu or
            such''')<br>
            + option('rootprefix', type : 'string',<br>
            +        description : '''override the root prefix''')<br>
            ++option('roothomedir', type : 'string',<br>
            ++       description : '''override the root home
            directory''')<br>
            + option('link-udev-shared', type : 'boolean',<br>
            +        description : 'link systemd-udev and its helpers to
            libsystemd-shared.so')<br>
            +<br>
            +--<br>
            +2.11.0<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0014-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch
            b/meta/recipes-core/systemd/<wbr>systemd/0007-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
            similarity index 81%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0014-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0007-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
            index ed7c68f..a47101d 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0014-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0007-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
            @@ -1,7 +1,7 @@<br>
            -From 0f47cfcb16e8e40a90a9221f9995f8<wbr>cd8a915c22 Mon Sep
            17 00:00:00 2001<br>
            +From b5a7ee09a4a3eea4d6ba3e4f96e27a<wbr>1ec6658525 Mon Sep
            17 00:00:00 2001<br>
             From: Jonathan Liu &lt;<a moz-do-not-send="true"
              href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
             Date: Thu, 19 Mar 2015 15:01:29 +1100<br>
            -Subject: [PATCH 14/19] Revert "rules: remove firmware
            loading rules"<br>
            +Subject: [PATCH 07/32] Revert "rules: remove firmware
            loading rules"<br>
            <br>
             This reverts commit 70e7d754ddb356fb1a2942b262f8ce<wbr>e9650e2a19.<br>
             Userspace firmware loading support is needed for Linux &lt;
            3.7.<br>
            @@ -16,7 +16,7 @@ Signed-off-by: Jonathan Liu &lt;<a
              moz-do-not-send="true" href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
            <br>
             diff --git a/rules/50-firmware.rules
            b/rules/50-firmware.rules<br>
             new file mode 100644<br>
            -index 0000000..f0ae684<br>
            +index 000000000..f0ae68451<br>
             --- /dev/null<br>
             +++ b/rules/50-firmware.rules<br>
             @@ -0,0 +1,3 @@<br>
            @@ -24,5 +24,5 @@ index 0000000..f0ae684<br>
             +<br>
             +SUBSYSTEM=="firmware", ACTION=="add",
            RUN{builtin}="firmware"<br>
             --<br>
            -2.10.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0007-check-for-<wbr>missing-canonicalize_file_<wbr>name.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0007-check-for-<wbr>missing-canonicalize_file_<wbr>name.patch<br>
            deleted file mode 100644<br>
            index 5234c59..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0007-check-for-<wbr>missing-canonicalize_file_<wbr>name.patch<br>
            +++ /dev/null<br>
            @@ -1,63 +0,0 @@<br>
            -From 05dffe67919ffc72be5c017bc6cf82<wbr>f164b2e8f9 Mon Sep
            17 00:00:00 2001<br>
            -From: Emil Renner Berthing &lt;<a moz-do-not-send="true"
              href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
            -Date: Mon, 23 Oct 2017 11:42:03 -0700<br>
            -Subject: [PATCH 07/12] check for missing
            canonicalize_file_name<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            -Upstream-Status: Pending<br>
            -<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a>         
                  | 2 ++<br>
            - src/basic/missing.h         | 1 +<br>
            - src/basic/missing_syscall.h | 6 ++++++<br>
            - 3 files changed, 9 insertions(+)<br>
            -<br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index cd035a971..3674190fb 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -333,6 +333,7 @@ AC_CHECK_DECLS([<br>
            -         renameat2,<br>
            -         kcmp,<br>
            -         keyctl,<br>
            -+        canonicalize_file_name,<br>
            -         LO_FLAGS_PARTSCAN,<br>
            -         copy_file_range,<br>
            -         explicit_bzero],<br>
            -@@ -343,6 +344,7 @@ AC_CHECK_DECLS([<br>
            - #include &lt;fcntl.h&gt;<br>
            - #include &lt;sched.h&gt;<br>
            - #include &lt;string.h&gt;<br>
            -+#include &lt;stdlib.h&gt;<br>
            - #include &lt;linux/loop.h&gt;<br>
            - ]])<br>
            -<br>
            -diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
            -index 671f341c6..8ae4964e1 100644<br>
            ---- a/src/basic/missing.h<br>
            -+++ b/src/basic/missing.h<br>
            -@@ -1246,3 +1246,4 @@ struct ethtool_link_settings {<br>
            - #endif<br>
            -<br>
            - #include "missing_syscall.h"<br>
            -+<br>
            -diff --git a/src/basic/missing_syscall.h
            b/src/basic/missing_syscall.h<br>
            -index 898116c7b..4d44ee4fa 100644<br>
            ---- a/src/basic/missing_syscall.h<br>
            -+++ b/src/basic/missing_syscall.h<br>
            -@@ -28,6 +28,12 @@ static inline int pivot_root(const char
            *new_root, const char *put_old) {<br>
            - }<br>
            - #endif<br>
            -<br>
            -+#if !HAVE_DECL_CANONICALIZE_FILE_<wbr>NAME<br>
            -+static inline char *canonicalize_file_name(const char
            *path) {<br>
            -+        return realpath(path, NULL);<br>
            -+}<br>
            -+#endif<br>
            -+<br>
            - /* ==============================<wbr>==============================<wbr>===========
            */<br>
            -<br>
            - #if !HAVE_DECL_MEMFD_CREATE<br>
            ---<br>
            -2.14.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
            deleted file mode 100644<br>
            index bc92db7..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>relative-opti.patch<br>
            +++ /dev/null<br>
            @@ -1,40 +0,0 @@<br>
            -From a3482c91642cf568b3ac27fa6c0cb3<wbr>c6b30669b7 Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Nov 2016 19:32:14 -0800<br>
            -Subject: [PATCH 07/19] use lnr wrapper instead of looking
            for --relative<br>
            - option for ln<br>
            -<br>
            -Upstream-Status: Inappropriate [OE-Specific]<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            - Makefile.am  | 2 +-<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a> | 2 --<br>
            - 2 files changed, 1 insertion(+), 3 deletions(-)<br>
            -<br>
            -Index: git/Makefile.am<br>
            -=============================<wbr>==============================<wbr>========<br>
            ---- git.orig/Makefile.am<br>
            -+++ git/Makefile.am<br>
            -@@ -320,7 +320,7 @@ define install-relative-aliases<br>
            -       while [ -n "$$1" ]; do \<br>
            -               $(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2`
            &amp;&amp; \<br>
            -               rm -f $(DESTDIR)$$dir/$$2 &amp;&amp; \<br>
            --              $(LN_S) --relative $(DESTDIR)$$1
            $(DESTDIR)$$dir/$$2 &amp;&amp; \<br>
            -+              lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2
            &amp;&amp; \<br>
            -               shift 2 || exit $$?; \<br>
            -       done<br>
            - endef<br>
            -Index: git/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a><br>
            -=============================<wbr>==============================<wbr>========<br>
            ---- git.orig/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a><br>
            -+++ git/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a><br>
            -@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin],
            [/usr<br>
            - AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount],
            [$PATH:/usr/sbin:/sbin])<br>
            - AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount],
            [$PATH:/usr/sbin:/sbin])<br>
            -<br>
            --AS_IF([! ln --relative --help &gt; /dev/null 2&gt;&amp;1],
            [AC_MSG_ERROR([*** ln doesn't support --relative ***])])<br>
            --<br>
            - M4_DEFINES=<br>
            -<br>
            - AC_CHECK_TOOL(OBJCOPY, objcopy)<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0008-Do-not-enable-<wbr>nss-tests.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0008-Do-not-enable-<wbr>nss-tests.patch<br>
            deleted file mode 100644<br>
            index 67a4f8e..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0008-Do-not-enable-<wbr>nss-tests.patch<br>
            +++ /dev/null<br>
            @@ -1,35 +0,0 @@<br>
            -From 48e7c0f5b2f5d777a16ac5584dc4f5<wbr>0f1dfa832c Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Mon, 23 Oct 2017 12:27:53 -0700<br>
            -Subject: [PATCH 08/12] Do not enable nss tests<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            -Upstream-Status: Pending<br>
            -<br>
            - Makefile.am | 2 +-<br>
            - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            -<br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index 3cc8f3451..df20a9a11 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -5290,6 +5290,7 @@ EXTRA_DIST += \<br>
            -       src/timesync/<a moz-do-not-send="true"
              href="http://timesyncd.conf.in" rel="noreferrer"
              target="_blank">timesyncd.conf.in</a><br>
            -<br>
            - # ------------------------------<wbr>------------------------------<wbr>------------------<br>
            -+if ENABLE_NSS_SYSTEMD<br>
            - test_nss_SOURCES = \<br>
            -       src/test/test-nss.c<br>
            -<br>
            -@@ -5302,7 +5303,6 @@ manual_tests += \<br>
            -       test-nss<br>
            -<br>
            - # ------------------------------<wbr>------------------------------<wbr>------------------<br>
            --if ENABLE_NSS_SYSTEMD<br>
            - libnss_systemd_la_SOURCES = \<br>
            -       src/nss-systemd/nss-systemd.<wbr>sym \<br>
            -       src/nss-systemd/nss-systemd.c<br>
            ---<br>
            -2.14.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0015-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0008-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch<br>
            similarity index 65%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0015-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0008-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch<br>
            index 95871bb..fdbf341 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0015-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0008-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loading-suppor.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From 7883985a3a78677e9a1d5d61fe7fa8<wbr>badf39f565 Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Nov 2016 20:45:23 -0800<br>
            -Subject: [PATCH 10/14] Revert "udev: remove userspace
            firmware loading<br>
            +From 93f35c7d6abf6925392f53af595c84<wbr>f4b6b3b2e4 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Mon, 26 Feb 2018 13:07:54 +0800<br>
            +Subject: [PATCH 08/32] Revert "udev: remove userspace
            firmware loading<br>
              support"<br>
            <br>
             This reverts commit be2ea723b1d023b3d385d3b791ee46<wbr>07cbfb20ca.<br>
            @@ -11,47 +11,26 @@ Upstream-Status: Inappropriate [OE
            specific]<br>
            <br>
             Signed-off-by: Jonathan Liu &lt;<a moz-do-not-send="true"
              href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
             Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
             ---<br>
            - Makefile.am                      |  12 +++<br>
              README                           |   4 +-<br>
              TODO                             |   1 +<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a>         
                       |  18 +++++<br>
            + meson.build                      |   8 ++<br>
            + meson_options.txt                |   2 +<br>
            + rules/meson.build                |   4 +<br>
            + src/udev/meson.build             |   5 ++<br>
              src/udev/udev-builtin-<wbr>firmware.c | 154
            ++++++++++++++++++++++++++++++<wbr>+++++++++<br>
              src/udev/udev-builtin.c          |   3 +<br>
              src/udev/udev.h                  |   6 ++<br>
              src/udev/udevd.c                 |  13 ++++<br>
            - 8 files changed, 209 insertions(+), 2 deletions(-)<br>
            + 10 files changed, 198 insertions(+), 2 deletions(-)<br>
              create mode 100644 src/udev/udev-builtin-<wbr>firmware.c<br>
            <br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index c2b4a99d2..692d7bb95 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -3985,6 +3985,18 @@ libudev_core_la_LIBADD = \<br>
            -       $(BLKID_LIBS) \<br>
            -       $(KMOD_LIBS)<br>
            -<br>
            -+libudev_core_la_CPPFLAGS = \<br>
            -+      $(AM_CPPFLAGS) \<br>
            -+      -DFIRMWARE_PATH="$(FIRMWARE_<wbr>PATH)"<br>
            -+<br>
            -+if ENABLE_FIRMWARE<br>
            -+libudev_core_la_SOURCES += \<br>
            -+      src/udev/udev-builtin-<wbr>firmware.c<br>
            -+<br>
            -+dist_udevrules_DATA += \<br>
            -+      rules/50-firmware.rules<br>
            -+endif<br>
            -+<br>
            - if HAVE_KMOD<br>
            - libudev_core_la_SOURCES += \<br>
            -       src/udev/udev-builtin-kmod.c<br>
             diff --git a/README b/README<br>
            -index 60388eebe..e21976393 100644<br>
            +index b245564f5..8396a0f6e 100644<br>
             --- a/README<br>
             +++ b/README<br>
            -@@ -61,8 +61,8 @@ REQUIREMENTS:<br>
            +@@ -58,8 +58,8 @@ REQUIREMENTS:<br>
                      Legacy hotplug slows down the system and confuses
            udev:<br>
                        CONFIG_UEVENT_HELPER_PATH=""<br>
            <br>
            @@ -63,10 +42,10 @@ index 60388eebe..e21976393 100644<br>
            <br>
                      Some udev rules and virtualization detection
            relies on it:<br>
             diff --git a/TODO b/TODO<br>
            -index 61efa5e9f..67ccac224 100644<br>
            +index 0c20012b2..93788122c 100644<br>
             --- a/TODO<br>
             +++ b/TODO<br>
            -@@ -740,6 +740,7 @@ Features:<br>
            +@@ -769,6 +769,7 @@ Features:<br>
              * initialize the hostname from the fs label of /, if
            /etc/hostname does not exist?<br>
            <br>
              * udev:<br>
            @@ -74,42 +53,90 @@ index 61efa5e9f..67ccac224 100644<br>
                - move to LGPL<br>
                - kill scsi_id<br>
                - add trigger --subsystem-match=usb/usb_<wbr>device
            device<br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index b53ca1f1a..1150ca50e 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -1522,6 +1522,23 @@ AM_CONDITIONAL(HAVE_<wbr>MYHOSTNAME,
            [test "$have_myhostname" = "yes"])<br>
            - AC_ARG_ENABLE(hwdb, [AS_HELP_STRING([--disable-<wbr>hwdb],
            [disable hardware database support])],<br>
            -        enable_hwdb=$enableval, enable_hwdb=yes)<br>
            - AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])<br>
            -+AC_ARG_WITH(firmware-path,<br>
            -+       AS_HELP_STRING([--with-<wbr>firmware-path=DIR[[[:DIR[...]]<wbr>]]],<br>
            -+          [Firmware search path (default="")]),<br>
            -+       [], [with_firmware_path=""])<br>
            -+OLD_IFS=$IFS<br>
            -+IFS=:<br>
            -+for i in $with_firmware_path; do<br>
            -+       if test "x${FIRMWARE_PATH}" = "x"; then<br>
            -+              FIRMWARE_PATH="\\\"${i}/\\\""<br>
            -+       else<br>
            -+              FIRMWARE_PATH="${FIRMWARE_<wbr>PATH},
            \\\"${i}/\\\""<br>
            -+       fi<br>
            -+done<br>
            -+IFS=$OLD_IFS<br>
            -+AC_SUBST(FIRMWARE_PATH)<br>
            -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [
            AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is
            available]) ])<br>
            -+AM_CONDITIONAL(ENABLE_<wbr>FIRMWARE, [test
            "x${FIRMWARE_PATH}" != "x"])<br>
            +diff --git a/meson.build b/meson.build<br>
            +index 7df4f7a33..85c2ee6aa 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -72,6 +72,12 @@ conf.set10('HAVE_SYSV_COMPAT', have,<br>
            +            description : 'SysV init scripts and rcN.d
            links are supported')<br>
            + m4_defines += have ? ['-DHAVE_SYSV_COMPAT'] : []<br>
            +<br>
            ++firmware_path = get_option('firmware-path')<br>
            ++have = firmware_path != ''<br>
            ++conf.set10('HAVE_FIRMWARE', have,<br>
            ++           description : 'Userspace firmware loading is
            supported')<br>
            ++m4_defines += have ? ['-DHAVE_FIRMWARE'] : []<br>
            ++<br>
            + # join_paths ignore the preceding arguments if an absolute
            component is<br>
            + # encountered, so this should canonicalize various paths
            when they are<br>
            + # absolute or relative.<br>
            +@@ -258,6 +264,7 @@ substs.set('SYSTEMCTL',               
                                   join_paths(rootbin<br>
            + substs.set('RANDOM_SEED',                                 
               join_paths(randomseeddir, 'random-seed'))<br>
            + substs.set('SYSTEM_SYSVINIT_<wbr>PATH',                   
                    sysvinit_path)<br>
            + substs.set('SYSTEM_SYSVRCND_<wbr>PATH',                   
                    sysvrcnd_path)<br>
            ++substs.set('FIRMWARE_PATH',                               
               firmware_path)<br>
            + substs.set('RC_LOCAL_SCRIPT_<wbr>PATH_START',             
                    get_option('rc-local'))<br>
            + substs.set('RC_LOCAL_SCRIPT_<wbr>PATH_STOP',             
                     get_option('halt-local'))<br>
            +<br>
            +@@ -2569,6 +2576,7 @@ status = [<br>
            +         'roothome directory:               
            @0@'.format(roothomedir),<br>
            +         'SysV init scripts:               
             @0@'.format(sysvinit_path),<br>
            +         'SysV rc?.d directories:           
            @0@'.format(sysvrcnd_path),<br>
            ++        'firmware path:                   
             @0@'.format(firmware_path),<br>
            +         'PAM modules directory:           
             @0@'.format(pamlibdir),<br>
            +         'PAM configuration directory:     
             @0@'.format(pamconfdir),<br>
            +         'RPM macros directory:             
            @0@'.format(rpmmacrosdir),<br>
            +diff --git a/meson_options.txt b/meson_options.txt<br>
            +index 7bd8845ce..412d9af04 100644<br>
            +--- a/meson_options.txt<br>
            ++++ b/meson_options.txt<br>
            +@@ -107,6 +107,8 @@ option('tmpfiles', type : 'boolean',<br>
            +        description : 'support for tmpfiles.d')<br>
            + option('importd', type : 'combo', choices : ['auto',
            'true', 'false'],<br>
            +        description : 'install the systemd-importd daemon')<br>
            ++option('firmware-path', type : 'string', value : '',<br>
            ++       description : 'Firmware search path')<br>
            + option('hwdb', type : 'boolean',<br>
            +        description : 'support for the hardware database')<br>
            + option('rfkill', type : 'boolean',<br>
            +diff --git a/rules/meson.build b/rules/meson.build<br>
            +index e253b9f59..5eee5fbca 100644<br>
            +--- a/rules/meson.build<br>
            ++++ b/rules/meson.build<br>
            +@@ -41,6 +41,10 @@ rules = files('''<br>
            + install_data(rules,<br>
            +              install_dir : udevrulesdir)<br>
            +<br>
            ++if conf.get('HAVE_FIRMWARE') == 1<br>
            ++        install_data('50-firmware.<wbr>rules', install_dir
            : udevrulesdir)<br>
            ++endif<br>
            ++<br>
            + all_rules = rules<br>
            +<br>
            + rules_in = '''<br>
            +diff --git a/src/udev/meson.build b/src/udev/meson.build<br>
            +index d01cf8f19..3e3de05bd 100644<br>
            +--- a/src/udev/meson.build<br>
            ++++ b/src/udev/meson.build<br>
            +@@ -67,6 +67,10 @@ if conf.get('HAVE_ACL') == 1<br>
            +                                  sd_login_c]<br>
            + endif<br>
            +<br>
            ++if conf.get('HAVE_FIRMWARE') == 1<br>
            ++        libudev_core_sources +=
            ['udev-builtin-firmware.c']<br>
            ++endif<br>
            ++<br>
            + ##############################<wbr>##############################<br>
            +<br>
            + generate_keyboard_keys_list = find_program('generate-<wbr>keyboard-keys-list.sh')<br>
            +@@ -130,6 +134,7 @@ libudev_core = static_library(<br>
            +         link_config_gperf_c,<br>
            +         keyboard_keys_from_name_h,<br>
            +         include_directories : libudev_core_includes,<br>
            ++        c_args : ['-DFIRMWARE_PATH="@0@"'.<wbr>format(firmware_path)],<br>
            +         link_with : udev_link_with,<br>
            +         dependencies : [libblkid, libkmod])<br>
            <br>
            - # ------------------------------<wbr>------------------------------<wbr>------------------<br>
            - have_manpages=no<br>
            -@@ -1839,6 +1856,7 @@ AC_MSG_RESULT([<br>
            -         SysV init scripts:               
             ${SYSTEM_SYSVINIT_PATH}<br>
            -         SysV rc?.d directories:           
            ${SYSTEM_SYSVRCND_PATH}<br>
            -         build Python:                      ${PYTHON}<br>
            -+        firmware path:                   
             ${FIRMWARE_PATH}<br>
            -         PAM modules dir:                 
             ${with_pamlibdir}<br>
            -         PAM configuration dir:           
             ${with_pamconfdir}<br>
            -         RPM macros dir:                   
            ${with_rpmmacrosdir}<br>
             diff --git a/src/udev/udev-builtin-<wbr>firmware.c
            b/src/udev/udev-builtin-<wbr>firmware.c<br>
             new file mode 100644<br>
             index 000000000..bd8c2fb96<br>
            @@ -271,73 +298,73 @@ index 000000000..bd8c2fb96<br>
             +        .run_once = true,<br>
             +};<br>
             diff --git a/src/udev/udev-builtin.c
            b/src/udev/udev-builtin.c<br>
            -index e6b36f124..cd9947e2a 100644<br>
            +index db2b6874f..ccd88638c 100644<br>
             --- a/src/udev/udev-builtin.c<br>
             +++ b/src/udev/udev-builtin.c<br>
            -@@ -31,6 +31,9 @@ static const struct udev_builtin
            *builtins[] = {<br>
            +@@ -32,6 +32,9 @@ static const struct udev_builtin
            *builtins[] = {<br>
                      [UDEV_BUILTIN_BLKID] = &amp;udev_builtin_blkid,<br>
              #endif<br>
                      [UDEV_BUILTIN_BTRFS] = &amp;udev_builtin_btrfs,<br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +        [UDEV_BUILTIN_FIRMWARE] =
            &amp;udev_builtin_firmware,<br>
             +#endif<br>
                      [UDEV_BUILTIN_HWDB] = &amp;udev_builtin_hwdb,<br>
                      [UDEV_BUILTIN_INPUT_ID] =
            &amp;udev_builtin_input_id,<br>
                      [UDEV_BUILTIN_KEYBOARD] =
            &amp;udev_builtin_keyboard,<br>
             diff --git a/src/udev/udev.h b/src/udev/udev.h<br>
            -index c0cb7eae8..9f0f1cf13 100644<br>
            +index ea11c2d29..c47dd3d88 100644<br>
             --- a/src/udev/udev.h<br>
             +++ b/src/udev/udev.h<br>
            -@@ -150,6 +150,9 @@ enum udev_builtin_cmd {<br>
            +@@ -151,6 +151,9 @@ enum udev_builtin_cmd {<br>
                      UDEV_BUILTIN_BLKID,<br>
              #endif<br>
                      UDEV_BUILTIN_BTRFS,<br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +        UDEV_BUILTIN_FIRMWARE,<br>
             +#endif<br>
                      UDEV_BUILTIN_HWDB,<br>
                      UDEV_BUILTIN_INPUT_ID,<br>
                      UDEV_BUILTIN_KEYBOARD,<br>
            -@@ -178,6 +181,9 @@ struct udev_builtin {<br>
            +@@ -179,6 +182,9 @@ struct udev_builtin {<br>
              extern const struct udev_builtin udev_builtin_blkid;<br>
              #endif<br>
              extern const struct udev_builtin udev_builtin_btrfs;<br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +extern const struct udev_builtin udev_builtin_firmware;<br>
             +#endif<br>
              extern const struct udev_builtin udev_builtin_hwdb;<br>
              extern const struct udev_builtin udev_builtin_input_id;<br>
              extern const struct udev_builtin udev_builtin_keyboard;<br>
             diff --git a/src/udev/udevd.c b/src/udev/udevd.c<br>
            -index acbddd418..20347b402 100644<br>
            +index 1644935ff..7eb4b9374 100644<br>
             --- a/src/udev/udevd.c<br>
             +++ b/src/udev/udevd.c<br>
            -@@ -125,6 +125,9 @@ struct event {<br>
            +@@ -127,6 +127,9 @@ struct event {<br>
                      bool is_block;<br>
                      sd_event_source *timeout_warning;<br>
                      sd_event_source *timeout;<br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +        bool nodelay;<br>
             +#endif<br>
              };<br>
            <br>
            - static inline struct event *node_to_event(struct
            udev_list_node *node) {<br>
            -@@ -613,6 +616,10 @@ static int event_queue_insert(Manager
            *manager, struct udev_device *dev) {<br>
            + static void event_queue_cleanup(Manager *manager, enum
            event_state type);<br>
            +@@ -609,6 +612,10 @@ static int event_queue_insert(Manager
            *manager, struct udev_device *dev) {<br>
                      event-&gt;devnum = udev_device_get_devnum(dev);<br>
                      event-&gt;is_block = streq("block",
            udev_device_get_subsystem(dev)<wbr>);<br>
                      event-&gt;ifindex = udev_device_get_ifindex(dev);<br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +        if (streq(udev_device_get_<wbr>subsystem(dev),
            "firmware"))<br>
             +                event-&gt;nodelay = true;<br>
             +#endif<br>
            <br>
                      log_debug("seq %llu queued, '%s' '%s'",
            udev_device_get_seqnum(dev),<br>
                           udev_device_get_action(dev),
            udev_device_get_subsystem(dev)<wbr>);<br>
            -@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager
            *manager, struct event *event) {<br>
            +@@ -692,6 +699,12 @@ static bool is_devpath_busy(Manager
            *manager, struct event *event) {<br>
                                      return true;<br>
                              }<br>
            <br>
            -+#ifdef HAVE_FIRMWARE<br>
            ++#if HAVE_FIRMWARE<br>
             +                /* allow to bypass the dependency tracking
            */<br>
             +                if (event-&gt;nodelay)<br>
             +                        continue;<br>
            @@ -347,5 +374,5 @@ index acbddd418..20347b402 100644<br>
                              if (event-&gt;devpath[common] == '/') {<br>
                                      event-&gt;delaying_seqnum =
            loop_event-&gt;seqnum;<br>
             --<br>
            -2.13.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0017-remove-duplicate-<wbr>include-uchar.h.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0009-remove-duplicate-<wbr>include-uchar.h.patch<br>
            similarity index 78%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0017-remove-duplicate-<wbr>include-uchar.h.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0009-remove-duplicate-<wbr>include-uchar.h.patch<br>
            index d200635..d91c689 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0017-remove-duplicate-<wbr>include-uchar.h.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0009-remove-duplicate-<wbr>include-uchar.h.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From e78af874fc9f3d3af49498b8207109<wbr>993d93a596 Mon Sep
            17 00:00:00 2001<br>
            +From 55517716b078424541b6cd44235043<wbr>22eb5d7589 Mon Sep
            17 00:00:00 2001<br>
             From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
             Date: Mon, 22 Feb 2016 05:59:01 +0000<br>
            -Subject: [PATCH 17/19] remove duplicate include uchar.h<br>
            +Subject: [PATCH 09/32] remove duplicate include uchar.h<br>
            <br>
             missing.h already includes it<br>
            <br>
            @@ -13,10 +13,10 @@ Upstream-Status: Pending<br>
              2 files changed, 2 deletions(-)<br>
            <br>
             diff --git a/src/basic/escape.h b/src/basic/escape.h<br>
            -index deaa4de..36d437c 100644<br>
            +index de89f43a8..9921ccbbd 100644<br>
             --- a/src/basic/escape.h<br>
             +++ b/src/basic/escape.h<br>
            -@@ -23,7 +23,6 @@<br>
            +@@ -24,7 +24,6 @@<br>
              #include &lt;stddef.h&gt;<br>
              #include &lt;stdint.h&gt;<br>
              #include &lt;sys/types.h&gt;<br>
            @@ -25,10 +25,10 @@ index deaa4de..36d437c 100644<br>
              #include "string-util.h"<br>
              #include "missing.h"<br>
             diff --git a/src/basic/utf8.h b/src/basic/utf8.h<br>
            -index f9b9c94..6ac9a3c 100644<br>
            +index b0a7485ae..fa06d2906 100644<br>
             --- a/src/basic/utf8.h<br>
             +++ b/src/basic/utf8.h<br>
            -@@ -22,7 +22,6 @@<br>
            +@@ -23,7 +23,6 @@<br>
              #include &lt;stdbool.h&gt;<br>
              #include &lt;stddef.h&gt;<br>
              #include &lt;stdint.h&gt;<br>
            @@ -37,5 +37,5 @@ index f9b9c94..6ac9a3c 100644<br>
              #include "macro.h"<br>
              #include "missing.h"<br>
             --<br>
            -2.10.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0010-check-for-uchar.<wbr>h-in-meson.build.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0010-check-for-uchar.<wbr>h-in-meson.build.patch<br>
            new file mode 100644<br>
            index 0000000..ac77ca5<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0010-check-for-uchar.<wbr>h-in-meson.build.patch<br>
            @@ -0,0 +1,45 @@<br>
            +From acf11f1ac360717cb192166a72350f<wbr>69ebed92e9 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Mon, 26 Feb 2018 15:34:52 +0800<br>
            +Subject: [PATCH 10/32] check for uchar.h in meson.build<br>
            +<br>
            +Use #if HAVE_UCHAR_H to include uchar.h conditionally.<br>
            +<br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Upstream-Status: Pending<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + meson.build         | 1 +<br>
            + src/basic/missing.h | 2 ++<br>
            + 2 files changed, 3 insertions(+)<br>
            +<br>
            +diff --git a/meson.build b/meson.build<br>
            +index 85c2ee6aa..a5e249dc7 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -581,6 +581,7 @@ foreach header : ['linux/btrfs.h',<br>
            +                   'sys/auxv.h',<br>
            +                   'valgrind/memcheck.h',<br>
            +                   'valgrind/valgrind.h',<br>
            ++                  'uchar.h',<br>
            +                  ]<br>
            +<br>
            +         conf.set10('HAVE_' + header.underscorify().to_<wbr>upper(),<br>
            +diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
            +index 5a602e9a6..cdb4eb4be 100644<br>
            +--- a/src/basic/missing.h<br>
            ++++ b/src/basic/missing.h<br>
            +@@ -38,7 +38,9 @@<br>
            + #include &lt;sys/resource.h&gt;<br>
            + #include &lt;sys/socket.h&gt;<br>
            + #include &lt;sys/syscall.h&gt;<br>
            ++#if HAVE_UCHAR_H<br>
            + #include &lt;uchar.h&gt;<br>
            ++#endif<br>
            + #include &lt;unistd.h&gt;<br>
            +<br>
            + #if HAVE_AUDIT<br>
            +--<br>
            +2.11.0<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build-conditionally-when-HAVE_<wbr>MYHOSTN.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build-conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
            deleted file mode 100644<br>
            index b01ae97..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build-conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
            +++ /dev/null<br>
            @@ -1,38 +0,0 @@<br>
            -From 3f6f45578b828e414f50c682237507<wbr>3e7174236a Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Mon, 14 Dec 2015 00:50:01 +0000<br>
            -Subject: [PATCH 11/19] nss-mymachines: Build conditionally
            when<br>
            - HAVE_MYHOSTNAME is set<br>
            -<br>
            -Fixes build failures when building with
            --disable-myhostname<br>
            -<br>
            -Upstream-Status: Pending<br>
            -<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
            - Makefile.am | 2 ++<br>
            - 1 file changed, 2 insertions(+)<br>
            -<br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index 02f4017..420e0e0 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES += \<br>
            - BUSNAMES_TARGET_WANTS += \<br>
            -       org.freedesktop.machine1.<wbr>busname<br>
            -<br>
            -+if HAVE_MYHOSTNAME<br>
            - libnss_mymachines_la_SOURCES = \<br>
            -       src/nss-mymachines/nss-<wbr>mymachines.sym \<br>
            -       src/nss-mymachines/nss-<wbr>mymachines.c<br>
            -@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES += \<br>
            -       <a moz-do-not-send="true"
              href="http://libnss_mymachines.la" rel="noreferrer"
              target="_blank">libnss_mymachines.la</a><br>
            -<br>
            - endif<br>
            -+endif<br>
            -<br>
            - polkitpolicy_in_files += \<br>
            -       src/machine/<a moz-do-not-send="true"
              href="http://org.freedesktop.machine1.policy.in"
              rel="noreferrer" target="_blank">org.freedesktop.<wbr>machine1.policy.in</a><br>
            ---<br>
            -2.10.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0019-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0011-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
            similarity index 58%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0019-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0011-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
            index b609276..de6804d 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0019-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0011-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
            @@ -1,25 +1,26 @@<br>
            -From b7c6bfe2ec5ae426e586e1d6ecadb5<wbr>2a97128a3f Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Nov 2016 20:49:53 -0800<br>
            -Subject: [PATCH 13/14] socket-util: don't fail if libc
            doesn't support IDN<br>
            +From 2dd6f45e4578e5ae405508f4fba07c<wbr>69d5ab3307 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Mon, 26 Feb 2018 15:46:05 +0800<br>
            +Subject: [PATCH 11/32] socket-util: don't fail if libc
            doesn't support IDN<br>
            <br>
             Upstream-Status: Pending<br>
            <br>
             Signed-off-by: Emil Renner Berthing &lt;<a
              moz-do-not-send="true" href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
             Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            <br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
             ---<br>
            - src/basic/socket-util.c | 9 +++++++++<br>
            - 1 file changed, 9 insertions(+)<br>
            + src/basic/socket-util.c | 10 ++++++++++<br>
            + 1 file changed, 10 insertions(+)<br>
            <br>
             diff --git a/src/basic/socket-util.c
            b/src/basic/socket-util.c<br>
            -index 016e64aa0..d4658826e 100644<br>
            +index a458fc290..b74649e78 100644<br>
             --- a/src/basic/socket-util.c<br>
             +++ b/src/basic/socket-util.c<br>
            -@@ -47,6 +47,15 @@<br>
            - #include "user-util.h"<br>
            +@@ -49,6 +49,16 @@<br>
              #include "utf8.h"<br>
              #include "util.h"<br>
            +<br>
             +/* Don't fail if the standard library<br>
             + * doesn't support IDN */<br>
             +#ifndef NI_IDN<br>
            @@ -29,9 +30,10 @@ index 016e64aa0..d4658826e 100644<br>
             +#ifndef NI_IDN_USE_STD3_ASCII_RULES<br>
             +#define NI_IDN_USE_STD3_ASCII_RULES 0<br>
             +#endif<br>
            -<br>
            - #ifdef ENABLE_IDN<br>
            ++<br>
            + #if ENABLE_IDN<br>
              #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_<wbr>RULES)<br>
            + #else<br>
             --<br>
            -2.13.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0020-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0012-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            similarity index 90%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0020-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0012-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            index 17d698a..ba53aae 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0020-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0012-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From 8207d645582e96c56950674e104653<wbr>d0cd552d60 Mon Sep
            17 00:00:00 2001<br>
            +From 6aabb5129bc350854a837440ab1974<wbr>e9b1daba44 Mon Sep
            17 00:00:00 2001<br>
             From: Hongxu Jia &lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
             Date: Fri, 17 Nov 2017 09:46:00 +0800<br>
            -Subject: [PATCH] rules: watch metadata changes in ide
            devices<br>
            +Subject: [PATCH 12/32] rules: watch metadata changes in ide
            devices<br>
            <br>
             Formatting IDE storage does not trigger "change" uevents.
            As a result<br>
             clients using udev API don't get any updates afterwards and
            get outdated<br>
            @@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia &lt;<a
              moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
              1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
             diff --git a/rules/60-block.rules b/rules/60-block.rules<br>
            -index 343fc06..b5237da 100644<br>
            +index 343fc06f8..b5237dac4 100644<br>
             --- a/rules/60-block.rules<br>
             +++ b/rules/60-block.rules<br>
             @@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
            KERNEL=="block", ATTR{parameters/events_dfl_<br>
            @@ -39,5 +39,5 @@ index 343fc06..b5237da 100644<br>
             -ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*",
            OPTIONS+="watch"<br>
             +ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*|hd*",
            OPTIONS+="watch"<br>
             --<br>
            -1.8.3.1<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr>directory-configurable.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr>directory-configurable.patch<br>
            deleted file mode 100644<br>
            index aeebbfb..0000000<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr>directory-configurable.patch<br>
            +++ /dev/null<br>
            @@ -1,155 +0,0 @@<br>
            -From 479e1f4aa2b9f1c911a4d0dd18e222<wbr>d241a978ea Mon Sep
            17 00:00:00 2001<br>
            -From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Nov 2016 20:35:30 -0800<br>
            -Subject: [PATCH 42/48] Make root's home directory
            configurable<br>
            -<br>
            -OpenEmbedded has a configurable home directory for root.
            Allow<br>
            -systemd to be built using its idea of what root's home
            directory<br>
            -should be.<br>
            -<br>
            -Upstream-Status: Denied<br>
            -Upstream wants to have a unified hierarchy where everyone
            is<br>
            -using the same root folder.<br>
            -<a moz-do-not-send="true"
              href="https://github.com/systemd/systemd/issues/541"
              rel="noreferrer" target="_blank">https://github.com/systemd/<wbr>systemd/issues/541</a><br>
            -<br>
            -Signed-off-by: Dan McGregor &lt;<a moz-do-not-send="true"
              href="mailto:dan.mcgregor@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            -<br>
            ----<br>
            - Makefile.am                | 2 ++<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a>         
                 | 7 +++++++<br>
            - src/basic/user-util.c      | 4 ++--<br>
            - src/nspawn/nspawn.c        | 4 ++--<br>
            - units/<a moz-do-not-send="true"
              href="http://emergency.service.in" rel="noreferrer"
              target="_blank">emergency.service.in</a> | 4 ++--<br>
            - units/<a moz-do-not-send="true"
              href="http://rescue.service.in" rel="noreferrer"
              target="_blank">rescue.service.in</a>    | 4 ++--<br>
            - 6 files changed, 17 insertions(+), 8 deletions(-)<br>
            -<br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index 1bcd932c2..c2b4a99d2 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -226,6 +226,7 @@ AM_CPPFLAGS = \<br>
            -       -DLIBDIR=\"$(libdir)\" \<br>
            -       -DROOTLIBDIR=\"$(rootlibdir)\" \<br>
            -       -DROOTLIBEXECDIR=\"$(<wbr>rootlibexecdir)\" \<br>
            -+      -DROOTHOMEDIR=\"$(roothomedir)<wbr>\" \<br>
            -       -I $(top_srcdir)/src \<br>
            -       -I $(top_builddir)/src/basic \<br>
            -       -I $(top_srcdir)/src/basic \<br>
            -@@ -6356,6 +6357,7 @@ substitutions = \<br>
            -        '|rootlibdir=$(rootlibdir)|' \<br>
            -        '|rootlibexecdir=$(<wbr>rootlibexecdir)|' \<br>
            -        '|rootbindir=$(rootbindir)|' \<br>
            -+       '|roothomedir=$(roothomedir)|' \<br>
            -        '|bindir=$(bindir)|' \<br>
            -        '|SYSTEMCTL=$(rootbindir)/<wbr>systemctl|' \<br>
            -        '|SYSTEMD_NOTIFY=$(rootbindir)<wbr>/systemd-notify|'
            \<br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index 0354ffe6a..b53ca1f1a 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -1641,6 +1641,11 @@ AC_ARG_WITH([rootlibdir],<br>
            -         [with_rootlibdir=${libdir}])<br>
            - AX_NORMALIZE_PATH([with_<wbr>rootlibdir])<br>
            -<br>
            -+AC_ARG_WITH([roothomedir],<br>
            -+        AS_HELP_STRING([--with-<wbr>roothomedir=DIR],
            [Home directory for the root user]),<br>
            -+        [],<br>
            -+        [with_roothomedir=/root])<br>
            -+<br>
            - AC_ARG_WITH([pamlibdir],<br>
            -         AS_HELP_STRING([--with-<wbr>pamlibdir=DIR],
            [directory for PAM modules]),<br>
            -         [],<br>
            -@@ -1733,6 +1738,7 @@ AC_SUBST([pamconfdir],
            [$with_pamconfdir])<br>
            - AC_SUBST([rpmmacrosdir], [$with_rpmmacrosdir])<br>
            - AC_SUBST([rootprefix], [$with_rootprefix])<br>
            - AC_SUBST([rootlibdir], [$with_rootlibdir])<br>
            -+AC_SUBST([roothomedir], [$with_roothomedir])<br>
            -<br>
            - AC_CONFIG_FILES([<br>
            -         Makefile<br>
            -@@ -1829,6 +1835,7 @@ AC_MSG_RESULT([<br>
            -         includedir:                        ${includedir}<br>
            -         lib dir:                           ${libdir}<br>
            -         rootlib dir:                     
             ${with_rootlibdir}<br>
            -+        root home dir:                   
             ${with_roothomedir}<br>
            -         SysV init scripts:               
             ${SYSTEM_SYSVINIT_PATH}<br>
            -         SysV rc?.d directories:           
            ${SYSTEM_SYSVRCND_PATH}<br>
            -         build Python:                      ${PYTHON}<br>
            -diff --git a/src/basic/user-util.c b/src/basic/user-util.c<br>
            -index c619dad52..662682adf 100644<br>
            ---- a/src/basic/user-util.c<br>
            -+++ b/src/basic/user-util.c<br>
            -@@ -129,7 +129,7 @@ int get_user_creds(<br>
            -                         *gid = 0;<br>
            -<br>
            -                 if (home)<br>
            --                        *home = "/root";<br>
            -+                        *home = ROOTHOMEDIR;<br>
            -<br>
            -                 if (shell)<br>
            -                         *shell = "/bin/sh";<br>
            -@@ -389,7 +389,7 @@ int get_home_dir(char **_h) {<br>
            -         /* Hardcode home directory for root to avoid NSS
            */<br>
            -         u = getuid();<br>
            -         if (u == 0) {<br>
            --                h = strdup("/root");<br>
            -+                h = strdup(ROOTHOMEDIR);<br>
            -                 if (!h)<br>
            -                         return -ENOMEM;<br>
            -<br>
            -diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c<br>
            -index 8a5fedd4b..7b01ec078 100644<br>
            ---- a/src/nspawn/nspawn.c<br>
            -+++ b/src/nspawn/nspawn.c<br>
            -@@ -2291,7 +2291,7 @@ static int inner_child(<br>
            -         if (envp[n_env])<br>
            -                 n_env++;<br>
            -<br>
            --        if ((asprintf((char**)(envp + n_env++), "HOME=%s",
            home ? home: "/root") &lt; 0) ||<br>
            -+        if ((asprintf((char**)(envp + n_env++), "HOME=%s",
            home ? home: ROOTHOMEDIR) &lt; 0) ||<br>
            -             (asprintf((char**)(envp + n_env++), "USER=%s",
            arg_user ? arg_user : "root") &lt; 0) ||<br>
            -             (asprintf((char**)(envp + n_env++),
            "LOGNAME=%s", arg_user ? arg_user : "root") &lt; 0))<br>
            -                 return log_oom();<br>
            -@@ -2373,7 +2373,7 @@ static int inner_child(<br>
            -         } else {<br>
            -                 if (!arg_chdir)<br>
            -                         /* If we cannot change the
            directory, we'll end up in /, that is expected. */<br>
            --                        (void) chdir(home ?: "/root");<br>
            -+                        (void) chdir(home ?: ROOTHOMEDIR);<br>
            -<br>
            -                 execle("/bin/bash", "-bash", NULL,
            env_use);<br>
            -                 execle("/bin/sh", "-sh", NULL, env_use);<br>
            -diff --git a/units/<a moz-do-not-send="true"
              href="http://emergency.service.in" rel="noreferrer"
              target="_blank">emergency.service.in</a> b/units/<a
              moz-do-not-send="true" href="http://emergency.service.in"
              rel="noreferrer" target="_blank">emergency.service.in</a><br>
            -index e9eb238b9..32588e48a 100644<br>
            ---- a/units/<a moz-do-not-send="true"
              href="http://emergency.service.in" rel="noreferrer"
              target="_blank">emergency.service.in</a><br>
            -+++ b/units/<a moz-do-not-send="true"
              href="http://emergency.service.in" rel="noreferrer"
              target="_blank">emergency.service.in</a><br>
            -@@ -15,8 +15,8 @@ Conflicts=syslog.socket<br>
            - Before=shutdown.target<br>
            -<br>
            - [Service]<br>
            --Environment=HOME=/root<br>
            --WorkingDirectory=-/root<br>
            -+Environment=HOME=@<wbr>roothomedir@<br>
            -+WorkingDirectory=-@<wbr>roothomedir@<br>
            - ExecStart=-@rootlibexecdir@/<wbr>systemd-sulogin-shell
            emergency<br>
            - Type=idle<br>
            - StandardInput=tty-force<br>
            -diff --git a/units/<a moz-do-not-send="true"
              href="http://rescue.service.in" rel="noreferrer"
              target="_blank">rescue.service.in</a> b/units/<a
              moz-do-not-send="true" href="http://rescue.service.in"
              rel="noreferrer" target="_blank">rescue.service.in</a><br>
            -index 4ab66f485..bd9898f2c 100644<br>
            ---- a/units/<a moz-do-not-send="true"
              href="http://rescue.service.in" rel="noreferrer"
              target="_blank">rescue.service.in</a><br>
            -+++ b/units/<a moz-do-not-send="true"
              href="http://rescue.service.in" rel="noreferrer"
              target="_blank">rescue.service.in</a><br>
            -@@ -14,8 +14,8 @@ After=sysinit.target
            plymouth-start.service<br>
            - Before=shutdown.target<br>
            -<br>
            - [Service]<br>
            --Environment=HOME=/root<br>
            --WorkingDirectory=-/root<br>
            -+Environment=HOME=@<wbr>roothomedir@<br>
            -+WorkingDirectory=-@<wbr>roothomedir@<br>
            - ExecStart=-@rootlibexecdir@/<wbr>systemd-sulogin-shell
            rescue<br>
            - Type=idle<br>
            - StandardInput=tty-force<br>
            ---<br>
            -2.13.2<br>
            -<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0013-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch<br>
            similarity index 88%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0001-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0013-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch<br>
            index e2f7458..2bb1663 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0001-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0013-add-fallback-<wbr>parse_printf_format-<wbr>implementation.patch<br>
            @@ -1,53 +1,51 @@<br>
            -From 0933ca6251808f856b92b0ce8da869<wbr>6d5febc333 Mon Sep
            17 00:00:00 2001<br>
            -From: Emil Renner Berthing &lt;<a moz-do-not-send="true"
              href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
            -Date: Mon, 23 Oct 2017 10:41:39 -0700<br>
            -Subject: [PATCH 01/12] add fallback parse_printf_format
            implementation<br>
            +From 3ba72b753294d9dec47d5cf8b6f2db<wbr>b8812cae06 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Mon, 26 Feb 2018 16:25:30 +0800<br>
            +Subject: [PATCH 13/32] add fallback parse_printf_format
            implementation<br>
            +<br>
            +Upstream-Status: Pending<br>
            <br>
             Signed-off-by: Emil Renner Berthing &lt;<a
              moz-do-not-send="true" href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
             Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
             ---<br>
            -Upstream-Status: Pending<br>
            -<br>
            - Makefile.am                     |   4 +<br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a>         
                      |   2 +<br>
            + meson.build                     |   1 +<br>
            + src/basic/meson.build           |   4 +<br>
              src/basic/parse-printf-format.<wbr>c | 273
            ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
              src/basic/parse-printf-format.<wbr>h |  57 +++++++++<br>
              src/basic/stdio-util.h          |   2 +-<br>
              src/journal/journal-send.c      |   2 +-<br>
            - 6 files changed, 338 insertions(+), 2 deletions(-)<br>
            + 6 files changed, 337 insertions(+), 2 deletions(-)<br>
              create mode 100644 src/basic/parse-printf-format.<wbr>c<br>
              create mode 100644 src/basic/parse-printf-format.<wbr>h<br>
            <br>
            -diff --git a/Makefile.am b/Makefile.am<br>
            -index 692d7bb95..3cc8f3451 100644<br>
            ---- a/Makefile.am<br>
            -+++ b/Makefile.am<br>
            -@@ -997,6 +997,10 @@ libbasic_la_SOURCES = \<br>
            -       src/basic/journal-importer.h \<br>
            -       src/basic/journal-importer.c<br>
            +diff --git a/meson.build b/meson.build<br>
            +index a5e249dc7..9ca9ba23a 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -578,6 +578,7 @@ endif<br>
            + foreach header : ['linux/btrfs.h',<br>
            +                   'linux/memfd.h',<br>
            +                   'linux/vm_sockets.h',<br>
            ++                  'printf.h',<br>
            +                   'sys/auxv.h',<br>
            +                   'valgrind/memcheck.h',<br>
            +                   'valgrind/valgrind.h',<br>
            +diff --git a/src/basic/meson.build b/src/basic/meson.build<br>
            +index a37e279e5..a674cc14f 100644<br>
            +--- a/src/basic/meson.build<br>
            ++++ b/src/basic/meson.build<br>
            +@@ -296,6 +296,10 @@ endforeach<br>
            <br>
            -+if !HAVE_PRINTF_H<br>
            -+libbasic_la_SOURCES += src/basic/parse-printf-format.<wbr>c<br>
            + basic_sources = basic_sources_plain + [missing_h] +
            generated_gperf_headers<br>
            +<br>
            ++if conf.get('HAVE_PRINTF_H') != 1<br>
            ++        basic_sources += [files('parse-printf-format.c'<wbr>)]<br>
             +endif<br>
             +<br>
            - nodist_libbasic_la_SOURCES = \<br>
            -       src/basic/errno-from-name.h \<br>
            -       src/basic/errno-to-name.h \<br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index 60e7df5ee..efcdc6c16 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -308,8 +308,10 @@ AC_CHECK_HEADERS([uchar.h], [], [])<br>
            - AC_CHECK_HEADERS([sys/<wbr>capability.h], [],
            [AC_MSG_ERROR([*** POSIX caps headers not found])])<br>
            - AC_CHECK_HEADERS([linux/btrfs.<wbr>h], [], [])<br>
            - AC_CHECK_HEADERS([linux/memfd.<wbr>h], [], [])<br>
            -+AC_CHECK_HEADERS([printf.h], [], [])<br>
            - AC_CHECK_HEADERS([linux/vm_<wbr>sockets.h], [], [],
            [#include &lt;sys/socket.h&gt;])<br>
            -<br>
            -+AM_CONDITIONAL(HAVE_PRINTF_<wbr>H, [test
            "x$ac_cv_header_printf_h" = xyes])<br>
            - # unconditionally pull-in librt with old glibc versions<br>
            - AC_SEARCH_LIBS([clock_gettime]<wbr>, [rt], [], [])<br>
            -<br>
            + libbasic = static_library(<br>
            +         'basic',<br>
            +         basic_sources,<br>
             diff --git a/src/basic/parse-printf-<wbr>format.c
            b/src/basic/parse-printf-<wbr>format.c<br>
             new file mode 100644<br>
             index 000000000..49437e544<br>
            @@ -329,7 +327,7 @@ index 000000000..49437e544<br>
             +}<br>
             diff --git a/src/basic/parse-printf-<wbr>format.h
            b/src/basic/parse-printf-<wbr>format.h<br>
             new file mode 100644<br>
            -index 000000000..4371177b0<br>
            +index 000000000..47be7522d<br>
             --- /dev/null<br>
             +++ b/src/basic/parse-printf-<wbr>format.h<br>
             @@ -0,0 +1,57 @@<br>
            @@ -361,7 +359,7 @@ index 000000000..4371177b0<br>
             +<br>
             +#include "config.h"<br>
             +<br>
            -+#ifdef HAVE_PRINTF_H<br>
            ++#if HAVE_PRINTF_H<br>
             +#include &lt;printf.h&gt;<br>
             +#else<br>
             +<br>
            @@ -391,10 +389,10 @@ index 000000000..4371177b0<br>
             +<br>
             +#endif /* HAVE_PRINTF_H */<br>
             diff --git a/src/basic/stdio-util.h
            b/src/basic/stdio-util.h<br>
            -index bd1144b4c..c9c95eb54 100644<br>
            +index dbfafba26..8038380d6 100644<br>
             --- a/src/basic/stdio-util.h<br>
             +++ b/src/basic/stdio-util.h<br>
            -@@ -19,12 +19,12 @@<br>
            +@@ -20,12 +20,12 @@<br>
                along with systemd; If not, see &lt;<a
              moz-do-not-send="true" href="http://www.gnu.org/licenses/"
              rel="noreferrer" target="_blank">http://www.gnu.org/licenses/</a>&gt;<wbr>.<br>
              ***/<br>
            <br>
            @@ -409,10 +407,10 @@ index bd1144b4c..c9c95eb54 100644<br>
              #define xsprintf(buf, fmt, ...) \<br>
                      assert_message_se((size_t) snprintf(buf,
            ELEMENTSOF(buf), fmt, __VA_ARGS__) &lt; ELEMENTSOF(buf),
            "xsprintf: " #buf "[] must be big enough")<br>
             diff --git a/src/journal/journal-send.c
            b/src/journal/journal-send.c<br>
            -index 440fba67c..0236c43c4 100644<br>
            +index a78aa0703..97fc29d01 100644<br>
             --- a/src/journal/journal-send.c<br>
             +++ b/src/journal/journal-send.c<br>
            -@@ -19,7 +19,6 @@<br>
            +@@ -20,7 +20,6 @@<br>
            <br>
              #include &lt;errno.h&gt;<br>
              #include &lt;fcntl.h&gt;<br>
            @@ -420,7 +418,7 @@ index 440fba67c..0236c43c4 100644<br>
              #include &lt;stddef.h&gt;<br>
              #include &lt;sys/socket.h&gt;<br>
              #include &lt;sys/un.h&gt;<br>
            -@@ -38,6 +37,7 @@<br>
            +@@ -39,6 +38,7 @@<br>
              #include "stdio-util.h"<br>
              #include "string-util.h"<br>
              #include "util.h"<br>
            @@ -429,5 +427,5 @@ index 440fba67c..0236c43c4 100644<br>
              #define SNDBUF_SIZE (8*1024*1024)<br>
            <br>
             --<br>
            -2.14.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0002-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0014-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch<br>
            similarity index 60%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0002-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0014-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch<br>
            index 94c136b..8d4537c 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0002-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0014-src-basic-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch<br>
            @@ -1,15 +1,16 @@<br>
            -From 585abd891a56409915314304101cac<wbr>26b42c076b Mon Sep
            17 00:00:00 2001<br>
            -From: Emil Renner Berthing &lt;<a moz-do-not-send="true"
              href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
            -Date: Mon, 23 Oct 2017 10:45:46 -0700<br>
            -Subject: [PATCH 02/12] src/basic/missing.h: check for
            missing strndupa<br>
            +From 72d7c9aaf2f4af1ac21caa8703d183<wbr>715d143e8f Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Mon, 26 Feb 2018 16:41:36 +0800<br>
            +Subject: [PATCH 14/32] src/basic/missing.h: check for
            missing strndupa<br>
            <br>
             include missing.h  for definition of strndupa<br>
            <br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
             Upstream-Status: Pending<br>
            <br>
            - <a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a>         
             |  1 +<br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + meson.build            |  1 +<br>
              src/basic/missing.h    | 11 +++++++++++<br>
              src/basic/mkdir.c      |  1 +<br>
              src/basic/parse-util.c |  1 +<br>
            @@ -17,27 +18,27 @@ Upstream-Status: Pending<br>
              src/shared/uid-range.c |  1 +<br>
              6 files changed, 16 insertions(+)<br>
            <br>
            -diff --git a/<a moz-do-not-send="true"
              href="http://configure.ac" rel="noreferrer"
              target="_blank">configure.ac</a> b/<a
              moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -index efcdc6c16..cd035a971 100644<br>
            ---- a/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -+++ b/<a moz-do-not-send="true" href="http://configure.ac"
              rel="noreferrer" target="_blank">configure.ac</a><br>
            -@@ -329,6 +329,7 @@ AC_CHECK_DECLS([<br>
            -         pivot_root,<br>
            -         name_to_handle_at,<br>
            -         setns,<br>
            -+        strndupa,<br>
            -         renameat2,<br>
            -         kcmp,<br>
            -         keyctl,<br>
            +diff --git a/meson.build b/meson.build<br>
            +index 9ca9ba23a..47a170c08 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -486,6 +486,7 @@ foreach ident : [<br>
            +         ['bpf',               '''#include
            &lt;sys/syscall.h&gt;<br>
            +                                  #include
            &lt;unistd.h&gt;'''],<br>
            +         ['explicit_bzero' ,   '''#include
            &lt;string.h&gt;'''],<br>
            ++        ['strndupa' ,         '''#include
            &lt;string.h&gt;'''],<br>
            + ]<br>
            +<br>
            +         have = cc.has_function(ident[0], prefix :
            ident[1])<br>
             diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
            -index 04912bf52..8009888ad 100644<br>
            +index cdb4eb4be..1d4a70f25 100644<br>
             --- a/src/basic/missing.h<br>
             +++ b/src/basic/missing.h<br>
            -@@ -1104,6 +1104,17 @@ typedef int32_t key_serial_t;<br>
            - #define KEYCTL_DESCRIBE 6<br>
            +@@ -1115,6 +1115,17 @@ struct input_mask {<br>
            + typedef int32_t key_serial_t;<br>
              #endif<br>
            <br>
            -+#if !HAVE_DECL_STRNDUPA<br>
            ++#if ! HAVE_STRNDUPA<br>
             +#define strndupa(s, n) \<br>
             +  ({ \<br>
             +    const char *__old = (s); \<br>
            @@ -48,26 +49,26 @@ index 04912bf52..8009888ad 100644<br>
             +  })<br>
             +#endif<br>
             +<br>
            - #ifndef KEYCTL_READ<br>
            - #define KEYCTL_READ 11<br>
            + #ifndef KEYCTL_JOIN_SESSION_KEYRING<br>
            + #define KEYCTL_JOIN_SESSION_KEYRING 1<br>
              #endif<br>
             diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c<br>
            -index 6b1a98402..d1388df48 100644<br>
            +index 4386b38c4..de2077cf8 100644<br>
             --- a/src/basic/mkdir.c<br>
             +++ b/src/basic/mkdir.c<br>
            -@@ -28,6 +28,7 @@<br>
            +@@ -30,6 +30,7 @@<br>
              #include "path-util.h"<br>
              #include "stat-util.h"<br>
              #include "user-util.h"<br>
             +#include "missing.h"<br>
            <br>
            - int mkdir_safe_internal(const char *path, mode_t mode,
            uid_t uid, gid_t gid, mkdir_func_t _mkdir) {<br>
            + int mkdir_safe_internal(const char *path, mode_t mode,
            uid_t uid, gid_t gid, bool follow_symlink, mkdir_func_t
            _mkdir) {<br>
                      struct stat st;<br>
             diff --git a/src/basic/parse-util.c
            b/src/basic/parse-util.c<br>
            -index 4532f222c..7a30a0e06 100644<br>
            +index d03f60e01..4117a94c3 100644<br>
             --- a/src/basic/parse-util.c<br>
             +++ b/src/basic/parse-util.c<br>
            -@@ -30,6 +30,7 @@<br>
            +@@ -32,6 +32,7 @@<br>
              #include "parse-util.h"<br>
              #include "process-util.h"<br>
              #include "string-util.h"<br>
            @@ -76,10 +77,10 @@ index 4532f222c..7a30a0e06 100644<br>
              int parse_boolean(const char *v) {<br>
                      assert(v);<br>
             diff --git a/src/shared/pager.c b/src/shared/pager.c<br>
            -index 4d7b02c63..854efc0c9 100644<br>
            +index 39997278f..6767c7d71 100644<br>
             --- a/src/shared/pager.c<br>
             +++ b/src/shared/pager.c<br>
            -@@ -38,6 +38,7 @@<br>
            +@@ -39,6 +39,7 @@<br>
              #include "string-util.h"<br>
              #include "strv.h"<br>
              #include "terminal-util.h"<br>
            @@ -88,10 +89,10 @@ index 4d7b02c63..854efc0c9 100644<br>
              static pid_t pager_pid = 0;<br>
            <br>
             diff --git a/src/shared/uid-range.c
            b/src/shared/uid-range.c<br>
            -index b6ec47439..91ce9fb7f 100644<br>
            +index c38b7cc98..8ec6bf08d 100644<br>
             --- a/src/shared/uid-range.c<br>
             +++ b/src/shared/uid-range.c<br>
            -@@ -24,6 +24,7 @@<br>
            +@@ -25,6 +25,7 @@<br>
              #include "macro.h"<br>
              #include "uid-range.h"<br>
              #include "user-util.h"<br>
            @@ -100,5 +101,5 @@ index b6ec47439..91ce9fb7f 100644<br>
              static bool uid_range_intersect(UidRange *range, uid_t
            start, uid_t nr) {<br>
                      assert(range);<br>
             --<br>
            -2.14.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0003-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0015-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch<br>
            similarity index 88%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0003-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0015-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch<br>
            index 9a2d2c8..00ff925 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0003-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0015-don-t-fail-if-<wbr>GLOB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch<br>
            @@ -1,7 +1,7 @@<br>
            -From 5bbbc2a08a3b4283ec04af0e77e25f<wbr>b205aa8b82 Mon Sep
            17 00:00:00 2001<br>
            +From 860b4c4d9156b398ccb5450cb1f42f<wbr>0f711f7b5d Mon Sep
            17 00:00:00 2001<br>
             From: Emil Renner Berthing &lt;<a moz-do-not-send="true"
              href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
             Date: Mon, 23 Oct 2017 10:50:14 -0700<br>
            -Subject: [PATCH 03/12] don't fail if GLOB_BRACE and
            GLOB_ALTDIRFUNC is not<br>
            +Subject: [PATCH 15/32] don't fail if GLOB_BRACE and
            GLOB_ALTDIRFUNC is not<br>
              defined<br>
            <br>
             If the standard library doesn't provide brace<br>
            @@ -11,20 +11,20 @@ Dont use GNU GLOB extentions on
            non-glibc systems<br>
            <br>
             Conditionalize use of GLOB_ALTDIRFUNC<br>
            <br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
             Upstream-Status: Pending<br>
            <br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +---<br>
              src/basic/glob-util.c     | 20 +++++++++++++++++---<br>
              src/test/test-glob-util.c | 17 +++++++++++++++--<br>
              src/tmpfiles/tmpfiles.c   |  8 ++++++++<br>
              3 files changed, 40 insertions(+), 5 deletions(-)<br>
            <br>
             diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c<br>
            -index f611c42e4..ad6e2be8d 100644<br>
            +index 6e80a1e23..312bb3fd1 100644<br>
             --- a/src/basic/glob-util.c<br>
             +++ b/src/basic/glob-util.c<br>
            -@@ -27,13 +27,18 @@<br>
            +@@ -28,13 +28,18 @@<br>
              #include "macro.h"<br>
              #include "path-util.h"<br>
              #include "strv.h"<br>
            @@ -44,7 +44,7 @@ index f611c42e4..ad6e2be8d 100644<br>
                      if (!pglob-&gt;gl_closedir)<br>
                              pglob-&gt;gl_closedir = (void (*)(void *))
            closedir;<br>
                      if (!pglob-&gt;gl_readdir)<br>
            -@@ -44,10 +49,13 @@ int safe_glob(const char *path, int
            flags, glob_t *pglob) {<br>
            +@@ -45,10 +50,13 @@ int safe_glob(const char *path, int
            flags, glob_t *pglob) {<br>
                              pglob-&gt;gl_lstat = lstat;<br>
                      if (!pglob-&gt;gl_stat)<br>
                              pglob-&gt;gl_stat = stat;<br>
            @@ -60,7 +60,7 @@ index f611c42e4..ad6e2be8d 100644<br>
                      if (k == GLOB_NOMATCH)<br>
                              return -ENOENT;<br>
                      if (k == GLOB_NOSPACE)<br>
            -@@ -60,6 +68,12 @@ int safe_glob(const char *path, int
            flags, glob_t *pglob) {<br>
            +@@ -61,6 +69,12 @@ int safe_glob(const char *path, int
            flags, glob_t *pglob) {<br>
                      return 0;<br>
              }<br>
            <br>
            @@ -74,10 +74,10 @@ index f611c42e4..ad6e2be8d 100644<br>
                      _cleanup_globfree_ glob_t g = {};<br>
                      int k;<br>
             diff --git a/src/test/test-glob-util.c
            b/src/test/test-glob-util.c<br>
            -index af866e004..3afa09ada 100644<br>
            +index bd2f8fcfd..a10c77427 100644<br>
             --- a/src/test/test-glob-util.c<br>
             +++ b/src/test/test-glob-util.c<br>
            -@@ -29,6 +29,11 @@<br>
            +@@ -30,6 +30,11 @@<br>
              #include "glob-util.h"<br>
              #include "macro.h"<br>
              #include "rm-rf.h"<br>
            @@ -89,7 +89,7 @@ index af866e004..3afa09ada 100644<br>
            <br>
              static void test_glob_exists(void) {<br>
                      char name[] = "/tmp/test-glob_exists.XXXXXX"<wbr>;<br>
            -@@ -51,25 +56,33 @@ static void test_glob_exists(void) {<br>
            +@@ -52,25 +57,33 @@ static void test_glob_exists(void) {<br>
              static void test_glob_no_dot(void) {<br>
                      char template[] = "/tmp/test-glob-util.XXXXXXX";<br>
                      const char *fn;<br>
            @@ -126,10 +126,10 @@ index af866e004..3afa09ada 100644<br>
            <br>
                      (void) rm_rf(template,
            REMOVE_ROOT|REMOVE_PHYSICAL);<br>
             diff --git a/src/tmpfiles/tmpfiles.c
            b/src/tmpfiles/tmpfiles.c<br>
            -index 9419c99e2..07027a765 100644<br>
            +index a7ce1a804..bb0d62858 100644<br>
             --- a/src/tmpfiles/tmpfiles.c<br>
             +++ b/src/tmpfiles/tmpfiles.c<br>
            -@@ -71,6 +71,12 @@<br>
            +@@ -76,6 +76,12 @@<br>
              #include "umask-util.h"<br>
              #include "user-util.h"<br>
              #include "util.h"<br>
            @@ -142,7 +142,7 @@ index 9419c99e2..07027a765 100644<br>
            <br>
              /* This reads all files listed in /etc/tmpfiles.d/?*.conf
            and creates<br>
               * them in the file system. This is intended to be used to
            create<br>
            -@@ -1092,7 +1098,9 @@ static int item_do_children(Item *i,
            const char *path, action_t action) {<br>
            +@@ -1229,7 +1235,9 @@ static int item_do_children(Item *i,
            const char *path, action_t action) {<br>
            <br>
              static int glob_item(Item *i, action_t action, bool
            recursive) {<br>
                      _cleanup_globfree_ glob_t g = {<br>
            @@ -153,5 +153,5 @@ index 9419c99e2..07027a765 100644<br>
                      int r = 0, k;<br>
                      char **fn;<br>
             --<br>
            -2.14.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0004-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0016-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch<br>
            similarity index 77%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0004-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0016-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch<br>
            index cb5ae99..5021bea 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0004-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0016-src-basic-<wbr>missing.h-check-for-missing-__<wbr>compar_fn_t-.patch<br>
            @@ -1,24 +1,24 @@<br>
            -From c850b654e71677e0d6292f1345207b<wbr>9b5acffc33 Mon Sep
            17 00:00:00 2001<br>
            +From 55416ee5068cf8aeb35294adebfe15<wbr>1ace6ae71d Mon Sep
            17 00:00:00 2001<br>
             From: Emil Renner Berthing &lt;<a moz-do-not-send="true"
              href="mailto:systemd@esmil.dk">systemd@esmil.dk</a>&gt;<br>
             Date: Mon, 23 Oct 2017 11:31:03 -0700<br>
            -Subject: [PATCH 04/12] src/basic/missing.h: check for
            missing __compar_fn_t<br>
            +Subject: [PATCH 16/32] src/basic/missing.h: check for
            missing __compar_fn_t<br>
              typedef<br>
            <br>
             include missing.h for missing __compar_fn_t<br>
            <br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
             Upstream-Status: Pending<br>
            <br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +---<br>
              src/basic/missing.h | 5 +++++<br>
              src/basic/strbuf.c  | 1 +<br>
              2 files changed, 6 insertions(+)<br>
            <br>
             diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
            -index 8009888ad..671f341c6 100644<br>
            +index 1d4a70f25..8b6353f39 100644<br>
             --- a/src/basic/missing.h<br>
             +++ b/src/basic/missing.h<br>
            -@@ -1063,6 +1063,11 @@ struct input_mask {<br>
            +@@ -1090,6 +1090,11 @@ struct input_mask {<br>
              #define RENAME_NOREPLACE (1 &lt;&lt; 0)<br>
              #endif<br>
            <br>
            @@ -31,10 +31,10 @@ index 8009888ad..671f341c6 100644<br>
              #define KCMP_FILE 0<br>
              #endif<br>
             diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c<br>
            -index 00aaf9e62..9dc4a584a 100644<br>
            +index 8befffa66..bcb860f95 100644<br>
             --- a/src/basic/strbuf.c<br>
             +++ b/src/basic/strbuf.c<br>
            -@@ -23,6 +23,7 @@<br>
            +@@ -24,6 +24,7 @@<br>
            <br>
              #include "alloc-util.h"<br>
              #include "strbuf.h"<br>
            @@ -43,5 +43,5 @@ index 00aaf9e62..9dc4a584a 100644<br>
              /*<br>
               * Strbuf stores given strings in a single continuous
            allocated memory<br>
             --<br>
            -2.14.2<br>
            +2.11.0<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0006-Include-netinet-<wbr>if_ether.h.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0017-Include-netinet-<wbr>if_ether.h.patch<br>
            similarity index 81%<br>
            rename from meta/recipes-core/systemd/<wbr>systemd/0006-Include-netinet-<wbr>if_ether.h.patch<br>
            rename to meta/recipes-core/systemd/<wbr>systemd/0017-Include-netinet-<wbr>if_ether.h.patch<br>
            index 55887ee..c230127 100644<br>
            --- a/meta/recipes-core/systemd/<wbr>systemd/0006-Include-netinet-<wbr>if_ether.h.patch<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0017-Include-netinet-<wbr>if_ether.h.patch<br>
            @@ -1,17 +1,17 @@<br>
            -From 21080b6a40d0a4ddd2db8f0fa37686<wbr>f6fa885d1c Mon Sep
            17 00:00:00 2001<br>
            +From b8bac091279f255aafdba251f8ccc5<wbr>f6afb2cd5c Mon Sep
            17 00:00:00 2001<br>
             From: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
             Date: Mon, 23 Oct 2017 11:38:33 -0700<br>
            -Subject: [PATCH 06/12] Include netinet/if_ether.h<br>
            +Subject: [PATCH 17/32] Include netinet/if_ether.h<br>
            <br>
             Fixes<br>
            -/mnt/a/oe/build/tmp/work/<wbr>mips32r2-bec-linux-musl/<wbr>systemd/1_234-r0/recipe-<wbr>sysroot/usr/include/netinet/<wbr>if_ether.h:101:8:
            error: redefinition of 'struct ethhdr'<br>
            +/path/to/systemd/recipe-<wbr>sysroot/usr/include/netinet/<wbr>if_ether.h:101:8:
            error: redefinition of 'struct ethhdr'<br>
              struct ethhdr {<br>
                     ^~~~~~<br>
            <br>
            -Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            ----<br>
             Upstream-Status: Pending<br>
            <br>
            +Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true"
              href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
            +---<br>
              src/libsystemd/sd-netlink/<wbr>netlink-types.c | 1 +<br>
              src/network/netdev/tuntap.c               | 1 +<br>
              src/network/networkd-brvlan.c             | 1 +<br>
            @@ -20,10 +20,10 @@ Upstream-Status: Pending<br>
              5 files changed, 5 insertions(+), 2 deletions(-)<br>
            <br>
             diff --git a/src/libsystemd/sd-netlink/<wbr>netlink-types.c
            b/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
            -index 923f7dd10..b95b1e4b2 100644<br>
            +index f8be296d3..46737b558 100644<br>
             --- a/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
             +++ b/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
            -@@ -19,6 +19,7 @@<br>
            +@@ -20,6 +20,7 @@<br>
            <br>
              #include &lt;stdint.h&gt;<br>
              #include &lt;sys/socket.h&gt;<br>
            @@ -32,10 +32,10 @@ index 923f7dd10..b95b1e4b2 100644<br>
              #include &lt;linux/rtnetlink.h&gt;<br>
              #include &lt;linux/can/netlink.h&gt;<br>
             diff --git a/src/network/netdev/tuntap.c
            b/src/network/netdev/tuntap.c<br>
            -index 3d6280884..40e58c38f 100644<br>
            +index 4597a7fee..941f2a324 100644<br>
             --- a/src/network/netdev/tuntap.c<br>
             +++ b/src/network/netdev/tuntap.c<br>
            -@@ -18,6 +18,7 @@<br>
            +@@ -19,6 +19,7 @@<br>
              ***/<br>
            <br>
              #include &lt;fcntl.h&gt;<br>
            @@ -44,10 +44,10 @@ index 3d6280884..40e58c38f 100644<br>
              #include &lt;net/if.h&gt;<br>
              #include &lt;netinet/if_ether.h&gt;<br>
             diff --git a/src/network/networkd-brvlan.<wbr>c
            b/src/network/networkd-brvlan.<wbr>c<br>
            -index fa5d3ee7f..e0828962a 100644<br>
            +index 99dd41629..90407c9d8 100644<br>
             --- a/src/network/networkd-brvlan.<wbr>c<br>
             +++ b/src/network/networkd-brvlan.<wbr>c<br>
            -@@ -18,6 +18,7 @@<br>
            +@@ -19,6 +19,7 @@<br>
              ***/<br>
            <br>
              #include &lt;netinet/in.h&gt;<br>
            @@ -56,10 +56,10 @@ index fa5d3ee7f..e0828962a 100644<br>
              #include &lt;stdbool.h&gt;<br>
            <br>
             diff --git a/src/udev/net/ethtool-util.c
            b/src/udev/net/ethtool-util.c<br>
            -index 201fc2343..5f7cc2a0a 100644<br>
            +index 3ed8a51fd..cfb39ba59 100644<br>
             --- a/src/udev/net/ethtool-util.c<br>
             +++ b/src/udev/net/ethtool-util.c<br>
            -@@ -16,7 +16,7 @@<br>
            +@@ -17,7 +17,7 @@<br>
                You should have received a copy of the GNU Lesser
            General Public License<br>
                along with systemd; If not, see &lt;<a
              moz-do-not-send="true" href="http://www.gnu.org/licenses/"
              rel="noreferrer" target="_blank">http://www.gnu.org/licenses/</a>&gt;<wbr>.<br>
              ***/<br>
            @@ -69,10 +69,10 @@ index 201fc2343..5f7cc2a0a 100644<br>
              #include &lt;sys/ioctl.h&gt;<br>
              #include &lt;linux/ethtool.h&gt;<br>
             diff --git a/src/udev/udev-builtin-net_<wbr>setup_link.c
            b/src/udev/udev-builtin-net_<wbr>setup_link.c<br>
            -index 8e4777513..d01fff2a4 100644<br>
            +index 40158e0af..fbead3a7b 100644<br>
             --- a/src/udev/udev-builtin-net_<wbr>setup_link.c<br>
             +++ b/src/udev/udev-builtin-net_<wbr>setup_link.c<br>
            -@@ -16,7 +16,7 @@<br>
            +@@ -17,7 +17,7 @@<br>
                You should have received a copy of the GNU Lesser
            General Public License<br>
                al...<br>
            <br>
            [Message clipped]  </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------C9011CB4348048E2C5755D89--

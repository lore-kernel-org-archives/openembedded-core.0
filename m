Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id E02F06C4E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 17:24:51 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id g17so11336591ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ogazaezirdiRXV3XE+rxvaJtM5IlotxDV6LiZigYUmo=;
	b=B/04U2x3YWf+uZHfwafPPzdOcep8kKCi/mm/HJ4sPR33HRlhY7/DjMrREymkdsuHxp
	7HfkVsOjlhbGgRo/w9bcuYM5zJvTPYiGZ/wZ1KCwXU2nMSAp/WPRb7aBl2AdDrj+rbsC
	axZyqLwB/cy0ydxaPXLPUDm4aYL2D03gWCxyDhTZfC3sdJMvoK0Ma734jdte1j5CKLXk
	5J+iFzaBOvKN8Rr1D5TE+0MmvadCRB/cC3c3Fz95bY/rARy3EWMp1+u/Q79MGARFK1P0
	JJJkP+EgB4yryVn8bSYnOzp9MBAP1Ncm9jgeXKiMV2veYMnMgLkULKZq5+3qE35iRoGO
	0s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ogazaezirdiRXV3XE+rxvaJtM5IlotxDV6LiZigYUmo=;
	b=TSuP8Cz/AvA/SP4JSv0DmEVtjKnOnCyzFCZXncQhupQ1DJy9WdwP60hIxJaK87H7Pm
	ZNmxSO8ar2oIpaae9gtwuDqCwM/4MtBvapD+ZPyGpPK8IUhkyp3yIE/misldeKhrVZgg
	1ldi3CEeWx+HJOzx8hmFXMpCWRNMPv44KRDYl9f/UI3mgE9n4IatyynReyidSpIsS7zB
	1XqV/oP91eZW+udylMp5UNWGGbzYPI/Ip9fhTB/Nqc+Z0KEgQdX5gCfaPMfpdFOQI+Vb
	7jxrXWr9iGqXpNmuK7mVcrKaILHIk3UemwEoNz7Toi/rAkiXCK1NPO+d66UkPrjEyxOr
	7kJw==
X-Gm-Message-State: APjAAAVseGl5x5MhQlGDur6x/+W/2/DKEflL5GbgeJEs9akumGy3E8lW
	QSzffDdYzcvXZ8h/+YsE74GsfnvB65FxJ3Lxwi7oYg==
X-Google-Smtp-Source: APXvYqxpQntRv85rQjsJXXAApYx8DFeKW4DevXImTFWQFKBjF7Sfdf17L5PUk0xu7Ji8wXR9lMO2OAyTEsiiEzjYa/s=
X-Received: by 2002:a24:7d84:: with SMTP id b126mr2792505itc.58.1552670692466; 
	Fri, 15 Mar 2019 10:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
In-Reply-To: <CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 15 Mar 2019 18:24:40 +0100
Message-ID: <CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Fri, 15 Mar 2019 17:24:52 -0000
Content-Type: text/plain; charset="UTF-8"

Replied to wrong mailing

On Wed, Feb 6, 2019 at 5:38 PM <git@git.openembedded.org> wrote:
>
> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a change to branch thud
> in repository openembedded-core.
>
>     from ad0a553  build-appliance-image: Update to thud head revision
>      add 0bbe3d5  kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
>      add 933712e  linux-yocto/4.18: update to v4.18.22
>      add 193eb75  icecc: readlink -f on the recipe-sysroot gcc/g++
>      add 57673fe  icecc: Trivial simplification
>      add d4ec470  icecc: Syntax error meant that we weren't waiting for tarball generation
>      add 46db052  icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
>      add 9d3587d  icecc: patchelf is needed by icecc-create-env
>      add d8bf7e5  eudev: upgrade 3.2.5 -> 3.2.7
>      add a316146  gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
>      add 88581ac  libatomic-ops: upgrade 7.6.6 -> 7.6.8
>      add 7c6e9f5  libpng: upgrade 1.6.35 -> 1.6.36
>      add be1429b  common-licenses: update Libpng license text
>      add 93c76fe  i2c-tools: upgrade 4.0 -> 4.1
>      add b09f261  oeqa/utils/qemurunner: Print output when failed to login
>      add 47731b4  grub2: Fix passing null to printf formats
>      add e3ef28a  gnupg: Upgrade to 2.2.12 release
>      add a44c7ba  tzdata/tzcode-native: update to 2018i
>      add 4a7945c  lighttpd: update to 1.4.51
>      add 4f14eac  boost: update to 1.69.0
In my infinite naivety I just updated thud.

* Many updates here - wasn't there some policy just to update in case
of 'emergency'?
* How can you update boost on a stable branch - a first class citizen
for build trouble?

Wonder which further fallout I'll get...

Andreas
>      add 70e942e  oeqa/utils/qemurunner: set timeout to 60s for run_serial
>      add 1f3577f  libsndfile1: Security fix CVE-2017-17456/17457 CVE-2018-19661/19662
>      add 86a4eca  binutils: Fix build with clang
>      add 2c12e1d  oeqa: Fix for QEMU_USE_KVM
>      add 30b68e8  nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
>      add f57d83c  sstate: add support for caching shared workdir tasks
>      add 284252d  package.bbclass: fix python unclosed file ResourceWarning
>      add f51e59b  scripts/oe-git-archive: fix non-existent key referencing error
>      add 2bb4774  toolchain-scripts: run post-relocate scripts for every environment
>      add 9841962  patch: reproducibility: Fix host umask leakage
>      add 694d62e  kernel: don't assign the build user/host
>      add 778f33d  classes: Correctly markup regex strings
>      add bfd7257  testimage: Remove duplicate dependencies
>      add 16c9002  testimage: Simplfy DEFAULT_TEST_SUITES logic
>      add 7dce356  testimage: Further cleanup DEFAULT_TEST_SUITES
>      add 1da4c2e  testimage: Enable autorunning of the package manager testsuites
>      add ab49891  testimage: Add support for slirp
>      add 0469c75  testimage: Add possibility to pass parmeters to qemu
>      add 51423c3  testimage.bbclass: remove boot parameter systemd.log_target
>      add 5fedb01  meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
>      add 310a2b1  oeqa: make it work for multiple users
>      add d082852  classes/testsdk: Split implementation into classes
>      add 4b5a4b7  runqemu: clean up subprocess usage
>      add 79471a2  runqemu-gen-tapdevs: Allow run --help without sudo
>      add a916a92  wic: sdimage-bootpart: Use mmcblk0 drive instead of bogus mmcblk
>      add 27b9008  binutils: Upgrade to latest on 2.31 release branch
>      add f829801  binutils: bfd doesn't handle ELF compressed data alignment
>      add 601f870  oeqa/runtime/cases: Improve test dependency information
>      add e65d168  oeqa/runtime/cases: Improve dependencies of kernel/gcc/build tests
>      add c3d51e9  oeqa/qemu & runtime: qemu do not need ip input from external
>      add 63f0ce0  oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM
>      add ffea871  oeqa/selftest/runqemu: Enable kvm when QEMU_USE_KVM is set
>      add 34efb67  oeqa/utils/buildproject: Only clean files if we've done something
>      add e35ced7  kernel.bbclass: Fix incorrect deploying of fitimage.initramfs
>      add 7800f42  linux-yocto/4.18: update to v4.18.25
>      add aee9c2c  systemd-systemctl-native: handle Install wildcards
>      add f2c5e46  systemd: backport fix to stop enabling ECN
>      add 9a78a88  systemd: fix compile error for x32
>      add 82cb42d  systemd: Fix memory use after free errors
>      add 925113c  systemd: backport a patch to fix meson 0.49.0 issue
>      add 1bd93c6  systemd: Add PACKAGECONFIG for gnutls
>      add 2da88ec  meta: remove True option to getVar calls (again)
>      add 419aaf6  systemd: Correct and clean up user/group definitions
>      add 86de2bf  systemd: Correct a conditional add to SYSTEMD_PACKAGES
>      add 403e74b  systemd: Security fix CVE-2018-16864
>      add d5d2b82  systemd: Security fix CVE-2018-16865
>      add 5e4d9fd  systemd: Security fix CVE-2018-16866
>      add 6a5cce8  eSDK.py: avoid error in tearDownClass due to race condistion
>      add 748f946  eSDK.py: unset BBPATH and BUILDDIR to avoid eSDK failure
>
> No new revisions were added by this update.
>
> Summary of changes:
>  meta/classes/clutter.bbclass                       |   4 +-
>  meta/classes/cmake.bbclass                         |   2 +-
>  meta/classes/icecc.bbclass                         |  72 ++---
>  meta/classes/insane.bbclass                        |  16 +-
>  meta/classes/kernel.bbclass                        |   9 +-
>  meta/classes/license_image.bbclass                 |  14 +-
>  meta/classes/package.bbclass                       |   3 +-
>  meta/classes/patch.bbclass                         |   1 +
>  meta/classes/perl-version.bbclass                  |   2 +-
>  meta/classes/sstate.bbclass                        |   6 +
>  meta/classes/systemd.bbclass                       |   2 +-
>  meta/classes/testimage.bbclass                     |  74 ++---
>  meta/classes/testsdk.bbclass                       | 217 +-------------
>  meta/classes/toolchain-scripts.bbclass             |  46 +--
>  meta/classes/update-alternatives.bbclass           |   2 +-
>  meta/classes/useradd-staticids.bbclass             |   4 +-
>  meta/files/common-licenses/Libpng                  | 200 +++++++------
>  meta/lib/oe/types.py                               |  24 ++
>  meta/lib/oeqa/core/target/qemu.py                  |   5 +-
>  meta/lib/oeqa/manual/bsp-qemu.json                 |   4 +-
>  meta/lib/oeqa/runtime/cases/buildcpio.py           |   9 +-
>  meta/lib/oeqa/runtime/cases/buildgalculator.py     |   9 +-
>  meta/lib/oeqa/runtime/cases/buildlzip.py           |  12 +-
>  meta/lib/oeqa/runtime/cases/date.py                |   2 +
>  meta/lib/oeqa/runtime/cases/df.py                  |   2 +
>  meta/lib/oeqa/runtime/cases/gcc.py                 |  19 +-
>  meta/lib/oeqa/runtime/cases/kernelmodule.py        |   8 +-
>  meta/lib/oeqa/runtime/cases/opkg.py                |   4 +-
>  meta/lib/oeqa/runtime/cases/ptest.py               |   2 +
>  meta/lib/oeqa/runtime/cases/python.py              |   8 +-
>  meta/lib/oeqa/runtime/cases/rpm.py                 |  31 +-
>  meta/lib/oeqa/runtime/cases/scp.py                 |   2 +
>  meta/lib/oeqa/runtime/cases/ssh.py                 |   2 +
>  meta/lib/oeqa/runtime/cases/stap.py                |   6 +-
>  meta/lib/oeqa/runtime/cases/xorg.py                |   2 +
>  meta/lib/oeqa/runtime/context.py                   |   7 +-
>  meta/lib/oeqa/sdk/testsdk.py                       | 142 +++++++++
>  meta/lib/oeqa/sdkext/testsdk.py                    | 104 +++++++
>  meta/lib/oeqa/selftest/cases/eSDK.py               |   8 +-
>  meta/lib/oeqa/selftest/cases/runqemu.py            |   5 +
>  meta/lib/oeqa/targetcontrol.py                     |  12 +-
>  meta/lib/oeqa/utils/buildproject.py                |   5 +
>  meta/lib/oeqa/utils/dump.py                        |   2 +-
>  meta/lib/oeqa/utils/qemurunner.py                  |   3 +-
>  meta/lib/oeqa/utils/qemutinyrunner.py              |   2 +-
>  .../0001-grub-setup-Debug-message-cleanup.patch    |  34 +++
>  meta/recipes-bsp/grub/grub2.inc                    |   1 +
>  meta/recipes-core/meta/dummy-sdk-package.inc       |   4 +-
>  .../meta/nativesdk-buildtools-perl-dummy.bb        |  22 +-
>  .../meta/nativesdk-sdk-provides-dummy.bb           |   1 -
>  .../recipes-core/meta/target-sdk-provides-dummy.bb |  27 ++
>  meta/recipes-core/systemd/systemd-boot_239.bb      |   3 +-
>  .../systemd/systemd-systemctl/systemctl            |  15 +-
>  ...tl.d-request-ECN-on-both-in-and-outgoing-.patch |  36 +++
>  .../0001-meson-rename-Ddebug-to-Ddebug-extra.patch |  45 +++
>  ...l-Don-t-pass-null-directive-argument-to-s.patch |  31 ++
>  ...ync-changes-type-of-drift_freq-to-int64_t.patch |  49 +++
>  ...Fix-use-after-free-case-in-load_from_path.patch |  43 +++
>  ...-not-store-the-iovec-entry-for-process-co.patch | 204 +++++++++++++
>  ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  56 ++++
>  ...ote-set-a-limit-on-the-number-of-fields-i.patch |  84 ++++++
>  .../0027-journal-fix-syslog_parse_identifier.patch |  77 +++++
>  ...not-remove-multiple-spaces-after-identifi.patch |  84 ++++++
>  meta/recipes-core/systemd/systemd_239.bb           |  35 ++-
>  .../udev/{eudev_3.2.5.bb => eudev_3.2.7.bb}        |   4 +-
>  meta/recipes-devtools/binutils/binutils-2.31.inc   |  11 +-
>  ...check-for-input-file-matching-output-file.patch |  59 ----
>  ...location-where-GOT-information-is-collect.patch | 201 -------------
>  ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  38 ---
>  ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  46 ---
>  ...tion-was-still-being-generated-when-symbo.patch |  40 ---
>  ...compressed-header-alignment-correctly-by-.patch | 332 +++++++++++++++++++++
>  ...ignment-of-uncompressed-section-from-ch_a.patch | 200 +++++++++++++
>  .../binutils/binutils/CVE-2018-17358.patch         |  37 +--
>  .../binutils/binutils/CVE-2018-17360.patch         |  24 +-
>  .../binutils/binutils/CVE-2018-18309.patch         |  87 +-----
>  .../binutils/binutils/CVE-2018-18605.patch         |  20 +-
>  .../binutils/binutils/CVE-2018-18606.patch         |  22 +-
>  .../binutils/binutils/CVE-2018-18607.patch         |  25 +-
>  .../binutils/binutils/clang-bfd-fix.patch          |  30 ++
>  ...s-eeprog-Module.mk-Add-missing-dependency.patch |  32 --
>  ...01-lib-Module.mk-Add-missing-dependencies.patch |  37 ---
>  ...-tools-Module.mk-Add-missing-dependencies.patch |  66 ----
>  .../i2c-tools/files/remove-i2c-dev.patch           |  98 ------
>  .../{i2c-tools_4.0.bb => i2c-tools_4.1.bb}         |   8 +-
>  .../python/python-native_2.7.15.bb                 |   2 +-
>  .../python/python3-native_3.5.6.bb                 |   2 +-
>  meta/recipes-devtools/rpm/rpm_4.14.2.bb            |   6 +-
>  .../{lighttpd_1.4.50.bb => lighttpd_1.4.51.bb}     |   4 +-
>  ...code-native_2018g.bb => tzcode-native_2018i.bb} |   8 +-
>  .../tzdata/{tzdata_2018g.bb => tzdata_2018i.bb}    |   4 +-
>  ...28.0.bb => gsettings-desktop-schemas_3.28.1.bb} |   4 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |   6 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_4.18.bb      |  20 +-
>  .../libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb}  |   8 +-
>  ...-a-ulaw-fix-multiple-buffer-overflows-432.patch | 101 +++++++
>  .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
>  ...bjam-native_1.68.0.bb => bjam-native_1.69.0.bb} |   0
>  .../boost/{boost-1.68.0.inc => boost-1.69.0.inc}   |   4 +-
>  meta/recipes-support/boost/boost.inc               |   1 -
>  ...-arch-instruction-set-flags-we-do-that-o.patch} |  23 +-
>  ...ucibility-add-file-directive-to-assembler.patch | 243 ---------------
>  .../boost/{boost_1.68.0.bb => boost_1.69.0.bb}     |   6 +-
>  ...c-use-a-custom-value-for-the-location-of-.patch |   6 +-
>  meta/recipes-support/gnupg/gnupg/relocate.patch    |   2 +-
>  .../gnupg/{gnupg_2.2.11.bb => gnupg_2.2.12.bb}     |   4 +-
>  ...batomic-ops_7.6.6.bb => libatomic-ops_7.6.8.bb} |  10 +-
>  scripts/lib/wic/canned-wks/sdimage-bootpart.wks    |   4 +-
>  scripts/oe-git-archive                             |  19 +-
>  scripts/runqemu                                    |  63 ++--
>  scripts/runqemu-gen-tapdevs                        |  27 +-
>  112 files changed, 2263 insertions(+), 1706 deletions(-)
>  create mode 100644 meta/lib/oeqa/sdk/testsdk.py
>  create mode 100644 meta/lib/oeqa/sdkext/testsdk.py
>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch
>  rename meta/recipes-core/udev/{eudev_3.2.5.bb => eudev_3.2.7.bb} (95%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/remove-i2c-dev.patch
>  rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.0.bb => i2c-tools_4.1.bb} (77%)
>  rename meta/recipes-extended/lighttpd/{lighttpd_1.4.50.bb => lighttpd_1.4.51.bb} (96%)
>  rename meta/recipes-extended/tzcode/{tzcode-native_2018g.bb => tzcode-native_2018i.bb} (70%)
>  rename meta/recipes-extended/tzdata/{tzdata_2018g.bb => tzdata_2018i.bb} (98%)
>  rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.28.0.bb => gsettings-desktop-schemas_3.28.1.bb} (70%)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb} (74%)
>  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
>  rename meta/recipes-support/boost/{bjam-native_1.68.0.bb => bjam-native_1.69.0.bb} (100%)
>  rename meta/recipes-support/boost/{boost-1.68.0.inc => boost-1.69.0.inc} (85%)
>  rename meta/recipes-support/boost/boost/{0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch => 0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
>  delete mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
>  rename meta/recipes-support/boost/{boost_1.68.0.bb => boost_1.69.0.bb} (56%)
>  rename meta/recipes-support/gnupg/{gnupg_2.2.11.bb => gnupg_2.2.12.bb} (92%)
>  rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.6.bb => libatomic-ops_7.6.8.bb} (61%)
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


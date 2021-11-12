Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FACC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 06:13:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.11971.1636697591483987704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 22:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220291037"
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800";
   d="scan'208";a="220291037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 22:13:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800";
   d="scan'208";a="670545973"
Received: from wanmohds-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.139.200])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 22:13:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/28] Pull request (cover letter only)
Date: Fri, 12 Nov 2021 14:12:56 +0800
Message-Id: <cover.1636697455.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 06:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158208

Please merge these changes.

Thanks,

Anuj

The following changes since commit 3cbe3e6f932151800793854ad5d3569dc6f36ab1:

  qemu.inc: Remove empty egg-info directories before running meson (2021-11-03 00:40:35 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexander Kanavin (2):
  linux-firmware: upgrade 20210919 -> 20211027
  libpcre/libpcre2: correct SRC_URI

Andres Beltran (1):
  create-spdx: Set the Organization field via a variable

Anuj Mittal (1):
  glibc-version.inc: remove branch= from GLIBC_GIT_URI

Bruce Ashfield (4):
  linux-yocto/5.14: update to v5.14.15
  linux-yocto/5.10: update to v5.10.76
  linux-yocto-rt/5.10: update to -rt54
  strace: fix build against 5.15 kernel/kernel-headers

Jose Quaresma (1):
  sstate: another fix for touching files inside pseudo

Kai Kang (1):
  squashfs-tools: fix CVE-2021-41072

Khem Raj (1):
  kernel-devsrc: Add vdso.lds and other build files for riscv64 as well

Manuel Leonhardt (2):
  sstate: Account for reserved characters when shortening sstate
    filenames
  dpkg: Install dkpg-perl scripts to versioned perl directory

Peter Kjellerstedt (2):
  libx11: Update LICENSE to better reflect reality
  libx11-compose-data: Update LICENSE to better reflect reality

Richard Purdie (9):
  opkg: Fix poor operator combination choice
  linunistring: Add missing gperf-native dependency
  pseudo: Add fcntl64 wrapper
  meta: Add explict branch to git SRC_URIs
  meta/scripts: Manual git url branch additions
  scripts/convert-srcuri: Update SRC_URI conversion script to handle
    github url changes
  recipes: Update github.com urls to use https
  go-helloworld/glide: Fix urls
  bitbake.conf: Fix corruption of GNOME mirror url

Ross Burton (1):
  meson: set objcopy in the cross and native toolchain files

Tom Hochstein (3):
  wayland: Fix wayland-tools packaging
  nativesdk-packagegroup-sdk-host.bb: Update host tools for wayland
  bitbake.conf: Use wayland distro feature for native builds

 .../devtool/devtool-upgrade-test2_git.bb      |   2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |   2 +-
 .../git-submodule-test/git-submodule-test.bb  |   2 +-
 meta/classes/create-spdx.bbclass              |  10 +-
 meta/classes/devupstream.bbclass              |   2 +-
 meta/classes/meson.bbclass                    |   2 +
 meta/classes/sstate.bbclass                   |  14 +-
 meta/conf/bitbake.conf                        |   4 +-
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |   2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   6 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |   2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |   2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |   2 +-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb       |   2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |   2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   2 +-
 .../connman/connman-gnome_0.7.bb              |   2 +-
 .../libnss-mdns/libnss-mdns_0.15.1.bb         |   2 +-
 .../libuv/libuv_1.42.0.bb                     |   2 +-
 .../mobile-broadband-provider-info_git.bb     |   2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |   2 +-
 meta/recipes-core/fts/fts_1.2.7.bb            |   2 +-
 .../glibc/cross-localedef-native_2.34.bb      |   2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |   2 +-
 .../initscripts/init-system-helpers_1.60.bb   |   2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 +-
 meta/recipes-core/musl/libucontext_git.bb     |   2 +-
 meta/recipes-core/musl/musl-obstack.bb        |   2 +-
 meta/recipes-core/musl/musl-utils.bb          |   2 +-
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 meta/recipes-core/ncurses/ncurses.inc         |   2 +-
 .../nativesdk-packagegroup-sdk-host.bb        |   2 +-
 meta/recipes-core/psplash/psplash_git.bb      |   2 +-
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |   2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |   2 +-
 .../btrfs-tools/btrfs-tools_5.13.1.bb         |   2 +-
 .../createrepo-c/createrepo-c_0.17.4.bb       |   2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb    |   2 +-
 meta/recipes-devtools/dnf/dnf_4.8.0.bb        |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc           |   4 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
 .../erofs-utils/erofs-utils_1.3.bb            |   2 +-
 meta/recipes-devtools/file/file_5.40.bb       |   2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb   |   2 +-
 .../gnu-config/gnu-config_git.bb              |   2 +-
 .../libcomps/libcomps_0.1.17.bb               |   2 +-
 meta/recipes-devtools/libdnf/libdnf_0.63.1.bb |   2 +-
 .../librepo/librepo_1.14.1.bb                 |   2 +-
 meta/recipes-devtools/llvm/llvm_git.bb        |   2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   2 +-
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |   2 +-
 meta/recipes-devtools/opkg/opkg_0.4.5.bb      |   2 +-
 .../patchelf/patchelf_0.13.bb                 |   2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |   2 +-
 .../CVE-2021-41072-requisite-1.patch          | 135 ++++++++
 .../CVE-2021-41072-requisite-2.patch          | 108 ++++++
 .../CVE-2021-41072-requisite-3.patch          | 326 ++++++++++++++++++
 .../squashfs-tools/CVE-2021-41072.patch       | 325 +++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   6 +-
 ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++++
 meta/recipes-devtools/strace/strace_5.14.bb   |   1 +
 .../systemd-bootchart_234.bb                  |   2 +-
 .../tcf-agent/tcf-agent_git.bb                |   2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |   2 +-
 .../rust-hello-world/rust-hello-world_git.bb  |   2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   2 +-
 .../go-examples/go-helloworld_0.1.bb          |   2 +-
 .../iputils/iputils_20210722.bb               |   2 +-
 .../recipes-extended/libaio/libaio_0.3.112.bb |   2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |   2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |   2 +-
 .../libsolv/libsolv_0.7.19.bb                 |   2 +-
 meta/recipes-extended/ltp/ltp_20210524.bb     |   2 +-
 .../net-tools/net-tools_2.10.bb               |   2 +-
 meta/recipes-extended/procps/procps_3.3.17.bb |   2 +-
 meta/recipes-extended/psmisc/psmisc_23.4.bb   |   2 +-
 .../rpcsvc-proto/rpcsvc-proto.bb              |   2 +-
 .../stress-ng/stress-ng_0.13.00.bb            |   2 +-
 .../sysklogd/sysklogd_2.2.3.bb                |   2 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |   2 +-
 meta/recipes-extended/zstd/zstd_1.5.0.bb      |   2 +-
 meta/recipes-gnome/libportal/libportal_0.4.bb |   2 +-
 .../glslang/glslang_11.5.0.bb                 |   2 +-
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |   2 +-
 .../libfakekey/libfakekey_git.bb              |   2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |   2 +-
 .../libva/libva-utils_2.12.0.bb               |   2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |   2 +-
 .../spir/spirv-headers_1.5.4.bb               |   2 +-
 .../spir/spirv-tools_2021.2.bb                |   2 +-
 .../vulkan/vulkan-headers_1.2.182.0.bb        |   2 +-
 .../vulkan/vulkan-loader_1.2.182.0.bb         |   2 +-
 .../vulkan/vulkan-samples_git.bb              |   2 +-
 .../vulkan/vulkan-tools_1.2.182.0.bb          |   2 +-
 .../wayland/wayland_1.19.0.bb                 |   6 +-
 .../xinput-calibrator_git.bb                  |   2 +-
 .../xorg-driver/xf86-video-intel_git.bb       |   2 +-
 .../xorg-lib/libx11-compose-data_1.6.8.bb     |   2 +-
 .../recipes-graphics/xorg-lib/libx11_1.7.2.bb |   2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |   2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |   2 +-
 meta/recipes-kernel/dtc/dtc.inc               |   2 +-
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/kmod/kmod.inc             |   2 +-
 ...20210919.bb => linux-firmware_20211027.bb} |   4 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  10 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.14.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.14.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb |  26 +-
 meta/recipes-kernel/powertop/powertop_2.14.bb |   2 +-
 .../systemtap/systemtap_git.inc               |   2 +-
 meta/recipes-multimedia/x264/x264_git.bb      |   2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |   2 +-
 .../matchbox-config-gtk_0.2.bb                |   2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |   2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |   2 +-
 .../matchbox-terminal_0.2.bb                  |   2 +-
 .../matchbox-theme-sato_0.2.bb                |   2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |   2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |   2 +-
 .../bmap-tools/bmap-tools_3.6.bb              |   2 +-
 .../boost/boost-build-native_4.4.1.bb         |   2 +-
 .../ca-certificates_20211016.bb               |   2 +-
 .../dos2unix/dos2unix_7.4.2.bb                |   2 +-
 .../gnome-desktop-testing_2021.1.bb           |   2 +-
 meta/recipes-support/libgit2/libgit2_1.1.1.bb |   2 +-
 .../libjitterentropy_3.1.0.bb                 |   2 +-
 .../recipes-support/libpcre/libpcre2_10.37.bb |   4 +-
 meta/recipes-support/libpcre/libpcre_8.45.bb  |   2 +-
 .../libseccomp/libseccomp_2.5.1.bb            |   2 +-
 .../libunistring/libunistring_0.9.10.bb       |   1 +
 meta/recipes-support/lz4/lz4_1.9.3.bb         |   2 +-
 meta/recipes-support/numactl/numactl_git.bb   |   2 +-
 .../recipes-support/p11-kit/p11-kit_0.24.0.bb |   2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |   2 +-
 .../rng-tools/rng-tools_6.14.bb               |   2 +-
 .../shared-mime-info/shared-mime-info_git.bb  |   2 +-
 meta/recipes-support/vim/vim.inc              |   2 +-
 meta/recipes-support/xxhash/xxhash_0.8.0.bb   |   2 +-
 scripts/contrib/convert-srcuri.py             |  77 +++++
 scripts/lib/recipetool/create.py              |   3 +
 148 files changed, 1332 insertions(+), 189 deletions(-)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072-requisite-1.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072-requisite-2.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072-requisite-3.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)
 create mode 100755 scripts/contrib/convert-srcuri.py

-- 
2.31.1



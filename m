Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F0CC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.5106.1637033069573146147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220822386"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="220822386"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023914"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/14] Review request
Date: Tue, 16 Nov 2021 11:24:06 +0800
Message-Id: <cover.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158323

Please review these changes for hardknott. No issues seen while testing
on autobuilder.

Thanks,

Anuj

The following changes since commit 0ca080a23c2770a15138f702d4c879bbd90ca360:

  build-appliance-image: Update to hardknott head revision (2021-11-04 11:58:28 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (2):
  linux-firmware: upgrade 20210919 -> 20211027
  cross-canadian: correct the location of pkg-config files

Anuj Mittal (2):
  meta: add explicit branch and protocol to SRC_URI
  llvm: bump HASHEQUIV_HASH_VERSION

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.76
  linux-yocto-rt/5.10: update to -rt54

Chen Qi (1):
  avahi: update CVE id fixed by local-ping.patch

Jose Quaresma (1):
  sstate: another fix for touching files inside pseudo

Manuel Leonhardt (1):
  sstate: Account for reserved characters when shortening sstate
    filenames

Richard Purdie (5):
  linunistring: Add missing gperf-native dependency
  pseudo: Add in ability to flush database with shutdown request
  pseudo: Add fcntl64 wrapper
  scripts/convert-srcuri: Backport SRC_URI conversion script from master
    branch
  meta/scripts: Manual git url branch additions

 .../devtool/devtool-upgrade-test2_git.bb      |  2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |  2 +-
 .../git-submodule-test/git-submodule-test.bb  |  2 +-
 meta/classes/cross-canadian.bbclass           |  2 +-
 meta/classes/devupstream.bbclass              |  2 +-
 meta/classes/sstate.bbclass                   | 14 ++--
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |  2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |  6 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |  2 +-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb       |  2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb  |  2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../avahi/files/local-ping.patch              |  1 +
 .../connman/connman-gnome_0.7.bb              |  2 +-
 .../libnss-mdns/libnss-mdns_0.14.1.bb         |  2 +-
 .../libuv/libuv_1.41.0.bb                     |  2 +-
 .../mobile-broadband-provider-info_git.bb     |  2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
 meta/recipes-core/fts/fts_1.2.7.bb            |  2 +-
 .../glibc/cross-localedef-native_2.33.bb      |  2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |  2 +-
 .../initscripts/init-system-helpers_1.60.bb   |  2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 meta/recipes-core/musl/libucontext_git.bb     |  2 +-
 meta/recipes-core/musl/musl-obstack.bb        |  2 +-
 meta/recipes-core/musl/musl-utils.bb          |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 meta/recipes-core/netbase/netbase_6.2.bb      |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
 .../btrfs-tools/btrfs-tools_5.10.1.bb         |  2 +-
 .../createrepo-c/createrepo-c_0.17.0.bb       |  2 +-
 meta/recipes-devtools/distcc/distcc_3.3.5.bb  |  2 +-
 meta/recipes-devtools/dnf/dnf_4.6.0.bb        |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 meta/recipes-devtools/file/file_5.39.bb       |  2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb   |  2 +-
 .../gnu-config/gnu-config_git.bb              |  2 +-
 .../libcomps/libcomps_0.1.15.bb               |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.58.0.bb |  2 +-
 .../librepo/librepo_1.13.0.bb                 |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb        |  6 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |  2 +-
 .../patchelf/patchelf_0.12.bb                 |  2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  2 +-
 .../squashfs-tools/squashfs-tools_git.bb      |  2 +-
 .../systemd-bootchart_234.bb                  |  2 +-
 .../tcf-agent/tcf-agent_git.bb                |  2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
 .../go-examples/go-helloworld_0.1.bb          |  2 +-
 .../iputils/iputils_s20200821.bb              |  2 +-
 .../recipes-extended/libaio/libaio_0.3.112.bb |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |  2 +-
 .../libsolv/libsolv_0.7.17.bb                 |  2 +-
 meta/recipes-extended/ltp/ltp_20210121.bb     |  2 +-
 .../net-tools/net-tools_2.10.bb               |  2 +-
 meta/recipes-extended/procps/procps_3.3.17.bb |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.4.bb   |  2 +-
 .../rpcsvc-proto/rpcsvc-proto.bb              |  2 +-
 .../sysklogd/sysklogd_2.2.2.bb                |  2 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |  2 +-
 meta/recipes-extended/zstd/zstd_1.4.9.bb      |  2 +-
 meta/recipes-gnome/libhandy/libhandy_1.2.0.bb |  2 +-
 meta/recipes-gnome/libportal/libportal_0.3.bb |  2 +-
 .../glslang/glslang_11.2.0.bb                 |  2 +-
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  2 +-
 .../libfakekey/libfakekey_git.bb              |  2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
 .../libva/libva-utils_2.10.0.bb               |  2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb      |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  2 +-
 .../spir/spirv-headers_1.5.4.bb               |  2 +-
 .../spir/spirv-tools_2020.7.bb                |  2 +-
 .../virglrenderer/virglrenderer_0.8.2.bb      |  2 +-
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
 .../vulkan/vulkan-headers_1.2.170.0.bb        |  2 +-
 .../vulkan/vulkan-loader_1.2.170.0.bb         |  2 +-
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 .../vulkan/vulkan-tools_1.2.170.0.bb          |  2 +-
 .../xinput-calibrator_git.bb                  |  2 +-
 .../xorg-driver/xf86-video-intel_git.bb       |  2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 meta/recipes-kernel/dtc/dtc.inc               |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod.inc             |  2 +-
 ...20210919.bb => linux-firmware_20211027.bb} |  4 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++---
 meta/recipes-kernel/powertop/powertop_2.13.bb |  2 +-
 .../systemtap/systemtap_git.inc               |  2 +-
 meta/recipes-multimedia/x264/x264_git.bb      |  2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
 .../matchbox-config-gtk_0.2.bb                |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +-
 .../matchbox-terminal_0.2.bb                  |  2 +-
 .../matchbox-theme-sato_0.2.bb                |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 .../bmap-tools/bmap-tools_3.6.bb              |  2 +-
 .../boost/boost-build-native_4.3.0.bb         |  2 +-
 .../ca-certificates_20211016.bb               |  2 +-
 .../dos2unix/dos2unix_7.4.2.bb                |  2 +-
 .../gnome-desktop-testing_2018.1.bb           |  2 +-
 meta/recipes-support/libgit2/libgit2_1.1.0.bb |  2 +-
 .../libjitterentropy_3.0.1.bb                 |  2 +-
 .../libunistring/libunistring_0.9.10.bb       |  1 +
 meta/recipes-support/lz4/lz4_1.9.3.bb         |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  2 +-
 .../p11-kit/p11-kit_0.23.22.bb                |  2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |  2 +-
 .../rng-tools/rng-tools_6.11.bb               |  2 +-
 .../shared-mime-info/shared-mime-info_git.bb  |  2 +-
 meta/recipes-support/vim/vim.inc              |  2 +-
 meta/recipes-support/xxhash/xxhash_0.8.0.bb   |  2 +-
 scripts/contrib/convert-srcuri.py             | 77 +++++++++++++++++++
 scripts/lib/recipetool/create.py              |  3 +
 131 files changed, 239 insertions(+), 153 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)
 create mode 100755 scripts/contrib/convert-srcuri.py

-- 
2.33.1



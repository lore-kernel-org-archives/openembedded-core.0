Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88805C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649312"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649312"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:53 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567024022"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/14] meta: add explicit branch and protocol to
 SRC_URI
Date: Tue, 16 Nov 2021 11:24:17 +0800
Message-Id: 
 <ab781d4e3fa7425d96ea770ddfd0f01f62018c5b.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158334

Add branch name explicitly to SRC_URI where it's not defined and switch
to using https protocol for Github projects.

The change was made using convert-srcuri script in scripts/contrib.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded  | 2 +-
 .../recipes-test/git-submodule-test/git-submodule-test.bb       | 2 +-
 meta/classes/devupstream.bbclass                                | 2 +-
 meta/lib/oeqa/selftest/cases/fetch.py                           | 2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb                    | 2 +-
 meta/recipes-bsp/efivar/efivar_37.bb                            | 2 +-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb                         | 2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb                    | 2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb          | 2 +-
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb     | 2 +-
 meta/recipes-connectivity/libuv/libuv_1.41.0.bb                 | 2 +-
 .../mobile-broadband-provider-info_git.bb                       | 2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                    | 2 +-
 meta/recipes-core/fts/fts_1.2.7.bb                              | 2 +-
 meta/recipes-core/glibc/cross-localedef-native_2.33.bb          | 2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb                   | 2 +-
 meta/recipes-core/initscripts/init-system-helpers_1.60.bb       | 2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 meta/recipes-core/musl/libucontext_git.bb                       | 2 +-
 meta/recipes-core/musl/musl-obstack.bb                          | 2 +-
 meta/recipes-core/musl/musl-utils.bb                            | 2 +-
 meta/recipes-core/musl/musl_git.bb                              | 2 +-
 meta/recipes-core/ncurses/ncurses.inc                           | 2 +-
 meta/recipes-core/netbase/netbase_6.2.bb                        | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                        | 2 +-
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb                | 2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb           | 2 +-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb         | 2 +-
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb       | 2 +-
 meta/recipes-devtools/distcc/distcc_3.3.5.bb                    | 2 +-
 meta/recipes-devtools/dnf/dnf_4.6.0.bb                          | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 +-
 meta/recipes-devtools/file/file_5.39.bb                         | 2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb                     | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb              | 2 +-
 meta/recipes-devtools/libcomps/libcomps_0.1.15.bb               | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.58.0.bb                   | 2 +-
 meta/recipes-devtools/librepo/librepo_1.13.0.bb                 | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                          | 2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb                      | 2 +-
 meta/recipes-devtools/ninja/ninja_1.10.2.bb                     | 2 +-
 meta/recipes-devtools/patchelf/patchelf_0.12.bb                 | 2 +-
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb                       | 2 +-
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb      | 2 +-
 .../recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb                | 2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb                        | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb                      | 2 +-
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb          | 2 +-
 meta/recipes-extended/iputils/iputils_s20200821.bb              | 2 +-
 meta/recipes-extended/libaio/libaio_0.3.112.bb                  | 2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb                     | 2 +-
 meta/recipes-extended/libnss-nis/libnss-nis.bb                  | 2 +-
 meta/recipes-extended/libsolv/libsolv_0.7.17.bb                 | 2 +-
 meta/recipes-extended/ltp/ltp_20210121.bb                       | 2 +-
 meta/recipes-extended/net-tools/net-tools_2.10.bb               | 2 +-
 meta/recipes-extended/procps/procps_3.3.17.bb                   | 2 +-
 meta/recipes-extended/psmisc/psmisc_23.4.bb                     | 2 +-
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb              | 2 +-
 meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb                | 2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb                 | 2 +-
 meta/recipes-extended/zstd/zstd_1.4.9.bb                        | 2 +-
 meta/recipes-gnome/libhandy/libhandy_1.2.0.bb                   | 2 +-
 meta/recipes-gnome/libportal/libportal_0.3.bb                   | 2 +-
 meta/recipes-graphics/glslang/glslang_11.2.0.bb                 | 2 +-
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb        | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb              | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb           | 2 +-
 meta/recipes-graphics/libva/libva-utils_2.10.0.bb               | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb          | 2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb                        | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                      | 2 +-
 meta/recipes-graphics/spir/spirv-headers_1.5.4.bb               | 2 +-
 meta/recipes-graphics/spir/spirv-tools_2020.7.bb                | 2 +-
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb      | 2 +-
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb                    | 2 +-
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb        | 2 +-
 meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb         | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb          | 2 +-
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb       | 2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb                    | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
 meta/recipes-kernel/dtc/dtc.inc                                 | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb         | 2 +-
 meta/recipes-kernel/kmod/kmod.inc                               | 2 +-
 meta/recipes-kernel/powertop/powertop_2.13.bb                   | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc                 | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                        | 2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb                        | 2 +-
 .../recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb      | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb     | 2 +-
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb    | 2 +-
 .../recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb        | 2 +-
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb      | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.6.bb               | 2 +-
 meta/recipes-support/boost/boost-build-native_4.3.0.bb          | 2 +-
 .../recipes-support/ca-certificates/ca-certificates_20211016.bb | 2 +-
 meta/recipes-support/dos2unix/dos2unix_7.4.2.bb                 | 2 +-
 .../gnome-desktop-testing/gnome-desktop-testing_2018.1.bb       | 2 +-
 meta/recipes-support/libgit2/libgit2_1.1.0.bb                   | 2 +-
 meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb | 2 +-
 meta/recipes-support/lz4/lz4_1.9.3.bb                           | 2 +-
 meta/recipes-support/numactl/numactl_git.bb                     | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.23.22.bb                 | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb         | 2 +-
 meta/recipes-support/rng-tools/rng-tools_6.11.bb                | 2 +-
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb   | 2 +-
 meta/recipes-support/vim/vim.inc                                | 2 +-
 meta/recipes-support/xxhash/xxhash_0.8.0.bb                     | 2 +-
 116 files changed, 116 insertions(+), 116 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 07b83276fb..8a27e3a791 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -11,7 +11,7 @@ SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 32ec4b14fa..fbe90d6c6b 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 9429564df4..cc5d7eae5a 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index 7780c5482c..97e137cb40 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -4,7 +4,7 @@
 #
 # Usage:
 # BBCLASSEXTEND = "devupstream:target"
-# SRC_URI_class-devupstream = "git://git.example.com/example"
+# SRC_URI_class-devupstream = "git://git.example.com/example;branch=master"
 # SRCREV_class-devupstream = "abcdef"
 #
 # If the first entry in SRC_URI is a git: URL then S is rewritten to
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index cd15f65129..d2f0c38ef4 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -99,7 +99,7 @@ class Dependencies(OESelftestTestCase):
 
             r = """
             LICENSE="CLOSED"
-            SRC_URI="git://example.com/repo"
+            SRC_URI="git://example.com/repo;branch=master"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 5d6f200a73..e9dfa0770e 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -10,7 +10,7 @@ DEPENDS = "efivar popt"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=master \
            file://0001-remove-extra-decl.patch \
            file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
           "
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index 5bf121ff6e..fa1fe1ecdf 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index cb1c3f2ebf..e01491c9b7 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -9,7 +9,7 @@ require opensbi-payloads.inc
 inherit autotools-brokensep deploy
 
 SRCREV = "234ed8e427f4d92903123199f6590d144e0d9351"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
index 613e3161fb..8234b86162 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
 SRCREV = "824551ac77bab1d0f7ae34d7a7c77b155240e754"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 993478a73b..17c6140216 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
 
-SRC_URI = "git://git.denx.de/u-boot.git \
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
            file://0001-add-valid-fdt-check.patch \
            file://CVE-2021-27097-1.patch \
            file://CVE-2021-27097-2.patch \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index af986c4eab..e4eeb3c726 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master;protocol=https \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
            file://images/ \
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
index 9a83898e52..5213b28345 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 
-SRC_URI = "git://github.com/lathiat/nss-mdns \
+SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
            "
 
 SRCREV = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
index 4987331dc8..e15d338941 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "1dff88e5161cba5c59276d2070d2e304e4dcb242"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index f170cf4650..b4cbc1a76c 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -8,7 +8,7 @@ SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
 PV = "20201225"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 677768d35a..b39f7523c0 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index ea820cb0c3..d3b0f31eda 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.33.bb b/meta/recipes-core/glibc/cross-localedef-native_2.33.bb
index ec59c6ba10..22d3f96c09 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.33.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.33.bb
@@ -20,7 +20,7 @@ inherit native
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
-           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
+           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef;protocol=https \
            \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index 0daf50acab..afc3196620 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -7,7 +7,7 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://99_network \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
index 33977e66c1..98f45e1355 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
@@ -17,7 +17,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
 SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
-SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index b5ca863d54..8008ba2d38 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
            file://0001-configure.ac-do-not-use-compute-symver-floor.patch \
            "
 SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 11affebb49..87946b7ec3 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -10,7 +10,7 @@ DEPENDS = ""
 
 PV = "0.10+${SRCPV}"
 SRCREV = "19fa1bbfc26efb92147b5e85cc0ca02a0e837561"
-SRC_URI = "git://github.com/kaniini/libucontext \
+SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 3003935fe5..74de48c2cd 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.1"
 SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
-SRC_URI = "git://github.com/pullmoll/musl-obstack"
+SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index dd0ce33061..c30509469c 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PV = "20170421"
 
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
-SRC_URI = "git://github.com/boltlinux/musl-utils"
+SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e6f9e2441e..a241a2fbbd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,7 +12,7 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/musl \
+SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ef59bc3b0a..9c74d2ec36 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
index c016d32dd3..ad7e9becde 100644
--- a/meta/recipes-core/netbase/netbase_6.2.bb
+++ b/meta/recipes-core/netbase/netbase_6.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https;branch=master"
 SRCREV = "1c892c96a078ef28ec1a94681b3a0da7a3d545f7"
 
 inherit allarch
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 59e1e3f194..e1236475fc 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,7 +10,7 @@ SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7d3b3064ba..b11ab112af 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -16,6 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
 SRCBRANCH = "v247-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index da716674c3..daee5c224b 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
-SRC_URI = "git://git.yoctoproject.org/update-rc.d"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
 SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index d5beaecd0e..02a286c396 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRC_URI = "git://github.com/xrmx/bootchart.git \
+SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
index fca010d4ae..7f51c799cd 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
@@ -15,7 +15,7 @@ DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
index 7480affbc0..29f3866079 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.3.5.bb b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
index 5c2644199e..defea99c95 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.5.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN}-server = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master;protocol=https \
            file://default \
            file://distcc \
            file://distcc.service \
diff --git a/meta/recipes-devtools/dnf/dnf_4.6.0.bb b/meta/recipes-devtools/dnf/dnf_4.6.0.bb
index 6651e64352..f2cb6db89b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.6.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.6.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
 
-SRC_URI = "git://github.com/rpm-software-management/dnf.git \
+SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 2f113c5e8d..fb02b2006e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/file/file_5.39.bb b/meta/recipes-devtools/file/file_5.39.bb
index c0c7253688..234440e493 100644
--- a/meta/recipes-devtools/file/file_5.39.bb
+++ b/meta/recipes-devtools/file/file_5.39.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS_class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git \
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            file://0001-src-compress.c-correct-header-define-for-xz-lzma.patch \
            file://0001-Fix-close_on_exec-multithreaded-decompression-issue.patch"
 
diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index 6eb87df7c3..1a5c760cb3 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
 
 GO_IMPORT = "github.com/Masterminds/glide"
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};branch=master;protocol=https"
 SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index c41177c72b..ecbd60e72a 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "6faca61810d335c7837f320733fe8e15a1431fc2"
 PV = "20210125+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git \
+SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
index 58d2dee897..d9e712f74a 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
            file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
index dbe68d5a15..30b96bd81d 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This library provides a high level package-manager. It's core lib
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
+SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
diff --git a/meta/recipes-devtools/librepo/librepo_1.13.0.bb b/meta/recipes-devtools/librepo/librepo_1.13.0.bb
index 0a68e0ac4f..3f5919d0a2 100644
--- a/meta/recipes-devtools/librepo/librepo_1.13.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.13.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index db6694339c..3f53b477dd 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -30,7 +30,7 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 SRCREV = "1fdec59bffc11ae37eb51a1b9869f0696bfd5312"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 105a68dad8..de7bdcd969 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_mtd-utils-tests += "bash"
 PV = "2.1.2"
 
 SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
 
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index 2a39b2d216..79328583ee 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 7c97ea0789..390a8110da 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPLv3"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
            file://alignmentfix.patch \
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index ea1cc38806..62da3d2095 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x;protocol=https \
            file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 083e597b03..5d754b20b3 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
            file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
            file://CVE-2021-40153.patch;striplevel=2 \
 "
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index 905a0cbb72..44f0c8c8f2 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
            file://no_lto.patch \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index a143b09656..7f790c9dbb 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index a21fb58397..bcaa4e2822 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -14,7 +14,7 @@ DEPENDS_append_class-nativesdk = " flex-nativesdk"
 ASNEEDED = ""
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
+SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 70eb67f1f2..d2f34449b3 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e
 "
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
-           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index c51f163e9b..3b738f82e7 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://golang.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};branch=master;protocol=https"
 SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index e43abf2629..dd541d4d48 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils \
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
 SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
diff --git a/meta/recipes-extended/libaio/libaio_0.3.112.bb b/meta/recipes-extended/libaio/libaio_0.3.112.bb
index b3606474a5..3892f3244e 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.112.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.112.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https \
+SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index badb71d977..0690d4cd3b 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -14,7 +14,7 @@ PV = "1.3.0"
 
 SRCREV = "fbad7b36acaa89a54023930af70805649f962999"
 
-SRC_URI = "git://github.com/thkukuk/libnsl \
+SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index a1d914e871..984cc98fc2 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -17,7 +17,7 @@ PV = "3.1+git${SRCPV}"
 
 SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
-SRC_URI = "git://github.com/thkukuk/libnss_nis \
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
index fa6e8a3c4d..2b5da4d932 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
 "
 
 SRCREV = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index 17adbf43f0..e816244f8c 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -33,7 +33,7 @@ SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
 PR = "r4"
 HASHEQUIV_HASH_VERSION .= ".4"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index de4a715971..2dafe96356 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
 SRCREV = "80d7b95067f1f22fece9537dea6dff53081f4886"
-SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
+SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index c74a901d9a..9fd3db196d 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -12,7 +12,7 @@ DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
+SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            file://0001-w.c-correct-musl-builds.patch \
            file://0002-proc-escape.c-add-missing-include.patch \
diff --git a/meta/recipes-extended/psmisc/psmisc_23.4.bb b/meta/recipes-extended/psmisc/psmisc_23.4.bb
index 894443f4ef..89fe8a709c 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.4.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.4.bb
@@ -2,7 +2,7 @@ require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
 SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 5aff2b56a6..ad392138b5 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4.2"
 
 SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
-SRC_URI = "git://github.com/thkukuk/${BPN} \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
           "
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
index 5dfeca5326..01a079f041 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
            file://sysklogd \
            "
 
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 69d5b2f83b..c6d356d227 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55c5fdf02cfcca3fc9621b6f2ceae10f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https \
+SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
            file://xinetd.init \
            file://xinetd.default \
            file://xinetd.service \
diff --git a/meta/recipes-extended/zstd/zstd_1.4.9.bb b/meta/recipes-extended/zstd/zstd_1.4.9.bb
index 44224ec627..b648c84093 100644
--- a/meta/recipes-extended/zstd/zstd_1.4.9.bb
+++ b/meta/recipes-extended/zstd/zstd_1.4.9.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
            file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
            "
 
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
index 1e37feb20a..f39cbdca5a 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master"
 SRCREV = "7b38a860ffcec6c2ad28153358cc3d037ddb618f"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-gnome/libportal/libportal_0.3.bb b/meta/recipes-gnome/libportal/libportal_0.3.bb
index bc4ff3784c..c24a794fc4 100644
--- a/meta/recipes-gnome/libportal/libportal_0.3.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.3.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://github.com/flatpak/libportal/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https"
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
 SRCREV = "a609e06d0c4adc5c510cf9ac7b060db3d368e78f"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/glslang/glslang_11.2.0.bb b/meta/recipes-graphics/glslang/glslang_11.2.0.bb
index 902f7345f5..e00f73ccb7 100644
--- a/meta/recipes-graphics/glslang/glslang_11.2.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.2.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
 SRCREV = "5421877c380d5f92c1965c7a94620dac861297dd"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 1cc94cf993..4b8630a318 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -12,7 +12,7 @@ inherit meson
 SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
 PV = "1.25+git${SRCPV}"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
            file://0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch \
            file://reproducibility.patch"
 
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index ab6f5ac9ed..33ea6fe5a9 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index 1a31677978..06bd682823 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libva/libva-utils_2.10.0.bb b/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
index 828f4fb317..39763ba539 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
@@ -14,7 +14,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.10-branch"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.10-branch;protocol=https"
 SRCREV = "f112ee75fcd1472131b20f901b93f6ac1d293fad"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index a08eb252ce..3ea67d09d6 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
            file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index 58a6997ffe..88101b5dcc 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -7,7 +7,7 @@ PV = "1.4.7+git${SRCPV}"
 # Exclude x.99.x versions from upstream checks
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>^\d+(\.(?!99)\d+)+)"
 
-SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4 \
+SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4;protocol=https \
 	   file://fix-test-includes.patch \
 	  "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 14f4c75a2c..96ec93071d 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=master \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patch \
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 7a43af5e6b..ea7e17305e 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
 SRCREV = "bcf55210f13a4fa3c3d0963b509ff1070e434c79"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb b/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
index 8be698533a..9a06408526 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "2573fd781b5408cd7fe5755a78b60d767a748ff9"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
            file://0001-fix-strncpy-bound-error.patch \
           "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 52821195d1..7f035f820a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/libgl libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 5a8c62e64d..295ac12fc5 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
+SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release;protocol=https \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
index 4c9c94f3d2..b0211432ab 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master;protocol=https"
 
 SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
index 6b6ed06dbb..a866f0a5cb 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master;protocol=https \
            "
 SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index b7c38f6543..07d6e9d735 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
index 0c8bcaa085..d81dc14472 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170;protocol=https"
 SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index d2a16643fe..e524b82dd6 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRCREV = "18ec53f1cada39f905614ebfaffed5c7754ecf46"
-SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput \
+SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput;protocol=https \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 161371b118..73c0cdc385 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "f66d39544bb8339130c96d282a80f87ca1606caf"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
            file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
            file://0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch \
 "
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7ccc022b93..2110bc75fa 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,7 @@ SRCREV = "cca113f2fe0759b91fd6a0e10fdcda2c28f18a7e"
 
 PV = "1.2.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git \
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
            file://ldflags.patch \
            file://CVE-2018-10689.patch \
            file://make-btt-scripts-python3-ready.patch \
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ae2c308911..6ada0b0295 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -8,7 +8,7 @@ API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
 SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 5da6c24fbf..461ab8fbd3 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -5,7 +5,7 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
            file://make_install.patch \
            file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
            "
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e967f485c1..ef035aed23 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -14,7 +14,7 @@ PV = "0.2+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index ba5ec7f650..11220c5138 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -19,7 +19,7 @@ SRCREV = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"
 # Lookout for PV bump too when SRCREV is changed
 PV = "28"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
            "
diff --git a/meta/recipes-kernel/powertop/powertop_2.13.bb b/meta/recipes-kernel/powertop/powertop_2.13.bb
index 8c7e78fd94..dc9c77f337 100644
--- a/meta/recipes-kernel/powertop/powertop_2.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.13.bb
@@ -6,7 +6,7 @@ DEPENDS = "ncurses libnl pciutils autoconf-archive"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
+SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 SRCREV = "184cee06b2d64679bae5f806fe0a218827fdde99"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 73fba981b7..38bdbe3cfb 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "988f439af39a359b4387963ca4633649866d8275"
 PV = "4.4"
 
-SRC_URI = "git://sourceware.org/git/systemtap.git \
+SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index f95fb0c41e..448d632145 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://github.com/mirror/x264;branch=stable \
+SRC_URI = "git://github.com/mirror/x264;branch=stable;protocol=https \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 85c2c500ea..4d5d299d47 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git${SRCPV}"
-SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git"
+SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 547e851c15..5733a36b12 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "settings-daemon"
 
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index d775b5c651..71fb238f43 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index c659964a2b..54fe578cd3 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -23,7 +23,7 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 9f00281dde..e2e81c2905 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -11,7 +11,7 @@ SECTION = "x11/utils"
 
 #SRCREV tagged 0.2
 SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index 7a043d3447..bc4024736f 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index 2b1f513f1c..7e7612253d 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 
 # SRCREV tagged 0.3
 SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI = "git://git.yoctoproject.org/screenshot"
+SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index d01177f9b9..19c4a73dc3 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -9,7 +9,7 @@ SECTION = "x11"
 
 # SRCREV tagged 0.0.2
 SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master \
            file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
index 611c0fb680..70ce12a06f 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN}"
+SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/boost/boost-build-native_4.3.0.bb b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
index 00f3a86dd6..f09ff484ec 100644
--- a/meta/recipes-support/boost/boost-build-native_4.3.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
 SRCREV = "632ea768f3eb225b4472c5ed6d20afee708724ad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+){2,}))"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 214bad4ae3..a54d6b458a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -16,7 +16,7 @@ PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
 
-SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
index 9005bdea59..e0a5499263 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
@@ -8,7 +8,7 @@ SECTION = "support"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8a7c3499a1142df819e727253cd53a12"
 
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "72596f0ae21faa25a07a872d4843bc885475115d"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
index e5c69c0c46..19f32e8d1f 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http"
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http;branch=master"
 SRCREV = "4decade67b29ad170fcf3de148e41695fc459f48"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-support/libgit2/libgit2_1.1.0.bb b/meta/recipes-support/libgit2/libgit2_1.1.0.bb
index 2bbf59ea74..9b2eec9c9e 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1;protocol=https"
 SRCREV = "7f4fa178629d559c037a1f72f79f79af9c1ef8ce"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
index 197bb787ac..f335abb261 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c69090e97c8fd6372d03099c0a5bc382 \
                     file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
 SRCREV = "747bf030b0ea9c44548b4e29bcfab7ae416675fc"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index 9d5dc0253a..15867023c3 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://run-ptest \
            file://CVE-2021-3520.patch \
            "
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 6c8a667a41..a0e72253a1 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e
 SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
 PV = "2.0.14"
 
-SRC_URI = "git://github.com/numactl/numactl \
+SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index 623afccb5e..5f1b73ee16 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -10,7 +10,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23;protocol=https"
 SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index b14b947f97..6544b374c2 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.11.bb b/meta/recipes-support/rng-tools/rng-tools_6.11.bb
index 61a0cef2e0..bc98efa3c6 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.11.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.11.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
 
 SRC_URI = "\
-    git://github.com/nhorman/rng-tools.git \
+    git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
     file://init \
     file://default \
     file://rngd.service \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index ff32259d8e..9eb70b7e65 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
 SRCREV = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"
 PV = "2.1"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e04c653fe3..db4741ba4f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
 
-SRC_URI = "git://github.com/vim/vim.git \
+SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.0.bb b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
index 9e38872361..daa1bc26de 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.0.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
 
-SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git"
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
-- 
2.33.1



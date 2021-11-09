Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A5CC4167B
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:39:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.12796.1636468740845062503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229916016"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229916016"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956954"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 25/26] recipes: Update github.com urls to use https
Date: Tue,  9 Nov 2021 22:38:00 +0800
Message-Id: 
 <8b83eddda83327d25247bb9b61a049b0a8698a45.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:39:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158045

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Github has announced there will be no more git:// fetching from their servers:

https://github.blog/2021-09-01-improving-git-protocol-security-github/#no-more-unauthenticated-git

and they're about to start having brownout periods to encourage people
to update. This runs the conversion script over OE-Core to update our
urls to use https instead of git.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b37b61e9a1e448a34957db9ae39285d21352552e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/efivar/efivar_37.bb                            | 2 +-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb                         | 2 +-
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb          | 2 +-
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb     | 2 +-
 meta/recipes-connectivity/libuv/libuv_1.42.0.bb                 | 2 +-
 meta/recipes-core/fts/fts_1.2.7.bb                              | 2 +-
 meta/recipes-core/glibc/cross-localedef-native_2.34.bb          | 2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 meta/recipes-core/musl/libucontext_git.bb                       | 2 +-
 meta/recipes-core/musl/musl-obstack.bb                          | 2 +-
 meta/recipes-core/musl/musl-utils.bb                            | 2 +-
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb           | 2 +-
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb       | 2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb                      | 2 +-
 meta/recipes-devtools/dnf/dnf_4.8.0.bb                          | 2 +-
 meta/recipes-devtools/file/file_5.40.bb                         | 2 +-
 meta/recipes-devtools/libcomps/libcomps_0.1.17.bb               | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.63.1.bb                   | 2 +-
 meta/recipes-devtools/librepo/librepo_1.14.1.bb                 | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                          | 2 +-
 meta/recipes-devtools/ninja/ninja_1.10.2.bb                     | 2 +-
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb                       | 2 +-
 meta/recipes-extended/iputils/iputils_20210722.bb               | 2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb                     | 2 +-
 meta/recipes-extended/libnss-nis/libnss-nis.bb                  | 2 +-
 meta/recipes-extended/libsolv/libsolv_0.7.19.bb                 | 2 +-
 meta/recipes-extended/ltp/ltp_20210524.bb                       | 2 +-
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb              | 2 +-
 meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb                | 2 +-
 meta/recipes-extended/zstd/zstd_1.5.0.bb                        | 2 +-
 meta/recipes-graphics/libva/libva-utils_2.12.0.bb               | 2 +-
 meta/recipes-graphics/spir/spirv-tools_2021.2.bb                | 2 +-
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb        | 2 +-
 meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb         | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb          | 2 +-
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                        | 2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb                        | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.6.bb               | 2 +-
 meta/recipes-support/libgit2/libgit2_1.1.1.bb                   | 2 +-
 meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb | 2 +-
 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb             | 2 +-
 meta/recipes-support/lz4/lz4_1.9.3.bb                           | 2 +-
 meta/recipes-support/numactl/numactl_git.bb                     | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.24.0.bb                  | 2 +-
 meta/recipes-support/rng-tools/rng-tools_6.14.bb                | 2 +-
 meta/recipes-support/vim/vim.inc                                | 2 +-
 meta/recipes-support/xxhash/xxhash_0.8.0.bb                     | 2 +-
 51 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index 6340020cef..fc36913f30 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index cb9f346dc0..1956fbf9ff 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -9,7 +9,7 @@ require opensbi-payloads.inc
 inherit autotools-brokensep deploy
 
 SRCREV = "234ed8e427f4d92903123199f6590d144e0d9351"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
 
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index eb6d1f7181..7e1619aab2 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master;protocol=https \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
            file://images/ \
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
index cfe474d72e..f5c87f7291 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 
-SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master \
+SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
            "
 
 SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
index 169bd6206b..2dfbb8b895 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "6ce14710da7079eb248868171f6343bc409ea3a4"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index f907a35a90..d3b0f31eda 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
index 6100f3d4c4..482e53cf5d 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
@@ -20,7 +20,7 @@ inherit native
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
-           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
+           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef;protocol=https \
            \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 29b941d380..0411de3637 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
 SRCREV = "b9116ef2245abb128a22a975d187b1272312a80c"
 SRCBRANCH ?= "develop"
 
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 1a8d1c4b21..9061cf0b1b 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -10,7 +10,7 @@ DEPENDS = ""
 
 PV = "1.1+${SRCPV}"
 SRCREV = "335ee864ef6f4a5d4b525453fd9dbfb3507cfecc"
-SRC_URI = "git://github.com/kaniini/libucontext;branch=master \
+SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
            file://0001-meson-Add-option-to-pass-cpu.patch \
            "
 
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 3748047496..74de48c2cd 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.1"
 SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
-SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master"
+SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index fa49d1da04..00d088d089 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PV = "20170421"
 
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
-SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master"
+SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 05341724f4..13b8b61af6 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "090378dcb1de5ca66900503210e85d63075fa70a"
 SRCBRANCH = "v249-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 6ef5298a3b..59fcd8c78a 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master \
+SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
index 68284a1190..7a9656bf86 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index c1cce24d11..93983f6aee 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS:${PN}-server = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master;protocol=https \
            file://default \
            file://distcc \
            file://distcc.service \
diff --git a/meta/recipes-devtools/dnf/dnf_4.8.0.bb b/meta/recipes-devtools/dnf/dnf_4.8.0.bb
index 9929da6fa4..9070077270 100644
--- a/meta/recipes-devtools/dnf/dnf_4.8.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
 
-SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/file/file_5.40.bb b/meta/recipes-devtools/file/file_5.40.bb
index 3c083be192..0360eb5ec7 100644
--- a/meta/recipes-devtools/file/file_5.40.bb
+++ b/meta/recipes-devtools/file/file_5.40.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
 SRCREV = "f49fda6f52a9477d817dbd9c06afab02daf025f8"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
index 1a59fc1a7b..09861d9c26 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.17.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
            file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
index 282c28e2c4..6294509d2e 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This library provides a high level package-manager. It's core lib
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
+SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.1.bb b/meta/recipes-devtools/librepo/librepo_1.14.1.bb
index 19a2bd612e..cdb5946905 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 4167080653..d9efa53499 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -28,7 +28,7 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 SRCREV = "fed41342a82f5a3a9201819a82bf7a48313e296b"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index c908bcb738..7270321d6e 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index aa6b5ee8aa..cb15415d7f 100644
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
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index c92bc830bc..d81f787dd8 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils;branch=master \
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            file://0001-meson-Make-tests-optional.patch \
            "
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 6194d90177..3f6ccbad70 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -14,7 +14,7 @@ PV = "2.0.0"
 
 SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
 
-SRC_URI = "git://github.com/thkukuk/libnsl;branch=master \
+SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index bc2e292f40..478e9e2be3 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -17,7 +17,7 @@ PV = "3.1+git${SRCPV}"
 
 SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
-SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master \
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
index 768682f885..a3a4fc7896 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
 "
 
 SRCREV = "c773294be6b0a2425f344a8999f173fb00cfd16f"
diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-extended/ltp/ltp_20210524.bb
index b728dffc19..0636cb92cb 100644
--- a/meta/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta/recipes-extended/ltp/ltp_20210524.bb
@@ -29,7 +29,7 @@ CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch \
            "
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 81bd40bf61..c08e9d52c3 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4.2"
 
 SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
-SRC_URI = "git://github.com/thkukuk/${BPN};branch=master \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
           "
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
index eca531d05d..f4ecb7d459 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
            file://sysklogd \
            "
 
diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
index 978812fddb..51305d0562 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
            file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
            file://0001-MinGW-Build-Fixes.patch \
            "
diff --git a/meta/recipes-graphics/libva/libva-utils_2.12.0.bb b/meta/recipes-graphics/libva/libva-utils_2.12.0.bb
index 096d80b68d..3550ad0c59 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.12.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.12.0.bb
@@ -14,7 +14,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.11-branch"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.11-branch;protocol=https"
 SRCREV = "c0145a895ebe9b24cde5c441733f90482f1e3d71"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.2.bb b/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
index a22ceb6bfd..314ab0c1a1 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "e198c6a785d388db68eb9166b43ac5e5208fd5cc"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
            file://0001-fix-strncpy-bound-error.patch \
           "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
index 5ae56ec076..26f4f58b26 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
 SRCREV = "37164a5726f7e6113810f9557903a117498421cf"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
index eb16c547b7..41632f25ce 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master;protocol=https \
            "
 SRCREV = "1896143df69d439b0933c1bb485f5a4587bdf2dc"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 4827e3a22c..c1ffc7ecde 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
index d0a298ecfc..b7966f6333 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.182"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.182;protocol=https"
 SRCREV = "9d3305731c3be8de05c9f223a79959d448506a37"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 2553d89529..49c42bd68a 100644
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
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index e4a7922ad1..6ada0b0295 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -8,7 +8,7 @@ API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master \
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
 SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 9f23794df1..c49e935d1c 100644
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
index 034e19dc7a..50f6da24f3 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git${SRCPV}"
-SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master"
+SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
index 37cec13842..c66ff3a7da 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=master"
+SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/libgit2/libgit2_1.1.1.bb b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
index ae30a7a100..fcf80e4809 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1;protocol=https"
 SRCREV = "8a0dc6783c340e61a44c179c48f832165ad2053c"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
index f740e4a729..b5d816f864 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master \
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https \
            file://0001-Makefile-restore-build-reproducibility.patch \
            "
 SRCREV = "409828cfccf4b3b07edc40a7840a821ce074e2c3"
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
index 74bface4a1..27954ca6b1 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
@@ -10,7 +10,7 @@ DEPENDS += "gperf-native"
 PV .= "+git${SRCPV}"
 SRCREV = "5822e50c2920ce597d038077dea4a0eedf193f86"
 
-SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main \
+SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main;protocol=https \
            file://0001-configure.ac-Bump-version-to-2.5.99.patch \
            file://0001-arch-Add-riscv32-architecture-support.patch \
            file://0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch \
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index b22eea3156..a3c48bccfb 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://CVE-2021-3520.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 66e826304f..19f2293a51 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e
 SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
 PV = "2.0.14"
 
-SRC_URI = "git://github.com/numactl/numactl;branch=master \
+SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
index d8330f460c..7fe3c37fde 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
 SRCREV = "34826623f58399b24c21f1788e2cdaea34521b7b"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.14.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
index 72d1e3f3db..222d7cc630 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.14.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
 
-SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master \
+SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rngd.service \
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 616b38b28b..50e215d20f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
 
-SRC_URI = "git://github.com/vim/vim.git;branch=master \
+SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.0.bb b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
index 4e48365a71..686fbea591 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.0.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
 
-SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git \
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https \
            file://0001-Makefile-escape-special-regex-characters-in-paths.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] recipes: Update github.com urls to use https
Date: Tue,  2 Nov 2021 11:42:58 +0000
Message-Id: <20211102114258.3540995-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211102114258.3540995-1-richard.purdie@linuxfoundation.org>
References: <20211102114258.3540995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Github has announced there will be no more git:// fetching from their servers:

https://github.blog/2021-09-01-improving-git-protocol-security-github/#no-more-unauthenticated-git

and they're about to start having brownout periods to encourage people
to update. This runs the conversion script over OE-Core to update our
urls to use https instead of git.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
 meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb       | 2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb                      | 2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb                         | 2 +-
 meta/recipes-devtools/file/file_5.41.bb                         | 2 +-
 meta/recipes-devtools/libcomps/libcomps_0.1.18.bb               | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb                   | 2 +-
 meta/recipes-devtools/librepo/librepo_1.14.2.bb                 | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                          | 2 +-
 meta/recipes-devtools/ninja/ninja_1.10.2.bb                     | 2 +-
 meta/recipes-devtools/rpm/rpm_4.17.0.bb                         | 2 +-
 meta/recipes-extended/iputils/iputils_20210722.bb               | 2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb                     | 2 +-
 meta/recipes-extended/libnss-nis/libnss-nis.bb                  | 2 +-
 meta/recipes-extended/libsolv/libsolv_0.7.20.bb                 | 2 +-
 meta/recipes-extended/lsof/lsof_4.94.0.bb                       | 2 +-
 meta/recipes-extended/ltp/ltp_20210927.bb                       | 2 +-
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb              | 2 +-
 meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb                | 2 +-
 meta/recipes-extended/zstd/zstd_1.5.0.bb                        | 2 +-
 meta/recipes-graphics/libva/libva-utils_2.13.0.bb               | 2 +-
 meta/recipes-graphics/spir/spirv-tools_2021.3.bb                | 2 +-
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb        | 2 +-
 meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb         | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb          | 2 +-
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                        | 2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb                        | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.6.bb               | 2 +-
 meta/recipes-support/libgit2/libgit2_1.3.0.bb                   | 2 +-
 meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb | 2 +-
 meta/recipes-support/libseccomp/libseccomp_2.5.2.bb             | 2 +-
 meta/recipes-support/lz4/lz4_1.9.3.bb                           | 2 +-
 meta/recipes-support/numactl/numactl_git.bb                     | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.24.0.bb                  | 2 +-
 meta/recipes-support/rng-tools/rng-tools_6.14.bb                | 2 +-
 meta/recipes-support/vim/vim.inc                                | 2 +-
 meta/recipes-support/xxhash/xxhash_0.8.0.bb                     | 2 +-
 52 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index 6340020cef0..fc36913f308 100644
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
index cb9f346dc05..1956fbf9ffc 100644
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
index eb6d1f71813..7e1619aab2a 100644
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
index cfe474d72e1..f5c87f72913 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 
-SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master \
+SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
            "
 
 SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
index 169bd6206be..2dfbb8b8956 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "6ce14710da7079eb248868171f6343bc409ea3a4"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index f907a35a909..d3b0f31eda4 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
index 6100f3d4c46..482e53cf5d9 100644
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
index ea877bbbb62..9186c45e18a 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=29c5f9af198623cdce52a77f85695164 \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
 SRCREV = "8ff7a8c5019cbd50419f7d0a8cd691eb99d6b086"
 SRCBRANCH ?= "develop"
 
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 1a8d1c4b210..9061cf0b1b5 100644
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
index 37480474960..74de48c2cd7 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.1"
 SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
-SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master"
+SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index fa49d1da04b..00d088d0899 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PV = "20170421"
 
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
-SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master"
+SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 53ffe8d293b..4e4cdd2e2fb 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
 SRCBRANCH = "v249-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 6ef5298a3bd..59fcd8c78af 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master \
+SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
index 97405988559..0c27756d2ac 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index c1cce24d115..93983f6aee2 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS:${PN}-server = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master;protocol=https \
            file://default \
            file://distcc \
            file://distcc.service \
diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 4ad7e21c24d..e4432c7f09a 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
 
-SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.41.bb
index 36a9ebd9bf9..653887e97a4 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.41.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
 SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 94108d3a7fd..3fd4d5b83d4 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
            file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index 78f2002040b..fbda7769c07 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This library provides a high level package-manager. It's core lib
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
+SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
index 777b4476819..61a485cfe89 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 41670806533..d9efa534994 100644
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
index c908bcb738f..7270321d6e3 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.0.bb b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
index 00e480b1704..beb03ba3dd0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protocol=https \
            file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index c92bc830bc9..d81f787dd88 100644
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
index 6194d901776..3f6ccbad70d 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -14,7 +14,7 @@ PV = "2.0.0"
 
 SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
 
-SRC_URI = "git://github.com/thkukuk/libnsl;branch=master \
+SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index bc2e292f40f..478e9e2be3b 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -17,7 +17,7 @@ PV = "3.1+git${SRCPV}"
 
 SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
-SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master \
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
index 21017c39027..f0ba9553e7d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
diff --git a/meta/recipes-extended/lsof/lsof_4.94.0.bb b/meta/recipes-extended/lsof/lsof_4.94.0.bb
index 9145c2d8ea2..c2b8bc839bc 100644
--- a/meta/recipes-extended/lsof/lsof_4.94.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.94.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
 # the most commonly used alternative.
 
-SRC_URI = "git://github.com/lsof-org/lsof;branch=master \
+SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://lsof-remove-host-information.patch \
           "
 
diff --git a/meta/recipes-extended/ltp/ltp_20210927.bb b/meta/recipes-extended/ltp/ltp_20210927.bb
index 534dffdd266..b5dfd8bb692 100644
--- a/meta/recipes-extended/ltp/ltp_20210927.bb
+++ b/meta/recipes-extended/ltp/ltp_20210927.bb
@@ -24,7 +24,7 @@ CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "12beeda351b5d758a729aaf695b836ccc9eb5304"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0002-lib-fix-MemAvailable-parsing.patch \
            file://0003-lapi-rtnetlink.h-Fix-include-guards.patch \
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 81bd40bf612..c08e9d52c38 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4.2"
 
 SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
-SRC_URI = "git://github.com/thkukuk/${BPN};branch=master \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
           "
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
index eca531d05d2..f4ecb7d4593 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
            file://sysklogd \
            "
 
diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
index 978812fddb7..51305d0562c 100644
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
diff --git a/meta/recipes-graphics/libva/libva-utils_2.13.0.bb b/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
index baa0719f855..c93cdb44844 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
@@ -14,7 +14,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.13-branch"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.13-branch;protocol=https"
 SRCREV = "7bad184b2cf2ffaf4fb3cc71d4df63d7b142d592"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
index d369d3c3906..bf44b58c996 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "1fbed83c8aab8517d821fcb4164c08567951938f"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
index 679a455ef15..897064d51ea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
 SRCREV = "4fee3efc189c83ccd26a9cd8265185c98458c94d"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
index db8d871616e..c5e77b3a908 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master;protocol=https \
            "
 SRCREV = "7d7cdaa17bc8c349102cfee1d5062d6b7185c172"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 4827e3a22c6..c1ffc7ecde9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
index 636877bf26a..85dd99888dc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
 SRCREV = "f4974ccd170cf2338c0582f607af5d8dfc3dac51"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 2553d895292..49c42bd68a0 100644
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
index e4a7922ad17..6ada0b0295b 100644
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
index 9f23794df18..c49e935d1cc 100644
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
index 034e19dc7ae..50f6da24f3a 100644
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
index 37cec138427..c66ff3a7da9 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=master"
+SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/libgit2/libgit2_1.3.0.bb b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
index bf625c325db..de913c780db 100644
--- a/meta/recipes-support/libgit2/libgit2_1.3.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
 SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
index ec6bc057283..936101a1525 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
 SRCREV = "418c1e64231255aec2167cbb20aab62a0863415d"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
index 3ec6f135c5d..695ad043987 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
@@ -10,7 +10,7 @@ DEPENDS += "gperf-native"
 PV .= "+git${SRCPV}"
 SRCREV = "2457dec1a90101d720e89e8027376742e2f3c327"
 
-SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main \
+SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main;protocol=https \
            file://0001-configure.ac-Bump-version-to-2.5.99.patch \
            file://0001-arch-Add-riscv32-architecture-support.patch \
            file://0002-man-Add-RISCV64-to-arch-list.patch \
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index b22eea3156a..a3c48bccfb2 100644
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
index 66e826304f8..19f2293a513 100644
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
index d8330f460c2..7fe3c37fde7 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
 SRCREV = "34826623f58399b24c21f1788e2cdaea34521b7b"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.14.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
index 72d1e3f3dbd..222d7cc630b 100644
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
index 616b38b28b9..50e215d20f4 100644
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
index 4e48365a71b..686fbea591b 100644
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
2.32.0


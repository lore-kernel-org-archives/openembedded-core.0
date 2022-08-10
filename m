Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26778C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:45:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.2828.1660160716304288796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CoUDMDZU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z12so18895497wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=77LH8hO/Y/9rOoRiHeXD3gijQ6Srz8yVw/MhJ9U01hU=;
        b=CoUDMDZUgpG1c5aB+LqiXu4GxQe4AR4UhQ53zXWEER1GfOL4NYi9ZjZvfphJfcAl10
         5ivMqeJmLfGpwQHfWdehicPFn1tBIAz0rKNg2sbb/thB7xsttMgyVw3a5B4PfThclLWy
         0Cjhox9X36hp70IJidyDPMYjKETsQPBcSZ5lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=77LH8hO/Y/9rOoRiHeXD3gijQ6Srz8yVw/MhJ9U01hU=;
        b=wyQckz5EQj5sUhHStJ3nVDXS5VCQEZDbTrLPG24bqHL+/rgLeqFz2LBeFJaFiopzlJ
         GfLZ1rsdsYSrC9A/i+OmWj8LCyPxMSrPfWzvx9ih9UAbIacBPQXg7ykVWrUIMxLQoNcu
         l2KyfySTfj5H6Soxabt1gED5+DeVmTWbFnVbzMkaTn7u/1tMz+AwK4L46W47SXoRnWNb
         PvhU+YVAgtTyiiaK74voV/dbi6sv0G6dwTxbjz4Q19k425vxXd+5/v9NEcoa1pphSgow
         a71MrQn+ygBPOIxezSD4mgrVn+zCdaLo+ORyk2VWryglm106aDBiELgmUZ7w8LWR7re7
         jz3A==
X-Gm-Message-State: ACgBeo0zJ92mvGg9+fv5cAGGgRTElcvtgpbtHYPfj7FgBxzSIi+A6pJY
	xqwxTU6MwNlDTl7EXZ5n3kGUoIK0/rlRdA==
X-Google-Smtp-Source: 
 AA6agR7TYrjVWr5YojMpJd4t2Of65Eg/78oZ81qtXqNfnSPtbJCEvpvWQeRk8BMBorH59Dkfw4Lfew==
X-Received: by 2002:a05:6000:15c6:b0:222:ca5b:3868 with SMTP id
 y6-20020a05600015c600b00222ca5b3868mr9764798wry.152.1660160715943;
        Wed, 10 Aug 2022 12:45:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 l21-20020a1ced15000000b0039747cf8354sm3240823wmh.39.2022.08.10.12.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:45:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] classes: Add SPDX license identifiers
Date: Wed, 10 Aug 2022 20:45:09 +0100
Message-Id: <20220810194510.484900-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169205

As stated in our top level license files, the license is MIT unless
otherwise stated. Add SPDX identifers accordingly. Replace older
license statementa with the standardised syntax. Also drop "All
Rights Reserved" expression as it isn't used now, doesn't mean anything
and is confusing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass                         | 2 ++
 meta/classes-global/buildstats.bbclass                   | 2 ++
 meta/classes-global/debian.bbclass                       | 2 ++
 meta/classes-global/devshell.bbclass                     | 2 ++
 meta/classes-global/license.bbclass                      | 2 ++
 meta/classes-global/package.bbclass                      | 2 ++
 meta/classes-global/package_deb.bbclass                  | 2 ++
 meta/classes-global/package_ipk.bbclass                  | 2 ++
 meta/classes-global/package_pkgdata.bbclass              | 2 ++
 meta/classes-global/package_rpm.bbclass                  | 2 ++
 meta/classes-global/package_tar.bbclass                  | 2 ++
 meta/classes-global/packagedata.bbclass                  | 2 ++
 meta/classes-global/patch.bbclass                        | 2 ++
 meta/classes-global/remove-libtool.bbclass               | 2 ++
 meta/classes-global/sanity.bbclass                       | 2 ++
 meta/classes-global/sstate.bbclass                       | 2 ++
 meta/classes-global/staging.bbclass                      | 2 ++
 meta/classes-global/uninative.bbclass                    | 2 ++
 meta/classes-global/utility-tasks.bbclass                | 2 ++
 meta/classes-global/utils.bbclass                        | 2 ++
 meta/classes-recipe/allarch.bbclass                      | 2 ++
 meta/classes-recipe/autotools-brokensep.bbclass          | 2 ++
 meta/classes-recipe/autotools.bbclass                    | 2 ++
 meta/classes-recipe/baremetal-image.bbclass              | 2 ++
 meta/classes-recipe/bash-completion.bbclass              | 2 ++
 meta/classes-recipe/bin_package.bbclass                  | 2 ++
 meta/classes-recipe/binconfig-disabled.bbclass           | 2 ++
 meta/classes-recipe/binconfig.bbclass                    | 2 ++
 meta/classes-recipe/cargo.bbclass                        | 2 ++
 meta/classes-recipe/cargo_common.bbclass                 | 2 ++
 meta/classes-recipe/cmake.bbclass                        | 2 ++
 meta/classes-recipe/cml1.bbclass                         | 2 ++
 meta/classes-recipe/compress_doc.bbclass                 | 2 ++
 meta/classes-recipe/cpan-base.bbclass                    | 2 ++
 meta/classes-recipe/cpan.bbclass                         | 2 ++
 meta/classes-recipe/cpan_build.bbclass                   | 2 ++
 meta/classes-recipe/deploy.bbclass                       | 2 ++
 meta/classes-recipe/dos2unix.bbclass                     | 2 ++
 meta/classes-recipe/externalsrc.bbclass                  | 3 ++-
 meta/classes-recipe/fontcache.bbclass                    | 2 ++
 meta/classes-recipe/gconf.bbclass                        | 2 ++
 meta/classes-recipe/gettext.bbclass                      | 2 ++
 meta/classes-recipe/image-artifact-names.bbclass         | 2 ++
 meta/classes-recipe/populate_sdk.bbclass                 | 2 ++
 meta/classes-recipe/populate_sdk_base.bbclass            | 2 ++
 meta/classes-recipe/populate_sdk_ext.bbclass             | 2 ++
 meta/classes-recipe/ptest-gnome.bbclass                  | 2 ++
 meta/classes-recipe/ptest-perl.bbclass                   | 2 ++
 meta/classes-recipe/ptest.bbclass                        | 2 ++
 meta/classes-recipe/pypi.bbclass                         | 2 ++
 meta/classes-recipe/python3-dir.bbclass                  | 2 ++
 meta/classes-recipe/python3native.bbclass                | 2 ++
 meta/classes-recipe/python3targetconfig.bbclass          | 2 ++
 meta/classes-recipe/python_flit_core.bbclass             | 2 ++
 meta/classes-recipe/python_hatchling.bbclass             | 2 ++
 meta/classes-recipe/python_pep517.bbclass                | 2 ++
 meta/classes-recipe/python_poetry_core.bbclass           | 2 ++
 meta/classes-recipe/python_pyo3.bbclass                  | 2 ++
 meta/classes-recipe/python_setuptools3_rust.bbclass      | 2 ++
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 2 ++
 meta/classes-recipe/qemu.bbclass                         | 2 ++
 meta/classes-recipe/qemuboot.bbclass                     | 2 ++
 meta/classes-recipe/rootfs-postcommands.bbclass          | 2 ++
 meta/classes-recipe/rootfs_deb.bbclass                   | 2 ++
 meta/classes-recipe/rootfs_ipk.bbclass                   | 2 ++
 meta/classes-recipe/rootfs_rpm.bbclass                   | 2 ++
 meta/classes-recipe/rootfsdebugfiles.bbclass             | 2 ++
 meta/classes-recipe/rust-bin.bbclass                     | 2 ++
 meta/classes-recipe/rust-common.bbclass                  | 2 ++
 meta/classes-recipe/rust-target-config.bbclass           | 2 ++
 meta/classes-recipe/rust.bbclass                         | 2 ++
 meta/classes-recipe/siteinfo.bbclass                     | 2 ++
 meta/classes-recipe/testimage.bbclass                    | 2 +-
 meta/classes-recipe/testsdk.bbclass                      | 2 +-
 meta/classes-recipe/texinfo.bbclass                      | 2 ++
 meta/classes-recipe/toolchain-scripts-base.bbclass       | 2 ++
 meta/classes-recipe/toolchain-scripts.bbclass            | 2 ++
 meta/classes-recipe/uboot-config.bbclass                 | 3 +++
 meta/classes-recipe/uboot-extlinux-config.bbclass        | 2 +-
 meta/classes-recipe/uboot-sign.bbclass                   | 2 ++
 meta/classes-recipe/update-alternatives.bbclass          | 2 ++
 meta/classes-recipe/update-rc.d.bbclass                  | 2 ++
 meta/classes-recipe/useradd.bbclass                      | 2 ++
 meta/classes-recipe/useradd_base.bbclass                 | 2 ++
 meta/classes-recipe/vala.bbclass                         | 2 ++
 meta/classes-recipe/waf.bbclass                          | 2 ++
 meta/classes-recipe/xmlcatalog.bbclass                   | 2 ++
 meta/classes/archiver.bbclass                            | 2 ++
 meta/classes/buildhistory.bbclass                        | 2 ++
 meta/classes/buildstats-summary.bbclass                  | 2 ++
 meta/classes/ccache.bbclass                              | 2 ++
 meta/classes/ccmake.bbclass                              | 2 ++
 meta/classes/chrpath.bbclass                             | 2 ++
 meta/classes/copyleft_compliance.bbclass                 | 2 ++
 meta/classes/copyleft_filter.bbclass                     | 2 ++
 meta/classes/core-image.bbclass                          | 2 ++
 meta/classes/cross-canadian.bbclass                      | 2 ++
 meta/classes/cross.bbclass                               | 2 ++
 meta/classes/crosssdk.bbclass                            | 2 ++
 meta/classes/cve-check.bbclass                           | 2 ++
 meta/classes/devicetree.bbclass                          | 2 ++
 meta/classes/devtool-source.bbclass                      | 2 ++
 meta/classes/devupstream.bbclass                         | 2 ++
 meta/classes/distro_features_check.bbclass               | 2 ++
 meta/classes/distrooverrides.bbclass                     | 2 ++
 meta/classes/extrausers.bbclass                          | 2 ++
 meta/classes/features_check.bbclass                      | 3 +++
 meta/classes/fs-uuid.bbclass                             | 2 ++
 meta/classes/gi-docgen.bbclass                           | 2 ++
 meta/classes/gio-module-cache.bbclass                    | 2 ++
 meta/classes/glide.bbclass                               | 2 ++
 meta/classes/gnomebase.bbclass                           | 2 ++
 meta/classes/go-mod.bbclass                              | 2 ++
 meta/classes/go-ptest.bbclass                            | 2 ++
 meta/classes/go.bbclass                                  | 2 ++
 meta/classes/goarch.bbclass                              | 2 ++
 meta/classes/gobject-introspection-data.bbclass          | 2 ++
 meta/classes/gobject-introspection.bbclass               | 2 ++
 meta/classes/grub-efi-cfg.bbclass                        | 3 +--
 meta/classes/grub-efi.bbclass                            | 2 ++
 meta/classes/gsettings.bbclass                           | 2 ++
 meta/classes/gtk-doc.bbclass                             | 2 ++
 meta/classes/gtk-icon-cache.bbclass                      | 2 ++
 meta/classes/gtk-immodules-cache.bbclass                 | 2 ++
 meta/classes/icecc.bbclass                               | 2 ++
 meta/classes/image-buildinfo.bbclass                     | 2 +-
 meta/classes/image-combined-dbg.bbclass                  | 2 ++
 meta/classes/image-container.bbclass                     | 2 ++
 meta/classes/image-live.bbclass                          | 5 +++--
 meta/classes/image-postinst-intercepts.bbclass           | 2 ++
 meta/classes/image.bbclass                               | 2 ++
 meta/classes/image_types.bbclass                         | 2 ++
 meta/classes/image_types_wic.bbclass                     | 2 ++
 meta/classes/insane.bbclass                              | 2 ++
 meta/classes/kernel-arch.bbclass                         | 2 ++
 meta/classes/kernel-artifact-names.bbclass               | 2 ++
 meta/classes/kernel-devicetree.bbclass                   | 2 ++
 meta/classes/kernel-fitimage.bbclass                     | 2 ++
 meta/classes/kernel-grub.bbclass                         | 2 ++
 meta/classes/kernel-module-split.bbclass                 | 2 ++
 meta/classes/kernel-uboot.bbclass                        | 2 ++
 meta/classes/kernel-uimage.bbclass                       | 2 ++
 meta/classes/kernel-yocto.bbclass                        | 2 ++
 meta/classes/kernel.bbclass                              | 2 ++
 meta/classes/kernelsrc.bbclass                           | 2 ++
 meta/classes/lib_package.bbclass                         | 2 ++
 meta/classes/libc-package.bbclass                        | 2 ++
 meta/classes/license_image.bbclass                       | 2 ++
 meta/classes/linux-dummy.bbclass                         | 2 ++
 meta/classes/linux-kernel-base.bbclass                   | 2 ++
 meta/classes/linuxloader.bbclass                         | 2 ++
 meta/classes/live-vm-common.bbclass                      | 2 ++
 meta/classes/logging.bbclass                             | 2 ++
 meta/classes/manpages.bbclass                            | 2 ++
 meta/classes/mcextend.bbclass                            | 2 ++
 meta/classes/meson-routines.bbclass                      | 2 ++
 meta/classes/meson.bbclass                               | 2 ++
 meta/classes/metadata_scm.bbclass                        | 2 ++
 meta/classes/migrate_localcount.bbclass                  | 2 ++
 meta/classes/mime-xdg.bbclass                            | 1 +
 meta/classes/mime.bbclass                                | 2 ++
 meta/classes/mirrors.bbclass                             | 2 ++
 meta/classes/module-base.bbclass                         | 2 ++
 meta/classes/module.bbclass                              | 2 ++
 meta/classes/multilib.bbclass                            | 2 ++
 meta/classes/multilib_global.bbclass                     | 2 ++
 meta/classes/multilib_header.bbclass                     | 2 ++
 meta/classes/multilib_script.bbclass                     | 2 ++
 meta/classes/native.bbclass                              | 2 ++
 meta/classes/nativesdk.bbclass                           | 2 ++
 meta/classes/nopackages.bbclass                          | 2 ++
 meta/classes/oelint.bbclass                              | 2 ++
 meta/classes/overlayfs-etc.bbclass                       | 2 ++
 meta/classes/overlayfs.bbclass                           | 2 ++
 meta/classes/own-mirrors.bbclass                         | 2 ++
 meta/classes/packagegroup.bbclass                        | 2 ++
 meta/classes/perl-version.bbclass                        | 2 ++
 meta/classes/perlnative.bbclass                          | 2 ++
 meta/classes/pixbufcache.bbclass                         | 2 ++
 meta/classes/pkgconfig.bbclass                           | 2 ++
 meta/classes/prexport.bbclass                            | 2 ++
 meta/classes/primport.bbclass                            | 2 ++
 meta/classes/recipe_sanity.bbclass                       | 2 ++
 meta/classes/relative_symlinks.bbclass                   | 2 ++
 meta/classes/relocatable.bbclass                         | 2 ++
 meta/classes/report-error.bbclass                        | 3 ++-
 meta/classes/rm_work.bbclass                             | 2 ++
 meta/classes/rm_work_and_downloads.bbclass               | 3 +--
 meta/classes/scons.bbclass                               | 2 ++
 meta/classes/setuptools3-base.bbclass                    | 2 ++
 meta/classes/setuptools3.bbclass                         | 2 ++
 meta/classes/setuptools3_legacy.bbclass                  | 2 ++
 meta/classes/sign_ipk.bbclass                            | 2 ++
 meta/classes/sign_package_feed.bbclass                   | 2 ++
 meta/classes/sign_rpm.bbclass                            | 2 ++
 meta/classes/siteconfig.bbclass                          | 2 ++
 meta/classes/syslinux.bbclass                            | 4 ++--
 meta/classes/systemd-boot-cfg.bbclass                    | 2 ++
 meta/classes/systemd-boot.bbclass                        | 2 +-
 meta/classes/systemd.bbclass                             | 2 ++
 meta/classes/terminal.bbclass                            | 2 ++
 meta/classes/testexport.bbclass                          | 3 +--
 meta/classes/toaster.bbclass                             | 2 +-
 meta/classes/typecheck.bbclass                           | 2 ++
 meta/classes/upstream-version-is-even.bbclass            | 2 ++
 meta/classes/useradd-staticids.bbclass                   | 2 ++
 meta/classes/yocto-check-layer.bbclass                   | 2 ++
 207 files changed, 407 insertions(+), 18 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 1aa0978f650..8203f545192 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 BB_DEFAULT_TASK ?= "build"
 CLASSOVERRIDE ?= "class-target"
diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
index 0e4e340ad17..f49a67aa4f0 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 
diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/debian.bbclass
index 2fd1b987dc0..7135d74837c 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Debian package renaming only occurs when a package is built
 # We therefore have to make sure we build all runtime packages
diff --git a/meta/classes-global/devshell.bbclass b/meta/classes-global/devshell.bbclass
index 4545d988c16..03af56b7a22 100644
--- a/meta/classes-global/devshell.bbclass
+++ b/meta/classes-global/devshell.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit terminal
 
diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index f08bacff120..560acb8b6f1 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Populates LICENSE_DIRECTORY as set in distro config with the license files as set by
 # LIC_FILES_CHKSUM.
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index a4b62638840..418400da8c9 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Packaging process
diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index a9b8ba01184..ec7e10dbc99 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright 2006-2008 OpenedHand Ltd.
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit package
 
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 552361e8fdb..c43592af7e3 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit package
 
diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index e495eaf6bd3..f653bd92408 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 WORKDIR_PKGDATA = "${WORKDIR}/pkgdata-sysroot"
 
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index a24ffb719a2..63c1b077a30 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit package
 
diff --git a/meta/classes-global/package_tar.bbclass b/meta/classes-global/package_tar.bbclass
index 0c5c3e58e80..de995f97473 100644
--- a/meta/classes-global/package_tar.bbclass
+++ b/meta/classes-global/package_tar.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit package
 
diff --git a/meta/classes-global/packagedata.bbclass b/meta/classes-global/packagedata.bbclass
index 89a015b8790..9f72c01d774 100644
--- a/meta/classes-global/packagedata.bbclass
+++ b/meta/classes-global/packagedata.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python read_subpackage_metadata () {
     import oe.packagedata
diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.bbclass
index 8de70254919..e3157c7b188 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -1,4 +1,6 @@
 # Copyright (C) 2006  OpenedHand LTD
+#
+# SPDX-License-Identifier: MIT
 
 # Point to an empty file so any user's custom settings don't break things
 QUILTRCFILE ?= "${STAGING_ETCDIR_NATIVE}/quiltrc"
diff --git a/meta/classes-global/remove-libtool.bbclass b/meta/classes-global/remove-libtool.bbclass
index ef79151aa91..8e987388c80 100644
--- a/meta/classes-global/remove-libtool.bbclass
+++ b/meta/classes-global/remove-libtool.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class removes libtool .la files after do_install
 
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index f1ebdf5684a..4104694478e 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Sanity check the users setup for common misconfigurations
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5009ce825c8..cd77c58dbf8 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 SSTATE_VERSION = "10"
 
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 55df9d1c915..5a1f43de780 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # These directories will be staged in the sysroot
 SYSROOT_DIRS = " \
diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 76999eb6530..4b7fb364498 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
diff --git a/meta/classes-global/utility-tasks.bbclass b/meta/classes-global/utility-tasks.bbclass
index 1275a45861f..ae2da330b86 100644
--- a/meta/classes-global/utility-tasks.bbclass
+++ b/meta/classes-global/utility-tasks.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 addtask listtasks
 do_listtasks[nostamp] = "1"
diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index 27f6f8d3248..8d797ff126c 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 oe_soinstall() {
 	# Purpose: Install shared library file and
diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index 630cd070f6f..9138f40ed84 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class is used for architecture independent recipes/data files (usually scripts)
diff --git a/meta/classes-recipe/autotools-brokensep.bbclass b/meta/classes-recipe/autotools-brokensep.bbclass
index ac9a8d07c90..a0fb4b7b503 100644
--- a/meta/classes-recipe/autotools-brokensep.bbclass
+++ b/meta/classes-recipe/autotools-brokensep.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Autotools class for recipes where separate build dir doesn't work
 # Ideally we should fix software so it does work. Standard autotools supports
diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index c77ba71a3a0..a4c1c4be41d 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def get_autotools_dep(d):
     if d.getVar('INHIBIT_AUTOTOOLS_DEPS'):
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index 10ca390c48a..3a979f2ed12 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Baremetal image class
 #
diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index cefd7dd18d8..b656e76c09a 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPENDS:append:class-target = " bash-completion"
 
diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
index 9d1b6101d1f..3a1befc29c5 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Common variable and task for the binary package recipe.
 # Basic principle:
diff --git a/meta/classes-recipe/binconfig-disabled.bbclass b/meta/classes-recipe/binconfig-disabled.bbclass
index c8f76b790ba..cbe2078e0f3 100644
--- a/meta/classes-recipe/binconfig-disabled.bbclass
+++ b/meta/classes-recipe/binconfig-disabled.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Class to disable binconfig files instead of installing them
diff --git a/meta/classes-recipe/binconfig.bbclass b/meta/classes-recipe/binconfig.bbclass
index f50ed36d503..427dba7f1f7 100644
--- a/meta/classes-recipe/binconfig.bbclass
+++ b/meta/classes-recipe/binconfig.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 FILES:${PN}-dev += "${bindir}/*-config"
  
diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index d36c3d5071f..d1e83518b58 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ##
 ## Purpose:
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 51b1ebb77fd..eec7710a4c8 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ##
 ## Purpose:
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index cd7031b82dd..554b948c32a 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 8c21dff4d27..b79091383de 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # returns all the elements from the src uri that are .cfg files
 def find_cfgs(d):
diff --git a/meta/classes-recipe/compress_doc.bbclass b/meta/classes-recipe/compress_doc.bbclass
index 2298b6ed0c7..d603caf858b 100644
--- a/meta/classes-recipe/compress_doc.bbclass
+++ b/meta/classes-recipe/compress_doc.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Compress man pages in ${mandir} and info pages in ${infodir}
 #
diff --git a/meta/classes-recipe/cpan-base.bbclass b/meta/classes-recipe/cpan-base.bbclass
index 2c53eed3c4e..1db0a4ded62 100644
--- a/meta/classes-recipe/cpan-base.bbclass
+++ b/meta/classes-recipe/cpan-base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # cpan-base providers various perl related information needed for building
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index 7ab33423c92..bb76a5b3261 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This is for perl modules that use the old Makefile.PL build system
diff --git a/meta/classes-recipe/cpan_build.bbclass b/meta/classes-recipe/cpan_build.bbclass
index 0ad7d0b3c91..026859b6c78 100644
--- a/meta/classes-recipe/cpan_build.bbclass
+++ b/meta/classes-recipe/cpan_build.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This is for perl modules that use the new Build.PL build system
diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index 7c28e6934cf..f56fe98d6da 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
diff --git a/meta/classes-recipe/dos2unix.bbclass b/meta/classes-recipe/dos2unix.bbclass
index b02db9b23a7..18e89b1cf2a 100644
--- a/meta/classes-recipe/dos2unix.bbclass
+++ b/meta/classes-recipe/dos2unix.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for use to convert all CRLF line terminators to LF
 # provided that some projects are being developed/maintained
diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
index 90792a737b1..51dbe9ea5a2 100644
--- a/meta/classes-recipe/externalsrc.bbclass
+++ b/meta/classes-recipe/externalsrc.bbclass
@@ -2,7 +2,8 @@
 # Author: Richard Purdie
 # Some code and influence taken from srctree.bbclass:
 # Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
+#
+# SPDX-License-Identifier: MIT
 #
 # externalsrc.bbclass enables use of an existing source tree, usually external to
 # the build system to build a piece of software rather than the usual fetch/unpack/patch
diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 2ca51c53379..0d496b72ddc 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class will generate the proper postinst/postrm scriptlets for font
diff --git a/meta/classes-recipe/gconf.bbclass b/meta/classes-recipe/gconf.bbclass
index d4d94583abd..b81851bc78e 100644
--- a/meta/classes-recipe/gconf.bbclass
+++ b/meta/classes-recipe/gconf.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPENDS += "gconf"
 PACKAGE_WRITE_DEPS += "gconf-native"
diff --git a/meta/classes-recipe/gettext.bbclass b/meta/classes-recipe/gettext.bbclass
index 4aecbb44130..c313885d52e 100644
--- a/meta/classes-recipe/gettext.bbclass
+++ b/meta/classes-recipe/gettext.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def gettext_dependencies(d):
     if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index 425683a7e13..5c4e746b903 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ##################################################################
 # Specific image creation and rootfs population info.
diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-recipe/populate_sdk.bbclass
index 3e3a290ef22..caeef5d2b2a 100644
--- a/meta/classes-recipe/populate_sdk.bbclass
+++ b/meta/classes-recipe/populate_sdk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # The majority of populate_sdk is located in populate_sdk_base
 # This chunk simply facilitates compatibility with SDK only recipes.
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index df8ef8ef127..0be108ad98e 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PACKAGES = ""
 
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index a28588a384e..56e24c4eedc 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Extensible SDK
 
diff --git a/meta/classes-recipe/ptest-gnome.bbclass b/meta/classes-recipe/ptest-gnome.bbclass
index d68df978d7f..d4ad22d85d5 100644
--- a/meta/classes-recipe/ptest-gnome.bbclass
+++ b/meta/classes-recipe/ptest-gnome.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit ptest
 
diff --git a/meta/classes-recipe/ptest-perl.bbclass b/meta/classes-recipe/ptest-perl.bbclass
index fba13934c91..c283fdd1fc4 100644
--- a/meta/classes-recipe/ptest-perl.bbclass
+++ b/meta/classes-recipe/ptest-perl.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit ptest
 
diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index bdb50ff39a0..0383206a6dd 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 SUMMARY:${PN}-ptest ?= "${SUMMARY} - Package test files"
 DESCRIPTION:${PN}-ptest ?= "${DESCRIPTION}  \
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index b59f0d33ace..aab04c638fa 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def pypi_package(d):
     bpn = d.getVar('BPN')
diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index f98380d331d..912c67253c6 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PYTHON_BASEVERSION = "3.10"
 PYTHON_ABI = ""
diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index ec7402d9043..654a002fdb9 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python3-dir
 
diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index ad3629180d3..3f89e5e09e2 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python3native
 
diff --git a/meta/classes-recipe/python_flit_core.bbclass b/meta/classes-recipe/python_flit_core.bbclass
index 0f5301084f8..a0b1feb70ad 100644
--- a/meta/classes-recipe/python_flit_core.bbclass
+++ b/meta/classes-recipe/python_flit_core.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python_pep517 python3native python3-dir setuptools3-base
 
diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-recipe/python_hatchling.bbclass
index 502ec877c1c..b9e6582eb50 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python_pep517 python3native python3-dir setuptools3-base
 
diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-recipe/python_pep517.bbclass
index c001b7d1572..202dde0bc31 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Common infrastructure for Python packages that use PEP-517 compliant packaging.
 # https://www.python.org/dev/peps/pep-0517/
diff --git a/meta/classes-recipe/python_poetry_core.bbclass b/meta/classes-recipe/python_poetry_core.bbclass
index 5de90a7be34..c7dc5d0382e 100644
--- a/meta/classes-recipe/python_poetry_core.bbclass
+++ b/meta/classes-recipe/python_poetry_core.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python_pep517 python3native setuptools3-base
 
diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 3b938667b53..9a32eac6fd3 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class helps make sure that Python extensions built with PyO3
diff --git a/meta/classes-recipe/python_setuptools3_rust.bbclass b/meta/classes-recipe/python_setuptools3_rust.bbclass
index 0a4eaddc114..d6ce2edb963 100644
--- a/meta/classes-recipe/python_setuptools3_rust.bbclass
+++ b/meta/classes-recipe/python_setuptools3_rust.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python_pyo3 setuptools3
 
diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/meta/classes-recipe/python_setuptools_build_meta.bbclass
index 346b13337e2..4c84d1e8d0b 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit setuptools3-base python_pep517
 
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index 924457a4977..874b15127cb 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class contains functions for recipes that need QEMU or test for its
diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 54cfcd25f28..018c000ca20 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Help runqemu boot target board, "QB" means Qemu Boot, the following
 # vars can be set in conf files, such as <bsp.conf> to make it can be
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 49338eba228..bf1e992bb27 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Zap the root password if debug-tweaks and empty-root-password features are not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
diff --git a/meta/classes-recipe/rootfs_deb.bbclass b/meta/classes-recipe/rootfs_deb.bbclass
index 0469ba7059a..c5c6426abb8 100644
--- a/meta/classes-recipe/rootfs_deb.bbclass
+++ b/meta/classes-recipe/rootfs_deb.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright 2006-2007 Openedhand Ltd.
 #
+# SPDX-License-Identifier: MIT
+#
 
 ROOTFS_PKGMANAGE = "dpkg apt"
 
diff --git a/meta/classes-recipe/rootfs_ipk.bbclass b/meta/classes-recipe/rootfs_ipk.bbclass
index 48732e97841..a48ad07dfc8 100644
--- a/meta/classes-recipe/rootfs_ipk.bbclass
+++ b/meta/classes-recipe/rootfs_ipk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Creates a root filesystem out of IPKs
diff --git a/meta/classes-recipe/rootfs_rpm.bbclass b/meta/classes-recipe/rootfs_rpm.bbclass
index 629e1d41a97..6eccd5a9599 100644
--- a/meta/classes-recipe/rootfs_rpm.bbclass
+++ b/meta/classes-recipe/rootfs_rpm.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Creates a root filesystem out of rpm packages
diff --git a/meta/classes-recipe/rootfsdebugfiles.bbclass b/meta/classes-recipe/rootfsdebugfiles.bbclass
index 98cea38de04..cbcf876479e 100644
--- a/meta/classes-recipe/rootfsdebugfiles.bbclass
+++ b/meta/classes-recipe/rootfsdebugfiles.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class installs additional files found on the build host
 # directly into the rootfs.
diff --git a/meta/classes-recipe/rust-bin.bbclass b/meta/classes-recipe/rust-bin.bbclass
index 369c574ed0d..b8e7ef8191a 100644
--- a/meta/classes-recipe/rust-bin.bbclass
+++ b/meta/classes-recipe/rust-bin.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit rust
 
diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 344e6586154..93bf6c8be64 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python3native
 inherit rust-target-config
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index a435523e4b2..35d83e0cd26 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Right now this is focused on arm-specific tune features.
 # We get away with this for now as one can only use x86-64 as the build host
diff --git a/meta/classes-recipe/rust.bbclass b/meta/classes-recipe/rust.bbclass
index b91de85db22..dae25cac2a5 100644
--- a/meta/classes-recipe/rust.bbclass
+++ b/meta/classes-recipe/rust.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit rust-common
 
diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index 2f20ad781ff..d31c9b2571a 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class exists to provide information about the targets that
 # may be needed by other classes and/or recipes. If you add a new
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 7898223bce6..8d2fab21dff 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -1,6 +1,6 @@
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 
 inherit metadata_scm
 inherit image-artifact-names
diff --git a/meta/classes-recipe/testsdk.bbclass b/meta/classes-recipe/testsdk.bbclass
index 8b2e74f6069..fd82e6ef41d 100644
--- a/meta/classes-recipe/testsdk.bbclass
+++ b/meta/classes-recipe/testsdk.bbclass
@@ -1,6 +1,6 @@
 # Copyright (C) 2013 - 2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 
 # testsdk.bbclass enables testing for SDK and Extensible SDK
 #
diff --git a/meta/classes-recipe/texinfo.bbclass b/meta/classes-recipe/texinfo.bbclass
index d7afbc7d6aa..380247faf57 100644
--- a/meta/classes-recipe/texinfo.bbclass
+++ b/meta/classes-recipe/texinfo.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class is inherited by recipes whose upstream packages invoke the
 # texinfo utilities at build-time. Native and cross recipes are made to use the
diff --git a/meta/classes-recipe/toolchain-scripts-base.bbclass b/meta/classes-recipe/toolchain-scripts-base.bbclass
index e0719e584bc..d24a986e022 100644
--- a/meta/classes-recipe/toolchain-scripts-base.bbclass
+++ b/meta/classes-recipe/toolchain-scripts-base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #This function create a version information file
 toolchain_create_sdk_version () {
diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index eec77805306..3cc823fe63d 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit toolchain-scripts-base siteinfo kernel-arch
 
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index e8da8c7452a..9889d026fad 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -10,6 +10,9 @@
 # UBOOT_MACHINE = "config"
 #
 # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
+#
+# SPDX-License-Identifier: MIT
+
 
 def removesuffix(s, suffix):
     if suffix and s.endswith(suffix):
diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index dcebe7ff313..86a7d30ca0c 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -54,7 +54,7 @@
 #   APPEND root=/dev/mmcblk2p2 rootwait rw console=${console}
 #
 # Copyright (C) 2016, O.S. Systems Software LTDA.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
+# SPDX-License-Identifier: MIT
 #
 # The kernel has an internal default console, which you can override with
 # a console=...some_tty...
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 970f20407b7..debbf23ec60 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This file is part of U-Boot verified boot support and is intended to be
 # inherited from u-boot recipe and from kernel-fitimage.bbclass.
diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 09465898682..970d9bcd450 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class is used to help the alternatives system which is useful when
 # multiple sources provide same command. You can use update-alternatives
diff --git a/meta/classes-recipe/update-rc.d.bbclass b/meta/classes-recipe/update-rc.d.bbclass
index b92ff5a4fae..cb2aaba57c7 100644
--- a/meta/classes-recipe/update-rc.d.bbclass
+++ b/meta/classes-recipe/update-rc.d.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 UPDATERCPN ?= "${PN}"
 
diff --git a/meta/classes-recipe/useradd.bbclass b/meta/classes-recipe/useradd.bbclass
index 2aff3eda423..4d3bd9a5f56 100644
--- a/meta/classes-recipe/useradd.bbclass
+++ b/meta/classes-recipe/useradd.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit useradd_base
 
diff --git a/meta/classes-recipe/useradd_base.bbclass b/meta/classes-recipe/useradd_base.bbclass
index ee8cc6c8435..863cb7b76c5 100644
--- a/meta/classes-recipe/useradd_base.bbclass
+++ b/meta/classes-recipe/useradd_base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This bbclass provides basic functionality for user/group settings.
 # This bbclass is intended to be inherited by useradd.bbclass and
diff --git a/meta/classes-recipe/vala.bbclass b/meta/classes-recipe/vala.bbclass
index 65e15013e1e..460ddb36f04 100644
--- a/meta/classes-recipe/vala.bbclass
+++ b/meta/classes-recipe/vala.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Everyone needs vala-native and targets need vala, too,
 # because that is where target builds look for .vapi files.
diff --git a/meta/classes-recipe/waf.bbclass b/meta/classes-recipe/waf.bbclass
index ef24c61dd87..5fa0cc49871 100644
--- a/meta/classes-recipe/waf.bbclass
+++ b/meta/classes-recipe/waf.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
diff --git a/meta/classes-recipe/xmlcatalog.bbclass b/meta/classes-recipe/xmlcatalog.bbclass
index 14a1094d0f2..5826d0a8b51 100644
--- a/meta/classes-recipe/xmlcatalog.bbclass
+++ b/meta/classes-recipe/xmlcatalog.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPENDS = "libxml2-native"
 
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2262fdd652d..0710c1ec5e6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This bbclass is used for creating archive for:
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 35db2b11927..395f594278c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -6,6 +6,8 @@
 # Copyright (C) 2011-2016 Intel Corporation
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
+# SPDX-License-Identifier: MIT
+#
 
 IMAGE_CLASSES += "image-artifact-names"
 
diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index 716189fd305..12e8f178367 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Summarize sstate usage at the end of the build
 python buildstats_summary () {
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index dee6248017a..34becb69d10 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Usage:
diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
index 75f68cc8e39..c5b4bf62601 100644
--- a/meta/classes/ccmake.bbclass
+++ b/meta/classes/ccmake.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit terminal
 
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 930c53e76f6..1aecb4df662 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 5bf16a91069..9ff9956fe90 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Deploy sources for recipes for compliance with copyleft-style licenses
 # Defaults to using symlinks, as it's a quick operation, and one can easily
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 0e93a3df42e..83cd90060d7 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Filter the license, the copyleft_should_include returns True for the
 # COPYLEFT_LICENSE_INCLUDE recipe, and False for the
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 6764035729f..4b5f2c99c4b 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -1,6 +1,8 @@
 # Common code for generating core reference images
 #
 # Copyright (C) 2007-2011 Linux Foundation
+#
+# SPDX-License-Identifier: MIT
 
 # IMAGE_FEATURES control content of the core reference images
 # 
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 23c864f6846..1670217d697 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 # NOTE - When using this class the user is responsible for ensuring that
 # TRANSLATED_TARGET_ARCH is added into PN. This ensures that if the TARGET_ARCH
 # is changed, another nativesdk xxx-canadian-cross can be installed
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 5ed21302ce7..93de9a52744 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit relocatable
 
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 3c5a1a3717a..824b1bcff47 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit cross
 
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 53790e89d14..d95465775d2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class is used to check recipes against public CVEs.
 #
diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 954582bcd35..ac1d284ccd9 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This bbclass implements device tree compliation for user provided device tree
 # sources. The compilation of the device tree sources is the same as the kernel
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 7a4568a0e4f..a02b1e9b0ec 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Development tool - source extraction helper class
 #
diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index ad1061b4d12..1529cc8fca4 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for use in BBCLASSEXTEND to make it easier to have a single recipe that
 # can build both stable tarballs and snapshots from upstream source
diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index db26c60fab0..1f2674fd6e9 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Temporarily provide fallback to the old name of the class
 
diff --git a/meta/classes/distrooverrides.bbclass b/meta/classes/distrooverrides.bbclass
index d5f3a06af48..8d9d7cda7dc 100644
--- a/meta/classes/distrooverrides.bbclass
+++ b/meta/classes/distrooverrides.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Turns certain DISTRO_FEATURES into overrides with the same
 # name plus a df- prefix. Ensures that these special
diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index e4059872d87..94576b88729 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This bbclass is used for image level user/group configuration.
 # Inherit this class if you want to make EXTRA_USERS_PARAMS effective.
diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index 3ef6b35baae..163a7bc3fcc 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -11,6 +11,9 @@
 #
 # Copyright 2019 (C) Texas Instruments Inc.
 # Copyright 2013 (C) O.S. Systems Software LTDA.
+#
+# SPDX-License-Identifier: MIT
+
 
 python () {
     if d.getVar('PARSE_ALL_RECIPES', False):
diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 93a3e420d54..a9e7eb8c67c 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Extract UUID from ${ROOTFS}, which must have been built
 # by the time that this function gets called. Only works
diff --git a/meta/classes/gi-docgen.bbclass b/meta/classes/gi-docgen.bbclass
index 3a3966c8016..8b7eaacea3f 100644
--- a/meta/classes/gi-docgen.bbclass
+++ b/meta/classes/gi-docgen.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # gi-docgen is a new gnome documentation generator, which
 # seems to be a successor to gtk-doc:
diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index 788ca99c1c8..d12e03c4a08 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
index ee073b9fbd5..21b48fa4e0d 100644
--- a/meta/classes/glide.bbclass
+++ b/meta/classes/glide.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Handle Glide Vendor Package Management use
 #
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index d424091bc0e..805daafa40c 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def gnome_verdir(v):
     return ".".join(v.split(".")[:-1])
diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
index a428471e3aa..927746a338b 100644
--- a/meta/classes/go-mod.bbclass
+++ b/meta/classes/go-mod.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Handle Go Modules support
 #
diff --git a/meta/classes/go-ptest.bbclass b/meta/classes/go-ptest.bbclass
index 2493b305a59..54fcbb535d1 100644
--- a/meta/classes/go-ptest.bbclass
+++ b/meta/classes/go-ptest.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit go ptest
 
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index d86c5859b8d..6b9748406d8 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit goarch
 inherit linuxloader
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 0bfc1c1e0dc..61ead30a637 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
 BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes/gobject-introspection-data.bbclass
index 8ec2cfe4e60..7f522a1ed32 100644
--- a/meta/classes/gobject-introspection-data.bbclass
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This variable is set to True if gobject-introspection-data is in
 # DISTRO_FEATURES and qemu-usermode is in MACHINE_FEATURES, and False otherwise.
diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 91b728214a4..0c7b7d200a9 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Inherit this class in recipes to enable building their introspection files
 
diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index ea21b3de3d8..52e85a3bb0e 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -1,8 +1,7 @@
 # grub-efi.bbclass
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
 #
-# Released under the MIT license (see packages/COPYING)
+# SPDX-License-Identifier: MIT
 
 # Provide grub-efi specific functions for building bootable images.
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 79049440bf9..4afd12195fb 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit grub-efi-cfg
 require conf/image-uefi.conf
diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index d811a0e0340..adb027ea0a0 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # A bbclass to handle installed GSettings (glib) schemas, updated the compiled
 # form on package install and remove.
diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index a32901305c0..68fa2cc7451 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Helper class to pull in the right gtk-doc dependencies and configure
 # gtk-doc to enable or disable documentation building (which requries the
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 399d107ce7e..17c7eb7a33a 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 FILES:${PN} += "${datadir}/icons/hicolor"
 
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 97e9162fa75..8fbe1dd1fb4 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class will update the inputmethod module cache for virtual keyboards
 #
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index cf08db8cf3b..a11e781f00f 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # IceCream distributed compiling support
 #
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index ef790bb73b4..206cc9d57d6 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -4,7 +4,7 @@
 # Copyright (C) 2014 Intel Corporation
 # Author: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@intel.com>
 #
-# Licensed under the MIT license, see COPYING.MIT for details
+# SPDX-License-Identifier: MIT
 #
 # Usage: add INHERIT += "image-buildinfo" to your conf file
 #
diff --git a/meta/classes/image-combined-dbg.bbclass b/meta/classes/image-combined-dbg.bbclass
index 0e8e8183ac1..dcf19685389 100644
--- a/meta/classes/image-combined-dbg.bbclass
+++ b/meta/classes/image-combined-dbg.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 IMAGE_PREPROCESS_COMMAND:append = " combine_dbg_image; "
 
diff --git a/meta/classes/image-container.bbclass b/meta/classes/image-container.bbclass
index 10036151c0e..d24b0304535 100644
--- a/meta/classes/image-container.bbclass
+++ b/meta/classes/image-container.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ROOTFS_BOOTSTRAP_INSTALL = ""
 IMAGE_TYPES_MASKED += "container"
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 2c948190cfe..1034acc49e4 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,5 +1,6 @@
-# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
+# Copyright (C) 2004, Advanced Micro Devices, Inc.
+#
+# SPDX-License-Identifier: MIT
 
 # Creates a bootable image using syslinux, your kernel and an optional
 # initrd
diff --git a/meta/classes/image-postinst-intercepts.bbclass b/meta/classes/image-postinst-intercepts.bbclass
index af81910bc7f..fc159263845 100644
--- a/meta/classes/image-postinst-intercepts.bbclass
+++ b/meta/classes/image-postinst-intercepts.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Gather existing and candidate postinst intercepts from BBPATH
 POSTINST_INTERCEPTS_DIR ?= "${COREBASE}/scripts/postinst-intercepts"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f485967ae28..e387645503a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 IMAGE_CLASSES ??= ""
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c6c44db7c7b..a731e585b2b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # The default aligment of the size of the rootfs is set to 1KiB. In case
 # you're using the SD card emulation of a QEMU system simulator you may
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index e388fa67972..c339b9bdfb4 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f6a82cc44fc..176a42fd0d8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # BB Class inspired by ebuild.sh
 #
diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index f25ad44a3d0..6f5d3bde6c3 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # set the ARCH environment variable for kernel compilation (including
diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index ce58e2af635..311075c68dc 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ##################################################################
 # Specific kernel creation info
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 28330151ecc..b2117de8050 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Support for device tree generation
 python () {
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a0d2e444b2b..838ce204cb0 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit kernel-uboot kernel-artifact-names uboot-sign
 
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index 8475e0f9da3..2325e635e1f 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # While installing a rpm to update kernel on a deployed target, it will update
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index df18f5d0f00..1b4c864a630 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 pkg_postinst:modules () {
 if [ -z "$D" ]; then
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 9eb934919b8..4aab02671e5 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # fitImage kernel compression algorithm
 FIT_KERNEL_COMP_ALG ?= "gzip"
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 8cc1dc50cc9..1a599e656c8 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit kernel-uboot
 
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 9f327933a1c..8eda0dcaf38 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 683d8c4d67f..b5ddd6dabc8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit linux-kernel-base kernel-module-split
 
diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index f40e3c88199..a32882a5d27 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 07f3f258d23..6d110155e5a 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 #
 # ${PN}-bin is defined in bitbake.conf
 #
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 580c02948e1..de3d4223a8c 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class knows how to package up [e]glibc. Its shared since prebuild binary toolchains
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 0cda839c94f..b60d6e44f40 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
 
diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy.bbclass
index 90b932c5906..9291533cf9f 100644
--- a/meta/classes/linux-dummy.bbclass
+++ b/meta/classes/linux-dummy.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python __anonymous () {
     if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 36f9caac690..cb2212c9485 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # parse kernel ABI version out of <linux/version.h>
 def get_kernelversion_headers(p):
diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 6bd8a62da90..1dfb95e31dd 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def get_musl_loader_arch(d):
     import re
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 99b92b6155a..b619f3a4be0 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Some of the vars for vm and live image are conflicted, this function
 # is used for fixing the problem.
diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index 0d59ae2631c..ce03abfe425 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # The following logging mechanisms are to be used in bash functions of recipes.
 # They are intended to map one to one in intention and output format with the
diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index 57b9be06500..693fb536714 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Inherit this class to enable or disable building and installation of manpages
 # depending on whether 'api-documentation' is in DISTRO_FEATURES. Such building
diff --git a/meta/classes/mcextend.bbclass b/meta/classes/mcextend.bbclass
index 33833c3b9e4..a489eeb3c77 100644
--- a/meta/classes/mcextend.bbclass
+++ b/meta/classes/mcextend.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python mcextend_virtclass_handler () {
     cls = e.data.getVar("BBEXTENDCURR")
diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routines.bbclass
index 6827bdb21d1..6086fce9d9b 100644
--- a/meta/classes/meson-routines.bbclass
+++ b/meta/classes/meson-routines.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit siteinfo
 
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 17c6abbd609..765e81bc4f8 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python3native meson-routines qemu
 
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index f17cdcccf1a..6842119b6b4 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 METADATA_BRANCH := "${@oe.buildcfg.detect_branch(d)}"
 METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
index cb0d1c698b5..1d00c110e28 100644
--- a/meta/classes/migrate_localcount.bbclass
+++ b/meta/classes/migrate_localcount.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
 LOCALCOUNT_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv-localcount-exports.inc"
diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
index 9e596c25fef..cbdcb4c7e9d 100644
--- a/meta/classes/mime-xdg.bbclass
+++ b/meta/classes/mime-xdg.bbclass
@@ -1,6 +1,7 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
 #
 # This class creates mime <-> application associations based on entry 
 # 'MimeType' in *.desktop files
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index e036bb23a1a..9b13f62bdab 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class is used by recipes installing mime types
diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index e56f90a7e8c..9643b31a231 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 MIRRORS += "\
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 3f3d60947e2..094b563b1a4 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit kernel-arch
 
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index bcc46ab1d82..d52d5e30984 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit module-base kernel-module-split pkgconfig
 
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 2931aed8346..10a4ef9c37a 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python multilib_virtclass_handler () {
     cls = e.data.getVar("BBEXTENDCURR")
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 7d9f48e9d9f..dcd89b2f63b 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def preferred_ml_updates(d):
     # If any of PREFERRED_PROVIDER, PREFERRED_RPROVIDER, REQUIRED_VERSION
diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index 403a24667bf..33f7e027f06 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit siteinfo
 
diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index 0cf6d502bb4..70115262542 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Recipe needs to set MULTILIB_SCRIPTS in the form <pkgname>:<scriptname>, e.g.
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1d9c3a72665..61ad053def6 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # We want native packages to be relocatable
 inherit relocatable
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 78f94c79ca7..08288fdb733 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 22017524cdb..9ea7273530a 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 deltask do_package
 deltask do_package_write_rpm
diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index a4ee7d6e335..458a25ecc39 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 addtask lint before do_build
 do_lint[nostamp] = "1"
diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
index 5c1e8f9bebe..d0bc3ecfac6 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for setting up /etc in overlayfs
 #
diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index ccc88bb4ac8..bdc6dd9d571 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for generation of overlayfs mount units
 #
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 699eb3628b9..2f24ff18304 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PREMIRRORS:prepend = " \
 cvs://.*/.*     ${SOURCE_MIRROR_URL} \
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 54917942a4a..6f17fc73b0f 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for packagegroup (package group) recipes
 
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
index c314b4b575b..269ac9eb316 100644
--- a/meta/classes/perl-version.bbclass
+++ b/meta/classes/perl-version.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PERL_OWN_DIR = ""
 
diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
index 4d6ddd83cb7..d56ec4ae72c 100644
--- a/meta/classes/perlnative.bbclass
+++ b/meta/classes/perlnative.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 EXTRANATIVEPATH += "perl-native"
 DEPENDS += "perl-native"
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b451f5a7dd4..107e38885ef 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class will generate the proper postinst/postrm scriptlets for pixbuf
diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index db57ce44726..1e1f3824dd5 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPENDS:prepend = "pkgconfig-native "
 
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index ddd0ce68db1..e5098e3308b 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 PRSERV_DUMPOPT_VERSION = "${PRAUTOINX}"
 PRSERV_DUMPOPT_PKGARCH  = ""
diff --git a/meta/classes/primport.bbclass b/meta/classes/primport.bbclass
index 4d577bf8300..00924174c1e 100644
--- a/meta/classes/primport.bbclass
+++ b/meta/classes/primport.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python primport_handler () {
     import bb.event
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index c09a551a4ff..1c2e24c6a17 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 def __note(msg, d):
     bb.note("%s: recipe_sanity: %s" % (d.getVar("P"), msg))
diff --git a/meta/classes/relative_symlinks.bbclass b/meta/classes/relative_symlinks.bbclass
index 15674db495f..9ee20e0d098 100644
--- a/meta/classes/relative_symlinks.bbclass
+++ b/meta/classes/relative_symlinks.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 do_install[postfuncs] += "install_relative_symlinks"
 
diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 7b691fe6549..d0a623fb0a9 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit chrpath
 
diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 6866d47370d..2f692fbbccb 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -4,7 +4,8 @@
 # Copyright (C) 2013 Intel Corporation
 # Author: Andreea Brandusa Proca <andreea.b.proca@intel.com>
 #
-# Licensed under the MIT license, see COPYING.MIT for details
+# SPDX-License-Identifier: MIT
+#
 
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 445d80c82ab..c493efff2fc 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # Removes source after build
diff --git a/meta/classes/rm_work_and_downloads.bbclass b/meta/classes/rm_work_and_downloads.bbclass
index 15e6091b9d5..2695a3807fd 100644
--- a/meta/classes/rm_work_and_downloads.bbclass
+++ b/meta/classes/rm_work_and_downloads.bbclass
@@ -1,8 +1,7 @@
 # Author:       Patrick Ohly <patrick.ohly@intel.com>
 # Copyright:    Copyright (C) 2015 Intel Corporation
 #
-# This file is licensed under the MIT license, see COPYING.MIT in
-# this source distribution for the terms.
+# SPDX-License-Identifier: MIT
 
 # This class is used like rm_work:
 # INHERIT += "rm_work_and_downloads"
diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index ead5ec4ce1a..5f0d4a910b1 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit python3native
 
diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setuptools3-base.bbclass
index 5d90ec1b198..21b688ced07 100644
--- a/meta/classes/setuptools3-base.bbclass
+++ b/meta/classes/setuptools3-base.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
 DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index c08178fcf5a..4c6e79ee9ab 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 inherit setuptools3-base python_pep517
 
diff --git a/meta/classes/setuptools3_legacy.bbclass b/meta/classes/setuptools3_legacy.bbclass
index 0d9345d8476..21748f922ad 100644
--- a/meta/classes/setuptools3_legacy.bbclass
+++ b/meta/classes/setuptools3_legacy.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class is for packages which use the deprecated setuptools behaviour,
 # specifically custom install tasks which don't work correctly with bdist_wheel.
diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
index 940d29f4519..51c24b38b26 100644
--- a/meta/classes/sign_ipk.bbclass
+++ b/meta/classes/sign_ipk.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for generating signed IPK packages.
 #
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d29985d5324..e9d664750c3 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for signing package feeds
 #
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 159d525261e..ee0c4808fa1 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Class for generating signed RPM packages.
 #
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 96491cf8287..953cafd285e 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 python siteconfig_do_siteconfig () {
     shared_state = sstate_state_fromvars(d)
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 894f6b37186..be3b898b4dc 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -1,6 +1,6 @@
 # syslinux.bbclass
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.
+# SPDX-License-Identifier: MIT
 
 # Provide syslinux specific functions for building bootable images.
 
diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index 64fe81d6d00..366dd237388 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 57ec0acbc53..5aa32dd9971 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -1,6 +1,6 @@
 # Copyright (C) 2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 
 # systemd-boot.bbclass - The "systemd-boot" is essentially the gummiboot merged into systemd.
 #                        The original standalone gummiboot project is dead without any more
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c24ed906644..f6564c2b310 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # The list of packages that should have systemd packaging scripts added.  For
 # each entry, optionally have a SYSTEMD_SERVICE:[package] that lists the service
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 5ca9104641b..2dfc7db2551 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 OE_TERMINAL ?= 'auto'
 OE_TERMINAL[type] = 'choice'
diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 1b0fb44a4a8..26816a750f7 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -1,7 +1,6 @@
 # Copyright (C) 2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
-#
+# SPDX-License-Identifier: MIT
 #
 # testexport.bbclass allows to execute runtime test outside OE environment.
 # Most of the tests are commands run on target image over ssh.
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index f365c091420..03c4f3a930c 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -3,7 +3,7 @@
 #
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 #
 # This bbclass is designed to extract data used by OE-Core during the build process,
 # for recording in the Toaster system.
diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
index 86fcf28942d..160f7a024b9 100644
--- a/meta/classes/typecheck.bbclass
+++ b/meta/classes/typecheck.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # Check types of bitbake configuration variables
 #
diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index b89a13414dd..19587cb12ca 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # This class ensures that the upstream version check only
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index c994b5979eb..abe484eb468 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 # In order to support a deterministic set of 'dynamic' users/groups,
 # we need a function to reformat the params based on a static file
diff --git a/meta/classes/yocto-check-layer.bbclass b/meta/classes/yocto-check-layer.bbclass
index 2d21676ec21..404f5fd9f22 100644
--- a/meta/classes/yocto-check-layer.bbclass
+++ b/meta/classes/yocto-check-layer.bbclass
@@ -1,6 +1,8 @@
 #
 # Copyright OpenEmbedded Contributors
 #
+# SPDX-License-Identifier: MIT
+#
 
 #
 # This class is used by yocto-check-layer script for additional per-recipe tests
-- 
2.34.1



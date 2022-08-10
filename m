Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F0EC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:59:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.3026.1660161591631491904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X6bECNzj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id n4so17179662wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ebsFYwCl0jx/2Woz+JYHu9ZdpXrbKrUTkMyyKDCzh9Q=;
        b=X6bECNzjfwv8EPShsuSkQLW5xnN4uS3QvdH/PzydKja4C7wgzZbNMx7oyfCClyWoVN
         /94Dbv0rQ9TYfvZ6e6YHEY+Hahk3sndB/H5dj6iO7HCLHujh9p5+MTU/HrWZUYOgzMQJ
         DrEM4oc6p1AjQTai0qE+1IJj3/4TE3urHe5z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ebsFYwCl0jx/2Woz+JYHu9ZdpXrbKrUTkMyyKDCzh9Q=;
        b=fItAt4LUKEqXvwtPUvf1Y247Xq+/1ZqowZhHw3q3xa54JZZACQpSGSX5o0oKm2oQJj
         twEOHFX/mf9LgRQ99J21yRCJjBu1IAIsgzljInUG/wS37JWvoKakC7vJUaxsLwag5gPi
         uDIXOVhTTouYss/w8uTuuf+OufryZmLBZOzlOyLJt/0PU8jTP37olemNUEths6H/xnOs
         e84p/itMc8XNspKewiCR91mM1hXeAxrsKSUgTaFKl4MYQDxVwcfsajDR7EyNEC26gi28
         uNXkjjCaaQxvK1u664BiD1/cfmBYEmYew2JjL/4i6KSSoYzSHRTLNfscSx4zkbv4dkas
         qv9Q==
X-Gm-Message-State: ACgBeo0keCNJ8iclD1JN+HZlGK+8FMpPwIBSnT8n2osT51UmlR2aYHFI
	dFoe0ylCULlX2mchDnpIriFCQGnZO+nIKQ==
X-Google-Smtp-Source: 
 AA6agR40rDy9rdkpin3kMvidyoWWQl2ghtKeP15TjGduoouQQa1Cvh2XjYb/EHeDLvS+HjnHDO6ftQ==
X-Received: by 2002:a5d:5847:0:b0:221:748d:243c with SMTP id
 i7-20020a5d5847000000b00221748d243cmr14686528wrf.222.1660161588636;
        Wed, 10 Aug 2022 12:59:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0021eaf4138aesm20264562wrx.108.2022.08.10.12.59.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:59:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] classes: Add copyright statements to files without one
Date: Wed, 10 Aug 2022 20:59:43 +0100
Message-Id: <20220810195946.486773-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810195946.486773-1-richard.purdie@linuxfoundation.org>
References: <20220810195946.486773-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169209

Where there isn't a copyright statement, add one to make it explicit.
Also drop editor config lines where they were present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass                         | 4 ++++
 meta/classes-global/buildstats.bbclass                   | 4 ++++
 meta/classes-global/debian.bbclass                       | 4 ++++
 meta/classes-global/devshell.bbclass                     | 4 ++++
 meta/classes-global/license.bbclass                      | 4 ++++
 meta/classes-global/package.bbclass                      | 4 ++++
 meta/classes-global/package_ipk.bbclass                  | 4 ++++
 meta/classes-global/package_pkgdata.bbclass              | 4 ++++
 meta/classes-global/package_rpm.bbclass                  | 4 ++++
 meta/classes-global/package_tar.bbclass                  | 4 ++++
 meta/classes-global/packagedata.bbclass                  | 4 ++++
 meta/classes-global/remove-libtool.bbclass               | 4 ++++
 meta/classes-global/sanity.bbclass                       | 4 ++++
 meta/classes-global/sstate.bbclass                       | 4 ++++
 meta/classes-global/staging.bbclass                      | 4 ++++
 meta/classes-global/uninative.bbclass                    | 4 ++++
 meta/classes-global/utility-tasks.bbclass                | 4 ++++
 meta/classes-global/utils.bbclass                        | 3 +++
 meta/classes-recipe/allarch.bbclass                      | 4 ++++
 meta/classes-recipe/autotools-brokensep.bbclass          | 4 ++++
 meta/classes-recipe/autotools.bbclass                    | 4 ++++
 meta/classes-recipe/baremetal-image.bbclass              | 4 ++++
 meta/classes-recipe/bash-completion.bbclass              | 4 ++++
 meta/classes-recipe/bin_package.bbclass                  | 4 ++--
 meta/classes-recipe/binconfig-disabled.bbclass           | 4 ++++
 meta/classes-recipe/binconfig.bbclass                    | 4 ++++
 meta/classes-recipe/cargo.bbclass                        | 4 ++++
 meta/classes-recipe/cargo_common.bbclass                 | 4 ++++
 meta/classes-recipe/cmake.bbclass                        | 4 ++++
 meta/classes-recipe/cml1.bbclass                         | 4 ++++
 meta/classes-recipe/compress_doc.bbclass                 | 4 ++++
 meta/classes-recipe/cpan-base.bbclass                    | 4 ++++
 meta/classes-recipe/cpan.bbclass                         | 4 ++++
 meta/classes-recipe/cpan_build.bbclass                   | 4 ++++
 meta/classes-recipe/deploy.bbclass                       | 4 ++++
 meta/classes-recipe/dos2unix.bbclass                     | 4 ++++
 meta/classes-recipe/fontcache.bbclass                    | 4 ++++
 meta/classes-recipe/gconf.bbclass                        | 4 ++++
 meta/classes-recipe/gettext.bbclass                      | 4 ++++
 meta/classes-recipe/image-artifact-names.bbclass         | 4 ++++
 meta/classes-recipe/populate_sdk.bbclass                 | 4 ++++
 meta/classes-recipe/populate_sdk_base.bbclass            | 4 ++++
 meta/classes-recipe/populate_sdk_ext.bbclass             | 4 ++++
 meta/classes-recipe/ptest-gnome.bbclass                  | 4 ++++
 meta/classes-recipe/ptest-perl.bbclass                   | 4 ++++
 meta/classes-recipe/ptest.bbclass                        | 4 ++++
 meta/classes-recipe/pypi.bbclass                         | 4 ++++
 meta/classes-recipe/python3-dir.bbclass                  | 4 ++++
 meta/classes-recipe/python3native.bbclass                | 4 ++++
 meta/classes-recipe/python3targetconfig.bbclass          | 4 ++++
 meta/classes-recipe/python_flit_core.bbclass             | 4 ++++
 meta/classes-recipe/python_hatchling.bbclass             | 4 ++++
 meta/classes-recipe/python_pep517.bbclass                | 4 ++++
 meta/classes-recipe/python_poetry_core.bbclass           | 4 ++++
 meta/classes-recipe/python_pyo3.bbclass                  | 4 ++++
 meta/classes-recipe/python_setuptools3_rust.bbclass      | 4 ++++
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++
 meta/classes-recipe/qemu.bbclass                         | 4 ++++
 meta/classes-recipe/qemuboot.bbclass                     | 4 ++++
 meta/classes-recipe/rootfs-postcommands.bbclass          | 3 +++
 meta/classes-recipe/rootfs_ipk.bbclass                   | 4 ++++
 meta/classes-recipe/rootfs_rpm.bbclass                   | 4 ++++
 meta/classes-recipe/rootfsdebugfiles.bbclass             | 4 ++++
 meta/classes-recipe/rust-bin.bbclass                     | 4 ++++
 meta/classes-recipe/rust-common.bbclass                  | 4 ++++
 meta/classes-recipe/rust-target-config.bbclass           | 4 ++++
 meta/classes-recipe/rust.bbclass                         | 4 ++++
 meta/classes-recipe/siteinfo.bbclass                     | 4 ++++
 meta/classes-recipe/texinfo.bbclass                      | 4 ++++
 meta/classes-recipe/toolchain-scripts-base.bbclass       | 4 ++++
 meta/classes-recipe/toolchain-scripts.bbclass            | 4 ++++
 meta/classes-recipe/uboot-sign.bbclass                   | 4 ++++
 meta/classes-recipe/update-alternatives.bbclass          | 4 ++++
 meta/classes-recipe/update-rc.d.bbclass                  | 4 ++++
 meta/classes-recipe/useradd.bbclass                      | 4 ++++
 meta/classes-recipe/useradd_base.bbclass                 | 4 ++++
 meta/classes-recipe/vala.bbclass                         | 4 ++++
 meta/classes-recipe/waf.bbclass                          | 4 ++++
 meta/classes-recipe/xmlcatalog.bbclass                   | 4 ++++
 meta/classes/archiver.bbclass                            | 6 ++++--
 meta/classes/buildstats-summary.bbclass                  | 4 ++++
 meta/classes/ccache.bbclass                              | 4 ++++
 meta/classes/ccmake.bbclass                              | 4 ++++
 meta/classes/chrpath.bbclass                             | 4 ++++
 meta/classes/copyleft_compliance.bbclass                 | 4 ++++
 meta/classes/copyleft_filter.bbclass                     | 6 ++++--
 meta/classes/create-spdx.bbclass                         | 2 ++
 meta/classes/cross-canadian.bbclass                      | 2 ++
 meta/classes/cross.bbclass                               | 4 ++++
 meta/classes/crosssdk.bbclass                            | 4 ++++
 meta/classes/cve-check.bbclass                           | 4 ++++
 meta/classes/devicetree.bbclass                          | 4 ++++
 meta/classes/devtool-source.bbclass                      | 4 ++++
 meta/classes/devupstream.bbclass                         | 4 ++++
 meta/classes/distro_features_check.bbclass               | 4 ++++
 meta/classes/distrooverrides.bbclass                     | 4 ++++
 meta/classes/extrausers.bbclass                          | 4 ++++
 meta/classes/fs-uuid.bbclass                             | 4 ++++
 meta/classes/gi-docgen.bbclass                           | 4 ++++
 meta/classes/gio-module-cache.bbclass                    | 4 ++++
 meta/classes/glide.bbclass                               | 4 ++++
 meta/classes/gnomebase.bbclass                           | 4 ++++
 meta/classes/go-mod.bbclass                              | 4 ++++
 meta/classes/go-ptest.bbclass                            | 4 ++++
 meta/classes/go.bbclass                                  | 4 ++++
 meta/classes/goarch.bbclass                              | 4 ++++
 meta/classes/gobject-introspection-data.bbclass          | 4 ++++
 meta/classes/gobject-introspection.bbclass               | 4 ++++
 meta/classes/grub-efi.bbclass                            | 4 ++++
 meta/classes/gsettings.bbclass                           | 4 ++++
 meta/classes/gtk-doc.bbclass                             | 4 ++++
 meta/classes/gtk-icon-cache.bbclass                      | 4 ++++
 meta/classes/gtk-immodules-cache.bbclass                 | 4 ++++
 meta/classes/icecc.bbclass                               | 4 ++++
 meta/classes/image-combined-dbg.bbclass                  | 4 ++++
 meta/classes/image-container.bbclass                     | 4 ++++
 meta/classes/image-postinst-intercepts.bbclass           | 4 ++++
 meta/classes/image.bbclass                               | 3 +++
 meta/classes/image_types.bbclass                         | 4 ++++
 meta/classes/image_types_wic.bbclass                     | 4 ++++
 meta/classes/insane.bbclass                              | 4 ++++
 meta/classes/kernel-arch.bbclass                         | 4 ++++
 meta/classes/kernel-artifact-names.bbclass               | 4 ++++
 meta/classes/kernel-devicetree.bbclass                   | 4 ++++
 meta/classes/kernel-fitimage.bbclass                     | 4 ++++
 meta/classes/kernel-grub.bbclass                         | 4 ++++
 meta/classes/kernel-module-split.bbclass                 | 4 ++++
 meta/classes/kernel-uboot.bbclass                        | 4 ++++
 meta/classes/kernel-uimage.bbclass                       | 4 ++++
 meta/classes/kernel-yocto.bbclass                        | 4 ++++
 meta/classes/kernel.bbclass                              | 4 ++++
 meta/classes/kernelsrc.bbclass                           | 4 ++++
 meta/classes/lib_package.bbclass                         | 3 +++
 meta/classes/libc-package.bbclass                        | 4 ++++
 meta/classes/license_image.bbclass                       | 4 ++++
 meta/classes/linux-dummy.bbclass                         | 3 +++
 meta/classes/linux-kernel-base.bbclass                   | 4 ++++
 meta/classes/linuxloader.bbclass                         | 4 ++++
 meta/classes/live-vm-common.bbclass                      | 4 ++++
 meta/classes/logging.bbclass                             | 4 ++++
 meta/classes/manpages.bbclass                            | 4 ++++
 meta/classes/mcextend.bbclass                            | 4 ++++
 meta/classes/meson-routines.bbclass                      | 4 ++++
 meta/classes/meson.bbclass                               | 4 ++++
 meta/classes/metadata_scm.bbclass                        | 3 +++
 meta/classes/migrate_localcount.bbclass                  | 4 ++++
 meta/classes/mime-xdg.bbclass                            | 3 +++
 meta/classes/mime.bbclass                                | 4 ++++
 meta/classes/mirrors.bbclass                             | 4 ++++
 meta/classes/module-base.bbclass                         | 4 ++++
 meta/classes/module.bbclass                              | 4 ++++
 meta/classes/multilib.bbclass                            | 4 ++++
 meta/classes/multilib_global.bbclass                     | 4 ++++
 meta/classes/multilib_header.bbclass                     | 4 ++++
 meta/classes/multilib_script.bbclass                     | 4 ++++
 meta/classes/native.bbclass                              | 4 ++++
 meta/classes/nativesdk.bbclass                           | 4 ++++
 meta/classes/nopackages.bbclass                          | 4 ++++
 meta/classes/oelint.bbclass                              | 4 ++++
 meta/classes/overlayfs-etc.bbclass                       | 4 ++++
 meta/classes/overlayfs.bbclass                           | 4 ++++
 meta/classes/own-mirrors.bbclass                         | 4 ++++
 meta/classes/packagegroup.bbclass                        | 4 ++++
 meta/classes/perl-version.bbclass                        | 4 ++++
 meta/classes/perlnative.bbclass                          | 4 ++++
 meta/classes/pixbufcache.bbclass                         | 4 ++++
 meta/classes/pkgconfig.bbclass                           | 4 ++++
 meta/classes/prexport.bbclass                            | 4 ++++
 meta/classes/primport.bbclass                            | 4 ++++
 meta/classes/recipe_sanity.bbclass                       | 4 ++++
 meta/classes/relative_symlinks.bbclass                   | 4 ++++
 meta/classes/relocatable.bbclass                         | 4 ++++
 meta/classes/rm_work.bbclass                             | 4 ++++
 meta/classes/scons.bbclass                               | 4 ++++
 meta/classes/setuptools3-base.bbclass                    | 4 ++++
 meta/classes/setuptools3.bbclass                         | 4 ++++
 meta/classes/setuptools3_legacy.bbclass                  | 4 ++++
 meta/classes/sign_ipk.bbclass                            | 4 ++++
 meta/classes/sign_package_feed.bbclass                   | 4 ++++
 meta/classes/sign_rpm.bbclass                            | 4 ++++
 meta/classes/siteconfig.bbclass                          | 4 ++++
 meta/classes/systemd-boot-cfg.bbclass                    | 4 ++++
 meta/classes/systemd.bbclass                             | 4 ++++
 meta/classes/terminal.bbclass                            | 4 ++++
 meta/classes/typecheck.bbclass                           | 4 ++++
 meta/classes/upstream-version-is-even.bbclass            | 4 ++++
 meta/classes/useradd-staticids.bbclass                   | 4 ++++
 meta/classes/yocto-check-layer.bbclass                   | 4 ++++
 188 files changed, 739 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 571b6754f22..1aa0978f650 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 BB_DEFAULT_TASK ?= "build"
 CLASSOVERRIDE ?= "class-target"
 
diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
index 132ecaa98b4..0e4e340ad17 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 
 ################################################################################
diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/debian.bbclass
index 8367be9f37f..2fd1b987dc0 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Debian package renaming only occurs when a package is built
 # We therefore have to make sure we build all runtime packages
 # before building the current package to make the packages runtime
diff --git a/meta/classes-global/devshell.bbclass b/meta/classes-global/devshell.bbclass
index 247d04478c4..4545d988c16 100644
--- a/meta/classes-global/devshell.bbclass
+++ b/meta/classes-global/devshell.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit terminal
 
 DEVSHELL = "${SHELL}"
diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 4ebfc4fb925..f08bacff120 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Populates LICENSE_DIRECTORY as set in distro config with the license files as set by
 # LIC_FILES_CHKSUM.
 # TODO:
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 97e97d2703b..a4b62638840 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Packaging process
 #
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 9fe3c52fae3..552361e8fdb 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit package
 
 IMAGE_PKGTYPE ?= "ipk"
diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index a1ea8fc0415..e495eaf6bd3 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 WORKDIR_PKGDATA = "${WORKDIR}/pkgdata-sysroot"
 
 def package_populate_pkgdata_dir(pkgdatadir, d):
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index e9ff1f7e65c..a24ffb719a2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit package
 
 IMAGE_PKGTYPE ?= "rpm"
diff --git a/meta/classes-global/package_tar.bbclass b/meta/classes-global/package_tar.bbclass
index d6c1b306fcf..0c5c3e58e80 100644
--- a/meta/classes-global/package_tar.bbclass
+++ b/meta/classes-global/package_tar.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit package
 
 IMAGE_PKGTYPE ?= "tar"
diff --git a/meta/classes-global/packagedata.bbclass b/meta/classes-global/packagedata.bbclass
index c2760e2bf0c..89a015b8790 100644
--- a/meta/classes-global/packagedata.bbclass
+++ b/meta/classes-global/packagedata.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 python read_subpackage_metadata () {
     import oe.packagedata
 
diff --git a/meta/classes-global/remove-libtool.bbclass b/meta/classes-global/remove-libtool.bbclass
index 3fd0cd58f94..ef79151aa91 100644
--- a/meta/classes-global/remove-libtool.bbclass
+++ b/meta/classes-global/remove-libtool.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class removes libtool .la files after do_install
 
 REMOVE_LIBTOOL_LA ?= "1"
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index b1fac107d51..f1ebdf5684a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Sanity check the users setup for common misconfigurations
 #
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 0aa901fe89d..5009ce825c8 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 SSTATE_VERSION = "10"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index bf8ca58b0b9..55df9d1c915 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # These directories will be staged in the sysroot
 SYSROOT_DIRS = " \
     ${includedir} \
diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 6a9e862bcd7..76999eb6530 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
diff --git a/meta/classes-global/utility-tasks.bbclass b/meta/classes-global/utility-tasks.bbclass
index 0466325c131..1275a45861f 100644
--- a/meta/classes-global/utility-tasks.bbclass
+++ b/meta/classes-global/utility-tasks.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 addtask listtasks
 do_listtasks[nostamp] = "1"
 python do_listtasks() {
diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index e6f7f95d801..27f6f8d3248 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 
 oe_soinstall() {
 	# Purpose: Install shared library file and
diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index a766a654a9b..630cd070f6f 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class is used for architecture independent recipes/data files (usually scripts)
 #
diff --git a/meta/classes-recipe/autotools-brokensep.bbclass b/meta/classes-recipe/autotools-brokensep.bbclass
index 71cf97a391d..ac9a8d07c90 100644
--- a/meta/classes-recipe/autotools-brokensep.bbclass
+++ b/meta/classes-recipe/autotools-brokensep.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Autotools class for recipes where separate build dir doesn't work
 # Ideally we should fix software so it does work. Standard autotools supports
 # this.
diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 4ab24609904..c77ba71a3a0 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def get_autotools_dep(d):
     if d.getVar('INHIBIT_AUTOTOOLS_DEPS'):
         return ''
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index cb9e2503500..10ca390c48a 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Baremetal image class
 #
 # This class is meant to be inherited by recipes for baremetal/RTOS applications
diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index 803b2cae4d5..cefd7dd18d8 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPENDS:append:class-target = " bash-completion"
 
 PACKAGES += "${PN}-bash-completion"
diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
index f0407e13293..9d1b6101d1f 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -1,7 +1,7 @@
 #
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+# Copyright OpenEmbedded Contributors
 #
+
 # Common variable and task for the binary package recipe.
 # Basic principle:
 # * The files have been unpacked to ${S} by base.bbclass
diff --git a/meta/classes-recipe/binconfig-disabled.bbclass b/meta/classes-recipe/binconfig-disabled.bbclass
index e8ac41b2d40..c8f76b790ba 100644
--- a/meta/classes-recipe/binconfig-disabled.bbclass
+++ b/meta/classes-recipe/binconfig-disabled.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Class to disable binconfig files instead of installing them
 #
diff --git a/meta/classes-recipe/binconfig.bbclass b/meta/classes-recipe/binconfig.bbclass
index 6e0c88269a9..f50ed36d503 100644
--- a/meta/classes-recipe/binconfig.bbclass
+++ b/meta/classes-recipe/binconfig.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 FILES:${PN}-dev += "${bindir}/*-config"
  
 # The namespaces can clash here hence the two step replace
diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 4bfcfe5fc65..d36c3d5071f 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ##
 ## Purpose:
 ## This class is used by any recipes that are built using
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 4a419cdd0a3..51b1ebb77fd 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ##
 ## Purpose:
 ## This class is to support building with cargo. It
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d9bcddbdbb1..cd7031b82dd 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index d319d66ab22..8c21dff4d27 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # returns all the elements from the src uri that are .cfg files
 def find_cfgs(d):
     sources=src_patches(d, True)
diff --git a/meta/classes-recipe/compress_doc.bbclass b/meta/classes-recipe/compress_doc.bbclass
index 379b6c169e5..2298b6ed0c7 100644
--- a/meta/classes-recipe/compress_doc.bbclass
+++ b/meta/classes-recipe/compress_doc.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Compress man pages in ${mandir} and info pages in ${infodir}
 #
 # 1. The doc will be compressed to gz format by default.
diff --git a/meta/classes-recipe/cpan-base.bbclass b/meta/classes-recipe/cpan-base.bbclass
index 93d11e1bee4..2c53eed3c4e 100644
--- a/meta/classes-recipe/cpan-base.bbclass
+++ b/meta/classes-recipe/cpan-base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # cpan-base providers various perl related information needed for building
 # cpan modules
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index 18f1b9d575e..7ab33423c92 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This is for perl modules that use the old Makefile.PL build system
 #
diff --git a/meta/classes-recipe/cpan_build.bbclass b/meta/classes-recipe/cpan_build.bbclass
index f3fb4666ef3..0ad7d0b3c91 100644
--- a/meta/classes-recipe/cpan_build.bbclass
+++ b/meta/classes-recipe/cpan_build.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This is for perl modules that use the new Build.PL build system
 #
diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index 7fbffe996be..7c28e6934cf 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
 do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
diff --git a/meta/classes-recipe/dos2unix.bbclass b/meta/classes-recipe/dos2unix.bbclass
index 3fc17e21963..b02db9b23a7 100644
--- a/meta/classes-recipe/dos2unix.bbclass
+++ b/meta/classes-recipe/dos2unix.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for use to convert all CRLF line terminators to LF
 # provided that some projects are being developed/maintained
 # on Windows so they have different line terminators(CRLF) vs
diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 442bfc7392f..2ca51c53379 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class will generate the proper postinst/postrm scriptlets for font
 # packages.
diff --git a/meta/classes-recipe/gconf.bbclass b/meta/classes-recipe/gconf.bbclass
index 9d3668edd3f..d4d94583abd 100644
--- a/meta/classes-recipe/gconf.bbclass
+++ b/meta/classes-recipe/gconf.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPENDS += "gconf"
 PACKAGE_WRITE_DEPS += "gconf-native"
 
diff --git a/meta/classes-recipe/gettext.bbclass b/meta/classes-recipe/gettext.bbclass
index f11cb044565..4aecbb44130 100644
--- a/meta/classes-recipe/gettext.bbclass
+++ b/meta/classes-recipe/gettext.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def gettext_dependencies(d):
     if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index f5769e520f5..425683a7e13 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ##################################################################
 # Specific image creation and rootfs population info.
 ##################################################################
diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-recipe/populate_sdk.bbclass
index f64a911b72c..3e3a290ef22 100644
--- a/meta/classes-recipe/populate_sdk.bbclass
+++ b/meta/classes-recipe/populate_sdk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # The majority of populate_sdk is located in populate_sdk_base
 # This chunk simply facilitates compatibility with SDK only recipes.
 
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 175c7dafb20..df8ef8ef127 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PACKAGES = ""
 
 inherit image-postinst-intercepts image-artifact-names
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index d58b2ba5d0d..a28588a384e 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Extensible SDK
 
 inherit populate_sdk_base
diff --git a/meta/classes-recipe/ptest-gnome.bbclass b/meta/classes-recipe/ptest-gnome.bbclass
index 18bd3dbff98..d68df978d7f 100644
--- a/meta/classes-recipe/ptest-gnome.bbclass
+++ b/meta/classes-recipe/ptest-gnome.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit ptest
 
 EXTRA_OECONF:append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-installed-tests', '--disable-installed-tests', d)}"
diff --git a/meta/classes-recipe/ptest-perl.bbclass b/meta/classes-recipe/ptest-perl.bbclass
index 5dd72c9dad8..fba13934c91 100644
--- a/meta/classes-recipe/ptest-perl.bbclass
+++ b/meta/classes-recipe/ptest-perl.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit ptest
 
 FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"
diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index c162f5d9342..bdb50ff39a0 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 SUMMARY:${PN}-ptest ?= "${SUMMARY} - Package test files"
 DESCRIPTION:${PN}-ptest ?= "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purposes."
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 5fa7b8a6ae2..b59f0d33ace 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def pypi_package(d):
     bpn = d.getVar('BPN')
     if bpn.startswith('python-'):
diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index ff03e584d4c..f98380d331d 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PYTHON_BASEVERSION = "3.10"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index 3783c0c47eb..ec7402d9043 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python3-dir
 
 PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 2476858caeb..ad3629180d3 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python3native
 
 EXTRA_PYTHON_DEPENDS ?= ""
diff --git a/meta/classes-recipe/python_flit_core.bbclass b/meta/classes-recipe/python_flit_core.bbclass
index 7109307de5b..0f5301084f8 100644
--- a/meta/classes-recipe/python_flit_core.bbclass
+++ b/meta/classes-recipe/python_flit_core.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python_pep517 python3native python3-dir setuptools3-base
 
 DEPENDS += "python3 python3-flit-core-native"
diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-recipe/python_hatchling.bbclass
index 984eb6bb5db..502ec877c1c 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python_pep517 python3native python3-dir setuptools3-base
 
 DEPENDS += "python3-hatchling-native"
diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-recipe/python_pep517.bbclass
index 7cdb9c8f9df..c001b7d1572 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Common infrastructure for Python packages that use PEP-517 compliant packaging.
 # https://www.python.org/dev/peps/pep-0517/
 #
diff --git a/meta/classes-recipe/python_poetry_core.bbclass b/meta/classes-recipe/python_poetry_core.bbclass
index 0aaf66b1944..5de90a7be34 100644
--- a/meta/classes-recipe/python_poetry_core.bbclass
+++ b/meta/classes-recipe/python_poetry_core.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python_pep517 python3native setuptools3-base
 
 DEPENDS += "python3-poetry-core-native"
diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index b41e3ba0752..3b938667b53 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class helps make sure that Python extensions built with PyO3
 # and setuptools_rust properly set up the environment for cross compilation
diff --git a/meta/classes-recipe/python_setuptools3_rust.bbclass b/meta/classes-recipe/python_setuptools3_rust.bbclass
index f12e5d0cbd2..0a4eaddc114 100644
--- a/meta/classes-recipe/python_setuptools3_rust.bbclass
+++ b/meta/classes-recipe/python_setuptools3_rust.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python_pyo3 setuptools3
 
 DEPENDS += "python3-setuptools-rust-native"
diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/meta/classes-recipe/python_setuptools_build_meta.bbclass
index 974054fe5ac..346b13337e2 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit setuptools3-base python_pep517
 
 DEPENDS += "python3-setuptools-native python3-wheel-native"
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index 7493ac34d4b..924457a4977 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class contains functions for recipes that need QEMU or test for its
 # existence.
diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index ad8489902a3..54cfcd25f28 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Help runqemu boot target board, "QB" means Qemu Boot, the following
 # vars can be set in conf files, such as <bsp.conf> to make it can be
 # boot by runqemu:
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 3dadba60475..49338eba228 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 
 # Zap the root password if debug-tweaks and empty-root-password features are not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
diff --git a/meta/classes-recipe/rootfs_ipk.bbclass b/meta/classes-recipe/rootfs_ipk.bbclass
index 245c256a6fb..48732e97841 100644
--- a/meta/classes-recipe/rootfs_ipk.bbclass
+++ b/meta/classes-recipe/rootfs_ipk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Creates a root filesystem out of IPKs
 #
diff --git a/meta/classes-recipe/rootfs_rpm.bbclass b/meta/classes-recipe/rootfs_rpm.bbclass
index bec4d63ed6c..629e1d41a97 100644
--- a/meta/classes-recipe/rootfs_rpm.bbclass
+++ b/meta/classes-recipe/rootfs_rpm.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Creates a root filesystem out of rpm packages
 #
diff --git a/meta/classes-recipe/rootfsdebugfiles.bbclass b/meta/classes-recipe/rootfsdebugfiles.bbclass
index 85c7ec74343..98cea38de04 100644
--- a/meta/classes-recipe/rootfsdebugfiles.bbclass
+++ b/meta/classes-recipe/rootfsdebugfiles.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class installs additional files found on the build host
 # directly into the rootfs.
 #
diff --git a/meta/classes-recipe/rust-bin.bbclass b/meta/classes-recipe/rust-bin.bbclass
index 7a70a7b6ba3..369c574ed0d 100644
--- a/meta/classes-recipe/rust-bin.bbclass
+++ b/meta/classes-recipe/rust-bin.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit rust
 
 RDEPENDS:${PN}:append:class-target = " ${RUSTLIB_DEP}"
diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 4c1a63df0dc..344e6586154 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python3native
 inherit rust-target-config
 
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 0f0797603e1..a435523e4b2 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Right now this is focused on arm-specific tune features.
 # We get away with this for now as one can only use x86-64 as the build host
 # (not arm).
diff --git a/meta/classes-recipe/rust.bbclass b/meta/classes-recipe/rust.bbclass
index 2639cecfd43..b91de85db22 100644
--- a/meta/classes-recipe/rust.bbclass
+++ b/meta/classes-recipe/rust.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit rust-common
 
 RUSTC = "rustc"
diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index 3555d5a6631..2f20ad781ff 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class exists to provide information about the targets that
 # may be needed by other classes and/or recipes. If you add a new
 # target this will probably need to be updated.
diff --git a/meta/classes-recipe/texinfo.bbclass b/meta/classes-recipe/texinfo.bbclass
index 68c9d4fb707..d7afbc7d6aa 100644
--- a/meta/classes-recipe/texinfo.bbclass
+++ b/meta/classes-recipe/texinfo.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class is inherited by recipes whose upstream packages invoke the
 # texinfo utilities at build-time. Native and cross recipes are made to use the
 # dummy scripts provided by texinfo-dummy-native, for improved performance.
diff --git a/meta/classes-recipe/toolchain-scripts-base.bbclass b/meta/classes-recipe/toolchain-scripts-base.bbclass
index 2489b9dbeb8..e0719e584bc 100644
--- a/meta/classes-recipe/toolchain-scripts-base.bbclass
+++ b/meta/classes-recipe/toolchain-scripts-base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #This function create a version information file
 toolchain_create_sdk_version () {
 	local versionfile=$1
diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 16f1e17607c..eec77805306 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit toolchain-scripts-base siteinfo kernel-arch
 
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index eecdec91607..970f20407b7 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This file is part of U-Boot verified boot support and is intended to be
 # inherited from u-boot recipe and from kernel-fitimage.bbclass.
 #
diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index fc1ffd828cf..09465898682 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class is used to help the alternatives system which is useful when
 # multiple sources provide same command. You can use update-alternatives
 # command directly in your recipe, but in most cases this class simplifies
diff --git a/meta/classes-recipe/update-rc.d.bbclass b/meta/classes-recipe/update-rc.d.bbclass
index 0a3a6086629..b92ff5a4fae 100644
--- a/meta/classes-recipe/update-rc.d.bbclass
+++ b/meta/classes-recipe/update-rc.d.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 UPDATERCPN ?= "${PN}"
 
 DEPENDS:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' update-rc.d initscripts', '', d)}"
diff --git a/meta/classes-recipe/useradd.bbclass b/meta/classes-recipe/useradd.bbclass
index 20771a0ce59..2aff3eda423 100644
--- a/meta/classes-recipe/useradd.bbclass
+++ b/meta/classes-recipe/useradd.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit useradd_base
 
 # base-passwd-cross provides the default passwd and group files in the
diff --git a/meta/classes-recipe/useradd_base.bbclass b/meta/classes-recipe/useradd_base.bbclass
index 7f5b9b72194..ee8cc6c8435 100644
--- a/meta/classes-recipe/useradd_base.bbclass
+++ b/meta/classes-recipe/useradd_base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This bbclass provides basic functionality for user/group settings.
 # This bbclass is intended to be inherited by useradd.bbclass and
 # extrausers.bbclass.
diff --git a/meta/classes-recipe/vala.bbclass b/meta/classes-recipe/vala.bbclass
index bfcceff7cf8..65e15013e1e 100644
--- a/meta/classes-recipe/vala.bbclass
+++ b/meta/classes-recipe/vala.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Everyone needs vala-native and targets need vala, too,
 # because that is where target builds look for .vapi files.
 #
diff --git a/meta/classes-recipe/waf.bbclass b/meta/classes-recipe/waf.bbclass
index 464564afa1d..ef24c61dd87 100644
--- a/meta/classes-recipe/waf.bbclass
+++ b/meta/classes-recipe/waf.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
diff --git a/meta/classes-recipe/xmlcatalog.bbclass b/meta/classes-recipe/xmlcatalog.bbclass
index be155b7bc28..14a1094d0f2 100644
--- a/meta/classes-recipe/xmlcatalog.bbclass
+++ b/meta/classes-recipe/xmlcatalog.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPENDS = "libxml2-native"
 
 # A whitespace-separated list of XML catalogs to be registered, for example
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index dca4271a69a..2262fdd652d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,5 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This bbclass is used for creating archive for:
 #  1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index f9b241b6c5b..716189fd305 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Summarize sstate usage at the end of the build
 python buildstats_summary () {
     import collections
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 4532894c574..dee6248017a 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Usage:
 # - Enable ccache
diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
index df5134a108a..75f68cc8e39 100644
--- a/meta/classes/ccmake.bbclass
+++ b/meta/classes/ccmake.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit terminal
 
 python do_ccmake() {
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 26b984c4dbb..930c53e76f6 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index eabf12ce7a0..5bf16a91069 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Deploy sources for recipes for compliance with copyleft-style licenses
 # Defaults to using symlinks, as it's a quick operation, and one can easily
 # follow the links when making use of the files (e.g. tar with the -h arg).
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index c36bce431a2..0e93a3df42e 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -1,10 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Filter the license, the copyleft_should_include returns True for the
 # COPYLEFT_LICENSE_INCLUDE recipe, and False for the
 # COPYLEFT_LICENSE_EXCLUDE.
 #
 # By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
-#
-# vi:sts=4:sw=4:et
 
 COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL* AGPL*'
 COPYLEFT_LICENSE_INCLUDE[type] = 'list'
diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 10deba638fe..383ca10bab3 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index a0e9d238369..23c864f6846 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # NOTE - When using this class the user is responsible for ensuring that
 # TRANSLATED_TARGET_ARCH is added into PN. This ensures that if the TARGET_ARCH
 # is changed, another nativesdk xxx-canadian-cross can be installed
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 9d951076a78..5ed21302ce7 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit relocatable
 
 # Cross packages are built indirectly via dependency,
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 04aecb694e9..3c5a1a3717a 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit cross
 
 CLASSOVERRIDE = "class-crosssdk"
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index da7f93371c0..53790e89d14 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class is used to check recipes against public CVEs.
 #
 # In order to use this class just inherit the class in the
diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 2a62ae7bc8e..954582bcd35 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This bbclass implements device tree compliation for user provided device tree
 # sources. The compilation of the device tree sources is the same as the kernel
 # device tree compilation process, this includes being able to include sources
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 41900e651f0..7a4568a0e4f 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Development tool - source extraction helper class
 #
 # NOTE: this class is intended for use by devtool and should not be
diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index ba6dc4136c1..ad1061b4d12 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for use in BBCLASSEXTEND to make it easier to have a single recipe that
 # can build both stable tarballs and snapshots from upstream source
 # repositories.
diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index 8124a8ca271..db26c60fab0 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Temporarily provide fallback to the old name of the class
 
 python __anonymous() {
diff --git a/meta/classes/distrooverrides.bbclass b/meta/classes/distrooverrides.bbclass
index bf3a2b2090e..d5f3a06af48 100644
--- a/meta/classes/distrooverrides.bbclass
+++ b/meta/classes/distrooverrides.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Turns certain DISTRO_FEATURES into overrides with the same
 # name plus a df- prefix. Ensures that these special
 # distro features remain set also for native and nativesdk
diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index a8ef660b30f..e4059872d87 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This bbclass is used for image level user/group configuration.
 # Inherit this class if you want to make EXTRA_USERS_PARAMS effective.
 
diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 9b53dfba7ab..93a3e420d54 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Extract UUID from ${ROOTFS}, which must have been built
 # by the time that this function gets called. Only works
 # on ext file systems and depends on tune2fs.
diff --git a/meta/classes/gi-docgen.bbclass b/meta/classes/gi-docgen.bbclass
index 15581ca1270..3a3966c8016 100644
--- a/meta/classes/gi-docgen.bbclass
+++ b/meta/classes/gi-docgen.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # gi-docgen is a new gnome documentation generator, which
 # seems to be a successor to gtk-doc:
 # https://gitlab.gnome.org/GNOME/gi-docgen
diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index 021eeb1cf8c..788ca99c1c8 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
index 2db4ac68466..ee073b9fbd5 100644
--- a/meta/classes/glide.bbclass
+++ b/meta/classes/glide.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Handle Glide Vendor Package Management use
 #
 # Copyright 2018 (C) O.S. Systems Software LTDA.
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 9a5bd9a232d..d424091bc0e 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def gnome_verdir(v):
     return ".".join(v.split(".")[:-1])
 
diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
index 674d2434e0b..a428471e3aa 100644
--- a/meta/classes/go-mod.bbclass
+++ b/meta/classes/go-mod.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Handle Go Modules support
 #
 # When using Go Modules, the the current working directory MUST be at or below
diff --git a/meta/classes/go-ptest.bbclass b/meta/classes/go-ptest.bbclass
index b282ff73744..2493b305a59 100644
--- a/meta/classes/go-ptest.bbclass
+++ b/meta/classes/go-ptest.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit go ptest
 
 do_compile_ptest_base() {
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cd2daed70bf..d86c5859b8d 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit goarch
 inherit linuxloader
 
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 92fec16b829..0bfc1c1e0dc 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
 BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
 BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes/gobject-introspection-data.bbclass
index d90cdb48399..8ec2cfe4e60 100644
--- a/meta/classes/gobject-introspection-data.bbclass
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This variable is set to True if gobject-introspection-data is in
 # DISTRO_FEATURES and qemu-usermode is in MACHINE_FEATURES, and False otherwise.
 #
diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 7bf9feb0d60..91b728214a4 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Inherit this class in recipes to enable building their introspection files
 
 # python3native is inherited to prevent introspection tools being run with
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 8fc6999e52a..79049440bf9 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit grub-efi-cfg
 require conf/image-uefi.conf
 
diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index 3fa5bd40b35..d811a0e0340 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # A bbclass to handle installed GSettings (glib) schemas, updated the compiled
 # form on package install and remove.
 #
diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 07b46ac8299..a32901305c0 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Helper class to pull in the right gtk-doc dependencies and configure
 # gtk-doc to enable or disable documentation building (which requries the
 # use of usermode qemu).
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 6808339b900..399d107ce7e 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 FILES:${PN} += "${datadir}/icons/hicolor"
 
 GTKIC_VERSION ??= '3'
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 2107517540b..97e9162fa75 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class will update the inputmethod module cache for virtual keyboards
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 9b912a3083a..cf08db8cf3b 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # IceCream distributed compiling support
 #
 # Stages directories with symlinks from gcc/g++ to icecc, for both
diff --git a/meta/classes/image-combined-dbg.bbclass b/meta/classes/image-combined-dbg.bbclass
index e5dc61f8573..0e8e8183ac1 100644
--- a/meta/classes/image-combined-dbg.bbclass
+++ b/meta/classes/image-combined-dbg.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 IMAGE_PREPROCESS_COMMAND:append = " combine_dbg_image; "
 
 combine_dbg_image () {
diff --git a/meta/classes/image-container.bbclass b/meta/classes/image-container.bbclass
index 3d1993576a0..10036151c0e 100644
--- a/meta/classes/image-container.bbclass
+++ b/meta/classes/image-container.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ROOTFS_BOOTSTRAP_INSTALL = ""
 IMAGE_TYPES_MASKED += "container"
 IMAGE_TYPEDEP:container = "tar.bz2"
diff --git a/meta/classes/image-postinst-intercepts.bbclass b/meta/classes/image-postinst-intercepts.bbclass
index ed30bbd98d9..af81910bc7f 100644
--- a/meta/classes/image-postinst-intercepts.bbclass
+++ b/meta/classes/image-postinst-intercepts.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Gather existing and candidate postinst intercepts from BBPATH
 POSTINST_INTERCEPTS_DIR ?= "${COREBASE}/scripts/postinst-intercepts"
 POSTINST_INTERCEPTS_PATHS ?= "${@':'.join('%s/postinst-intercepts' % p for p in '${BBPATH}'.split(':'))}:${POSTINST_INTERCEPTS_DIR}"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fe32cdefd52..f485967ae28 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 
 IMAGE_CLASSES ??= ""
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0ffea91195f..c6c44db7c7b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # The default aligment of the size of the rootfs is set to 1KiB. In case
 # you're using the SD card emulation of a QEMU system simulator you may
 # set this value to 2048 (2MiB alignment).
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 8497916d482..e388fa67972 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8b434bb54b..f6a82cc44fc 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # BB Class inspired by ebuild.sh
 #
 # This class will test files after installation for certain
diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 348a3adf225..f25ad44a3d0 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # set the ARCH environment variable for kernel compilation (including
 # modules). return value must match one of the architecture directories
diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index e77107c893f..ce58e2af635 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ##################################################################
 # Specific kernel creation info
 # for recipes/bbclasses which need to reuse some of the kernel
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index b4338da1b13..28330151ecc 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Support for device tree generation
 python () {
     if not bb.data.inherits_class('nopackages', d):
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 753164551ca..a0d2e444b2b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit kernel-uboot kernel-artifact-names uboot-sign
 
 def get_fit_replacement_type(d):
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index 44b2015468a..8475e0f9da3 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # While installing a rpm to update kernel on a deployed target, it will update
 # the boot area and the boot menu with the kernel as the priority but allow
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index a29c294810e..df18f5d0f00 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 pkg_postinst:modules () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 1bc98e042d8..9eb934919b8 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # fitImage kernel compression algorithm
 FIT_KERNEL_COMP_ALG ?= "gzip"
 FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 2e661ea9165..8cc1dc50cc9 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit kernel-uboot
 
 python __anonymous () {
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ce1446f7aa3..9f327933a1c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f41ac8e29b6..683d8c4d67f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit linux-kernel-base kernel-module-split
 
 COMPATIBLE_HOST = ".*-linux"
diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index a951ba3325e..f40e3c88199 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
 deltask do_unpack
diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 8849f590425..07f3f258d23 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -1,4 +1,7 @@
 #
+# Copyright OpenEmbedded Contributors
+#
+#
 # ${PN}-bin is defined in bitbake.conf
 #
 # We need to allow the other packages to be greedy with what they
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 13ef8cdc0df..580c02948e1 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class knows how to package up [e]glibc. Its shared since prebuild binary toolchains
 # may need packaging and its pointless to duplicate this code.
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 3213ea758e0..0cda839c94f 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
 
 # This requires LICENSE_CREATE_PACKAGE=1 to work too
diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy.bbclass
index 9a06a509dd7..90b932c5906 100644
--- a/meta/classes/linux-dummy.bbclass
+++ b/meta/classes/linux-dummy.bbclass
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 
 python __anonymous () {
     if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index ba59222c24c..36f9caac690 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # parse kernel ABI version out of <linux/version.h>
 def get_kernelversion_headers(p):
     import re
diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 4447c8847c9..6bd8a62da90 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def get_musl_loader_arch(d):
     import re
     ldso_arch = "NotSupported"
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 74e7074a539..99b92b6155a 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Some of the vars for vm and live image are conflicted, this function
 # is used for fixing the problem.
 def set_live_vm_vars(d, suffix):
diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index a0c94e98c73..0d59ae2631c 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # The following logging mechanisms are to be used in bash functions of recipes.
 # They are intended to map one to one in intention and output format with the
 # python recipe logging functions of a similar naming convention: bb.plain(),
diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index 5e09c77fe6f..57b9be06500 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Inherit this class to enable or disable building and installation of manpages
 # depending on whether 'api-documentation' is in DISTRO_FEATURES. Such building
 # tends to pull in the entire XML stack and other tools, so it's not enabled
diff --git a/meta/classes/mcextend.bbclass b/meta/classes/mcextend.bbclass
index 0f8f9622986..33833c3b9e4 100644
--- a/meta/classes/mcextend.bbclass
+++ b/meta/classes/mcextend.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 python mcextend_virtclass_handler () {
     cls = e.data.getVar("BBEXTENDCURR")
     variant = e.data.getVar("BBEXTENDVARIANT")
diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routines.bbclass
index be3aeedebab..6827bdb21d1 100644
--- a/meta/classes/meson-routines.bbclass
+++ b/meta/classes/meson-routines.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit siteinfo
 
 def meson_array(var, d):
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 546cd0476f3..17c6abbd609 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python3native meson-routines qemu
 
 DEPENDS:append = " meson-native ninja-native"
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index f646b3159a4..f17cdcccf1a 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 
 METADATA_BRANCH := "${@oe.buildcfg.detect_branch(d)}"
 METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
index 810a541316d..cb0d1c698b5 100644
--- a/meta/classes/migrate_localcount.bbclass
+++ b/meta/classes/migrate_localcount.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
 LOCALCOUNT_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv-localcount-exports.inc"
 
diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
index 271f48dd729..9e596c25fef 100644
--- a/meta/classes/mime-xdg.bbclass
+++ b/meta/classes/mime-xdg.bbclass
@@ -1,4 +1,7 @@
 #
+# Copyright OpenEmbedded Contributors
+#
+#
 # This class creates mime <-> application associations based on entry 
 # 'MimeType' in *.desktop files
 #
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 8d176a884e7..e036bb23a1a 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class is used by recipes installing mime types
 #
diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ffdccff5fb4..e56f90a7e8c 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 MIRRORS += "\
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 27bd69ff33b..3f3d60947e2 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit kernel-arch
 
 # We do the dependency this way because the output is not preserved
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a09ec3ed1e1..bcc46ab1d82 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit module-base kernel-module-split pkgconfig
 
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5859ca8d21e..2931aed8346 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 python multilib_virtclass_handler () {
     cls = e.data.getVar("BBEXTENDCURR")
     variant = e.data.getVar("BBEXTENDVARIANT")
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index e06307d057a..7d9f48e9d9f 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def preferred_ml_updates(d):
     # If any of PREFERRED_PROVIDER, PREFERRED_RPROVIDER, REQUIRED_VERSION
     # or PREFERRED_VERSION are set, we need to mirror these variables in
diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index efbc24f59b0..403a24667bf 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit siteinfo
 
 # If applicable on the architecture, this routine will rename the header and
diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index 41597341cd1..0cf6d502bb4 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Recipe needs to set MULTILIB_SCRIPTS in the form <pkgname>:<scriptname>, e.g.
 # MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/file1 ${PN}:${base_bindir}/file2"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5a273cdebba..1d9c3a72665 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # We want native packages to be relocatable
 inherit relocatable
 
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index e46739e325b..78f94c79ca7 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 7a4f632d716..22017524cdb 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 deltask do_package
 deltask do_package_write_rpm
 deltask do_package_write_ipk
diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index 2589d34059f..a4ee7d6e335 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 addtask lint before do_build
 do_lint[nostamp] = "1"
 python do_lint() {
diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
index 91afee695c5..5c1e8f9bebe 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for setting up /etc in overlayfs
 #
 # In order to have /etc directory in overlayfs a special handling at early boot stage is required
diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index f7069edd416..ccc88bb4ac8 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for generation of overlayfs mount units
 #
 # It's often desired in Embedded System design to have a read-only rootfs.
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index ef972740ce2..699eb3628b9 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PREMIRRORS:prepend = " \
 cvs://.*/.*     ${SOURCE_MIRROR_URL} \
 svn://.*/.*     ${SOURCE_MIRROR_URL} \
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 557b1b6382b..54917942a4a 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for packagegroup (package group) recipes
 
 # By default, only the packagegroup package itself is in PACKAGES.
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
index 84b67b81806..c314b4b575b 100644
--- a/meta/classes/perl-version.bbclass
+++ b/meta/classes/perl-version.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PERL_OWN_DIR = ""
 
 # Determine the staged version of perl from the perl configuration file
diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
index cc8de8b3815..4d6ddd83cb7 100644
--- a/meta/classes/perlnative.bbclass
+++ b/meta/classes/perlnative.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 EXTRANATIVEPATH += "perl-native"
 DEPENDS += "perl-native"
 OECMAKE_PERLNATIVE_DIR = "${STAGING_BINDIR_NATIVE}/perl-native"
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 886bf195b32..b451f5a7dd4 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class will generate the proper postinst/postrm scriptlets for pixbuf
 # packages.
diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index fa94527ce93..db57ce44726 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -1,2 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPENDS:prepend = "pkgconfig-native "
 
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 6dcf99e29fd..ddd0ce68db1 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 PRSERV_DUMPOPT_VERSION = "${PRAUTOINX}"
 PRSERV_DUMPOPT_PKGARCH  = ""
 PRSERV_DUMPOPT_CHECKSUM = ""
diff --git a/meta/classes/primport.bbclass b/meta/classes/primport.bbclass
index 8ed45f03f00..4d577bf8300 100644
--- a/meta/classes/primport.bbclass
+++ b/meta/classes/primport.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 python primport_handler () {
     import bb.event
     if not e.data:
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 7fa4a849ead..c09a551a4ff 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 def __note(msg, d):
     bb.note("%s: recipe_sanity: %s" % (d.getVar("P"), msg))
 
diff --git a/meta/classes/relative_symlinks.bbclass b/meta/classes/relative_symlinks.bbclass
index 3157737347a..15674db495f 100644
--- a/meta/classes/relative_symlinks.bbclass
+++ b/meta/classes/relative_symlinks.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 do_install[postfuncs] += "install_relative_symlinks"
 
 python install_relative_symlinks () {
diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index af04be5ccad..7b691fe6549 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit chrpath
 
 SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess relocatable_native_pcfiles"
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 5f12d5aaeb4..445d80c82ab 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # Removes source after build
 #
diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 80f8382107d..ead5ec4ce1a 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit python3native
 
 DEPENDS += "python3-scons-native"
diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setuptools3-base.bbclass
index 15abe1dd634..5d90ec1b198 100644
--- a/meta/classes/setuptools3-base.bbclass
+++ b/meta/classes/setuptools3-base.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
 DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
 RDEPENDS:${PN}:append:class-target = " ${PYTHON_PN}-core"
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 66c94660d8e..c08178fcf5a 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 inherit setuptools3-base python_pep517
 
 DEPENDS += "python3-setuptools-native python3-wheel-native"
diff --git a/meta/classes/setuptools3_legacy.bbclass b/meta/classes/setuptools3_legacy.bbclass
index 5a99daadb55..0d9345d8476 100644
--- a/meta/classes/setuptools3_legacy.bbclass
+++ b/meta/classes/setuptools3_legacy.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class is for packages which use the deprecated setuptools behaviour,
 # specifically custom install tasks which don't work correctly with bdist_wheel.
 # This behaviour is deprecated in setuptools[1] and won't work in the future, so
diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
index e5057b77991..940d29f4519 100644
--- a/meta/classes/sign_ipk.bbclass
+++ b/meta/classes/sign_ipk.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for generating signed IPK packages.
 #
 # Configuration variables used by this class:
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index f1504c2225b..d29985d5324 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for signing package feeds
 #
 # Related configuration variables that will be used after this class is
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 73a55a512d6..159d525261e 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Class for generating signed RPM packages.
 #
 # Configuration variables used by this class:
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 0cfa5a68342..96491cf8287 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 python siteconfig_do_siteconfig () {
     shared_state = sstate_state_fromvars(d)
     if shared_state['task'] != 'populate_sysroot':
diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index b3e0e6ad410..64fe81d6d00 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 09ec52792d5..c24ed906644 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # The list of packages that should have systemd packaging scripts added.  For
 # each entry, optionally have a SYSTEMD_SERVICE:[package] that lists the service
 # files in this package.  If this variable isn't set, [package].service is used.
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index a564ee74947..5ca9104641b 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 OE_TERMINAL ?= 'auto'
 OE_TERMINAL[type] = 'choice'
 OE_TERMINAL[choices] = 'auto none \
diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
index 72da9322328..86fcf28942d 100644
--- a/meta/classes/typecheck.bbclass
+++ b/meta/classes/typecheck.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # Check types of bitbake configuration variables
 #
 # See oe.types for details.
diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 256c752423c..b89a13414dd 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # This class ensures that the upstream version check only
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 3acf59cd461..c994b5979eb 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 # In order to support a deterministic set of 'dynamic' users/groups,
 # we need a function to reformat the params based on a static file
 def update_useradd_static_config(d):
diff --git a/meta/classes/yocto-check-layer.bbclass b/meta/classes/yocto-check-layer.bbclass
index 329d3f8edb0..2d21676ec21 100644
--- a/meta/classes/yocto-check-layer.bbclass
+++ b/meta/classes/yocto-check-layer.bbclass
@@ -1,3 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+
 #
 # This class is used by yocto-check-layer script for additional per-recipe tests
 # The first test ensures that the layer has no recipes skipping 'installed-vs-shipped' QA checks
-- 
2.34.1



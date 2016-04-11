Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 27EBF70016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:49:27 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l6so160224485wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MiHv5bv1InHvhLbT6PVQmnAgRd4GZWPufG4fwKU89O4=;
	b=LGPPLRyU6qmVsBc/hfMaSD6/6HOUuxW9T4SWncXI/TZyVETR+k37D2glMLg6ECefnD
	ctkmC2Y/qrFkBrOgPWfx8Xs2k07CuISL9ACC3X/CwzbRmAzvjjIICBJf0WNPNLe57i/H
	EyChNx6VzC8tcAV6+J0tjeiujTV3sM/rHheaqygtORrrmsCB3iOkj8CpY6YF6vlFnkDq
	3AiJG2hASwQrBnZFmenMaQRPfew+y1soxRcAWPTrZ6LxZnbPNBrcCexS/3VmJ96+idhF
	anFhQNWdqWUPiDX19n54bkY0Qc+aRZ/kzH9F8+2bmIwKu+fhLTSScKYsNXzyisigZEtN
	vXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MiHv5bv1InHvhLbT6PVQmnAgRd4GZWPufG4fwKU89O4=;
	b=jxvuXnpiOWljkTbDOJQMGYf9W7JO/foyfKFftGQL07rSJyAZUfeg8d4YhueK8YXikd
	PhSSISaJD7jAU/gkOjkIBLPgPZrANP5KI6twf32qJ9AO/RpQTKpVmsDVVHVkQsSyUYqe
	vGKj7bERV3xCEF+iHqvQMXtIs/hzgh3nkvV1zWmqqmOEnfYBRT77FVAZy3U8+NzySLDB
	5O6Pb1urBNnR1KDT9BRG1u15tVyUTi/LdZbsfah8YK6MtnOa4gX3wZMZMd5rWU62YhZQ
	FZz0HF6kVZIcUX5GAlqE+0RStJzZrAAe7yeAPMru8U0/YU8Jmtf6DIQkLU4cXEgzqpmq
	8MUg==
X-Gm-Message-State: AOPr4FX3QOUKLiGaibVHXpo4Wbk44NvDLaOysDN1WhMMgn5+EmTRHVyRo0qhb+G19+Kl7FFX
X-Received: by 10.28.91.199 with SMTP id p190mr11561867wmb.47.1460404168233;
	Mon, 11 Apr 2016 12:49:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm18996531wmf.8.2016.04.11.12.49.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 12:49:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 20:49:23 +0100
Message-Id: <1460404163-11259-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460404163-11259-1-git-send-email-ross.burton@intel.com>
References: <1460404163-11259-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] meta: remove redundant ac_cv_sizeof_off_t assignments
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
X-List-Received-Date: Mon, 11 Apr 2016 19:49:28 -0000

ac_cv_sizeof_off_t was previously in the site cache files, which was breaking
large file support and required a workaround in each recipe that actually wanted
to use large files.

Now that the entry has been removed from the site cache, we can remove the
workarounds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb                   | 2 +-
 meta/recipes-bsp/grub/grub_2.00.bb                       | 2 +-
 meta/recipes-bsp/grub/grub_git.bb                        | 2 +-
 meta/recipes-devtools/python/python.inc                  | 2 --
 meta/recipes-devtools/python/python_2.7.11.bb            | 3 +--
 meta/recipes-extended/pax/pax_3.4.bb                     | 4 ----
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb | 1 -
 meta/recipes-support/curl/curl_7.47.1.bb                 | 4 ----
 8 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index dbc034c..5a0dc95 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -33,7 +33,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-efiemu=no --program-prefix='' \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
 # ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index addc1b2..778074a 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -6,7 +6,7 @@ PR = "r1"
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ebab7f..6919c9a 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -31,7 +31,7 @@ GRUBPLATFORM ??= "pc"
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
 do_configure_prepend() {
     ( cd ${S}
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 52250d2..f4818c6 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -20,8 +20,6 @@ PYTHON_MAJMIN = "2.7"
 
 inherit autotools
 
-PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
-
 EXTRA_OECONF = "\
   --with-threads \
   --with-pymalloc \
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 0c00d6e..606f153 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -35,8 +35,7 @@ inherit autotools multilib_header python-dir pythonnative
 
 CONFIGUREOPTS += " --with-system-ffi "
 
-# The following is a hack until we drop ac_cv_sizeof_off_t from site files
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
+EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index cee52e3..9d1abfb 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -25,8 +25,4 @@ SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
 SRC_URI[md5sum] = "fbd9023b590b45ac3ade95870702a0d6"
 SRC_URI[sha256sum] = "ac3c06048e02828077cf7757d3d142241429238893b91d529af29a2e8cc5623b"
 
-# see https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html
-# We should ideally drop ac_cv_sizeof_off_t from site files but until then
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
-
 inherit autotools
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
index a5ac84e..80435d4 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
@@ -22,6 +22,5 @@ inherit autotools lib_package pkgconfig
 do_configure_prepend_arm() {
 	export ac_cv_sys_largefile_source=1
 	export ac_cv_sys_file_offset_bits=64
-	ac_cv_sizeof_off_t=8
 }
 
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 7e2664c..c2173d8 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -49,10 +49,6 @@ EXTRA_OECONF = " \
     --without-nghttp2 \
 "
 
-# see https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html
-# We should ideally drop ac_cv_sizeof_off_t from site files but until then
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
-
 do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
-- 
2.8.0.rc3



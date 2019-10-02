Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 357726B11A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 20:52:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y144so115572qkb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 13:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TRlfr6Dva9MY8BXYuc7fkY7RU/+Pqp55qQ5psBokNJ4=;
	b=b3yDblexKcLnXShABTRGKZsiCpPhzZJnpwnrMCqvHH3SFMtbSGlm/RkfyFgrclre/i
	45GVFfJuRp6gToSW5zuOQEiqx8yClbmfpFssuySsIJGFN4X6KVswiJzje7aS+5b7bvGd
	ACRvnUk/ho73IZazxbuh/q9HOoLYZQz3kfX1pO2IU09VY6UVJLLrvG6NBw1N2rr1nG8D
	GpLJ91fhMyzxK4MfQ8IuaVqutSVce6nmO/uo1ZazbtYF2yM32+t7tvD0zjd9cS/+nI2g
	Al8bGbDt1pLmpqwmNw3HFU74i9dQRFZecKHJEysVCl0uNJN3B1KftrQI7rneEfobEWj0
	7qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TRlfr6Dva9MY8BXYuc7fkY7RU/+Pqp55qQ5psBokNJ4=;
	b=SEf+EseEmOxMq0n5rIID/++s3/c97AvvmTp5dRDCtDZls2HYiKBbPJKe9IkVx6+mQn
	tMo9JiDgk5+/8J/LyvgdbgvdNC3Vo1vUYFhzjhHRrXB1myGMmp1XQtw3XgqBhZ70cuJ5
	y265VwmYbxE4TsZVZXiTAHGQNmLOmCNc6ro3+uq/GbRi7R30LEuGbhJzReAcp63VtWo0
	QjOL72/kFdJiI/f8BxVgKlieB74oOOiAk9JF/UrKLRcGCPhtSw5+GU/MIBD+hobl1YmP
	Wt559uvJR+7DW7cTEZ51sl50ejNd3RptrQouvD4GM1ItoKWboMGb+Yc+QSxD5Oj7p4Z8
	My+w==
X-Gm-Message-State: APjAAAWPyS6REALr6/bgYO1h0NKuC9S8yW9pxzaeABbguuGZR4m3IniR
	l0JJp70hUcCKMexq8e5GYeGPCNCSiOc=
X-Google-Smtp-Source: APXvYqzmMBsfkPMFOSkz02m2waMU13BRBlzxnCyOgyI/X1TjlTOhxvVIbx1AAl4Cen2f0kl+Icqcfw==
X-Received: by 2002:a05:620a:15b1:: with SMTP id
	f17mr805746qkk.187.1570049550192; 
	Wed, 02 Oct 2019 13:52:30 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	l129sm210223qkd.84.2019.10.02.13.52.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 13:52:29 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 16:52:27 -0400
Message-Id: <20191002205227.16149-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meta: add missing some description in devtools
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
X-List-Received-Date: Wed, 02 Oct 2019 20:52:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-devtools/apt/apt.inc              | 3 +++
 meta/recipes-devtools/cmake/cmake.inc          | 6 ++++++
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 2 ++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb         | 5 ++++-
 meta/recipes-devtools/meson/meson.inc          | 3 +++
 meta/recipes-devtools/qemu/qemu.inc            | 4 ++++
 meta/recipes-devtools/quilt/quilt.inc          | 4 ++++
 meta/recipes-devtools/swig/swig.inc            | 3 +++
 meta/recipes-devtools/unfs3/unfs3_git.bb       | 3 +++
 9 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index b855099e52..6883ac865a 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -1,4 +1,7 @@
 SUMMARY = "Advanced front-end for dpkg"
+DESCRIPTION = "Provides commandline tools for searching and managing as well \
+as querying information about packages as a low-level access to all features \
+of the libapt-pkg library."
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 3711f18db6..35d78eea17 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -2,6 +2,12 @@
 # Released under the MIT license (see packages/COPYING)
 
 SUMMARY = "Cross-platform, open-source make system"
+DESCRIPTION = "CMake is used to control the software compilation process \
+using simple platform and compiler independent configuration files. CMake \
+generates native makefiles and workspaces that can be used in the compiler \
+environment of your choice. CMake is quite sophisticated: it is possible to \
+support complex environments requiring system configuration, pre-processor \
+generation, code generation, and template instantiation."
 HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 7dc4e417f6..10220ebc91 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -1,4 +1,6 @@
 SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
+DESCRIPTION = "DejaGnu is a framework for testing other programs. Its purpose \
+is to provide a single front end for all tests."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index c77773332c..f38167f1ad 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolver"
+DESCRIPTION = "Software package manager that installs, updates, and removes \
+packages on RPM-based Linux distributions. It automatically computes \
+dependencies and determines the actions required to install packages."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
@@ -71,7 +74,7 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
         create_wrapper ${D}/${bindir}/dnf \
                 RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1 
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 6de109de7f..2958a2a8de 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -1,5 +1,8 @@
 HOMEPAGE = "http://mesonbuild.com"
 SUMMARY = "A high performance build system"
+DESCRIPTION = "Meson is a build system designed to increase programmer \
+productivity. It does this by providing a fast, simple and easy to use \
+interface for modern software development tools and practices."
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index de21d30732..11783eaca5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,4 +1,8 @@
 SUMMARY = "Fast open source processor emulator"
+DESCRIPTION = "QEMU is a hosted virtual machine monitor: it emulates the \
+machine's processor through dynamic binary translation and provides a set \
+of different hardware and device models for the machine, enabling it to run \
+a variety of guest operating systems"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 433e9b40b7..61e1c93605 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -1,4 +1,8 @@
 SUMMARY = "Tool for working with series of patches"
+DESCRIPTION = "Quilt is a tool to manage large sets of patches by keeping \
+track of the changes each patch makes. Patches can be applied, un-applied,\
+refreshed, etc. The key philosophical concept is that your primary output \
+is patches."
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 00b9c5b605..e62718c508 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -1,4 +1,7 @@
 SUMMARY = "SWIG - Simplified Wrapper and Interface Generator"
+DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
+code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
+Mzscheme, Chicken, OCaml, Pike, and C#."
 HOMEPAGE = "http://swig.sourceforge.net/"
 LICENSE = "BSD & GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index a4ac46c68e..79d09788d3 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Userspace NFS server v3 protocol"
+DESCRIPTION = "UNFS3 is a user-space implementation of the NFSv3 server \
+specification. It provides a daemon for the MOUNT and NFS protocols, which \
+are used by NFS clients for accessing files on the server."
 SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
-- 
2.20.1



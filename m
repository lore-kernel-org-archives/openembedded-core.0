Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id C957F6BBF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:17:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v6so11886286wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mW1sXXJ/iVaNNA5Xkh3gbsHCu6e+N3hVfujESW42ctk=;
	b=Y1Unz8JRbmtpOQLSSSAFod3QO5C5P0tTQ/FJw0wx/CkpwgGHGVv0OW7VKdPjNl9Wgd
	mr28Upz4SPNTSYBYAuis9noFF7jmN80sIaTwQKElsAVHZnEvAhJGFMkxPwwYV1/yVXfo
	7wsU6GV+sbnPl54soe8gfr/43902lzY8FWRspruSVD/0r7CUa4uaj/zZphwKJIODn/eO
	iH5XHwQlBV8JuzhtGWRgpCTd5k6AQGdmbzJtfZtCCBxWMul/SEpyJ9z6fwKaaJkpBvrD
	TGe7LHYSKeMBFDgFr9a3eQ5vuIoEM+5NUU1+DX/xsC3S4Li0R0VaOQpFztguGaQB0nkC
	Yg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mW1sXXJ/iVaNNA5Xkh3gbsHCu6e+N3hVfujESW42ctk=;
	b=lGCt2JQkCE/WfZNbJv/ClcsgzSr7jHavK1VrF2ozo2k4xA5ZWFBbEBhSMS16yX7oqN
	/4oDoDhM18SVirCaREcuWJoywmLncla8sT9BT0T7XMIuYPMzZU1Pvdq5Sids2I93epBL
	PDVacZZWYk2Qs8foCAr4gAny/4lLdtHtsIDiDLoRYUuhM9vekO0/V7NlhwMWzP3UHx3N
	BQdRcak2yl67ohyRcf6qBnNbBellYpStyq0Zi0hQhDJ4l2XRiEfYrm1cLmLIAMVvoNkn
	MALJtAY5QRq5dUqsrw113eWgWGbeL97mGnz01cBPNPxBGqcra58icHoXbySqH38LUTr3
	Dzhw==
X-Gm-Message-State: AA+aEWbvov7cvopiD0/hcm/9PG9MUdx56ms01fu9SXwS4viF7OSv7hc+
	65mDyEpd9jj7t5Kv/id04V60a1i0
X-Google-Smtp-Source: AFSGD/WIDOile3i7INfX3n+cr0na8AoEBCvcg5Eu1y7OFavBupzVIEHJHOdUIIHcmq1MpVFobYP8Kw==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr8825669wrv.287.1543839438883; 
	Mon, 03 Dec 2018 04:17:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	125-v6sm9019501wmr.22.2018.12.03.04.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 04:17:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:17:09 +0100
Message-Id: <20181203121710.36010-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] gobject-introspection: add a missing patch that was overlooked when adding meson support
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
X-List-Received-Date: Mon, 03 Dec 2018 12:17:19 -0000

This should also fix Rygel builds in meta-oe

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-cross-compilation-support-to-meson.patch | 28 ++++----
 ...pository-directory-for-native-builds.patch |  2 +-
 ...0010-meson-add-option-gir-dir-prefix.patch | 66 +++++++++++++++++++
 .../gobject-introspection_1.58.1.bb           |  1 +
 4 files changed, 82 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
index 63b02fe0f3d..80c9e71ad57 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
@@ -1,4 +1,4 @@
-From fabf8c505181636182a357e0c6e764b752ccf468 Mon Sep 17 00:00:00 2001
+From ea25a5a755bc839d5b504aac207f860ae68109bc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 15 Nov 2018 15:10:05 +0100
 Subject: [PATCH] Port cross-compilation support to meson
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 66 insertions(+), 17 deletions(-)
 
 diff --git a/gir/meson.build b/gir/meson.build
-index 607bbc45..c0e221b3 100644
+index 1cb514a..f873068 100644
 --- a/gir/meson.build
 +++ b/gir/meson.build
-@@ -37,15 +37,27 @@ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
- girdir = join_paths(get_option('datadir'), 'gir-1.0')
+@@ -36,15 +36,27 @@ gir_files = [
+ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
  install_data(gir_files, install_dir: girdir)
  
 -scanner_command = [
@@ -53,7 +53,7 @@ index 607bbc45..c0e221b3 100644
  
  dep_type = glib_dep.type_name()
  if dep_type == 'internal'
-@@ -58,6 +70,12 @@ if dep_type == 'internal'
+@@ -57,6 +69,12 @@ if dep_type == 'internal'
                        '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
  endif
  
@@ -66,7 +66,7 @@ index 607bbc45..c0e221b3 100644
  # Take a glob and print to newlines
  globber = '''
  from glob import glob
-@@ -84,8 +102,8 @@ glib_command = scanner_command + [
+@@ -83,8 +101,8 @@ glib_command = scanner_command + [
  
  if dep_type == 'pkgconfig'
    glib_command += ['--external-library', '--pkg=glib-2.0']
@@ -77,7 +77,7 @@ index 607bbc45..c0e221b3 100644
    glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
    glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
    glib_files += join_paths(glib_libincdir, 'glibconfig.h')
-@@ -339,7 +357,7 @@ endforeach
+@@ -338,7 +356,7 @@ endforeach
  if giounix_dep.found()
    if dep_type == 'pkgconfig'
      gio_command += ['--pkg=gio-unix-2.0']
@@ -86,7 +86,7 @@ index 607bbc45..c0e221b3 100644
      # Get the installed gio-unix header list
      ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
      if ret.returncode() != 0
-@@ -417,15 +435,24 @@ gir_files += custom_target('gir-girepository',
+@@ -416,15 +434,24 @@ gir_files += custom_target('gir-girepository',
    ]
  )
  
@@ -116,10 +116,10 @@ index 607bbc45..c0e221b3 100644
      install_dir: typelibdir,
    )
 diff --git a/meson.build b/meson.build
-index 7ec95328..9e20da57 100644
+index 17acd82..e0bb495 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -76,7 +76,9 @@ libffi_dep = dependency('libffi',
+@@ -81,7 +81,9 @@ libffi_dep = dependency('libffi',
  subdir('girepository')
  subdir('tools')
  subdir('giscanner')
@@ -131,12 +131,12 @@ index 7ec95328..9e20da57 100644
  subdir('docs')
  subdir('tests')
 diff --git a/meson_options.txt b/meson_options.txt
-index 49726be6..d557a3b6 100644
+index ee6958d..b168142 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -21,3 +21,23 @@ option('cairo-libname', type: 'string',
- option('python', type: 'string', value: 'python3',
-   description: 'Path or name of the Python interpreter to build for'
+@@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
+ option('gir-dir-prefix', type: 'string',
+   description: 'Intermediate prefix for gir installation under ${prefix}'
  )
 +
 +option('enable-host-gi', type: 'boolean', value : false,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 17b9eac057c..fdcef3c7140 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From a20b4d70f44449875b7c54750ab0f02eefb0870d Mon Sep 17 00:00:00 2001
+From 2882e091e7b905441beef51dbed968f4dd7ffd7c Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch
new file mode 100644
index 00000000000..8eec5f867ee
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch
@@ -0,0 +1,66 @@
+From bbc34f00fd30a13eafc607a956de60d822260355 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 14 Sep 2018 01:26:38 -0700
+Subject: [PATCH] meson: add option 'gir-dir-prefix'
+
+Add option 'gir-dir-prefix' for meson to make the installation path of
+.gir files could be configured which has been done for autoconf.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3938b86f5289c2b28a5ec42965b8da4b509445c4]
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gir/meson.build   | 1 -
+ meson.build       | 8 +++++++-
+ meson_options.txt | 4 ++++
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index 607bbc4..1cb514a 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -34,7 +34,6 @@ gir_files = [
+ ]
+ 
+ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
+-girdir = join_paths(get_option('datadir'), 'gir-1.0')
+ install_data(gir_files, install_dir: girdir)
+ 
+ scanner_command = [
+diff --git a/meson.build b/meson.build
+index a1432f7..17acd82 100644
+--- a/meson.build
++++ b/meson.build
+@@ -18,7 +18,12 @@ python = pymod.find_installation(get_option('python'))
+ cc = meson.get_compiler('c')
+ config = configuration_data()
+ config.set_quoted('GIR_SUFFIX', 'gir-1.0')
+-config.set_quoted('GIR_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'gir-1.0'))
++gir_dir_prefix = get_option('gir-dir-prefix')
++if gir_dir_prefix == ''
++    gir_dir_prefix = get_option('datadir')
++endif
++girdir = join_paths(get_option('prefix'), gir_dir_prefix, 'gir-1.0')
++config.set_quoted('GIR_DIR', girdir)
+ config.set_quoted('GOBJECT_INTROSPECTION_LIBDIR', join_paths(get_option('prefix'), get_option('libdir')))
+ 
+ foreach type : ['char', 'short', 'int', 'long']
+@@ -93,6 +98,7 @@ pkgconfig_conf.set('libdir', join_paths('${prefix}', get_option('libdir')))
+ pkgconfig_conf.set('datarootdir', join_paths('${prefix}', get_option('datadir')))
+ pkgconfig_conf.set('datadir', '${datarootdir}')
+ pkgconfig_conf.set('includedir', join_paths('${prefix}', get_option('includedir')))
++pkgconfig_conf.set('GIR_DIR', join_paths('${prefix}', gir_dir_prefix, 'gir-1.0'))
+ if host_system == 'windows' or host_system == 'cygwin'
+   pkgconfig_conf.set('EXEEXT', '.exe')
+ else
+diff --git a/meson_options.txt b/meson_options.txt
+index 49726be..ee6958d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -21,3 +21,7 @@ option('cairo-libname', type: 'string',
+ option('python', type: 'string', value: 'python3',
+   description: 'Path or name of the Python interpreter to build for'
+ )
++
++option('gir-dir-prefix', type: 'string',
++  description: 'Intermediate prefix for gir installation under ${prefix}'
++)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
index 66f99185389..f4f41b61c0f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            file://0001-configure.ac-make-GIR_DIR-configurable.patch \
            file://0002-g-ir-tools-respect-gir_dir_prefix.patch \
+           file://0010-meson-add-option-gir-dir-prefix.patch \
            file://0001-Port-cross-compilation-support-to-meson.patch \
            "
 
-- 
2.17.1



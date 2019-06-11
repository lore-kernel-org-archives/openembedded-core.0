Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACAD7E63B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:52:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f9so13355119wre.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7wgboYwevM4q3rnVBnIxs7bFMJG25biH+kMAUCmq4z8=;
	b=r3rx556ZfD6zl0uJc7Srevv9pI25jLtuRGPJupX85v9YJ7eIb9g0Cd3uuflcCp0T/U
	eIAK4/rZZFeSe+44MEqZHFBW/rbZK3VK8CTji5pxEOTIWL5Hpg314l5cfqFVqjq8bTa4
	YrMtfC3YpM7CYcN6wi6fgX6UatxZyc2XPJIPAfn7vuvr6o3NLRgn8vV0DWgxE9kBfRhk
	GzRTS7W600QCJUYQjGpgfZTP7HXP2JwoOr8W//HwpnL4T//z6Sxt52f28rof5ovsAhlh
	q+cWvw+zO1e6O4ImJUvyBtDdN5za+m77PBk0nyTVSPZs+zfFtOKU8Im9z2uyOefk1mnM
	7mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7wgboYwevM4q3rnVBnIxs7bFMJG25biH+kMAUCmq4z8=;
	b=jvTXJS1kTjMvx7swKsfxFeLmVKnmwpTKEqsmh3NVubhGmLF0PWeKgnQitpCIwQiIuI
	WExgeryw/NNUuOCQrWjyYTrHvENYt0TGA7n+ygtkYXxEVxgYOWxe9n2cap0Mznn3pqh/
	LHaWfdd4z8tM1p90JIqRxYD9SMlLyH+ifJI/N1qhMXscpIi/V5v59g1Qd19OrP5q3tGP
	ORxLY+mlwg/Uhbx6Cs5dUHAEPDa32ajrZ1IRaxMdbsGsZjKOOkdQIl660+7CcQQ9Rviz
	8qoQ3UPa0UzrehUpKThYLsHbfPgH0rTBIREONbCxKBpHMH9Fft9SgFLnKSv6lEC+k8e6
	Kipg==
X-Gm-Message-State: APjAAAUyjUbbEL/jIETQzjO1ZGZVvjI/57KjynxCkaDqzsdZZxwNbFQn
	jBgHA8SA1PtID/SoPCM7+V9Y1Z6TBmU=
X-Google-Smtp-Source: APXvYqwChNdfiyWBNlupHnEhnN32a2cvLz2gc3PxwF2TOrQJkTm4/8cYsQxQ9XrnOFDPrcnpbI9k4A==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr5057859wrs.136.1560264724585; 
	Tue, 11 Jun 2019 07:52:04 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm15007133wra.58.2019.06.11.07.52.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 07:52:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:51:58 +0200
Message-Id: <20190611145159.61078-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] gdk-pixbuf: update 2.38.0 -> 2.38.1
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
X-List-Received-Date: Tue, 11 Jun 2019 14:52:04 -0000

Remove 0001-loaders.cache-depend-on-loaders-being-fully-build.patch
as upstream has fixed the issue.

Add a patch to revert upstream's decision to not cross-compile
thumbnailer or tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...f-decisions-around-cross-compilation.patch | 50 ++++++++----------
 ...-depend-on-loaders-being-fully-build.patch | 51 -------------------
 ...-around-thumbnailer-cross-compile-fa.patch |  8 ++-
 ...ailer-and-tests-also-in-cross-builds.patch | 28 ++++++++++
 ...-pixbuf_2.38.0.bb => gdk-pixbuf_2.38.1.bb} |  6 +--
 5 files changed, 55 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.38.0.bb => gdk-pixbuf_2.38.1.bb} (95%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
index e638fd3b6f3..e4614049183 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
@@ -1,4 +1,4 @@
-From bf71999b6e64d1f1919b0351b27c1c417e2b8856 Mon Sep 17 00:00:00 2001
+From be8a47e0c21e5577d4f5669d339dfec6299b25be Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 14 Feb 2019 18:06:25 +0100
 Subject: [PATCH] Generate loaders.cache using a native tool when
@@ -10,37 +10,29 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- gdk-pixbuf/meson.build | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
+ gdk-pixbuf/meson.build | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 1995ffd..d692cb7 100644
+index 5cddbec..78c8bd3 100644
 --- a/gdk-pixbuf/meson.build
 +++ b/gdk-pixbuf/meson.build
-@@ -291,6 +291,7 @@ foreach bin: gdkpixbuf_bin
-   set_variable(bin_name.underscorify(), bin)
- endforeach
- 
-+if not meson.is_cross_build()
- # The 'loaders.cache' used for testing, so we don't accidentally
- # load the installed cache; we always build it by default
- loaders_cache = custom_target('loaders.cache',
-@@ -302,6 +303,18 @@ loaders_cache = custom_target('loaders.cache',
-                               ],
-                               build_by_default: true)
- loaders_dep = declare_dependency(sources: [ loaders_cache ])
-+else
-+loaders_cache = custom_target('loaders.cache',
-+                              output: 'loaders.cache',
-+                              capture: true,
-+                              depends: [ dynamic_loaders_dep ],
-+                              command: [
-+                                'gdk-pixbuf-query-loaders',
-+                                dynamic_loaders,
-+                              ],
-+                              build_by_default: true)
-+loaders_dep = declare_dependency(sources: [ loaders_cache ])
-+endif
+@@ -324,8 +324,16 @@ if not meson.is_cross_build()
+                                 build_by_default: true)
+   loaders_dep = declare_dependency(sources: [ loaders_cache ])
+ else
+-  loaders_cache = []
+-  loaders_dep = declare_dependency()
++  loaders_cache = custom_target('loaders.cache',
++                                output: 'loaders.cache',
++                                capture: true,
++                                command: [
++                                  'gdk-pixbuf-query-loaders',
++                                  dynamic_loaders,
++                                ],
++                                depends: dynamic_loaders_dep,
++                                build_by_default: true)
++  loaders_dep = declare_dependency(sources: [ loaders_cache ])
+ endif
  
  pkgconfig = import('pkgconfig')
- pkgconfig.generate(
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
deleted file mode 100644
index 2a7751511bb..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 116bc8f7a6034ce43053876a72a132fcd4e1e472 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 20 Feb 2019 19:53:07 +0100
-Subject: [PATCH] loaders.cache: depend on loaders being fully build
-
-Otherwise, races have been observed:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/310/steps/7/logs/step1b
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index fc3eb33..4e7ed20 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -171,6 +171,7 @@ gdkpixbuf_dep = declare_dependency(link_with: gdkpixbuf,
- # Now check if we are building loaders as installed shared modules
- # We do this here because shared modules depend on libgdk-pixbuf
- dynamic_loaders = []
-+dynamic_loaders_dep = []
- 
- foreach l: loaders
-   name = l[0]
-@@ -189,6 +190,7 @@ foreach l: loaders
- 
-     # We need the path to build loaders.cache for tests
-     dynamic_loaders += mod.full_path()
-+    dynamic_loaders_dep += mod
-   endif
- endforeach
- 
-@@ -206,6 +208,7 @@ if enable_native_windows_loaders
-                           install: true,
-                           install_dir: gdk_pixbuf_loaderdir)
-       dynamic_loaders += mod.full_path()
-+      dynamic_loaders_dep += mod
-     endforeach
-   endif
- endif
-@@ -236,6 +239,7 @@ if not meson.is_cross_build()
- loaders_cache = custom_target('loaders.cache',
-                               output: 'loaders.cache',
-                               capture: true,
-+                              depends: [ dynamic_loaders_dep ],
-                               command: [
-                                 gdk_pixbuf_query_loaders,
-                                 dynamic_loaders,
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
index 928962d230b..a9c7600eb3e 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
@@ -1,4 +1,4 @@
-From 6fc7f341399ec49ab06c94426f50dbdca49a2844 Mon Sep 17 00:00:00 2001
+From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 22 Feb 2019 13:22:06 +0100
 Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
@@ -15,6 +15,7 @@ The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
 
 Upstream-Status: Inappropriate [workaround]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  build-aux/gen-thumbnailer.py |  2 --
  tests/meson.build            | 11 +++++++++--
@@ -35,7 +36,7 @@ index 05ac821..c5b99ab 100644
  if os.name == 'nt':
      gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
 diff --git a/tests/meson.build b/tests/meson.build
-index 4fa3fbc..eca5166 100644
+index 8ed7cc1..e011b77 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -1,12 +1,19 @@
@@ -91,6 +92,3 @@ index aaafec8..71bd61b 100644
                ],
                install: true,
                install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
--- 
-2.17.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
new file mode 100644
index 00000000000..0fe13a387a2
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
@@ -0,0 +1,28 @@
+From 1a532e090c558a830de9503f56e23414e880bb95 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 5 Jun 2019 14:17:55 +0200
+Subject: [PATCH] Build thumbnailer and tests also in cross builds.
+
+Upstream-Status: Inappropriate [relies on oe-core specific hacks]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d104cea..7acb88a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -397,10 +397,8 @@ endif
+ # i18n
+ subdir('po')
+ 
+-if not meson.is_cross_build()
+-  subdir('tests')
+-  subdir('thumbnailer')
+-endif
++subdir('tests')
++subdir('thumbnailer')
+ 
+ # Documentation
+ subdir('docs')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
similarity index 95%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
index 7fef697f3fa..3145cc2089b 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.1.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
-           file://0001-loaders.cache-depend-on-loaders-being-fully-build.patch \
            file://0004-Do-not-run-tests-when-building.patch \
+           file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -29,8 +29,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "77765f24496dc8c90c6e0cbe10fd8f0e"
-SRC_URI[sha256sum] = "dd50973c7757bcde15de6bcd3a6d462a445efd552604ae6435a0532fbbadae47"
+SRC_URI[md5sum] = "f6ba2195acd18c5c9555421f30c31cc1"
+SRC_URI[sha256sum] = "f19ff836ba991031610dcc53774e8ca436160f7d981867c8c3a37acfe493ab3a"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-- 
2.17.1



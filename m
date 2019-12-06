Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E01E7FBE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so8766747wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=woBnt2387OegCMrgDvOsvOYvzVQbfy6IQXMWC7wbVX8=;
	b=c9asbEi+4kWW65K9gs5Y4f++t17K18Y9Nsf1qUcYwCwdJot4/kEdTCoicirwQi5DkS
	3uGzuMApysx9mc5vFml4tSczl4jqS+LagqjlpO6GxEDrBNdIEA3z6CE7vcNQ/JIZn29T
	BdFC7SnLQarkPhO12YafnOP48JGjnp+n0DD3kVkbOHXm2jSTRb6tGAJbMJIM0/hFFLsl
	SsULe+sp0c7YB+nHMXrkBfeeU98YbNLpNbi5vL14KPxojUp+fhd+Sj80jSmPd7p1DTAv
	TXujHvlBBhEc8t/J6gUjhzOgCYkKFmSm1GI7nqCXqtdohOl7WKOEBxdDRuQRmJIXDjTo
	I/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=woBnt2387OegCMrgDvOsvOYvzVQbfy6IQXMWC7wbVX8=;
	b=f5Ey2p8to2FbM1GhO8b7pwOMwOvb2a5FCvqT6K3Otbq98dlMskTr4nMUObVWzXQjMJ
	PaNf/tin26pl2m0d9PrCUOqlzVRpZohzVbXrEN94jUL/dqvcnHI6K0j5cFjFujLLNqph
	+1+ieLJapzsxad3dY53qkw+uxM4NbbmvHY91OOwk9fHL5ADsI1x3gjmsNeRai96ZxC35
	MQfl/rVkW5TZzbp717TwEr99cgpcvkIYl6J3EptqdGHk5uDBk5JrElIJMJV0M6r1zru2
	lTyXiu2kxnK9+qXHAMoSre8BtlnoOib/2gILaK7c+7zjX4zvZGz1O/zwaQQuc3JIovn2
	0+/Q==
X-Gm-Message-State: APjAAAXmJqhWsj+561dOJ0cIeVD8ITHJvO420F/E6eqZE8EkNP9ioQ69
	x/X+lBkmCmc/l7zalC2b2Q41aU95
X-Google-Smtp-Source: APXvYqwi2p74F6OOC/AQlQWIGHkGJtAZLUQ4MjfM4P2rwRpfCPDtpsox0gJA8aKB5fzU5wMnftWO6A==
X-Received: by 2002:a1c:2186:: with SMTP id h128mr12214404wmh.14.1575655805163;
	Fri, 06 Dec 2019 10:10:05 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.10.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:49 +0100
Message-Id: <20191206180949.59953-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/10] glib-2.0: update to 2.62.3
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ble-more-tests-while-cross-compiling.patch | 36 +++++++++----------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.62.2.bb => glib-2.0_2.62.3.bb} |  4 +--
 3 files changed, 20 insertions(+), 22 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.2.bb => glib-2.0_2.62.3.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index ff2629f06c8..48899ce8526 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 23cd157352ac8a53f992ddc6d6d01caadf1c79bc Mon Sep 17 00:00:00 2001
+From 0061d66057dfd7e7267772df60b36474fb180eed Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
 ---
- gio/tests/meson.build | 26 ++++++++++++++------------
- 1 file changed, 14 insertions(+), 12 deletions(-)
+ gio/tests/meson.build | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 65f43e2..028b196 100644
+index 382dfcc..c171717 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -185,7 +185,7 @@ if host_machine.system() != 'windows'
+@@ -191,7 +191,7 @@ if host_machine.system() != 'windows'
  
    #  Test programs that need to bring up a session bus (requires dbus-daemon)
    have_dbus_daemon = find_program('dbus-daemon', required : false).found()
@@ -27,12 +27,11 @@ index 65f43e2..028b196 100644
      annotate_args = [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -453,12 +453,13 @@ if installed_tests_enabled
+@@ -465,12 +465,12 @@ if installed_tests_enabled
    install_data('static-link.py', install_dir : installed_tests_execdir)
  endif
  
 -if not meson.is_cross_build() or meson.has_exe_wrapper()
-+#if not meson.is_cross_build() or meson.has_exe_wrapper()
 +if meson.is_cross_build()
  
    plugin_resources_c = custom_target('plugin-resources.c',
@@ -43,7 +42,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate-source',
-@@ -482,7 +483,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -494,7 +494,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_gresource = custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
@@ -52,7 +51,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -493,7 +494,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -505,7 +505,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_c = custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
@@ -61,7 +60,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -504,7 +505,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -516,7 +516,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_h = custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
@@ -70,7 +69,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -516,7 +517,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -528,7 +528,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      input : 'test2.gresource.xml',
      depends : big_test_resource,
      output : 'test_resources.c',
@@ -79,7 +78,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -527,7 +528,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -539,7 +539,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_c = custom_target('digit_test_resources.c',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.c',
@@ -88,7 +87,7 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -538,7 +539,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -550,7 +550,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_h = custom_target('digit_test_resources.h',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.h',
@@ -97,12 +96,11 @@ index 65f43e2..028b196 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -565,11 +566,12 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   # Support for --add-symbol was added to LLVM objcopy in 2019
-   # (https://reviews.llvm.org/D58234). FIXME: This test could be enabled for
+@@ -579,11 +579,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    # LLVM once that support is in a stable release.
--  if build_machine.system() == 'linux' and cc.get_id() == 'gcc'
-+  #if build_machine.system() == 'linux' and cc.get_id() == 'gcc'
+   objcopy = find_program('objcopy', required : false)
+ 
+-  if build_machine.system() == 'linux' and cc.get_id() == 'gcc' and objcopy.found()
 +  if not meson.is_cross_build()
      test_gresource_binary = custom_target('test5.gresource',
        input : 'test5.gresource.xml',
@@ -112,7 +110,7 @@ index 65f43e2..028b196 100644
                   '--target=@OUTPUT@',
                   '--sourcedir=' + meson.current_source_dir(),
                   '--sourcedir=' + meson.current_build_dir(),
-@@ -581,7 +583,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -595,7 +595,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      test_resources_binary_c = custom_target('test_resources_binary.c',
        input : 'test5.gresource.xml',
        output : 'test_resources_binary.c',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 7e9925845bb..70a43a77234 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 6325bf4e8a2f569c55c8e1a36b9439d3566f98f6 Mon Sep 17 00:00:00 2001
+From dd8c6822d05d65e8db72cbff0b2f3c1088686b6f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb
index 27a15a9b1dc..25406ecfc8e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb
@@ -20,5 +20,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "bed3a70397a019965efac0c49f9c8164"
-SRC_URI[sha256sum] = "698824a413f76df039739c2a78f45b10939d526ae7495bab4e694e6730deb3f1"
+SRC_URI[md5sum] = "9766a37736974e636227d62f86bae40e"
+SRC_URI[sha256sum] = "4400adc9f0d3ffcfe8e84225210370ce3f9853afb81812ddadb685325aa655c4"
-- 
2.17.1



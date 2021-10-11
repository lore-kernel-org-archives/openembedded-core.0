Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.9552.1633945271668476240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHfxXpOW;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id k7so53984268wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vR4bOle7WHrcIEYz4ewyy9BN7c7mikGEf9ehOzj0JQI=;
        b=gHfxXpOW6OpgSiyhqgQnz/oKA5DN55DbSSEuZTlqIhAI3hRAfQn620JSeCMsygdC7c
         7hD0nN71lML2VMh4A4xhlHlXoDMInIc359dwdhS0RZSoHRM1bR0i0t6RTWxBXCjtehl6
         EoclHjGfC2bTuVi7zR8XMqTw0LT8CwAigKqZDvJNXDLzWoXwIyB3kMDaoRJAbBHOz73C
         3UOv9qVbmuyJKMhdjB3N8HFUJagiDuM77sa28W0TSMlvSS8jdlK08cuAXQV9aJ7dVvME
         J1DysjGzJ1Web1hDQ9BvdWjwOFJXHwsqGLdmGDcg8WpYpjXcIiFFJGKRrLI311qw9BL8
         pcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vR4bOle7WHrcIEYz4ewyy9BN7c7mikGEf9ehOzj0JQI=;
        b=eLKuoxD/U2Cs1XOEhIFkxN5gErYrb/8dEUxE2exLIiSSVdBqiGTdh/EH+2Mh8IN/iC
         bBkpPGLk4E1zf4tr5/uyTVF4khBpedpmxs2WqfM24OIJkK9LcFZ2paAswll09bF4jVJC
         jfiFP25B+d371ode8E7lFzQfN1M6OKMe7JGF5wYwieHFG8AoqlsL7v/23YiJcerS02om
         kNr8L9Ql6i50qYr4gte7Ibxh+OpZAgQEo59q0Umrrm8qWHwQgaRatPkzsOUYV8MYWqVr
         9tqSA38RjDGk8rHVQQ2rhScQCJx1ipz9ilQjSofpKsJXQn5F77TA38dbMtfMrXPmtbO8
         m7WA==
X-Gm-Message-State: AOAM531B3SeSOMZS1DG2dJPXP8aS6+GQRpo/l8yDtecyVloB0NfMHvbM
	zRmYA6KHIxL5XMD2eayVpeB4twuyrhc=
X-Google-Smtp-Source: 
 ABdhPJwykSFHMXMvynYEckK922/+YUyR6rS1inQS2jBKUsw8B5PfobBOMw/QzyahQDNsisuWY5LQTQ==
X-Received: by 2002:adf:eb47:: with SMTP id u7mr23321236wrn.333.1633945270189;
        Mon, 11 Oct 2021 02:41:10 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 11/25] glib-2.0: update 2.68.4 -> 2.70.0
Date: Mon, 11 Oct 2021 11:40:45 +0200
Message-Id: <20211011094059.4184654-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156824

Internal copy of pcre is no longer provided.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ble-more-tests-while-cross-compiling.patch | 26 ++++++------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 ++--
 .../glib-2.0/glib-2.0/time-test.patch         | 40 -------------------
 ...{glib-2.0_2.68.4.bb => glib-2.0_2.70.0.bb} |  3 +-
 meta/recipes-core/glib-2.0/glib.inc           |  5 +--
 5 files changed, 20 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/time-test.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.4.bb => glib-2.0_2.70.0.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 41ecfa1df86..9bbb33ffc16 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 7cde170afe6854d674b50e32b4c1d3b511be9abe Mon Sep 17 00:00:00 2001
+From 73b1c416674d285b021e218da1a3ddb884e606da Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 788cf97..dab65d2 100644
+index 5dbfb8e..3fd7998 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -203,7 +203,7 @@ if host_machine.system() != 'windows'
+@@ -221,7 +221,7 @@ if host_machine.system() != 'windows'
  
    #  Test programs that need to bring up a session bus (requires dbus-daemon)
    have_dbus_daemon = find_program('dbus-daemon', required : false).found()
@@ -27,7 +27,7 @@ index 788cf97..dab65d2 100644
      annotate_args = [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -548,12 +548,12 @@ if installed_tests_enabled
+@@ -570,12 +570,12 @@ if installed_tests_enabled
    endforeach
  endif
  
@@ -42,7 +42,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate-source',
-@@ -577,7 +577,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -599,7 +599,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_gresource = custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
@@ -51,7 +51,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -588,7 +588,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -610,7 +610,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_c = custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
@@ -60,7 +60,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -599,7 +599,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -621,7 +621,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_h = custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
@@ -69,7 +69,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -611,7 +611,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -633,7 +633,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      input : 'test2.gresource.xml',
      depends : big_test_resource,
      output : 'test_resources.c',
@@ -78,7 +78,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -622,7 +622,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -644,7 +644,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_c = custom_target('digit_test_resources.c',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.c',
@@ -87,7 +87,7 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -633,7 +633,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -655,7 +655,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_h = custom_target('digit_test_resources.h',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.h',
@@ -96,11 +96,11 @@ index 788cf97..dab65d2 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -668,11 +668,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -688,11 +688,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
  
    ld = find_program('ld', required : false)
  
--  if build_machine.system() == 'linux' and cc.get_id() == 'gcc' and objcopy.found() and objcopy_supports_add_symbol and ld.found()
+-  if build_machine.system() == 'linux' and objcopy.found() and objcopy_supports_add_symbol and ld.found()
 +  if not meson.is_cross_build()
      test_gresource_binary = custom_target('test5.gresource',
        input : 'test5.gresource.xml',
@@ -110,7 +110,7 @@ index 788cf97..dab65d2 100644
                   '--target=@OUTPUT@',
                   '--sourcedir=' + meson.current_source_dir(),
                   '--sourcedir=' + meson.current_build_dir(),
-@@ -684,7 +684,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -704,7 +704,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      test_resources_binary_c = custom_target('test_resources_binary.c',
        input : 'test5.gresource.xml',
        output : 'test_resources_binary.c',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 846c8d62b68..9bfb6e85ccf 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From dac2bdeea38388e069412aa27eff8f1eff0440e5 Mon Sep 17 00:00:00 2001
+From ab071f315deed3740f867161ee58436b985d6fc1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index a2909a8..1f4ab82 100644
+index d34037a..7442df6 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -51,6 +51,8 @@
+@@ -54,6 +54,8 @@
  #ifdef G_OS_WIN32
  #include "gregistrysettingsbackend.h"
  #include "giowin32-priv.h"
@@ -31,7 +31,7 @@ index a2909a8..1f4ab82 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1213,7 +1215,15 @@ get_gio_module_dir (void)
+@@ -1224,7 +1226,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/time-test.patch b/meta/recipes-core/glib-2.0/glib-2.0/time-test.patch
deleted file mode 100644
index 4d7ef97bb56..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/time-test.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2177]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 289f8be1b397a453cfcf35641455f3ae5fb4faeb Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 6 Jul 2021 19:26:03 +0100
-Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
- don't happen
-
-The modification time test creates a file, gets the modification time in
-seconds, then gets the modification time in microseconds and assumes
-that the difference between the two has to be above 0.
-
-As rare as this may be, it can happen:
-
-$ stat g-file-info-test-50A450 -c %y
-2021-07-06 18:24:56.000000767 +0100
-
-Change the test to simply assert that the difference not negative to
-handle this case.
----
- gio/tests/g-file-info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
-index c11c50462..fd0c64b55 100644
---- a/gio/tests/g-file-info.c
-+++ b/gio/tests/g-file-info.c
-@@ -178,7 +178,7 @@ test_g_file_info_modification_time (void)
-   g_assert_nonnull (dt_usecs);
- 
-   ts = g_date_time_difference (dt_usecs, dt);
--  g_assert_cmpint (ts, >, 0);
-+  g_assert_cmpint (ts, >=, 0);
-   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
- 
-   /* Try round-tripping the modification time. */
--- 
-2.25.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
index cd789de3c01..8217aaa8d06 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
@@ -17,11 +17,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
-           file://time-test.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b"
+SRC_URI[sha256sum] = "200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a34776b0837..0eef2e330c3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
-                    file://glib/pcre/pcre.h;beginline=8;endline=36;md5=3e2977dae4ad05217f58c446237298fc \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
@@ -22,6 +21,7 @@ DEPENDS = "glib-2.0-native \
            virtual/libintl \
            virtual/libiconv \
            libffi \
+           libpcre \
            zlib"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
@@ -36,10 +36,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 S = "${WORKDIR}/glib-${PV}"
 
-PACKAGECONFIG ??= "system-pcre libmount \
+PACKAGECONFIG ??= "libmount \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 # To use the system pcre it must be configured with --enable-unicode-properties
-PACKAGECONFIG[system-pcre] = "-Dinternal_pcre=false,-Dinternal_pcre=true,libpcre"
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option
-- 
2.20.1



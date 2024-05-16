Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C4C25B7D
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:26:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.11096.1715858814692547781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9XpM8dj;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso299648966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858813; x=1716463613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foRCbXnIIycuHjUxiXkCphwmuIfENn2qRI5E4VEC320=;
        b=D9XpM8djNY4GCHHtPKcttGJDLxRaRdMCC3BuV2sXWtLWx9udzohQ+tNz3q5Js8X4KU
         oaV1jEGV9mAhbsEZgM76sVhuk+UGo0W8UzaNbAnsvZcu0TtDqJ1N8LJmltm/CTsUwiYw
         eloqi3bvkkPkoYjhJwbgHWWznOyp/ZAQcfNChKdARi3MrLWapl0DJmKnZ66BHG6W12py
         FOYADR62nFAqshSuGWOL7Ga5iDJPuQ0jAmNzUJx5IKS7rkYzld1YGaUMUMburChWcfbo
         Fp35stforq+3Deve00/+8fmsOfg7Y6vKgHk9kui6FQ1k26MTLFSnt+Nk1JkY0oIKD1yi
         hl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858813; x=1716463613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foRCbXnIIycuHjUxiXkCphwmuIfENn2qRI5E4VEC320=;
        b=STz63a1abblqkIXwnnQ4ygXIgmLIPj0U+6UIfrV/8V+iDqoKjenlQNiPOYEAnC2qE2
         XFVPhx71YtBpPRTJDYZ5geVkBoJFNlnlvAJD1mZxen/Ns/58LK4uRTr7wQVqSAc5Z9rT
         58bAKw1ZLZeRZ70VyDhro4cdlm8U2XvXwlhHG8kYF3Cyf7zic/iYAvLGpzGwcDFtV38b
         aQzAZDlfuL4//5Or3p+ZC3UQKIT0VQeqgP1H3QFqGUuwTz5JzERWHhA0aa5tQCijqQoS
         aOBocD4UycwpwuY4RfPc3oBEDnhkxuoNO+I0R3qJzQPw7fuiLVX1VGM5U6qdBKiDnkWK
         B2rA==
X-Gm-Message-State: AOJu0YywF1eXjK1OkvtALSOE92/pWEtIzxlL498oUSM+maMHWqMtqw9Q
	lXS8vQRv5L23UyutNYQC5EprU4ZSfzFJLeVRHln/UurHGWB3kYs6F2Qu4A==
X-Google-Smtp-Source: AGHT+IEJTe8VGDRtHUspV+sbAo9/82aomCdKwpeZzOJ2EhUXG//0aNJTm/5sA9ZXwfJL0Bjyy784vg==
X-Received: by 2002:a17:907:986:b0:a5a:5c5:a9f7 with SMTP id a640c23a62f3a-a5a2d55a4bemr1518310166b.8.1715858812998;
        Thu, 16 May 2024 04:26:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/13] glib-2.0: remove obsolete 0001-Set-host_machine-correctly-when-building-with-mingw3.patch
Date: Thu, 16 May 2024 13:26:29 +0200
Message-Id: <20240516112640.2145789-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199469

From: Alexander Kanavin <alex@linutronix.de>

This as well has been solved via
https://git.yoctoproject.org/poky/commit/?id=f6a35934540e910794b8729ecc278189a39b710f

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-correctly-when-building-with-mingw3.patch | 80 -------------------
 meta/recipes-core/glib-2.0/glib.inc           |  1 -
 2 files changed, 81 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
deleted file mode 100644
index a2f9dd9672f..00000000000
--- a/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 01810df82fae752428d3756c85edb2eb7bbf3c15 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 13 Feb 2019 15:32:05 +0100
-Subject: [PATCH] Set host_machine correctly when building with mingw32
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gio/tests/meson.build  | 8 ++++----
- glib/tests/meson.build | 2 +-
- meson.build            | 3 +++
- 3 files changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 232ecca..563298b 100644
---- a/gio/tests/meson.build
-+++ b/gio/tests/meson.build
-@@ -29,7 +29,7 @@ endif
- 
- test_cpp_args = test_c_args
- 
--if host_machine.system() == 'windows'
-+if host_system == 'windows'
-   common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
- endif
- 
-@@ -244,7 +244,7 @@ if have_dbus_daemon
- endif
- 
- #  Test programs buildable on UNIX only
--if host_machine.system() != 'windows'
-+if host_system != 'windows'
-   gio_tests += {
-     'file' : {
-       # FIXME: https://gitlab.gnome.org/GNOME/glib/-/issues/3148
-@@ -593,7 +593,7 @@ if host_machine.system() != 'windows'
- endif # unix
- 
- #  Test programs buildable on Windows only
--if host_machine.system() == 'windows'
-+if host_system == 'windows'
-   gio_tests += {'win32-streams' : {}}
- endif
- 
-@@ -663,7 +663,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
-   }
- endif
- 
--if host_machine.system() != 'windows'
-+if host_system != 'windows'
-   test_extra_programs += {
-     'gdbus-example-unix-fd-client' : {
-       'install' : false,
-diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index f6efc59..83eb5a5 100644
---- a/glib/tests/meson.build
-+++ b/glib/tests/meson.build
-@@ -226,7 +226,7 @@ if glib_conf.has('HAVE_EVENTFD')
-   }
- endif
- 
--if host_machine.system() == 'windows'
-+if host_system == 'windows'
-   if winsock2.found()
-     glib_tests += {
-       'gpoll' : {
-diff --git a/meson.build b/meson.build
-index 7534542..2560686 100644
---- a/meson.build
-+++ b/meson.build
-@@ -54,6 +54,9 @@ else
- endif
- 
- host_system = host_machine.system()
-+if host_system == 'mingw32'
-+  host_system = 'windows'
-+endif
- 
- if host_system == 'darwin'
-   ios_test_code = '''#include <TargetConditionals.h>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 1a97a0d02a6..2de50dd9af3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -222,7 +222,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-- 
2.39.2



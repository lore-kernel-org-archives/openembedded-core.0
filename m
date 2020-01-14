Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id B056D7FA32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b6so12296344wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QuNjiokwse0jFH5BhuAX+iHE2PhSy/B5hzJeCMaL5Jc=;
	b=C0DkOBltAZxR1GV4d881j2JFDcTAE+qL5ln80vKx6eKRd/TNW5YickNRJuXr2QQAyt
	QtZwO8j0NTV7jfIDRH0SE1usFbM5zkr1LokAThXmHryIWNYBLizLX+zlklucpdLRPWQZ
	0VQIRs85+KkFqE20RnybKIEBbvrGLE03Yr427RnK6bShzfunUx2IiXNFQdaQEEmLQqB8
	36lEcGtxhbOkvG/WhblsAp6AEN6rPZCFQvYocjV0QXcajb35f3G/8ZRk/4XorCEXRdkw
	Twyx7exCL25rQbhJ8SWJG4UHKF/65EHvJzfhgjWYimq+iyNEFiQzBz9cqiif13syhWub
	xK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QuNjiokwse0jFH5BhuAX+iHE2PhSy/B5hzJeCMaL5Jc=;
	b=ZzxsmhhCZurgA34kFZbUfDD/SnvSdO7FGjorzPKCMt+bbKm4FisGum/twYE3jlI9Cr
	moH0EhFKLZaJQPo5CBJhIkNRc/owwNdPGJxJQIH/cxG22XbcnNRMUwuGBLark2zwJ6UC
	OBIpHXQlIjpGTnuw5j0E3v/Jiwb51+/WWRNMw9xBDC+QmY/7GAR6Ccrsufh6uCgdsUeq
	tzzLWO7pALV70p3QsQuNiNARmvdlLrM8VqYXmNa/4g0GozHcmoXIrzlq5MFJHm2WlgB4
	pjdAadKr3XtrDBXKfz6ybuGyDaDM4FqX2WlHZuhzDv4G5RHqQPpoKrDCGI4J3vFU7VY2
	uqcA==
X-Gm-Message-State: APjAAAVe0JEbp9/ZEsDcD4wzj5NPxQA2SyMwdR8/03AtXEzAJD3YkxQQ
	SlOZl3kyQqHv2lGBmnPvsgnbUkVM
X-Google-Smtp-Source: APXvYqwzzNg1T2cixIpO+NKF8muoEJP74I5PzvarnDTjs02Pzcs3pUDR+J7Zq5kmsU4hGn2tz8voxA==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr25168366wre.156.1579010425986;
	Tue, 14 Jan 2020 06:00:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:01 +0100
Message-Id: <20200114140007.36622-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/20] glib: disable a failing ptest
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:26 -0000

The test needs resources that are built by glib using
hardcoded host tools, that was already disabled, so this
patch adds disabing the test that relies on those resources.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ces.c-comment-out-a-build-host-only-.patch | 27 +++++++++++++++++++
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
new file mode 100644
index 00000000000..3dfef176fdb
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -0,0 +1,27 @@
+From 730803f2bc3f2f1a74f4db809a224066e7eae114 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 8 Jan 2020 18:22:46 +0100
+Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
+
+This test requires building resources in a way that is
+not cross-compatible (hardcodes ld and objcopy).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gio/tests/resources.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/resources.c b/gio/tests/resources.c
+index c44d214..e289a01 100644
+--- a/gio/tests/resources.c
++++ b/gio/tests/resources.c
+@@ -993,7 +993,7 @@ main (int   argc,
+   g_test_add_func ("/resource/automatic", test_resource_automatic);
+   /* This only uses automatic resources too, so it tests the constructors and destructors */
+   g_test_add_func ("/resource/module", test_resource_module);
+-  g_test_add_func ("/resource/binary-linked", test_resource_binary_linked);
++  /* g_test_add_func ("/resource/binary-linked", test_resource_binary_linked); */
+ #endif
+   g_test_add_func ("/resource/uri/query-info", test_uri_query_info);
+   g_test_add_func ("/resource/uri/file", test_uri_file);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 70a43a77234..fc320dcab8e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From dd8c6822d05d65e8db72cbff0b2f3c1088686b6f Mon Sep 17 00:00:00 2001
+From 8c623acdbea3ecc2812bbaafcfc892758fa978da Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 5e71c81cca1..0b7080f4c34 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
+           file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1



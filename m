Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83F226C57E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q26so9496074wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bdTIKVIa4SqYY6ir6045VOPktz4Bnau5gg5B1A5fjUM=;
	b=ertrW40cBlGsZicWYjaNnt1vmGgu06JulGDB+VO0M7ZOKo99JU4gOoVc2773fZURV+
	MrRhwD2kDpKspPPFWcgKsKuFR9f9WQk1S5awHIID84uMHy0IjZkLQibWhvbeuXCbjZll
	Mvm3rSMPjodWGhvJoGjrAie+/Rw1tH3jW6pTJVl9sjuuoPmuvOpCyyOantPyuWeCfZfX
	+bCBxs3/F6IrDsvrXx7ga/0ahc05ORRvKR8awstbevlZrxHZ1WLd81bset8XdUWvLVjd
	AqsBNYu1PsulVM0692XGgv93LxiSoSHTR/Ttx+v4GzwimnQ5s7dIhZdpmL3lGUvVNYzX
	FqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bdTIKVIa4SqYY6ir6045VOPktz4Bnau5gg5B1A5fjUM=;
	b=ZTKncghORUL/XAhqaE0hIJGPTLgKTOxiQ7L/NWUAafT1tLV8TfzbyTysNkkdhS8+s7
	CZDIHxpfAChkiwvJ1veeXjTEsRE3RdVp2Bs+mgT1ioVbbFUZujZgz+iVpkTqmW5Fswym
	kneingUsqBz8u5YQunOluPbyxPQvjG+qe6O4TFf4URiv2XwOZsESJeoYxY6dmrgbuJyt
	fI62GiNeutIl6pR9qV7lvvVEfegJ+T6tRI8Qeh2ES2jxpNyj300qoSa3aj/VrTZRuaaX
	b2Ge/pcHjtGrfHFXlechgelcp0vnceZWhkJHeW3+zxQL/oZp1FnNN7Kgh+Abqh4JHT3m
	bZVA==
X-Gm-Message-State: AA+aEWZINn3hwcA9jtBjMjDTsVPJ+fBn7rKEulJ8JRGVUe0KL6kZi5m6
	bOTQnnQGaNKwWSEkLRSClur6lyFL
X-Google-Smtp-Source: AJdET5e7lHzOFssD6KUnwTlSVvw9yBB6ipP3e4dnauTl25+lzcb1wKGcOZ1iqWu8e75Jz3eSgXG4Sw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr10156829wmk.149.1542901310535;
	Thu, 22 Nov 2018 07:41:50 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:21 +0100
Message-Id: <20181122154136.121480-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:50 -0000

Also, change default meson option to building introspection files
(previously they were not built by default).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-Port-cross-compilation-support-to-meson.patch | 11 ++++++-----
 ...e-the-repository-directory-for-native-builds.patch |  2 +-
 ...tion_1.58.0.bb => gobject-introspection_1.58.1.bb} |  4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.58.0.bb => gobject-introspection_1.58.1.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
index b0eee1ebe5b..63b02fe0f3d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
@@ -1,10 +1,11 @@
-From e8ce42c5cb54847517fe8fbe50bbaea452618218 Mon Sep 17 00:00:00 2001
+From fabf8c505181636182a357e0c6e764b752ccf468 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 15 Nov 2018 15:10:05 +0100
 Subject: [PATCH] Port cross-compilation support to meson
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  gir/meson.build   | 59 ++++++++++++++++++++++++++++++++++-------------
  meson.build       |  4 +++-
@@ -12,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 66 insertions(+), 17 deletions(-)
 
 diff --git a/gir/meson.build b/gir/meson.build
-index 607bbc4..c0e221b 100644
+index 607bbc45..c0e221b3 100644
 --- a/gir/meson.build
 +++ b/gir/meson.build
 @@ -37,15 +37,27 @@ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
@@ -115,7 +116,7 @@ index 607bbc4..c0e221b 100644
      install_dir: typelibdir,
    )
 diff --git a/meson.build b/meson.build
-index 7ec9532..9e20da5 100644
+index 7ec95328..9e20da57 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -76,7 +76,9 @@ libffi_dep = dependency('libffi',
@@ -130,7 +131,7 @@ index 7ec9532..9e20da5 100644
  subdir('docs')
  subdir('tests')
 diff --git a/meson_options.txt b/meson_options.txt
-index 49726be..3e17c78 100644
+index 49726be6..d557a3b6 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -21,3 +21,23 @@ option('cairo-libname', type: 'string',
@@ -150,7 +151,7 @@ index 49726be..3e17c78 100644
 +  description: 'Use a ldd wrapper instead of system ldd command in giscanner (useful when cross-compiling)'
 +)
 +
-+option('enable-introspection-data', type: 'boolean', value : false,
++option('enable-introspection-data', type: 'boolean', value : true,
 +  description: 'Build introspection data (.gir and .typelib files) in addition to library and tools'
 +)
 +
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index b9754a96c22..17b9eac057c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 2e2bf063ab79ddff1c284834aef8e22710db9350 Mon Sep 17 00:00:00 2001
+From a20b4d70f44449875b7c54750ab0f02eefb0870d Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
index c9a0d816f5e..66f99185389 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-Port-cross-compilation-support-to-meson.patch \
            "
 
-SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
-SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513e401ec"
+SRC_URI[md5sum] = "101b04fb0184f9a0c718d450c056d68c"
+SRC_URI[sha256sum] = "4954681fa5c5ed95451d914de89de1263a5b35158b1ded1a8b870042c0d0df89"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.17.1



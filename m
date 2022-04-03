Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0682CC47089
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.7579.1649245872548068287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XJeIyneu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245870; i=@fujitsu.com;
	bh=K+rQOAYFiCFMQ4FDJwUltItj8W/EPuLAAG4iQQX+b/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XJeIyneu+ib5whRcrwHJRDZ0n3XP6qP4umsjxGq6T033876GdtmFxQMy4N3FWtmQH
	 cWD5UI/NWVoW/oqK4RQNxaNUYVljSoa4J1wYwEZE9pN1xnG5ndsJ39sU1RZE4m+ww8
	 vlIa6i3DERvXbIjV6P7ZbvdTqhraWutKzANDL3kSOhu5lAAwWE8vn8uS6ZF5zRgA+H
	 eA2qmtL3cHD75TJ22vowOD6ZHza8n6xHsrynoTocUx5FWI1LfbGkxDKltS/nrH1VrB
	 HQv1gi5Arvxw9jIzREszylYDFw+EpjZHYir8kyJwZbQvVmr1gFnVlKrvkxlY1PGz9w
	 beE7owuRvWq8Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSXddnW+
  SwfEeRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPr9F72gvM2FZ+u3GFuYLxu0sXIxSEk8JhR
  4sjKe+wQznkmiSeTZ7JCOLsZJZ62/mDsYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAvcT3b2fAbBag+MNlj1hAbF4BJ4mJ+7aAxSUEFCSmPHzPDGJzCjhLzFh+C2y8EFDNun
  ePGSHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+gaGVroJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEhnFKsdKtHYwbVv3UO8QoycGkJMq7v9w3SYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IE75YqoJxgUWp6akVaZg4wpmDSEhw8SiK8WjVAad7igsTc4sx0iNQpRnuOnVsu72XmuH
  ToCpC8egVE3gCRQix5+XmpUuK8L0HaBEDaMkrz4IbCUsAlRlkpYV5GBgYGIZ6C1KLczBJU+Ve
  M4hyMSsK8XiBTeDLzSuB2vwI6iwnorHdnPEHOKklESEk1MCWE39skw7ToBMeNW7I/HidpxM26
  F2gduLpm83Ht19+4q5mmffg4V8+3J9j3cr/NpLe8rO/+f6/acG2e5KP43QUOt2f23P8xofmv4
  a0re99sX375ooe3nOOm9dcP8md1vLNUTp0ZvuSSsJL0CUPeCoc9/XyT7awXaAgbu57wb7au8H
  115+b3XdzpvwKyJdiql5v+KDkw59Zkj2qd+o75SxsP2LzjPZy8tsY1bLF39JFPF15GSe5qSQm
  ZxyVzpLLhX92uk80Fe2tZpu6MykzxCrgQWMwxPzxZ4HRX2Xx3Ab6SlIc76yZfnLcw6m72uZIP
  0Vv+XXjye5WFpuJ7Xr5P+2Oeux++987qy61Hdsphhz4qsRRnJBpqMRcVJwIAInKCCXwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1649245870!8835!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3748 invoked from network); 6 Apr 2022 11:51:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:51:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 207C6100467
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 13DCD100460
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:50:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shared-mime-info: upgrade 2.1 -> 2.2
Date: Mon, 4 Apr 2022 02:47:28 +0800
Message-ID: <1649011649-28952-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011649-28952-1-git-send-email-wangmy@fujitsu.com>
References: <1649011649-28952-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164074

0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
removed since it's included in 2.2

Changelog:
=========
* model/3mf: new
* Match shared libraries with version suffix
* model/obj: add mtllib and Blender comment based magic
* model/mtl: add Blender comment magic, increase newmtl range
* model/obj, model/mtl: new types
* Add Electron Archive Format type application/x-asar
* text/x-qml: Lower match priority to avoid conflicts with Python
* Move '*.blend' to top of Blender glob list
* Adding SPARQL media types
* application/zip: Add '*.zipx' glob and test fixture
* Added DSD mime type
* Differentiate comic book archives
* FITS: Add missing 'application/fits' and legacy globs
* Add Godot engine files
* Add FlashForge "xgcode" mime-type
* text/x-objc++src: new type
* image/heif: test .hif extension too
* image/hif: add *.hif glob
* image/heif: add another test case
* image/heif: add magics
* Add a build-tools option to allow installing only the mime data
* Add compressed SVG glob pattern '*.svg.gz'
* Add Apple Wallet pass type application/vnd.apple.pkpass
* migrate from custom itstool to builtin msgfmt for creating translated XML
* Make the remaining plain text types subclasses of text/plain
* audio/mobile-xmf: separate from audio/x-xmf
* Adding ZIM file
* Make text/x-mrml a subclass of application/xml
* image/avif: move acronym and expansion to separate fields from comment
* freedesktop_generate.sh: Don't hardcode ninja
* Add text/x-mpl2
* application/x-apple-systemprofiler+xml: require _SPCommandLineArguments in plist
* image/jpeg: add test case with embedded property list XML
* audio/vnd.dts.hd: include parent type magic in magic match
* model/gltf+json: new type
* model/gltf-binary: new type
* application/x-object: add *.mod and a test case
* application/x-mod: add some ProTracker magics and a test case
* image/jxl: include test files in test list
* tests: add trailing linefeed to mime-detection list
* Make application/x-mswinurl a subclass of text/plain
* Change description for *.desktop files to "desktop entry"
* application/x-x509-ca-cert: add magics and test cases
* application/pkix-cert: add BEGIN/END X509 CERTIFICATE magic
* application/pkix-crl: add magic and test case
* application/pkix-cert: add magic and test case
* image/jxl: new type
* Added .sc filename extension for Scala source code, as it is occasionally used
* application/schema+json: new type
* Add text/x-crystal
* application/x-krita: remove stray period from comment
* adding org-mode
* Add Elixir source code mime type
* Add two new offsets for .kra and .krz
* text/x-python3: add *.pyi glob (Python stub files)
* image/x-canon-cr3: new
* image/x-xpixmap: make XPM3 magic more specific
* image/x-xpixmap: add XPM2 magic
* application/x-troff-man: add *.[1-9] glob
* application/toml: new type
* Lower priority of "BEGIN {" for perl, awk uses that too
* Add Smacker video type video/vnd.radgamettools.smacker
* Clarify database license
* meson: make xmlto optional, build spec only if found
* application/x-7z-compressed: add *.7z.001 glob
* Add Bink video type video/vnd.radgamettools.bink
* image/x-nikon-nrw: add test case
* image/x-nikon-nrw: new type
* application/x-vhdx-disk: improve acronym and its expansion
* application/ovf: new
* application/x-qed-disk: new
* application/x-vdi-disk: new
* application/x-vmdk-disk: new
* application/x-vhd-disk, /x-vhdx-disk: new
* application/vnd.apple.numbers, .pages: add older magics and test cases
* Add text/x-dart
* application/vnd.apple.numbers, /vnd.apple.pages: new types
* xdgmime: configure as submodule

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tom-itstool-to-builtin-msgfmt-for-cr.patch | 70 -------------------
 .../shared-mime-info/shared-mime-info_git.bb  |  8 +--
 2 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch

diff --git a/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch b/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
deleted file mode 100644
index d09013bb3c..0000000000
--- a/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 5ca815cb79f64fab9cbb428b95a861fc0c30c116 Mon Sep 17 00:00:00 2001
-From: Eli Schwartz <eschwartz@archlinux.org>
-Date: Mon, 8 Nov 2021 18:22:47 -0500
-Subject: [PATCH] migrate from custom itstool to builtin msgfmt for creating
- translated XML
-
-gettext upstream has supported this for a very long time, and using it
-means we don't need to jump through hoops to run ninja inside ninja in
-order to generate the .mo files for itstool.
-
-Although meson 0.60.0 added support for real targets for the built .mo
-files, this changed the rules for output filenames, breaking the script.
-But msgfmt does not care, and anyways comes with builtin meson functions
-for convenient use.
-
-Fixes #170
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/merge_requests/162]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/freedesktop_generate.sh | 12 ------------
- data/meson.build             | 16 +++++-----------
- 2 files changed, 5 insertions(+), 23 deletions(-)
- delete mode 100755 data/freedesktop_generate.sh
-
-diff --git a/data/freedesktop_generate.sh b/data/freedesktop_generate.sh
-deleted file mode 100755
-index ff13e75..0000000
---- a/data/freedesktop_generate.sh
-+++ /dev/null
-@@ -1,12 +0,0 @@
--#!/bin/sh -e
--
--src_root="$1"
--build_root="$2"
--
--ninja -C "${build_root}" shared-mime-info-gmo
--
--itstool \
--    --its "${src_root}/data/its/shared-mime-info.its" \
--    --join "${src_root}/data/freedesktop.org.xml.in" \
--    -o "${build_root}/data/freedesktop.org.xml" \
--    "${build_root}/po/"*".gmo"
-diff --git a/data/meson.build b/data/meson.build
-index 263567d..c5696f2 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -1,18 +1,12 @@
- 
- install_man('update-mime-database.1')
- 
--freedesktop_org_xml = custom_target('freedesktop.org.xml',
--    input : files(
--        'freedesktop.org.xml.in',
--        'its/shared-mime-info.its',
--        'its/shared-mime-info.loc',
--    ),
-+freedesktop_org_xml = i18n.merge_file(
-+    input: 'freedesktop.org.xml.in',
-     output: 'freedesktop.org.xml',
--    command: [
--        find_program('freedesktop_generate.sh'),
--        meson.source_root(),
--        meson.build_root()
--    ],
-+    data_dirs: '.',
-+    po_dir: '../po',
-+    type: 'xml',
-     install: true,
-     install_dir: get_option('datadir') / 'mime' / 'packages',
- )
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 6179abfef7..387dd7bbad 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
-           file://0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch \
-           "
-SRCREV = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"
-PV = "2.1"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRCREV = "13695c7225c2f525a435e72739c33ac32bbfbbb9"
+PV = "2.2"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
-- 
2.25.1



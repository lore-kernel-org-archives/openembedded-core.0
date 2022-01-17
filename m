Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58044C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.11745.1642429861654123078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mFbWBrod;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429859; i=@fujitsu.com;
	bh=n4vd0YYIVPBh0sK93coCTIEtlJWWKPl2fJOaYHJYhQw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mFbWBrodFR1Sjj7v8Ak+DFZLkHxdd5dnZTr2Zb1VBUCzuZ//8qrcDDDK8blBVRJ6E
	 bNKt2wZTKa3iirJxXZcGmueSGbRcs03whdP0IY3+K6oZbcudFl75tJ4OsPxzmCWX9/
	 B9crJcMRJ9iHImxrRjK+yoTKDDG3AS+c0ELmtkUl3767TndCgEAcv6vNU+gqPSb/fj
	 GR+Z/m383tAVQI/WmFBZB6JlIuqhoWz1o0hyQtMbsg0r1txr02bWiy17JPipP9AANI
	 VlWGHcjbWOWfBp8uu9vsTxn3CR0aMh4fknAn1SR1qpLvvq8I/TTpUyOS5FvPz27Nsw
	 lLlkexDSm96gg==
Received: from [100.115.7.63] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id B0/27-30341-3AD75E16;
 Mon, 17 Jan 2022 14:30:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRoruo9mm
  iwb1d1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b8SxvYCk7rVNw4cZu9gXG5ehcjF4eQwAwm
  idP32ti6GDmBnBOMEvMeqoPYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCXxp
  /s8E4jNIqAq8ffxOmYQm1fASWLz/zNgtoSAgsSUh++h4oISJ2c+YYGYIyFx8MULqBpFidmXm1
  kg7AqJWbPamCYw8s5C0jILScsCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6prpGxsZ6iVW6iXq
  ppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBAZZSzPpyB+P0vp96hxglOZiURHk5w54m
  CvEl5adUZiQWZ8QXleakFh9ilOHgUJLgvV0DlBMsSk1PrUjLzAEGO0xagoNHSYRXGxjwQrzFB
  Ym5xZnpEKlTjK4cb9YuWcTM0XbvLpCcueDgamaO++2HgOTrlp87mIVY8vLzUqXEeRtAZguANG
  eU5sGNhkXqJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvF9ApvBk5pXAXfAK6DgmoONWfXw
  EclxJIkJKqoHJ9Qzb8Vkz9tf/ilIuXDnjmpxcEds7ue18GXumeVttFZhikObLPNXgfApH4GWL
  lgpjsba6TYbLHq07KSWj/cHl7Iv27RnXGvq/v31XqL6OWaHfSPOxwzmdUlsP9vCl6So/X2j9O
  H6baaeMotJLqQstXZvfhlqkv2bZvf/c7Z5Zd/pffl+45JrKwu8Hl21nUIrpeXvh2IqAT7aff2
  zZyChX4+t8aj/Twbb2W9Plwt+cu778669XE+2TTmxLaXsj6M0YZMRmLqxhOH2G4Zz9p1udVs7
  Oq5283IrDRmfRuhMF36r/fPiV8kMt5u5OdsWGasuZUbfb/dI3mc1UtVQ+ff+xLIP3Wsn6iRVe
  Jfd7O7fmKLEUZyQaajEXFScCAJhB+TRPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1642429858!6668!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13868 invoked from network); 17 Jan 2022 14:30:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:30:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20HEUqn7023443
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:30:58 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:30:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 0.60.3 -> 0.61.0
Date: Mon, 17 Jan 2022 22:30:40 +0800
Message-ID: <1642429843-13852-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160647

0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
removed since it is included in 0.61.0

Changelog:
==========
backend_startup_project will no longer erase the last project in a VS solution
if it is not the specified project.

Previously the Windows module only accepted CustomTargets with one output,
it now accepts them with more than one output, and creates a windows resource
target for each output. Additionally it now accepts indexes of CustomTargets

Add a man page backend to refman

extract_objects() supports generated sources

Python 3.6 support will be dropped in the next release

Warning if check kwarg of run_command is missing

meson rewrite can modify extra_files

meson rewrite target <target> info outputs target's extra_files

As Visual Studio 2022 is released recently, it's time to support the new version
in Meson. This mainly includes the new "v143" platform tools.

Support for CMake <3.14 is now deprecated for CMake subprojects

Added support for sccache

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/meson/meson.inc         |  3 +-
 ...sues-that-arise-when-cross-compiling.patch | 39 -------------------
 .../{meson_0.60.3.bb => meson_0.61.0.bb}      |  0
 ...on_0.60.3.bb => nativesdk-meson_0.61.0.bb} |  0
 4 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
 rename meta/recipes-devtools/meson/{meson_0.60.3.bb => meson_0.61.0.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.3.bb => nativesdk-meson_0.61.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 042cf130e4..452b0c18ee 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -8,14 +8,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
-           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
+SRC_URI[sha256sum] = "ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24f3e00e27a3f5abdc35c"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
deleted file mode 100644
index b098c4a123..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Aug 2017 16:16:41 +0300
-Subject: [PATCH] gtkdoc: add support for a binary wrapper
-
-Make it possible to specify a wrapper for executing binaries
-in cross-compiling scenarios.
-(usually, some kind of target hardware emulator, such as qemu)
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/modules/gnome.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 1c6952d..5a6ff94 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -35,7 +35,7 @@ from ..mesonlib import (
- from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
- from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
- from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
--from ..programs import ExternalProgram, OverrideProgram
-+from ..programs import ExternalProgram, OverrideProgram, EmptyExternalProgram
- from ..build import CustomTarget, CustomTargetIndex, GeneratedList
- 
- if T.TYPE_CHECKING:
-@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
-             args.append(f'--{program_name}={path}')
-         if namespace:
-             args.append('--namespace=' + namespace)
-+        if state.environment.need_exe_wrapper() and not isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
-+            args.append('--run=' + ' '.join(state.environment.get_exe_wrapper().get_command()))
-+
-         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
-         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
-         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
diff --git a/meta/recipes-devtools/meson/meson_0.60.3.bb b/meta/recipes-devtools/meson/meson_0.61.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.60.3.bb
rename to meta/recipes-devtools/meson/meson_0.61.0.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.61.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.61.0.bb
-- 
2.25.1



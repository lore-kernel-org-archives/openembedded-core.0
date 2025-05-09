Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B3C3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6649.1746763071239636200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QvwwIb3h;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763070; x=1778299070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mlcXLxfqsRgM/N9MfUQWsha3PwedfVz1zY9DFD6M7dA=;
  b=QvwwIb3hI5ZVOpw4XVOw+xShTMOmKl4XjwVWToOxc9aXixJ9CLNGkfXx
   WlKNyIgUpy6yUBSKTmOUpivuznguIW8oFBHBwehreoWKH1CpX4gHK+JJD
   6eOfWyfhyGjbfQE0BN7dPL26p+9+vfTYUpe1AC3irxnphdLGMegFbnlDF
   UPivvLqIhM0I7LQBC7vxSBNhmcas2L5oXTWXgXconujk9Ffta1zkbxdmY
   VdCo9NLVq/FA/Lnzgxgytm0U5WMA4EmZofI5VTeFVz8vsk9GGbeFmVmXR
   ssmbsWWcXrjpCeAo6xKed+ZyQqqPUBGDAvYEGuPlHZTsDIX+5WQx10+CQ
   Q==;
X-CSE-ConnectionGUID: DYPtTMj9T0qdLlwVR5CMFg==
X-CSE-MsgGUID: EPJ1MxcUQLy0XXEpMAphbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="201766939"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="201766939"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:48 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F1B7E8525
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 607D9E0C0D
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2C661A009A;
	Fri,  9 May 2025 11:57:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/19] gstreamer1.0: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:11 +0800
Message-Id: <1746762980-12783-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216173

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-atomic-64-issue-on-armv5.patch
removed since it's included in 1.26.1

0002-tests-add-support-for-install-the-tests.patch
refreshed in 1.26.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-atomic-64-issue-on-armv5.patch   | 36 -------------------
 ...ts-add-support-for-install-the-tests.patch |  6 ++--
 ...er1.0_1.26.0.bb => gstreamer1.0_1.26.1.bb} |  3 +-
 3 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue-on-armv5.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.0.bb => gstreamer1.0_1.26.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue-on-armv5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue-on-armv5.patch
deleted file mode 100644
index 19a09f6829..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue-on-armv5.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 459afbb556432eb417bff5a33719efd596ef7502 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Wed, 2 Apr 2025 08:16:51 +0000
-Subject: [PATCH] Fix atomic 64 issue on armv5
-
-| /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld: gst/libgstreamer-1.0.so.0.2600.0.p/gstbuffer.c.o: in function `gst_atomic_int64_inc':
-| /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c:180:(.text+0x38c8): undefined reference to `__atomic_fetch_add_8'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- meson.build | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index f4c146d..9c24596 100644
---- a/meson.build
-+++ b/meson.build
-@@ -599,6 +599,13 @@ if nsl_lib.found()
-   network_deps += nsl_lib
- endif
- 
-+# Check for libatomic for use of C11 atomics: some architectures need
-+# to link explicitly to this library.
-+# TODO: Once meson 1.7 is in use, this can be updated to
-+# dependency('atomic')
-+atomic_dep = cc.find_library('atomic', required: false)
-+platform_deps += atomic_dep
-+
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 7274d3862f..ba8e410669 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From d9ad7d4fd596ece5f7a2ce25ed583b5c302984cf Mon Sep 17 00:00:00 2001
+From bfb530d2f0761f28c2645e2c45de5147b0528e4d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index f1be50c..f4c146d 100644
+index ba50005..09c7212 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -657,6 +657,10 @@ if bashcomp_dep.found()
+@@ -664,6 +664,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb
index a908ecd166..e4579d7342 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb
@@ -21,9 +21,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
-           file://0001-Fix-atomic-64-issue-on-armv5.patch \
            "
-SRC_URI[sha256sum] = "1b2ee4028010c25b776effa7c396c7e3e1861b60b9417e416f4914abcdff279f"
+SRC_URI[sha256sum] = "30a4c4a5e48345583eb596aa265d0f53c0feb93011d93a6aaa70dd6e3c519dc4"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0



Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CFEC36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 06:37:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.16236.1742971016895765145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 23:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nCfSFCIL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742971017; x=1774507017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rAwbvYZGOHTF3e1TceM+nJI0734Vw6kTaf7LtuAdiDQ=;
  b=nCfSFCILqeXsD7KRpkCmpb7NIoAVp8j6tNPPpsQjpcPz1IQ+S03/+ueO
   JBor0Hf7AcRWCzCzFvn1kFLdbqjUit2y3Dy9P7O92gAcP2hXacCyFY/fW
   2hPjWbYkr6Orx7hn/AyMnusTLCTii1YNAJ5VNLZ5Q62R/DhUxAHCVhoLo
   9ExSuev4jMfK0Qdy8t4XC9po+B4Blez6KgiXVsAcRmb1gKrSqRxFhWjq2
   odieKVbecmXbs9aIrf4GVZqBg4g8B3PpeNFP9Y7e6HT0onBxY34W4swbC
   LbxfCSD3cqWKdUqTZqbtzvr8SJQv5TjozxqQQoysa+PXwgt3/f8TeS4vQ
   g==;
X-CSE-ConnectionGUID: mmzJl96TRwOOCIixQcvhhw==
X-CSE-MsgGUID: ByrXoBgmQB+OfAXgsdFCiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="181689335"
X-IronPort-AV: E=Sophos;i="6.14,277,1736780400"; 
   d="scan'208";a="181689335"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:36:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BA88D4F67
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DEFD7D50F2
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:51 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51FD21A00B3;
	Wed, 26 Mar 2025 14:36:51 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leihaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 2/7] gstreamer1.0: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 14:36:42 +0800
Message-Id: <20250326063647.1941-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326063647.1941-1-leimaohui@fujitsu.com>
References: <20250326063647.1941-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 06:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213633

From: Lei Maohui <leihaohui@fujitsu.com>

Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
---
 ...-respect-the-idententaion-used-in-meson.patch |  6 +++---
 ...tests-add-support-for-install-the-tests.patch | 16 ++++++++--------
 ...ests-use-a-dictionaries-for-environment.patch |  6 +++---
 ...elper-script-to-run-the-installed_tests.patch |  6 +++---
 ...amer1.0_1.24.12.bb => gstreamer1.0_1.26.0.bb} |  2 +-
 5 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.26.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 0dd96bef01..5db93c5be1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001
+From cb49c5433f343aa9ae6c0656d2e835365330922b Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
@@ -11,10 +11,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 7d68212..bf0021f 100644
+index e8419fc..4cc4618 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -146,11 +146,11 @@ foreach t : core_tests
+@@ -149,11 +149,11 @@ foreach t : core_tests
  
    if not skip_test
      exe = executable(test_name, fname,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 01d9535eb8..7274d3862f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001
+From d9ad7d4fd596ece5f7a2ce25ed583b5c302984cf Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index dc9dbe2..55e85b3 100644
+index f1be50c..f4c146d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -645,6 +645,10 @@ if bashcomp_dep.found()
+@@ -657,6 +657,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -34,7 +34,7 @@ index dc9dbe2..55e85b3 100644
  
  pkgconfig = import('pkgconfig')
 diff --git a/meson_options.txt b/meson_options.txt
-index 340fb58..5b87f68 100644
+index 39255cf..78af552 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
@@ -46,10 +46,10 @@ index 340fb58..5b87f68 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index bf0021f..9a8c42c 100644
+index 4cc4618..f290e2e 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -125,10 +125,16 @@ test_defines = [
+@@ -128,10 +128,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
    '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
@@ -67,7 +67,7 @@ index bf0021f..9a8c42c 100644
  # sanity checking
  if get_option('check').disabled()
    if get_option('tests').enabled()
-@@ -151,6 +157,8 @@ foreach t : core_tests
+@@ -154,6 +160,8 @@ foreach t : core_tests
        include_directories : [configinc],
        link_with : link_with_libs,
        dependencies : gst_deps + test_deps,
@@ -76,7 +76,7 @@ index bf0021f..9a8c42c 100644
      )
  
      env = environment()
-@@ -162,6 +170,18 @@ foreach t : core_tests
+@@ -165,6 +173,18 @@ foreach t : core_tests
      env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
      env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 861046d2db..79e494a22a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001
+From d24110809da4588354ad3df4ae99556e8c62838a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
@@ -14,10 +14,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 13 insertions(+), 8 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 9a8c42c..6bb346a 100644
+index f290e2e..a3ffcb6 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -161,14 +161,19 @@ foreach t : core_tests
+@@ -164,14 +164,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index cb47f7244f..4b1aad2616 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001
+From 3b9ae399b57cfb6e332fac6a90997a3abd33c819 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100755 tests/check/template.sh.in
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 6bb346a..fe57935 100644
+index a3ffcb6..b907dcf 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -185,6 +185,23 @@ foreach t : core_tests
+@@ -188,6 +188,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
index d224b80eb3..ad5c54fa5d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
+SRC_URI[sha256sum] = "1b2ee4028010c25b776effa7c396c7e3e1861b60b9417e416f4914abcdff279f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0



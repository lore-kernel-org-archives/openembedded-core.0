Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235B4CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.5631.1755574542730048094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DVcfZFzM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574543; x=1787110543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q+Wd+7JbMSDyH15LJXqlj/l/6sxqtLm8CyLZO86T3R0=;
  b=DVcfZFzMgaLH7bfgjmEllQwUXnjxE7GCTaLJCZ4HbKLxnIRVy9ekIHpC
   Z6+/rrvBOG7I9pM7OOei4XY2lQKUBd42eFAOczLGhCrobWuYcD3L2IN6T
   JJOxd/tq5gBMrU3A7UziB3aXLZUT2KX8h0Pa4NtKlyc1n58PTuh2k1Wx5
   frLOUtNiOB0oyx0pnZ8uYvJdIF1aQboq3d2D4D2myAh00JuLhXHXgKH2N
   hYt65dbLNEAGhGnlUuHGA1kCKP/G+D3Ff8C3qcY3OD9IfabcFffp09SUs
   5s3JdtIuvILtaJNFkDGEyyGEgIEga8eigFNSduJPV4riTUtyDlD82tucD
   Q==;
X-CSE-ConnectionGUID: UOHSIFueRmmrcrBHLFhEQQ==
X-CSE-MsgGUID: Cr6/ttRJRQW1D1NGXVQlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="209708775"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="209708775"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:41 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1B1321000347
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:41 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id CCA541000870
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id BD9F6200020E
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:38 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3699A1A0078;
	Tue, 19 Aug 2025 11:35:35 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 04/11] gstreamer1.0: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:25 +0800
Message-ID: <20250819033433.390-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222064

Changelog:
==================
- aggregator: add sub_latency_min to pad queue size
- build: Disable C5287 warning on MSVC

Release note:
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ests-respect-the-idententaion-used-in-meson.patch |  6 +++---
 ...002-tests-add-support-for-install-the-tests.patch | 12 ++++++------
 ...03-tests-use-a-dictionaries-for-environment.patch |  6 +++---
 ...dd-helper-script-to-run-the-installed_tests.patch |  6 +++---
 ...gstreamer1.0_1.26.3.bb => gstreamer1.0_1.26.5.bb} |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.3.bb => gstreamer1.0_1.26.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 5db93c5be1..e1d870b040 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From cb49c5433f343aa9ae6c0656d2e835365330922b Mon Sep 17 00:00:00 2001
+From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
@@ -11,10 +11,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index e8419fc..4cc4618 100644
+index 78a6f9a..e3cb966 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -149,11 +149,11 @@ foreach t : core_tests
+@@ -154,11 +154,11 @@ foreach t : core_tests
  
    if not skip_test
      exe = executable(test_name, fname,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ba8e410669..ccfc869813 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From bfb530d2f0761f28c2645e2c45de5147b0528e4d Mon Sep 17 00:00:00 2001
+From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index ba50005..09c7212 100644
+index 0a77e90..cadfaeb 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -664,6 +664,10 @@ if bashcomp_dep.found()
@@ -46,10 +46,10 @@ index 39255cf..78af552 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 4cc4618..f290e2e 100644
+index e3cb966..e4df289 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -128,10 +128,16 @@ test_defines = [
+@@ -133,10 +133,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
    '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
@@ -67,7 +67,7 @@ index 4cc4618..f290e2e 100644
  # sanity checking
  if get_option('check').disabled()
    if get_option('tests').enabled()
-@@ -154,6 +160,8 @@ foreach t : core_tests
+@@ -159,6 +165,8 @@ foreach t : core_tests
        include_directories : [configinc],
        link_with : link_with_libs,
        dependencies : gst_deps + test_deps,
@@ -76,7 +76,7 @@ index 4cc4618..f290e2e 100644
      )
  
      env = environment()
-@@ -165,6 +173,18 @@ foreach t : core_tests
+@@ -170,6 +178,18 @@ foreach t : core_tests
      env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
      env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 79e494a22a..1236290e2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From d24110809da4588354ad3df4ae99556e8c62838a Mon Sep 17 00:00:00 2001
+From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
@@ -14,10 +14,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 13 insertions(+), 8 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index f290e2e..a3ffcb6 100644
+index e4df289..b840005 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -164,14 +164,19 @@ foreach t : core_tests
+@@ -169,14 +169,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 4b1aad2616..df382a4445 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 3b9ae399b57cfb6e332fac6a90997a3abd33c819 Mon Sep 17 00:00:00 2001
+From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100755 tests/check/template.sh.in
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a3ffcb6..b907dcf 100644
+index b840005..252da14 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -188,6 +188,23 @@ foreach t : core_tests
+@@ -193,6 +193,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
index 9de76944fb..4c800c22d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "dc661603221293dccc740862425eb54fbbed60fb29d08c801d440a6a3ff82680"
+SRC_URI[sha256sum] = "0a7edb0e7b42dbe6b575fce61a4808a3f6b20e085a1eaecbc025d0ec21f1e774"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0



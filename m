Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E50C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:09:11 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.100700.1703682547158452310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="123536041"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="123536041"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:09:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B29FAD6187
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0A3BCF7D8
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B50A202F1ADD
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 429BD1A006F;
	Wed, 27 Dec 2023 21:09:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 69.0.2 -> 69.0.3
Date: Wed, 27 Dec 2023 21:08:52 +0800
Message-Id: <1703682532-24126-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--4.068800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yTo39wOA02LhpxAd6mi1Ga0tarhbZNbQuQuV
	MctAPCgtKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxWKo
	DKTsuRuTjTcJsdpcw/0wVzTytimS14Mu+9Uvd4HjPmvnL2ai5ID9Xm5NY5h5sD2veI3/hwm/X7Q
	qxdrFbPuLzNWBegCW2wgn7iDBesS3fd+P6wwCt85Rncg/kBNofxb+TcemTtwiP0o4mQ/MmPwLMp
	yY2CrCctfdIjXOMGZmg5G4z5FdvtPKEvQVzmlrPDIKFXF4yISkCbqqjDa7PKx8ECYGQKlym/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192948

From: Wang Mingyu <wangmy@fujitsu.com>

0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
refreshed for 69.0.3

Changelog:
 Retain valid names with underscores in egg_info.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tutils-sysconfig.py-make-it-possible-to-substite.patch | 8 ++++----
 ...-setuptools_69.0.2.bb => python3-setuptools_69.0.3.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.0.2.bb => python3-setuptools_69.0.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index e1960b8d9f..7cafde4d5d 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From 3fd8fcd33d2b0f3ac2fc043eac8641ab4432967d Mon Sep 17 00:00:00 2001
+From bfa655d63e79ba5a75441604ca14a70800794189 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -21,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index e41d51e..c17a79a 100644
+index a40a723..14f35e7 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -119,6 +119,8 @@ def get_python_inc(plat_specific=0, prefix=None):
@@ -33,7 +33,7 @@ index e41d51e..c17a79a 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      try:
          getter = globals()[f'_get_python_inc_{os.name}']
-@@ -221,7 +223,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -238,7 +240,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
  
      early_prefix = prefix
  
@@ -48,7 +48,7 @@ index e41d51e..c17a79a 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -236,7 +244,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -253,7 +261,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_69.0.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
index 8093ab9ba8..ae8944f8b3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "735896e78a4742605974de002ac60562d286fa8051a7e2299445e8e8fbb01aa6"
+SRC_URI[sha256sum] = "be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ED4CD3430
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.18359.1725352402155435757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iRUT6dI2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352402; x=1756888402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kIO74PS4ktB8JnbzMAaolRJ1lbf5rjz9E6OXRp++bDo=;
  b=iRUT6dI2V27N9T/m2LZzKK7ZEnXDnKguYcCya5CDUAukx4qcHLnkijO5
   r3mMn8wir45hwsz0I+Up/fiYffSWFDY2j8nWomYFJyvQ2FFnizaRPAOvE
   oOppoSE1iotAJEEDykPgqUbtfi3ofZdcXzJvoSdItSBq87jAT7Nk1I41n
   akn73Gd6ldL0r69NRfEWC0eTLNpq7XDDVb+8WTyLulR3sICjEO4IHJo2E
   w3N6NOGofUdnOLIuKcwwTb1Fo+39FKx5ImR+D7G748SL+BKlo260wz890
   0WhOU9Ffs8PIa/nBZPkHgjkF2csVWIE9OkRpz/d8K1f+32imgUJrT94oY
   Q==;
X-CSE-ConnectionGUID: O9mQeK6RR+WWnnnewi6QvQ==
X-CSE-MsgGUID: MpEtyZf2Sg+fbpmY4nwGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="160537043"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="160537043"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:19 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 51542DB3C3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FF81CFBDE
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 35E1520076D34
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE43B1A000D;
	Tue,  3 Sep 2024 16:33:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/22] python3-pbr: upgrade 6.0.0 -> 6.1.0
Date: Tue,  3 Sep 2024 16:32:54 +0800
Message-Id: <1725352379-20334-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--8.064100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yTiEPRj9j9rvkdS3kPlaZyXfUZT83lbkEO79
	DJRUi35pWwhqFGcExMst/DPtuO0OwdzZGrP764sOTuctSpiuWyUUi4Ehat0547V5fSMRD1zqoHy
	0bASrKBrg8q4Y37zKTUsLjY8Hso6tJ1KOwNqVG3FKzjuZtPtIBEXmpVQIaHBPmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1riQAKrznJB/2YFvH39ZqWWWZpWM62uXK55VhU+zowOuaYCS6dd3oYQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204143

From: Wang Mingyu <wangmy@fujitsu.com>

0001-change-shebang-to-python3.patch
refreshed for 6.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-change-shebang-to-python3.patch            | 13 +++++--------
 meta/recipes-devtools/python/python3-pbr_6.0.0.bb   |  4 ----
 meta/recipes-devtools/python/python3-pbr_6.1.0.bb   |  4 ++++
 3 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_6.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_6.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
index 688da6b204..218add1778 100644
--- a/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
+++ b/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From 09bd8368bf0d5385663a10eeb890131481681bdd Mon Sep 17 00:00:00 2001
+From df0a8c56f03004738599e06a7b5a1d2b67189848 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 23 Apr 2020 09:28:58 +0000
 Subject: [PATCH] change shebang to python3
@@ -12,10 +12,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/pbr/tests/test_integration.py b/pbr/tests/test_integration.py
-index 8e96f21..b07cbe3 100644
+index cb4b5e5..4cbfb19 100644
 --- a/pbr/tests/test_integration.py
 +++ b/pbr/tests/test_integration.py
-@@ -150,7 +150,7 @@ class TestInstallWithoutPbr(base.BaseTestCase):
+@@ -171,7 +171,7 @@ class TestInstallWithoutPbr(base.BaseTestCase):
          pkgs = {
              'pkgTest': {
                  'setup.py': textwrap.dedent("""\
@@ -25,10 +25,10 @@ index 8e96f21..b07cbe3 100644
                      setuptools.setup(
                          name = 'pkgTest',
 diff --git a/pbr/tests/test_packaging.py b/pbr/tests/test_packaging.py
-index 07be547..f6a9412 100644
+index dddf7ae..bec03ce 100644
 --- a/pbr/tests/test_packaging.py
 +++ b/pbr/tests/test_packaging.py
-@@ -206,7 +206,7 @@ class CreatePackages(fixtures.Fixture):
+@@ -219,7 +219,7 @@ class CreatePackages(fixtures.Fixture):
  
      defaults = {
          'setup.py': textwrap.dedent(six.u("""\
@@ -37,6 +37,3 @@ index 07be547..f6a9412 100644
              import setuptools
              setuptools.setup(
                  setup_requires=['pbr'],
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3-pbr_6.0.0.bb b/meta/recipes-devtools/python/python3-pbr_6.0.0.bb
deleted file mode 100644
index 6c8171196a..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_6.0.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "d1377122a5a00e2f940ee482999518efe16d745d423a670c27773dfbc3c9a7d9"
diff --git a/meta/recipes-devtools/python/python3-pbr_6.1.0.bb b/meta/recipes-devtools/python/python3-pbr_6.1.0.bb
new file mode 100644
index 0000000000..a58b491a82
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_6.1.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "788183e382e3d1d7707db08978239965e8b9e4e5ed42669bf4758186734d5f24"
-- 
2.34.1



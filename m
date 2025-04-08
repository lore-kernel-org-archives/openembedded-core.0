Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1730BC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.63726.1744073533766508830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OWCaoeEt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073535; x=1775609535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/D9Mdagt2CklYSH4wg9/EHb8yE1HjoFMBydrq6utbW4=;
  b=OWCaoeEtX1EkpuRObqYsNKMs4fFmYIqXNBlmSJComILQfs0WOCVwg7F6
   fihwB1UltIeuL16vxlvZMPv65Q9exN5P2boRha+KpEJKCQr9CksJGw+Jz
   cdQ5AaG3JocL7lEvfgRxImMRz4mgk01HiD6PGZQd90rB3f4ZcZk45cfDV
   Be12t0RyYR2OmeTPfEsp7bAZpVXhpPOrtbJz8BgO46EPJTyd7KY/Zqbpu
   N+q46mKt4Db4YgDDFkemcYK84sfD8lHa3RJFNBZahU5z8GVrGzA82v5sg
   sJQWiXhS0HYoxHqfhbtL31Q3ogP/pFXNciafZMU6xFI9s1lF4z7263MeY
   A==;
X-CSE-ConnectionGUID: HQ+0aoxAR5KA2EiN0k5FAA==
X-CSE-MsgGUID: OxEl13H9QaGrJUmUm258lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="194896338"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="194896338"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E58C196741
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A971FCF7C9
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31ED81A009A;
	Tue,  8 Apr 2025 08:51:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/15] meson: upgrade 1.7.1 -> 1.7.2
Date: Tue,  8 Apr 2025 08:51:36 +0800
Message-Id: <1744073502-27695-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214497

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-CPU-family-warnings-fatal.patch
refreshed for 1.7.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch    | 10 +++++-----
 .../meson/{meson_1.7.1.bb => meson_1.7.2.bb}           |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.7.1.bb => meson_1.7.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index dcc8209c31..ca2bcef1ee 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 32c4ccfbdc8649f595a79e7fd1bd39d6f8325340 Mon Sep 17 00:00:00 2001
+From 8ba2c1f596206d45e8f14d4f4d2439023a3de9e7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 86bad9b..9703315 100644
+index 6726d4e..844b611 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -277,8 +277,8 @@ class MachineInfo(HoldableObject):
+@@ -278,8 +278,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,10 +26,10 @@ index 86bad9b..9703315 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 71a2f3a..4cbeabe 100644
+index 386316e..b4a0d88 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -416,10 +416,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -419,10 +419,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson_1.7.1.bb b/meta/recipes-devtools/meson/meson_1.7.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.7.1.bb
rename to meta/recipes-devtools/meson/meson_1.7.2.bb
index bc57c84cce..7e9c661818 100644
--- a/meta/recipes-devtools/meson/meson_1.7.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "155780a5be87f6dd7f427ad8bcbf0f2b2c5f62ee5fdacca7caa9de8439a24b89"
+SRC_URI[sha256sum] = "4d40d63aa748a9c139cc41ab9bffe43edd113c5639d78bde81544ca955aea890"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0



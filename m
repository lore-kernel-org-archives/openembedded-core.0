Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D04C7113D
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11719.1749026736796839147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i+qR21/x;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026747; x=1780562747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nwjvmp5MU20zDsEzyrY55ueAoEQEHGgyvQPrjOrXLOY=;
  b=i+qR21/xMT7VryyF34KShf/cptccsgufqh0tn8yKctDuE5IP+IedpK7B
   VK5ijK4fza/vhQJWZlpofWA+lTUeXV0UAB3dwHAYXCczR/XcEEH3wSvGv
   0vls4YfgQ0XbHmnBrHxKhmTaST6I+lDtC61OREBThToz8kZczGGuv8DO7
   c5BVqQJk8fNPxLxobUKvYbb9KvOPqi7ITSc8NBs4GJJMs2/Ieo5gnwAdo
   EARRkaVprxEcga027DX6r1jKdxFcl4NMUV/XHUWalF8UcRz2tEDTFPUxw
   ibjBvUqyp6Gp0jLdc/zyjoBxNKUnwSwaMoZyEgI96a6E8zYQPerObx2dY
   w==;
X-CSE-ConnectionGUID: /fm8KmSqTQ6ru0R09md4zg==
X-CSE-MsgGUID: hwYCgZ8GQzi8Gks+i77Rlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201658015"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201658015"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:45 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 083D3D4C2B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F17D4F40
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:41 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D8541A009B;
	Wed,  4 Jun 2025 16:45:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/45] python3-jsonschema: upgrade 4.23.0 -> 4.24.0
Date: Wed,  4 Jun 2025 16:45:15 +0800
Message-ID: <20250604084524.864-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217884

From: Wang Mingyu <wangmy@fujitsu.com>

d71f96a6523875c9694fcdf468c9f458323d07f2.patch
removed since it's included in 4.24.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...96a6523875c9694fcdf468c9f458323d07f2.patch | 44 -------------------
 ...4.23.0.bb => python3-jsonschema_4.24.0.bb} |  4 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
 rename meta/recipes-devtools/python/{python3-jsonschema_4.23.0.bb => python3-jsonschema_4.24.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch b/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
deleted file mode 100644
index 65cc2b4cf0..0000000000
--- a/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d71f96a6523875c9694fcdf468c9f458323d07f2 Mon Sep 17 00:00:00 2001
-From: Julian Berman <Julian@GrayVines.com>
-Date: Thu, 17 Oct 2024 09:36:35 -0400
-Subject: [PATCH] Fix the annotation for validator_for's default.
-
-This still doesn't seem to satisfy mypy, so tell it to be quiet.
-
-Upstream-Status: Backport [https://github.com/python-jsonschema/jsonschema/commit/d71f96a6523875c9694fcdf468c9f458323d07f2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- jsonschema/validators.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/jsonschema/validators.py b/jsonschema/validators.py
-index 85c39160..b8ca3bd4 100644
---- a/jsonschema/validators.py
-+++ b/jsonschema/validators.py
-@@ -857,7 +857,7 @@ def extend(
-     version="draft2020-12",
- )
- 
--_LATEST_VERSION = Draft202012Validator
-+_LATEST_VERSION: type[Validator] = Draft202012Validator
- 
- 
- class _RefResolver:
-@@ -1334,7 +1334,7 @@ def validate(instance, schema, cls=None, *args, **kwargs):  # noqa: D417
- 
- def validator_for(
-     schema,
--    default: Validator | _utils.Unset = _UNSET,
-+    default: type[Validator] | _utils.Unset = _UNSET,
- ) -> type[Validator]:
-     """
-     Retrieve the validator class appropriate for validating the given schema.
-@@ -1396,7 +1396,7 @@ class is returned:
-     DefaultValidator = _LATEST_VERSION if default is _UNSET else default
- 
-     if schema is True or schema is False or "$schema" not in schema:
--        return DefaultValidator
-+        return DefaultValidator  # type: ignore[return-value]
-     if schema["$schema"] not in _META_SCHEMAS and default is _UNSET:
-         warn(
-             (
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
index 82b7bb23ed..7a5f4a09a6 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
@@ -4,9 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI += "file://d71f96a6523875c9694fcdf468c9f458323d07f2.patch"
-
-SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
+SRC_URI[sha256sum] = "0b4e8069eb12aedfa881333004bccaec24ecef5a8a6a4b6df142b2cc9599d196"
 
 inherit pypi python_hatchling
 
-- 
2.43.0



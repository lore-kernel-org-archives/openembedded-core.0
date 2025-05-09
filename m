Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FE7C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 21:19:16 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.9080.1746825555076337667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 14:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QAEXp/+y;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1259; q=dns/txt;
  s=iport01; t=1746825555; x=1748035155;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VVGRbxy1Aiy071YoAwbVLVNEDAuXgT7mDWYeOFICPFg=;
  b=QAEXp/+yv6VSrlmldXuLxBxt6LC2d/1Y4CrexrhfK0TZhAY9aphEvzO+
   oHCMZptmd8hn8rP4ey9qo0ZdPs09M4ShB1WoVkQ89vl7vZNC6iyY4txwV
   aG7dxIRVKH7noMFt6bLCGUAvUKtHgRdkQMNs35Fmz8i/3jtwu24u/s1qC
   LO7BQocc52H1hWDh+EE3SNP+E69I5FGvd3X7sK0Pff6ahzmKIrUP3PQlp
   iyQvSo1ThvvBZCCiGBQvZXsSEp9vilIz/0SbTowHgJD6i6x2yNnn8ZHyk
   R/ZYYiTdcNuxd7z2WOSJPAtRnru4cgoRzbpuHhmagnHHpps5ul5C7MxDX
   A==;
X-CSE-ConnectionGUID: FoDn8sPIQdy+rSP+5VHtOg==
X-CSE-MsgGUID: iZozvv+gRPuiHiZwKEoZrw==
X-IPAS-Result: =?us-ascii?q?A0CSAwBRcB5o/5UQJK1aHgEBCxIMgggLgks4P1pCSZQkg?=
 =?us-ascii?q?iGeGYElA1YPAQEBDzEgBAEBkFICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4ThXsNhxMBghaDAgGCIgEBAQFFAgGzMoIsgQGEfNk6g?=
 =?us-ascii?q?W6BSY1NhWcnG4FJRIJQgi2ECoEGhXcEg0OeWEiBIQNZLAFVEw0KCwcFgWkDN?=
 =?us-ascii?q?QwLLhUyPDMdgg2FGYIPggSJBoRHK0+FIoMqQAMLGA1IESw3FBsGPm4HlguDZ?=
 =?us-ascii?q?QdZIhOBR5QfklahCYQljBqIAgeNKhozhVqkfwGZAKRMhGmBZzyBWTMaCBsVg?=
 =?us-ascii?q?yIJSRkPmAW9ZCM1PAIHCwEBAwmQDIF9AQE?=
IronPort-Data: A9a23:ru57yK37cggJhDfwXvbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2cAy
 WROUW+ObvaDYWTwfo1/Od/l8R9S78TdmNZiSwRo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmE4E/watANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU5
 Lsen+WFYAX4g2MsYzpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIkYaO90DwsdODXAN7
 8cga20zTgykiLfjqF67YrEEasULJc3vOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEWojx5nYj/7DLo5nOGhmnjicBVTqUmeouw85G27IAlZjOa9aouFIoHULSlTtkeqo
 XDY4Sf2OCkHNfye+yWm33WenPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:x6JLfa3fBDQEsiWtrEOJjAqjBKEkLtp133Aq2lEZdPUzSL36qy
 nAppsmPHPP4gr5O0tBpTn/Ase9qBrnnPYf3WB7B9uftWfd1VdAVLsC0WMnqAeQfhEXMYVmpM
 VdT5Q=
X-Talos-CUID: 9a23:32poXW390hJaxDGoz2FynLxfNMcJdC3G9FbpL177E11RC+CraUO39/Yx
X-Talos-MUID: 9a23:Qu3vUgTVMVc4cygzRXTttjZwKtkr7J6WFUEtkKcZmOSDBzZvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,276,1739836800"; 
   d="scan'208";a="468298056"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 May 2025 21:19:14 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by alln-l-core-12.cisco.com (Postfix) with ESMTP id C664F1800015F
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 21:19:13 +0000 (GMT)
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package: disable renamed dependency error if allarch is overridden
Date: Fri,  9 May 2025 14:19:12 -0700
Message-Id: <20250509211912.3286338-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 21:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216246

allarch code is only triggered if PACKAGE_ARCH remains set to "all".
This is not the case under some circumstances, like in the case of
nativesdk class which overrides this variable. This error then breaks
nativesdk package groups which depend on renamed packages yet aren't
affected by allarch.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/lib/oe/packagedata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb75e..2bc57b8c343c 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -138,7 +138,7 @@ def get_package_mapping(pkg, basepkg, d, depversions=None):
     key = "PKG:%s" % pkg
 
     if key in data:
-        if bb.data.inherits_class('allarch', d) and bb.data.inherits_class('packagegroup', d) and pkg != data[key]:
+        if d.getVar("PACKAGE_ARCH") == "all" and bb.data.inherits_class('packagegroup', d) and pkg != data[key]:
             bb.error("An allarch packagegroup shouldn't depend on packages which are dynamically renamed (%s to %s)" % (pkg, data[key]))
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
         if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
-- 
2.35.6



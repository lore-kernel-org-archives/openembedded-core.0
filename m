Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A27C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7886.1711413465023114444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YIo8XWeD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413465; x=1742949465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9b0S48m9igB4sSbRdL0Sih10lxZmgSLMbf3bu3BxHkw=;
  b=YIo8XWeDRvgj6AQpSHXKbtrMM4VS0euTGJ59x/iQHEYtFj5OgXl2K6uv
   /PFd92KZRTNCOBSfOntx42xAxCNOx25Fj6pfjERdagoxQx9JaioefvlZa
   3tXw4Rgr4wgCF0R5yYoSNWKvA+AuTXYDRFplYnJyHYV45JrUjm+IIZS95
   ohh4n/4sr9Oqt8OyQUr0PErS1o5prK6lkGZnESHXMm4TCxU9A8Uykya28
   CWY3NGhEJns0tSSY1L+DvrUC9bOdQ5KObeay8UhlyEwZfGwEBSGzD3V0T
   JB5H8EjXvBAVNFCHqOFYndDlaVaCiLgTnxm70SKy+I0STSgI8n84iiUh1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153359865"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153359865"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F19AFE0AAD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F213AFD82A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B759411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 345701A006A;
	Tue, 26 Mar 2024 08:37:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 31/34] spirv-tools: upgrade 1.3.275.0 -> 1.3.280.0
Date: Tue, 26 Mar 2024 08:34:49 +0800
Message-Id: <1711413292-3025-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--3.245300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwGtkCp/5Zlweuc
	IrQhn5lvxXjx/kIQBKKCTnCWhbuWKNfweBT1HuZZKsurITpSv+Nb4dXBMpIkhp7X/WkkrtTLvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQ6Yep/pka8JHW9n
	uzdghUMprshU0ckp3uDDFdx6sUOnq9sZWU6x9AqG9OepgphdNGfS0Ip2eEHnwj/1Rbkzl1E2nuo
	SGaY+DLjoczmuoPCq3JaY1Eg8qR7apfV+6TfIe+z2r0HIbRErC4FX0ts3+jE6zxaRz6Cv1Xukcq
	CLqDETPXm1yd+1Gc8uEGTx5tb/Ufxr5np9wygHEdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197520

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add tooling support for SPV_KHR_maximal_reconvergence
- Add support for SPV_KHR_float_controls2
- SPV_KHR_quad_control
- Fold 64-bit int operations
- update image enum tests to remove Kernel capability
- Support operand kind for SPV_INTEL_maximum_registers
- SPV_NV_shader_atomic_fp16_vector
- Support for SPV_QCOM_image_processing2 (#5582)
- Fix access chain struct checks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spir/{spirv-tools_1.3.275.0.bb => spirv-tools_1.3.280.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.275.0.bb => spirv-tools_1.3.280.0.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
index 05c6de1b50..d2b6acf946 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
+SRCREV = "04896c462d9f3f504c99a4698605b6524af813c1"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.34.1



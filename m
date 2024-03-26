Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D57DCD1281
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7881.1711413457301266588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G2LA8YR7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413464; x=1742949464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nfqw8HHzyKaWEhPCqwpA2B3vqE2obJLXgH+27oPZOOo=;
  b=G2LA8YR72FUlHDMPEkt+qOFQKhTCYofztFM+/2tGQZK+0XSUVXvbocDZ
   U0yCqeb1V6OaJsAIDDTasxd8ABIJFl406XFu0egZrJArdJrlCE58m+wqw
   +h0XOJRyasAa1PckS7+Rmt5Dk3m9uwnF+rPwDPU8OY8qNGZzlWle2bVzk
   Tl5bCZc/09PsUnuxtDjFC6tCCEVSRfgkOCfp5EjCSW+Z96ZOcPSuepTDx
   wcWGP+nF5EQJOS6Shx1PWO7yX0MYxXNCFoiM8JYLMGieGpL7Ufg0yMIF9
   RGdKM3zFRlMGFtPoKN7E/iJhojuCxH5o4S3WhF98HXBP9+Qqy56W+PF4d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="155200333"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="155200333"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D9F67440C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EC60D5D18
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C508520097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 722DC1A006D;
	Tue, 26 Mar 2024 08:37:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 30/34] spirv-headers: upgrade 1.3.275.0 -> 1.3.280.0
Date: Tue, 26 Mar 2024 08:34:48 +0800
Message-Id: <1711413292-3025-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--6.915500-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzn3ZLCt3rRSSAj
	mY4sdKWmWxjOUDkI5yBCxlHZBDt8DQorSvYb1VTuJmuC63VYgXKs4IQYg+G3CCsWLoSqLlJh9VJ
	ULu5hXwQYol+DZEBqU73a+OKk0gX1Dz3BmFL5P0x9SSAOK4bGf1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaJQJlSnF5lMgLnHu4BcYSmtALR/3svM0afgm7lSO4VWyyPnm
	JtdVNImN5at2BIGOiY65m9meG/WS63foTno8oX3b056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNZKaWZiSr+ARLiug2JFP0wRyM4Lq6VOvVQumQOmaLRqqBC0v0B9P9Ks=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197518

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add SPV_NV_raw_access_chains
-Headers support for SPV_INTEL_maximum_registers extension
-Add SPV_NV_shader_atomic_fp16_vector
-SPV_QCOM_image_processing2
-cmake: Allow external control of test and install options
-remove Kernel from Image Channel Order and Channel Data Type enums
-Update FPFastMath token reservation
-List all licenses in the root LICENSE file.
-Support SPV_KHR_quad_control (with fixed line endings)
-SPV_KHR_float_controls2
-Add SPV_KHR_maximal_reconvergence
-update copyright dates to 2024
-Register Zig Compiler tool
-Add a Source Language for Zig
-Reserve an FPFastMathMode bit
-Bump the github-actions group with 1 update
-Publish the header for the vulkan-shader-profiler embedded reflection
-Upstream tokens for SPV_INTEL_masked_gather_scatter
-feat: Create dependabot.yml

License-Update: List all licenses in the root LICENSE file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{spirv-headers_1.3.275.0.bb => spirv-headers_1.3.280.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.275.0.bb => spirv-headers_1.3.280.0.bb} (84%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
similarity index 84%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
index 598a8fc209..26bfd9c4fa 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "1c6bb2743599e6eb6f37b2969acc0aef812e32e3"
+SRCREV = "8b246ff75c6615ba4532fe4fde20f1be090c3764"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.34.1



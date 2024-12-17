Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD25E7718B
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.77563.1734425910989225049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ep0FmFSr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425911; x=1765961911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OtMD8bTjPRAPDpPoPl3EcB0tNWta0poMvPJc3S9AAXA=;
  b=Ep0FmFSrj4Cf7kwdtzg8gtnvru+SZ7zJtukjJRJnc+y6Hs/BGJuYFWWN
   TG3M/j5yvzR9C+PFpKFDu6mX9KPURI8sJ3ampo7+je2v7xOt3+Q5Mxc5q
   a8OpPALmNNVi8WmF3kZop61DYHUiT8J4k7F2KFi1Wu4XvMmMWVSavVn9J
   oKkPUOznNeTnZ39gHUGuVwZOEibIzc+t7ph7j0n+xqy3KboyBr19G3jmz
   +pjm2EsG0r+i7YKnkbGhtzhF8TQolmPE9K+HMBu718geklpdOpz9L7OGq
   c5XFyEFBEUb7RuqSUTZE6Ykfr9q0pWOP4utR6KOWbh9HExW7/Jpw3vRbB
   g==;
X-CSE-ConnectionGUID: mgFxzmbES3aL79aNQncqeg==
X-CSE-MsgGUID: KKoTKrAQTraNgVlN0OQosQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="163476393"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="163476393"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 909F5D4C36
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62B70BF4B5
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01EAF2007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 930771A000B;
	Tue, 17 Dec 2024 16:58:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 05/21] igt-gpu-tools: upgrade 1.29 -> 1.30
Date: Tue, 17 Dec 2024 16:57:51 +0800
Message-Id: <1734425887-18069-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-1.858200-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrKQNhMboqZloCiXI7bHFUBenj
	P3BkhQdS7OONDHfGrg9wk5p7o69tnbnYYc5tkWxnjoyKzEmtrEcxo/1JLP9UGWVIHhOmfZETmBQ
	vLjMBsUFqfFdSzuA9vvMW54P2B2td+YQ9ocFzl0tB9I5g6XEpiyEEwm0ncLbiJV7bB6xA7tH3Pt
	6BDgL9WmgrhIs0coGLE/lImiIh1n/R4XScAxEA34L5ja7E+OhyVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJoghqh+u1IaR7ngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIqxB3
	2o9eGcmjFIAOLQ6s+V0uhIKue1COlXbG8CeI3AeV49rEaF96EIsY/pPdFAed/1tb4qyIP5MbHCr
	kdNcr9BiU288BdVUl4O1N6Nk/EpDRCv/wL/cAsfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
General changes:
- New meson options xe_eudebug and vmtb.

Library changes:
- Added PantherLake (PTL) support, unified PCI IDs into one
  common header pciids.h
- Added BMG support for OA (Observability Architecture) for Xe driver.
- Added support for Xe3 platforms in GPGPU shader.
- Added 6k resolution support for a single CRTC.
- Added support for MTL platform in GPGPU compute.

Runner changes:
- Set option PRUNE_KEEP_ALL as default.
- Allow to dynamically ignore dmesg warn messages when generating
  results, usefull when driver is using kernel fault injection.

Test changes:
- Added sanity checks for KMS properties.
- Improved GPGPU tests for i915 and Xe.
- New SRIOV test for Functional Level Reset (FLR) for Xe.
- Added test that draws triangle without using 3d commands for vmwgfx.
- Added subtest for fallback for DP connector.
- Added async flips suspend resume subtest.
- New test for error handling of Xe at probe time.
- Added testing SIZE_HINTS property in KMS cursor test.
- Added KMS testing for ultrajoiner.
- New test for TLB invalidation in Xe.
- New test for timeslice duration in Xe.
- Display brightness test during DPMS on and off.
- New tests for EU debugging for Xe.

Tools changes:
- New power tool for power/energy measurement.
- New VM Testbench (VMTB) - SR-IOV Virtual Machine testing tool.
- Fixes in amd_hdmi_compliance.
- Fixes in intel_reg.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{igt-gpu-tools_1.29.bb => igt-gpu-tools_1.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_1.29.bb => igt-gpu-tools_1.30.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
index 323c89ec37..a302e1877f 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "fc3113c8c1e99797b2d4769aaf02265be64a7589"
+SRCREV = "edf352a96646c8d793f0c1eb11795112f9bde725"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master"
 
-- 
2.43.0



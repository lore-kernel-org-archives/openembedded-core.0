Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D4BC52D1F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46596.1722215431402451463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ac7/ff9C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215432; x=1753751432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AYfeBIhqnInwO+HmlVOOy1AalMde/bmqD+DhHQQORsM=;
  b=ac7/ff9Cr3zaMm7mPjoOJS4hOOgtTWDiPQUJjMF9bmlW0tKCLpqDXi82
   /X7zyfoocG58ad2fHvFuTxkQojoMDu2nWXrrAjuqqnlSOm5ksVMSqP0Sp
   ikRNqABboPikp+Dyjabipg7oIz15hBfnZdCpiLLae3rGY14n4my7jzCke
   XvxwAx3uls8w31wMSnQmtsP3n2capb+abE2n4FvOg+9q+mv5nAlx02b3i
   0bt7HAKGd3w6YwEP5spkBhjprhDBgTDz4Fs+OlXYw5P7FOC6kCgK3w3Ox
   4eABmcd2Muipoo/ne3aSSB5RejBU8fsuDMMP3h0NsTvJKZklYv9YKGvEe
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="157163428"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="157163428"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F1CB4E8D42
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48B9FD8ADF
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C45AA20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 481331A000C;
	Mon, 29 Jul 2024 09:10:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/33] spirv-tools: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:09:59 +0800
Message-Id: <1722215408-27541-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10-0.537900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrB8N4SAwGIo7k6Qbi+9i6D6RC
	7T8z9MsOhowmdCKCKbK9Du2ZULY31WWZ9CbZZf+bexrcsu+ObWdUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOruDIpcBQ49iRBCE2NlBjIjcfO0mA5QsX2tER9
	9WH+m5DrIA3x+6SpckrCdjRFVGO+sfE8yM4pjsD67rlQMPRoOCxEHRux+uk8irEHfaj14Zyf+K1
	r6Y/VHIYnTEB28TNfqRJ0lX4ZbZuKPLfZiLie2nqa0M6X+HYpdTVRfCh/SXIPkcSpFOx7xp3QT0
	eP6NA3Li7DT+WND3jHlwSKEzh++xgHIx+/YES1tTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Do not fold mul and adds to generate fmas
- add OpExtInst forward ref fixup pass
- Separate Location check for tess patch
- Validate MemoryAccessMask of OpCooperativeMatrixStoreKHR
- OpSampledImage extra validation
- add support for OpExtInstWithForwardRefs
- add decorations to comments
- Add --nested-indent and --reorder-blocks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spir/{spirv-tools_1.3.283.0.bb => spirv-tools_1.3.290.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.283.0.bb => spirv-tools_1.3.290.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
index 292a17f00d..1270da5b85 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "dd4b663e13c07fea4fbb3f70c1c91c86731099f7"
+SRCREV = "0cfe9e7219148716dfd30b37f4d21753f098707a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245ABC52CDC
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.46591.1722215426780874404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MZ3pEZYd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215432; x=1753751432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HtYSzjGvJoEOOD/l0Kj7SKcWepL2ILKW72UTYXbGXI0=;
  b=MZ3pEZYdEungLV0h0ROAHNpsWvjbAulCpcNb1sbjXoEI/dDoBc5Lbl4b
   LTYXkF4Tjp9U9PF06PSkeUDzFsUm6NP+Rb5cia73VgFKFKQvG1MsCxeL0
   OU/mJGL3J1PHr5bssArO8KaDx5HtuOqtuFScidnJ0GHLeVEt/v9Hilim1
   y3OZmo+xjcphbjVgGPeCiCgLql/WYzZk1HfjKoYn7RvEbBheHM0A5W7wf
   peoF4VSzGyd2tbwRaXuZrwJ3sVNiBLW1uh2P753vab5vlnv2zAakgP/AI
   uHH1inX4n0BTIItc77fP5QEPko8XKfMDRQmbz4+Q0eUAmGzAVPx3w+Bmp
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168832584"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168832584"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EA0AC944F
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AFFB103FD
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 146E5401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FD9D1A0002;
	Mon, 29 Jul 2024 09:10:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/33] vulkan-headers: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:02 +0800
Message-Id: <1722215408-27541-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--5.361000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr8boZEVitthjCLaXMX692qWdv
	IBM8UuLS4dmYvpvlVkmnjcf2c/1Ely8oE1Ngob6lG8gMA0GudQ0YR+gKWoGXztGMGYFaxr1Exxz
	G47hxUoTgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZ6Yep/pka8JHW9n
	uzdghUMprshU0ckp3uDDFdx6sUOno3KXWd30Ii3RRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07cjHc
	hynrO5b7SR4aTwiypWE4ENWPrufVf0bWCA/B/N8LsuSAMJYmlI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202600

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- cmake: Disable modules if clang-scan-deps is missing
- Disable VulkanHppModule support in clang-cl
- Add windows clang & clang-cl CI jobs
- Update for Vulkan-Docs 1.3.290
- build: Require MSVC 17.11 for module support
- build(deps): bump fsfe/reuse-action from 3 to 4
- Change name of update to Makefile.release
- Makefile to import generated scripts and headers when doing a spec update
- Update for Vulkan-Docs 1.3.289
- cmake: Workaround MSVC module support compiler bug
- ci: Add explicit build step
- cmake: Remove explicit install of Vulkan-Module
- ci: Add install step
- Add vulkan.cppm as a separate library: Vulkan::VulkanHppModule
- cmake: Allow external control of whether to test or install

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-headers_1.3.283.0.bb => vulkan-headers_1.3.290.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.283.0.bb => vulkan-headers_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
index 6423ef9df6..9f17ddc525 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "eaa319dade959cb61ed2229c8ea42e307cc8f8b3"
+SRCREV = "b379292b2ab6df5771ba9870d53cf8b2c9295daf"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



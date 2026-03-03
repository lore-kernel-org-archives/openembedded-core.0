Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3758EC049D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14984.1772532625208981363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r58tM9JZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532625; x=1804068625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PFEhbn/OsYzCW8iYWMtH6+JdfJYVw1dlKvELlo1eNu4=;
  b=r58tM9JZ88gcd3qGFne5/oP9opxSJJTpDtQaQP4S929UrdeKpWl17FVU
   KjQJ8EgfDB23fB+Pv4uYqRXyuHj/YjvLbX5w46ZyAelhNi/1WMOGonyOz
   JwOyMiFM5BCT3tyg/oGCt3A1UIlXyoHhSzAZ6HndEAfWDiFnHLLhmJ06v
   WOI6tOGzp84PzZBYJZTzXTHMPjCrHt1xvUfQKvYFRZ5eTzcZD5f5sCDrW
   ouaurKDRGJdkTABTzoFsQNnvSSaij4rj8N3KMWlPIAKd44RmNq1c7YzuQ
   0aCoAVSjeBBGb1myiNZPdPFvBHrHUWAjUWgYRYssL8hlw+2u5Ny7rfh59
   Q==;
X-CSE-ConnectionGUID: ZajwAiWmTI2RntO6bKM1kA==
X-CSE-MsgGUID: ZEg/wdrsTqagLvcztEBZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="232410439"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="232410439"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id A9E1FC01836
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5F6E518000C2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B6E451001CDC;
	Tue,  3 Mar 2026 10:10:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <auh@yoctoproject.org>
Subject: [OE-core] [PATCH 22/23] vulkan-samples: upgrade to latest revision
Date: Tue,  3 Mar 2026 18:09:27 +0800
Message-ID: <20260303100929.1624-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232298

From: Upgrade Helper <auh@yoctoproject.org>

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 64c7e0908c..66c034a794 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "97fcdeecf2db26a78b432b285af3869a65bb00bd"
+SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.43.0



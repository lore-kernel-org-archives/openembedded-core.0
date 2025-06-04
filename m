Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECFFC71148
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.11664.1749026749121882184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Le1E4Kgg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026749; x=1780562749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wCSd4/dcywuyilbbBU7fMegBV00QKs80Wl6htl0Q+Zo=;
  b=Le1E4Kgge3v1RDNiCvtyFhruAU48SWly4uBYJkl5gp9CU2IbrO0NaIdg
   hoeDZn5hsuWj3GfF6PG23ENHOuOijAhdpwFD5gdCFq6/XYoSigFr7iQup
   QVz50v3tPWBiY2YiCnUisaAfRWiV+rI8viOKqg4xkFSexDK2IgdnBvvs4
   Z4k/FaGf83avadujJkPLXfCULUUTqke1tMwl0/rvESYYDG6Ag0/dlw1/G
   /FilCewnjTdWosoaGH3Dh+OqLpRZP8H8puCm334+9BbwP0q4LCnHrPZ5V
   nVlesE27vacjj0FTI+DHQ8VxilFwXHyahVClvMOHHGtDj6ex4VlcuT7ak
   w==;
X-CSE-ConnectionGUID: T98jOnAUQmGzKvyCAGaN1g==
X-CSE-MsgGUID: JfTmsbxPTgGXTZyj3o0DUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="180587690"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="180587690"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40681D5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEB7DC8BF5
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F5E61A009A;
	Wed,  4 Jun 2025 16:45:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/45] repo: upgrade 2.54 -> 2.55
Date: Wed,  4 Jun 2025 16:45:21 +0800
Message-ID: <20250604084524.864-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217892

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.54.bb => repo_2.55.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.54.bb => repo_2.55.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.54.bb b/meta/recipes-devtools/repo/repo_2.55.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.54.bb
rename to meta/recipes-devtools/repo/repo_2.55.bb
index 07ee583172..5fea49abb3 100644
--- a/meta/recipes-devtools/repo/repo_2.54.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "97dc5c1bd9527c2abe2183b16a4b7ef037dc34a7"
+SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0



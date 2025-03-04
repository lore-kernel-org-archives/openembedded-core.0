Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C88C2BA1B
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18199.1741079368646739157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pbCnml8C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079372; x=1772615372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8dcn0DrjevY0Z1PpE0azgv0YcF9gonL9gMOkGGo6O3Q=;
  b=pbCnml8CEenv0IDOy/hQhtN1WWBVe8x3Sos9d5sGwX968Ff8Sk5pUGUG
   FxeMxTK/wsePQVy+77B6+k5H3EyUtaQKoPGnaFafcBiW9pTEcoLQzMvM9
   VQIQ8++fvLXZ6CrQAFDmC1uQK0VTKnXnkXwJwlw4snBygM2DH7rRS/gyL
   b/+N+iCirwhWsxqxwwTv25FqgiBjOqCo92YPOoaPXe4EJqOxz0QrO7+QV
   3s0ULMuzdp+fmuIGSC4M++f9iMJljX1fZf1RRMYZwQ/Bpn56S955zOEJx
   a8s7fiUiRNS+u9j1dDfFFTmf9sfEv5FqNLAnK4apeumh2evgg+R9SLYSa
   g==;
X-CSE-ConnectionGUID: 77HUfR5tQgyP/vshoWFXVw==
X-CSE-MsgGUID: 6o8jXvW/R9WZ3dFx+ACIWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="180271630"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="180271630"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EA56E6147
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 444F5D8B84
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0435B1A0071;
	Tue,  4 Mar 2025 17:09:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/31] python3-trove-classifiers: upgrade 2025.1.15.22 -> 2025.2.18.16
Date: Tue,  4 Mar 2025 17:09:09 +0800
Message-Id: <1741079356-13445-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212249

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...025.1.15.22.bb => python3-trove-classifiers_2025.2.18.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.1.15.22.bb => python3-trove-classifiers_2025.2.18.16.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
index eb7eb30554..6bdce9dc79 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9"
+SRC_URI[sha256sum] = "b1ee2e1668589217d4edf506743e28b1834da128f8a122bad522c02d837006e1"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



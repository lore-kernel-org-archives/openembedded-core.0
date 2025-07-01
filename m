Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFDAC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11128.1751412289918689651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kYceAdVp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412290; x=1782948290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAKXkM/N06XLkzkmd7vXh1qQOAAf0DSWOqhBVb3mA+s=;
  b=kYceAdVpsI2aECRBUUznXmMGa2dXzcoKds4j9FbjBBKG9c/MsGESHCh1
   jMhY+v2czpzqjkJcld7fbgzY8FIq4APFwC9oxbn/tqpPAkxE8xdF/2/kQ
   7xMeFd3Q94IyWBdGWNEO0mGUVd0p4ljTqWLdM1AiMUYye+TTDJK5xitwk
   daqjjorwleVKlEK/Sw62+UYUwRvGSCZBlk92uhHRr8q7FyjpmHvUZ5+tX
   8dT+BFveyE3fIn3hq9ORDXMqy3rvtupgRPYfLkI08bpBiJfF42fhvV9hJ
   hFAMplGoubT9lJ+g8+Nn80T+Y4UG9FuLDCjPT0aAk3D1zyk/QmO2SmPWW
   Q==;
X-CSE-ConnectionGUID: locrSozRTtiVHnRL95USug==
X-CSE-MsgGUID: 2gO+MH1QR6CyKfF7o4dDoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="204861758"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="204861758"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 143658204CA
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:48 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id 8F1B614003FF
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 032E6D96D6
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 79C971A006C;
	Wed,  2 Jul 2025 07:24:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/7] mesa: upgrade 25.1.3 -> 25.1.4
Date: Wed,  2 Jul 2025 07:24:36 +0800
Message-ID: <20250701232440.474-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250701232440.474-1-wangmy@fujitsu.com>
References: <20250701232440.474-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219740

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6b42a238cc..3d9e9ec91f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-dont-build-clover-frontend.patch \
 "
 
-SRC_URI[sha256sum] = "ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f"
-PV = "25.1.3"
+SRC_URI[sha256sum] = "164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704"
+PV = "25.1.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0



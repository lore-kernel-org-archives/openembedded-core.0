Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3595C54FC6
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:28 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.44372.1747993340690674314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=CrqSXr3G;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202505230942181a17d4ef979696e9ac-e9xbsz@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202505230942181a17d4ef979696e9ac
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QzUBWkObI0DVqeqDrutobOF4v5sZHYaEOJfl4tiVJ8E=;
 b=CrqSXr3GEumVO+gRBvf4Jw9oRZnGF3xCbS/oXxiX7fhoVhV6YweXY6X/Ef/2sc4K+8X5wp
 +tzcpCxHv+1cHeYo/KPLC4QdmVMrwrbzd+cF5c1X2TUeMBcGS0ee2psRPl/fgt4eD/4CfFQP
 uLFXJccAR5MQvSi37gbTQw8zNyq5vvTwZyKmr/SsJa8uP/uCaTHbo3t4attgQRp7g5FHvbvL
 tmfV0B7izeMVoR+QpvIW4xBQ0BEzit/lQgNl8kGD52USZyflJC8P8JEokhiVDfr4kb17/Jp6
 yJD09ENaHdKz0EUl2LAUF76+8UQOMKydODFCNtVbEmCumY6P5m73cJ6g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 04/17] maintainers: add myself for kernel-signing-keys-native
Date: Fri, 23 May 2025 11:41:05 +0200
Message-ID: <20250523094152.727177-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217184

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c19e306cfa..9d72c110024 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -307,6 +307,7 @@ RECIPE_MAINTAINER:pn-kbd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kea = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-kernel-signing-keys-native = "Adrian Freihofer <adrian.freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.49.0



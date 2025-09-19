Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93378CAC5AA
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:51:47 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.17106.1758289904828462244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Ethioo11;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202509191351405fa84182890002078e-qgm4y8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202509191351405fa84182890002078e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Sep 2025 15:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8vsO+nIycjvsKsRKP3bXyPRFVjQafoE3NxWPPbzBaEs=;
 b=Ethioo11Wu61RXj26tKvojJFkNjwzMDOkpUFBQfQXUhqAvYrctPq/u77TV9V3p9L7hFLZt
 0SZdRQuKcThyslKU3myLxOvv2YLgSRKFjHevGvTOgY2+uzJOjtjZODl3VK2ovIcUG+dNgJgK
 W52YsUZzpjbG2TK9qCgW6DFs/oHRE3wIZ/EZUQwQ80cF6PMqbYksTkXgmO6BLpVX8YMgKNey
 7qq7CbPMYk+moEJLKtu6untUUHaVo96/9hMxkJRQBG+R/4JbaKz7KFEauafS939Y2TGtkeTy
 BbHMQPLljNkIi+kbZjEcPTxtSiyLqZLHS9BL37lNDTdPfkESp4Sk4zeg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 1/2] llvm: update from 18.1.6 to 18.1.8
Date: Fri, 19 Sep 2025 15:50:06 +0200
Message-ID: <20250919135123.4177466-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250919135123.4177466-1-adrian.freihofer@siemens.com>
References: <20250919135123.4177466-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223754

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.8.bb
index caad611d7a..1f4b7e74d7 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
+SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.51.0



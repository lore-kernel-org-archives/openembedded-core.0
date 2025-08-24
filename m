Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B038CA0EFF
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 16:56:22 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.20606.1756054579131967436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 09:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dmIE2Sye;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250824165616342e5f71ba195194be-n6qa2u@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250824165616342e5f71ba195194be
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 18:56:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yxrQmLEOZzZMxJvgdgvqCsrlsLgnMPL/pA44jvbb4zU=;
 b=dmIE2Sye2fGEx1v3JV7WlSOjMaCdJIj7F09eHS2UcPbvQ7qU6hLeE6N13dmGb3ZNpweSXw
 mO7+IfdHrTtxxLvxi5x/n5MqaKIGgAA1acCelapNAnRkSHKqXc14ZgZCtkG+Wb80uYdq9cnI
 oHrsDW7mhuPYixRvF7HO8MfOE7vlCELQfvY+LPhzmFBRHoGWSg0JRmCCSO6TO1G8XbUdTYvA
 BPDTN5lAnCcYBw/vEB+YZJ4a/HqvFQyDSNwlpt1WRsjc24fVCVEVGKUeDgAn3cYkPVN62/0d
 znoo7dGeKVxQtLxTr7trZST7+OZWsG76SyAJT8x95nz/q8863D7pZjaw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] openmp: add openmp to CVE_PRODUCT
Date: Sun, 24 Aug 2025 18:55:23 +0200
Message-Id: <20250824165523.1114365-2-peter.marko@siemens.com>
In-Reply-To: <20250824165523.1114365-1-peter.marko@siemens.com>
References: <20250824165523.1114365-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 16:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222390

From: Peter Marko <peter.marko@siemens.com>

Currently CVE_PRODUCT is set to llvm:llvm from common.inc.
There is historical entry for openmp in the DB.
This entry is ignored, but it shows that there can also be future ones.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/clang/openmp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devtools/clang/openmp_git.bb
index cc0c7fbcd4..2d86718dee 100644
--- a/meta/recipes-devtools/clang/openmp_git.bb
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -9,6 +9,7 @@ require common-clang.inc
 require common-source.inc
 
 BPN = "openmp"
+CVE_PRODUCT += "openmp"
 
 LIC_FILES_CHKSUM = "file://openmp/LICENSE.TXT;md5=d75288d1ce0450b28b8d58a284c09c79"
 


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B12C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 16:29:21 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.10625.1745598553864335482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AZ6LGO93;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025042516291113b10f529a2605e88a-6ycsiy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025042516291113b10f529a2605e88a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Apr 2025 18:29:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9/3Jant6Iy3H9oqX61mGgPdpqxsnNlFRtQraIcS5Mrw=;
 b=AZ6LGO93SkJ4W/uavpSo6Hp5U6X87mUv72BQyfbBLD2IciUDq3AtmteUkXnPqCFJhDM8Xa
 CFkt5uzvFDQjKqg983iTT2FUbszn72guOKx+Hqh7+WqBJyRJppOCNekVS84XKv9LyykxeYyQ
 Xx86/hU7m9FonLUY5dWdplrygEfyVV5KLWWIAE9TKbTRqofqsWvIV/gZUICIndjBzIYoVXvb
 DLB+cyWh8C5+jwaVz2AZxr4Z66tbznWn14mvkpN+yqDQRLWNA0ePY+npFDGzFjV/d3j/GY2i
 ZRyJFaAXk/sU0qY93DX5372sAZ3NAKdBmM45IWiyfFOg6m35TSj9wdvw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: ignore CVE-2024-48615
Date: Fri, 25 Apr 2025 18:28:25 +0200
Message-Id: <20250425162825.10540-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 16:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215483

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE [1] is patchong code introduced by [2] in v3.7.5.
So v3.6.2 is not affected yet and the CVE can be safely ignored.
Also Debian tracker [3] contains this statement.

[1] https://github.com/libarchive/libarchive/commit/565b5aea491671ae33df1ca63697c10d54c00165
[2] https://github.com/libarchive/libarchive/commit/2d8a5760c5ec553283a95a1aaca746f6eb472d0f
[3] https://security-tracker.debian.org/tracker/CVE-2024-48615

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index f7e576b688..87d3794ab7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -46,6 +46,8 @@ CVE_CHECK_IGNORE += "CVE-2023-30571"
 CVE_CHECK_IGNORE += "CVE-2024-37407"
 # cpe-incorrect: bsdtar was introduced in v3.7.0, so 3.6.2 is not affected yet
 CVE_CHECK_IGNORE += "CVE-2025-1632"
+# cpe-incorrect: vulnerable code introduced in v3.7.5, so 3.6.2 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2024-48615"
 
 inherit autotools update-alternatives pkgconfig
 


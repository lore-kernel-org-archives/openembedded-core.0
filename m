Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE934FF8870
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:51:54 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7311.1777326711151909281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=J3ZBgYmU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260427215149b532a654ac00020774-yf6xqp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260427215149b532a654ac00020774
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Apr 2026 23:51:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=esKSzHrMB3woUXmeGNOSOEvG4xM9AyOUc+2nzcWhqB0=;
 b=J3ZBgYmU+6GMiwnsFZ472RakXabq4zcCqWppYR+pSUwqFrhE3ZIGaW7iklkb51QxBMj9mW
 2Ix4MrMK/K12bvN3moVUwt9xacNMsFOyxw3RFjNP3kGwUPqLekcsXhEaLns31UXYODMI/8Dr
 tD9MhVJ/D8aOeJZeGJbrwv6zPk0wXhM/h0gKM4LRvvGHu+5qna3QD48UhSgl6BrarWRny8G0
 2PuyzYl2w2LKgi0M7cEMT8DWEIuhqmdojvdMcQth5xqKjoYDnzDP+k6h0g1OxXNfGPc9+Q3f
 Ek2DWHkmk1Z3EGAZhPNNGHMQUWnAdjvj2Z3jmnRqSchfCRUUSgIT5Hjw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/4] libsoup: set status for CVE-2026-2436
Date: Mon, 27 Apr 2026 23:51:19 +0200
Message-ID: <20260427215120.199335-3-peter.marko@siemens.com>
In-Reply-To: <20260427215120.199335-1-peter.marko@siemens.com>
References: <20260427215120.199335-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236033

From: Peter Marko <peter.marko@siemens.com>

Commit fixing this CVE is [2] (per [1]).
That was backported to 3.6.6 as [3].

[1] https://security-tracker.debian.org/tracker/CVE-2026-2436
[2] https://gitlab.gnome.org/GNOME/libsoup/-/commit/e9b681a5b23f8259a5e29c5351a5284ae5cd1189
[3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/31052a2327c81fe3b7a3d4a66d8a7c9c1aaa47ca

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 9bc3f2f86f..206daa091f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -62,4 +62,5 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2026-1467] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1536] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"


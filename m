Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B27FA373C
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:11:18 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3902.1767355869902915701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 04:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Da23jy5U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260102121112360c13a211000207cc-pgnbrh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260102121112360c13a211000207cc
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 13:11:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WdPepPcXhlJEvLdPmGaACpckngCTfQ/YxqWhyLQ78cI=;
 b=Da23jy5UEETCL7MO3QB5UwUVNjlLj76nj51VOaF8MWXitLxcYMJcUcoGaA/33KrrecgfGF
 0SVHYVrkkkbjT0AaWwT+WuycJO3OXDtZ79vkekxpdbDmZP2/No7bg6RXf4kt+U0FLx8f0Eok
 EQe3yL5otSDwbepboSuSdU/S+fN+nA7UruhybFuCbp16nyvpe5wRRowkPpk2pHrjxJVSsdKE
 fxdi5U/oIahwd4WlyXJlc0q/J5cfZ4nysbwNZmDIU4IJFGOAXZZIQjWtDIdqoCNFxS3TxUR9
 tsZBTQF9DKhvwzqZy9z0ChtG+EIvFMQilvwxe9PATLlleImqAqJwjRow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 2/4] sqlite3: mark CVE-2025-29087 as patched
Date: Fri,  2 Jan 2026 13:10:57 +0100
Message-Id: <20260102121059.2321111-2-peter.marko@siemens.com>
In-Reply-To: <20260102121059.2321111-1-peter.marko@siemens.com>
References: <20260102121059.2321111-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 12:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228838

From: Peter Marko <peter.marko@siemens.com>

Description of CVE-2025-29087 and CVE-2025-3277 are very similar.
There is no link from NVD, but [1] and [2] from Debian mark these two
CVEs as duplicates with the same link for patch.

[1] https://security-tracker.debian.org/tracker/CVE-2025-29087
[2] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/files/CVE-2025-3277.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-3277.patch b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
index a3e28465f5..625cf29d3e 100644
--- a/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f4fc2ee20311a0a5141726c71d318ab52001c974]
 
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>


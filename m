Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2690C47DA9
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 16:58:10 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.41211.1706461085692814576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 08:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DQKGqEaO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240128165803fcc46b2cbd5c7a8805-dlexvq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240128165803fcc46b2cbd5c7a8805
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Jan 2024 17:58:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PL0fRpZRbWwRor0T7N5rWWwXyw7ncoMZunAYEeM8geE=;
 b=DQKGqEaOig9O+tElyqvbhVVMTsOhkn6CzKi1KHrqprCCY70GBY7UNvfsJCPIfxRUguSfjM
 /8vFns9uvmYOgUKR+r1hyfKsOocL9W9q1OE0CoPQ85I3P416e0D8XMAQRIbMQ3fRtP0qOZIG
 UngYS3PsGGygo2UzAItv63cL53/uo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][nanbield][PATCH 2/2] sqlite: drop obsolete CVE ignore
Date: Sun, 28 Jan 2024 17:57:05 +0100
Message-Id: <20240128165705.658656-2-peter.marko@siemens.com>
In-Reply-To: <20240128165705.658656-1-peter.marko@siemens.com>
References: <20240128165705.658656-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 16:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194447

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-36191 is now rejected in NVD DB so it won't shoup up in
cve-check report anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3_3.43.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
index 64c1013625..66d6255ac0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
@@ -5,6 +5,3 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
-
-CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
-
-- 
2.30.2



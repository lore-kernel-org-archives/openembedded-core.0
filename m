Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AA5CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 17:29:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.729.1791307772183629556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 10:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WCNyew7+;
 spf=temperror, err=temporary DNS error (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261006172928eee6456909000207a8-meyc9_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261006172928eee6456909000207a8
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 19:29:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hcQQ7Zg1pPzVuasi9M2yu8tSr+qC8+YZECKBIbma70s=;
 b=WCNyew7+Cq0/7XsoNrSw/D9cd2uL7JbW2m9pwif1JRyBq6SlMtQaj1NT+oJbzIo03xegRI
 G7eo1pEmVQoKyoCnBmZZLxWlQGDgvEiDdfz0cUm7aA8kGsulX9jL9YA4NTRTzIK7HPxqR84d
 vMfu9PXKys8DStxqdc6UjuFI+Wsb3KmCiFH8y3PO78RQxgLbcGUntlku7xyAHLIScX/wcD9Z
 KAwo9TazxVLiuC5jb4IWQdzWBg/uhQCwm8Y+9UDYqxJOFdunw7GY12dONg0vyJwrgIJbPq6M
 Bv3YLgHswxt2ZqPRyi9rFSWsoWNDE1k/mJFAZrZ7AXYL4uK+qwgArCnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libsoup: set status of 4 CVEs
Date: Tue,  6 Oct 2026 19:29:20 +0200
Message-ID: <20261006172920.169747-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 17:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247314

From: Peter Marko <peter.marko@siemens.com>

These CVEs re-appeared in CVE reports on upgrade to 3.8.0 which has
correctly removed them. They are version-less RedHat CVEs.
"git tag --contains <hash>" for hashes from removed patches show 3.7.1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libsoup/libsoup_3.8.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
index 3301451292..2a40eecaea 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -58,3 +58,7 @@ CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2369] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-1539] = "fixed-version: fixed in 3.7.1"
+CVE_STATUS[CVE-2026-2708] = "fixed-version: fixed in 3.7.1"
+CVE_STATUS[CVE-2026-4271] = "fixed-version: fixed in 3.7.1"
+CVE_STATUS[CVE-2026-5119] = "fixed-version: fixed in 3.7.1"


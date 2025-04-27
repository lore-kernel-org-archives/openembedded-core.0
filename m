Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA107C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:44:17 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.23815.1745747047633620092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=STOe73k/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250427094404c325e6e36c493e7693-0zkyxu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250427094404c325e6e36c493e7693
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 11:44:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ydPg9ZaSWNTHBRRr0OtEkAr7U5H0wdjZik3k0VoPIqs=;
 b=STOe73k/L40dnGllogT6YI2nU4Gh+7+DnPZ0beA6GlEkhLQ1+qFFM8pQr5mir3KO7/0mG3
 D5blTH6yWuKPGSrdcKYAv0DuI4M79FTpB3NNiOdvtk8ecGmjaV9L+vFUgTlVSqqkv77YISZ/
 gSBH9s2kCgmpknFM88xAGQH583rnk6SuLgEWvYJvWImYNKoEbHv5HwErqmj0W19YVXfGkp1L
 DVjr6pyKovlB/lsjuC5Kxrolfki+26Ytng66TLeBQN96EK2pToah88e6aaqMtmvmHHZSMI9H
 uxSCYi+HdjY7Jll8f3qsr0v/fuswwqMKX28+9JOTH5LQ8yu1Vlxi8FgQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/4] linux/cve-exclusion: update with latest cvelistV5
Date: Sun, 27 Apr 2025 11:42:59 +0200
Message-Id: <20250427094302.12064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 09:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215547

From: Peter Marko <peter.marko@siemens.com>

This is preparation for fix in the script so that next update shows only
entries updated by the script change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index a25cd3adaa..24d5631588 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-04-25 11:23:06.829517+00:00 for version 6.12.23
+# Generated at 2025-04-27 08:54:24.704112+00:00 for version 6.12.23
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.23"
@@ -11860,7 +11860,7 @@ CVE_STATUS[CVE-2025-22120] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-22125 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-22126 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22126 needs backporting (fixed from 6.12.25)
 
 # CVE-2025-22127 needs backporting (fixed from 6.15rc1)
 


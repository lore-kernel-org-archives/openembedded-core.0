Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC542C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 21:27:19 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.47750.1721942833364502421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 14:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=qzOkf7su;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024072521270963f8554141189a72c4-leltpv@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024072521270963f8554141189a72c4
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Jul 2024 23:27:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2pj8WvpyK6eF5SlO3MQSZnGKBfn6ycBHDjmeblWqddg=;
 b=qzOkf7suG1mH0TNiKABv2+nk5RL0Cy27vbhiXoO16hwlUq5FC3hagEmo1NHZEF6/Qq9kmO
 CrvtFZMOC3oPZRcK6lTerUU3zVGoOE8FLp/o3gUEt4KlO5n8/1KqOZ+6Am/bIz/sDmJhJtYv
 0NZM7BMEF5ARu3KrZ81oXVRbhPaNc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] glibc: cleanup old cve status
Date: Thu, 25 Jul 2024 23:26:21 +0200
Message-Id: <20240725212621.8294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 21:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202512

From: Peter Marko <peter.marko@siemens.com>

This CVE status should have been removed on version update.
CPE says >=2.34 and <2.39 while our version is already 2.40.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 6e167b6ca4..61996781bd 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -6,5 +6,3 @@ SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
-CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-- 
2.30.2



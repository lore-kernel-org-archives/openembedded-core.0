Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC26EF483E7
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:29:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3503.1774294144414207091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GI1Yl5MN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202603231929013f1a68beab00020728-kokzsr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202603231929013f1a68beab00020728
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 20:29:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=x85Vn9jcNyq4vYT8S3aH+S58E3JVEeOQxg3VQLg7b6M=;
 b=GI1Yl5MNbxTv+HPt8eGJvwPY9gMYK03wk94KFRtPNLs+iICSlyO5r9yIhgMWj8ckZ6OY7U
 9xx9NcuwZcOdQZQMKIx7YtO8K1v+yFVcOG0QgEXJK9h6QaR53/1BA8ZoiRXkTgPAd5HTzUhq
 Gxi900tq/jcQh4L52VD6IFLc4qTA83C3Gi0+ToHS9pL0DZ2nnzB2/ivl7t72MHGZ9YAvqaHr
 FhX9NTCWiK7Dnq4jO6tDc8PCa0QnSrKqGhne+A51yGdVGEAiHcZsXydii69zHc1dXc3Es7x1
 Wvcv9F0QPjUZZRyMzTPvvG4YeiAw9gI8BFpP4DFJuVGHYXBcyoS+XeSw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [kirkstone][PATCH] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Mon, 23 Mar 2026 20:28:53 +0100
Message-Id: <20260323192853.10515-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 19:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233754

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>

Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index ad0be85559b..7bb08a70162 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -22,3 +22,5 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+CVE_STATUS[CVE-2024-56431] = "fixed-version:branch 1.1 is not affected, vulnerable code is not present yet"


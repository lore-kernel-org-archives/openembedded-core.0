Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB1CCF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:58:36 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.18224.1727546313553493178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RJys/lrC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240928175829a273fb7d1728d23d41-chkdox@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240928175829a273fb7d1728d23d41
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 19:58:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8wHsMt3IbPMxkKYrz8NIRkJ3LhrrjZ9ZI1yB8nOJn8Y=;
 b=RJys/lrCy6LiPk7BdIQS/pg6u70RvbBVeMAYZAS6Ynb1yyBBZQnlCzFIN6YELkYvKlEQxp
 zd7upzqX2OqO1DoVhks/r45y78HEyuB4Bq6tVnIW0l4otk3Lgb9+IgFeZlTgl4qLmkQ5jP5T
 2tGkct6lbEJj3LdjoO1AloydolgpEIge8J3j8CCYGkm/MiQNrYs4I16MgqlsafJYVdTV/Irg
 JITgSXVBmp+X6xB+a3zfRZCoZu+CSi1jTFXt2jd9tRvKswkRC4SFHY2k+6ATsJFVLGHxH4oc
 eVvs9S9NZP4ORioRPForXxY7KMO8KYcdlkrhlb0Q83GFbmdghcD3985Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 1/2] gnupg: Document CVE-2022-3219 and mark wontfix
Date: Sat, 28 Sep 2024 19:57:40 +0200
Message-Id: <20240928175741.3750357-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 17:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205048

From: Peter Marko <peter.marko@siemens.com>

(From OE-Core rev: f10f9c3a8d2c17d5a6c3f0b00749e5b34a66e090)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index da2b1c4deb..7a29a5659a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -85,3 +85,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 lcl_maybe_fortify:mipsarch = ""
 
+# upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
+CVE_CHECK_IGNORE += "CVE-2022-3219"
-- 
2.30.2



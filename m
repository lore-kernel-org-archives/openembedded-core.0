Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9096CFF8863
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 22:27:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6774.1777156042114565050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 15:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ti061HUp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026042522272056483309a2000207cb-k0js3s@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026042522272056483309a2000207cb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 00:27:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MItJL+TWceH9C2mZfOYzYgWvpdzaiSZ45VHHbQSQM2Q=;
 b=Ti061HUpjr3ji1YFl4/WkDnBD1DRUGXCNDi3+dD2oqhbUeKNm09J3+ZSxDjzBY5TyVWc1n
 7BVCAUUwk+WZqwKMHhX635G5TCqeEL617Jd2lUeQdeHCnhNCvVcjA1XJ4i7bH5XbSHph3bu1
 SjSk1TgV4XpCuqzpa9JoJ45NwHUaoqqpHj1Zb08axg2yejNl3Ax+YTMxSPLXraBmR9BycOPH
 PsXLFpD+8786dfHv4WF4Mmej1oujQ+8zWY4BQt05VRFVQgXfUcjBcBn7egGGgL/I+le07nHA
 lzidVbA3DirLXPtGCYTGAzmMs5QPf9jccUdjXTxHTTLYmvpOUlya+1lQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/5] ruby: set status for CVE-2025-0306
Date: Sun, 26 Apr 2026 00:26:31 +0200
Message-ID: <20260425222634.44171-2-peter.marko@siemens.com>
In-Reply-To: <20260425222634.44171-1-peter.marko@siemens.com>
References: <20260425222634.44171-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 22:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235947

From: Peter Marko <peter.marko@siemens.com>

This is a version-less Redhat CVE, so explicit status is needed.
Per [1] the issue is mitigated by using openssl >= 3.2.0.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2336100

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/ruby/ruby_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.2.bb b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
index ba24e8601c..f2076e0f2c 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
@@ -140,3 +140,5 @@ FILES:${PN}-ptest:append:class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-0306] = "not-applicable-config: issue does not occur with openssl >= 3.2.0"


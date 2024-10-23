Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AD5CFA47E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:25:37 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.9449.1729718731269704396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=b98cT1+I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241023212527e380355aa40ac3021a-ilzhzq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241023212527e380355aa40ac3021a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Oct 2024 23:25:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8ir3mMvIwqLqfYRiBFq4NOAbMT7rD7RbaQqx+W6/aLA=;
 b=b98cT1+Ik5ENOCuMZtamH8OpyeMT1MfMvkZF8DZFQhYAuOPpqayAelXcQqMuwBCNQbEbzX
 ySXlNxVh+RK0nJwsYT/25ZYftwZPfCsXa6LFgPoxove2jZGuNkGRH/ThRkEqhHhHH4eX0o4y
 Jd73ZPFlFj05rHL494BKCrtIL+1wIIMRy8SAgpOdKBpsfqXSAkFbwglHc7PsHF29b5VvRgOx
 lxBWwIjkYJru8FuQv1IWcNLE4kBr4eKNYSRVdGY+/wMPJSBNwsE7PuK9StQ2/rvdJxLDI4dg
 dwM/U9EfS9HSYDMjZuzesVJKe75Y/nnLD3lQZ8/jHmM0hdMnYfOJHsZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: ignore fixed CVEs
Date: Wed, 23 Oct 2024 23:24:39 +0200
Message-Id: <20241023212439.2220965-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 21:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206270

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 3.10.15

Commit 487e8cdf1df6feba6d88fa29e11791f4ebaaa362 removed patches in favor
of version upgrade, which caused the CVEs to re-appear in reports.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.10.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.15.bb b/meta/recipes-devtools/python/python3_3.10.15.bb
index 4157b8cb83..0eb619dfa2 100644
--- a/meta/recipes-devtools/python/python3_3.10.15.bb
+++ b/meta/recipes-devtools/python/python3_3.10.15.bb
@@ -63,6 +63,8 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 CVE_CHECK_IGNORE += "CVE-2015-20107"
 # Not an issue, in fact expected behaviour
 CVE_CHECK_IGNORE += "CVE-2023-36632"
+# Fixes are included in 3.10.15
+CVE_CHECK_IGNORE += "CVE-2023-27043 CVE-2024-6232 CVE-2024-7592"
 
 PYTHON_MAJMIN = "3.10"
 
-- 
2.30.2



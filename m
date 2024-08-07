Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED6FC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 21:46:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.46189.1723067185251870411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 14:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YoN3hsob;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024080721462263c497e19371eb8d0e-ucgvyd@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024080721462263c497e19371eb8d0e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 07 Aug 2024 23:46:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WF1USCGGKs6pEhV9bfvTCv4oO73PR2y3mkaWR6NDGZU=;
 b=YoN3hsobnvCQxge4SQ37J4bML/oLRdXlCgUEbhk6sWwOmYqMOr3zg7k4RB4+0+Fl5Z74cK
 wZCJxAreSWmMJxXss7i8wnSJniTiMVf7gUW4mIMHTqEE5HZ3/9IWjG+gBl1lnXpt/77EY0wm
 gFvUThYeI3oCduQkeWtWrGTxHfiOeefpr3cyG5/2fOXtkZg0mAPBWQcwvVvXDN5a9XQ36fZh
 g6rc9S/wBPDTzszgBKo1ojjRAOp4NHz6Ox4xPEo7iyvzEOT3e+3KmQo7iMfaLM2SFRcWwTij
 5enJUV9Eul3GGq8RBWpZzOlgUgeB7PmLRAoj+l3hyiJyFQqzFzdatf6g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libyaml: ignore CVE-2024-35326
Date: Wed,  7 Aug 2024 23:45:16 +0200
Message-Id: <20240807214516.10437-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 21:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203096

From: Peter Marko <peter.marko@siemens.com>

This is the same problem as already ignored CVE-2024-35328.
See laso this comment in addition:
https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 1c6a5fcb45..334d9113d2 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



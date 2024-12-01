Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1006D49789
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.156773.1733079271455019757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LlI82aJx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024120118542769004acc37f9140e61-v26tsz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024120118542769004acc37f9140e61
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gifrNyWwZSZNr3IMPXGqw8LzOxxnxopFPL1sN6271Nk=;
 b=LlI82aJxNzvZguszdu4YRX6Css47W9JveCJ1th0VAnpns0T/9jF8P4SczVfKM9lbeQ8TV9
 WTKQyHHBYnA9td+xZk5dT0AZs3wR7UbQR8BQQ0HC319Hhr0h1htVgWVdIXP0hqMABVUzwoj6
 zq6JyXI3RHZnK0O2HZblSS/aIkNV6LtDipG0rfNUMeCMno49l5d/WVi/sF6a9wfDHfmFcctJ
 tC8aeSsUzhhtB3JAKHrAvZ0fy3YihofituxtQIRVq6fOh/7Gvc+TTqY2KuiiJzUfsv9jPyfX
 YVLdDP00XoRKowHjy84iD6T8A4WdB+yJCcBCWjMZ87AWrabmXKCQ1TYg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/5] gnupg: ignore CVE-2022-3515
Date: Sun,  1 Dec 2024 19:53:34 +0100
Message-Id: <20241201185337.2675566-3-peter.marko@siemens.com>
In-Reply-To: <20241201185337.2675566-1-peter.marko@siemens.com>
References: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208122

From: Peter Marko <peter.marko@siemens.com>

This is vulnerability of libksba and we use fixed libksba version
(currently 1.6.4).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 7a29a5659a..7075a61898 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -87,3 +87,5 @@ lcl_maybe_fortify:mipsarch = ""
 
 # upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
 CVE_CHECK_IGNORE += "CVE-2022-3219"
+# cpe-incorrect: this is vulnerability of libksba and we use fixed libksba version
+CVE_CHECK_IGNORE += "CVE-2022-3515"
-- 
2.30.2



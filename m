Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB204E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:55 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.138065.1734639943211622746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XoTRLMXV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202412192025456f827c19601f003a67-hdwvu3@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412192025456f827c19601f003a67
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8nbAoc/20xQfjyyA28I5Ummr1jXjPqN4Pm/zBnc5BKQ=;
 b=XoTRLMXVB0jkJmpc2XJwn+iutEtGxvp+KU1KuAmOpWis8Jw1tJJRm7p4LWlhkz2YoeLmC4
 aVqip8hvJVNBY7v9unH8C24tJc3Ca8YZ7cYArBKW1pdMtjzNZNvvIeqdh9FPGf2Z9rf85alD
 U0CNQdTUvGdQ2NCgN66gx09vctY+rxF5xBc/s5lYyjOGlgy9FwIx+gp94CaMBKIgjrH5NaR3
 NsXwtz89T8ziB2Xa2q8JKnUAC3ieJEFMaOlE7mnwV9Cslwy1tVDokgxRcgrJAV8hFVnvr9L1
 YrbUMd4zXTajQhh7Igx7xO97q4J03dtVwufhh8lit9/H28HYm7u/8szg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 05/12] gattlib: mark CVE-2019-6498 as fixed
Date: Thu, 19 Dec 2024 21:24:16 +0100
Message-Id: <20241219202423.346033-6-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208938

From: Peter Marko <peter.marko@siemens.com>

Our hash does not point to exact tag and CVE patch is already in.

We use: 33a8a275928b186381bb0aea0f9778e330e57ec3
Fix: https://github.com/labapart/gattlib/commit/60b813a770e42fdb0e85c1d2da7a55327784b8d6

git describe --tags --match=v0.2 33a8a275928b186381bb0aea0f9778e330e57ec3 60b813a770e42fdb0e85c1d2da7a55327784b8d6
v0.2-262-g33a8a27
v0.2-85-g60b813a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 7ad28d594d..0841dc2596 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -17,6 +17,8 @@ SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
+
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42
-- 
2.30.2



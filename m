Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421FECA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:48:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.4715.1755982111349878303
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bTtNeEJI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250823204829327c7a7338be58210a-y8afff@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250823204829327c7a7338be58210a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 22:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lVGRTBdvt/wv7hwP2aXKi3OJcXSa9p7zHPUmvUjmfJM=;
 b=bTtNeEJIhN/QwA9d197zIybQcnDQzTQ29ZGEZN8Y6o9kgfiBseM/eEzoGS25LEDy/ZPGwY
 DTFr1YXvHw1daDiAxx7XkVhkz4L3VsBAwQcmRJYnC3xlDfUI7TcE6o8vqmy8LlE27pGW98NH
 uWPOGIe1NNdErQ06IZKvoJ6Rhvnbz7TX0+7hxCD9V8jgBtA3zKU/0cjc7732j56x+PzK7I1a
 EbqZFp9dI2PzM5XXC5ub0LFvslmbtrXzJP+ddnpXjAVq4cnwLLNZPOch4x7ktj9cA5CviiCm
 BC4nAZie0NmDMN8LIfx/b2Lyqft8KlPiv7X6xPKyMXp1btzxAMUzVpvg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] libxml2: mark CVE-2025-6170 as fixed
Date: Sat, 23 Aug 2025 22:47:07 +0200
Message-Id: <20250823204707.35257-4-peter.marko@siemens.com>
In-Reply-To: <20250823204707.35257-1-peter.marko@siemens.com>
References: <20250823204707.35257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222355

From: Peter Marko <peter.marko@siemens.com>

As shown in [1] when expanding tags including it.

NVD tracks this CVE as version-less.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/libxml/libxml2_2.14.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.14.5.bb b/meta/recipes-core/libxml/libxml2_2.14.5.bb
index f60a46e187..0b5edcd7a3 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
@@ -27,6 +27,8 @@ SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be47223
 # Disputed as a security issue, but fixed in d39f780
 CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail"
 
+CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python"


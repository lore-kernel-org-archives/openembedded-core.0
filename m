Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BE0C282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.21669.1740763070269838013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 09:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ly7lBlaD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250228171746e54ca4fcbb35fe1a50-4gg6m1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250228171746e54ca4fcbb35fe1a50
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Feb 2025 18:17:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OqWfMLV/nOBISYGZmEM+PnodHQPIPTSYam62me3S02s=;
 b=Ly7lBlaDOhE5pgWenXQx2H+bXdi4txJtJpJAfTPt33s3G1XknvD58kAqjyWcEu/FEOEtYD
 bVneHSVVDVlj4hQpCHkq178CHGviHmcKRrOllJp0xYzRpGYKwfWJTS95550ezg7BG/l1PKHz
 4xB5tu8WQ+LRFB15gBWnntZbls6uSp7VXu8Z2e2f0lRiSIJo3rONigK39t8FAjPvr8scaQ9t
 9iLVy3coC2ou+CB2YnhxNmMvz3LYqOwbIgu467IsuqwGK8WEHq2NkcUY7NZ26BfUy/YABH1z
 eFWEL9D7rp27cxWDRlhyZ7MFGWzmU+PMinEKaUWHaEQ/VwssilEKSnaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: mark patch as fixing CVE-2025-27113
Date: Fri, 28 Feb 2025 18:16:58 +0100
Message-Id: <20250228171658.12345-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 17:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212072

 From: Peter Marko <peter.marko@siemens.com>

This vulnerability has now a CVE assigned.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...lation-of-explicit-child-axis.patch => CVE-2025-27113.patch} | 1 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb                      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{0001-pattern-Fix-compilation-of-explicit-child-axis.patch => CVE-2025-27113.patch} (98%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
similarity index 98%
rename from meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
rename to meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
index 932c0ec422..92713375eb 100644
--- a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] pattern: Fix compilation of explicit child axis
 The child axis is the default axis and should generate XML_OP_ELEM like
 the case without an axis.
 
+CVE: CVE-2025-27113
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/503f788e84f1c1f1d769c2c7258d77faee94b5a3]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 8f1d882505..1cbd620b34 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -34,7 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
            file://CVE-2022-49043.patch \
-           file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
+           file://CVE-2025-27113.patch \
            file://CVE-2024-56171.patch \
            file://CVE-2025-24928.patch \
            "


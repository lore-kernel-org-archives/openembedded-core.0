Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514A2C282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 17:30:50 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.22037.1740763839402471709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 09:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BoILBRPF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025022817303630d5d2b27563d67fc7-_dxfug@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025022817303630d5d2b27563d67fc7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Feb 2025 18:30:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=v1EecmU+3pfjk1G/XFLjHTYg1rkISKndfGPhCg0bP1s=;
 b=BoILBRPF85pg5723xUgzmbj7vsSDUEQeBc9XMuZhnqMAgX5Y8/SLkeJBBHQ5gmF4DG0n8o
 ntDf90WSwQ0pKtzbEMm74yvHc48oZ7VOS3k2O33YqUTTYp42JZItuhR8ebEqMhuUOWqjUIQW
 ndR6SC9lyog1iWlwiLGMnYbxzxU0iCcZyfwdwDnR8DSudkTP24ZyNrAcQ9H3BTXUZWJMpoSI
 SIyhbRu/VHLYEls81Lk01ajmEyyA0S7dAk4JZVdsjn2dfB6o8k2nthJ77AQkucxmQECelOv5
 WFf1al65Laub2Q+dkVIKjk9jv9Gd0N26625RrQbUxrkF0qT2IxCnED7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH] libxml2: upgrade 2.13.3 -> 2.13.6
Date: Fri, 28 Feb 2025 18:29:49 +0100
Message-Id: <20250228172949.13188-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 17:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212074

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-24928, CVE-2024-56171 and CVE-2025-27113.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch          | 4 ++--
 .../libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b1..1c8c13ab5cc 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0a49d37..1097c63 100644
+index 4cb9a5c..8adcd7e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -27,6 +27,16 @@ check_PROGRAMS = \
diff --git a/meta/recipes-core/libxml/libxml2_2.13.3.bb b/meta/recipes-core/libxml/libxml2_2.13.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.3.bb
rename to meta/recipes-core/libxml/libxml2_2.13.6.bb
index df24f3031c8..3b3ca87e962 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.6.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138"
+SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780


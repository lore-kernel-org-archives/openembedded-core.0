Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8CFE94116
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 20:10:08 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4275.1696623004530527895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 13:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JuX8FT9g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20231006201000eee5aa9e7d660877a3-cqyr9x@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20231006201000eee5aa9e7d660877a3
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Oct 2023 22:10:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=75dmaQtoSDXIGi9WsyYfqEbQ+imkVO8WlJySimIP4iU=;
 b=JuX8FT9gFHC0JnewFo8OCPP3CaKtAR8E9RmRmNf0I+ocksr6kUq+8CBOO10rRexQEqY1bq
 xijSGM67DjtkCARXKUblQ2jHzsta59k4ruIhrWeCJepkOI0JzboxUZZnhTexQx6L3NmrXocT
 /Hwc9hWnbQ//k9XRum4XYYDk0g3po=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable 2.35 branch
Date: Fri,  6 Oct 2023 22:08:14 +0200
Message-Id: <20231006200814.178676-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 20:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188784

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2023-4911.

Single commit bump:
* c84018a05ae tunables: Terminate if end of input is reached (CVE-2023-4911)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c23a43576c..e0d47f283b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "73d4ce728a59deb2fd18969e559769b3f590fac9"
+SRCREV_glibc ?= "c84018a05aec80f5ee6f682db0da1130b0196aef"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index b4bad5b7ac..271520f76b 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -17,7 +17,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.30.2



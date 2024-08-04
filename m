Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0956EC3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 08:54:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.23730.1722761692396812913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 01:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZhGDOQ0L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240804085449f76ff5bdaa8cd44d2a-n8zalj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240804085449f76ff5bdaa8cd44d2a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 10:54:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oyLHqjLM/9r1TcJh3KexVU1V0gr0bCN4j1AwooK+ADI=;
 b=ZhGDOQ0LxePuolUo+Ub85F7Ga181AxWj0sY4yjBx1+acQYulWee/qK4Wf2lgr3b3eyezN4
 mE2tcDkrng+jtP6Hyo5CWsECbNuSgHevI21vJOi08HIwykv8vCLExquJ/jpHKjAdcMQEnDR+
 YzrUcetHVdn+QVuGwDR6MWRPnXFZtc59Y2hUo+VzMv3YMHjAq+BeIAcVrBZ15p6yH5goUBHI
 sGAyoSpQ5VVS8JpUgYsnpz8Jhr7c3cYHn1oxXKcr+dtW+3mZO4QMYlTNKH/HvETdcPMJRyKu
 VOqX8vWu+X4cXzK+1G0yV8C45Vrdf6F0RjpPHMsVqk67V5pI9nmC5ukw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libyaml: Update status of CVE-2024-35328
Date: Sun,  4 Aug 2024 10:53:58 +0200
Message-Id: <20240804085358.3375423-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 08:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202941

From: Peter Marko <peter.marko@siemens.com>

This is open yet but seems to be disputed
This has not yet been disputed officially

Based on:
OE-Core rev: 4cba8ad405b1728afda3873f99ac88711ab85644
OE-Core rev: 7ec7384837f3e3fb68b25a6108ed7ec0f261a4aa
OE-Core rev: c66d9a2a0d197498fa21ee8ca51a4afb59f75473
Squashed and converted to CVE_CHECK_IGNORE syntax

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 4cb5717ece..f7c29e7e0f 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,4 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+# upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
+CVE_CHECK_IGNORE += "CVE-2024-35328"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



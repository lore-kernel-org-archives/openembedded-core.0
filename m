Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB46FE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:26:15 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.138082.1734639968056495792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FJ2YGs2u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024121920260640241b9a5669cec0ec-te1r_o@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024121920260640241b9a5669cec0ec
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:26:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4acOEUW0KM6GDiDuJ1RI4womNLDA1sjdrTgPxfqv/0w=;
 b=FJ2YGs2utPv9k16p/ArjzqNcY7gNWnMhGphwfCseWX7IbM8+LIIU5UyyYynPpeRLvQ9BcG
 napR0wS8S4hg5lm7b+/WzHXMgsBEEUvgSAls6zBT39aN1sWxrDu/JTcSAMS7qsEoCsGzBNPc
 sfgg0V2r5UvwzSHEdnTV6WRRaenKLFdjMQ3Y+LM1sWiXK0iTrxfKjoRX58A8upIkEzgDXWw8
 zrkAsiT/sU5tVT1LyM+/tlkA8IMuIv41ULB5tZwTC24QJavFwV262TQDAyQbG6fjwOmDa1r9
 npmbhweDDXOOIhxprKSdFE8eIKWaRQWEVbzKzaCJMD/60UgU7XopIIHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 10/12] swagger-ui: mark CVE-2016-1000229 as fixed
Date: Thu, 19 Dec 2024 21:24:21 +0100
Message-Id: <20241219202423.346033-11-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208943

From: Peter Marko <peter.marko@siemens.com>

as per https://github.com/swagger-api/swagger-ui/issues/1865
NVD tracks this CVE as version-less.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
index 5add32db43..0998643b2a 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
 
 SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
 
+CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
+
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
2.30.2



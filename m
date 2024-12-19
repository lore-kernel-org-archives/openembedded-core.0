Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB088E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.138051.1734639927807988727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QEk1oo/a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2024121920252543babc0adb7c0426d9-2wdkp7@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2024121920252543babc0adb7c0426d9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qJxvY7AjijVm77gr5baJcPyRsffAx9huVKAH8kj8aK8=;
 b=QEk1oo/a7XrUcLTS/h8KwqZUQNQITBb1+FlJkBfARSHKn7iUU6LrcteVxZg/lBiNoKSZpB
 KBqDQj1PkJUOgZTQM7qo8ZL2O1Letp9uSu5rnHdXado2tTiLlWTc7TltuIM8+9HsEjpRa3/e
 vhHX52NGfd+x6XOffC7mXYNQ5EU7mdLNMl2IJx3bGhM5egI36EMnxc1zgN2ncw8C4DdofDHu
 968aw3x7GZiY8xtdeepUSOdLouVctLjKLO6P7tYpiDBeN5+8tpNC5p4HSv9QboHPBAfv7lQw
 aDgFz5jy4f7vP7Uwf2LSx6BMXIuFjp2TI0R0jgWpps4q/4l3IsPWSWAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 01/12] ace: ignore CVE-2009-1147
Date: Thu, 19 Dec 2024 21:24:12 +0100
Message-Id: <20241219202423.346033-2-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208934

From: Peter Marko <peter.marko@siemens.com>

This CVE is for vmware ace.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
index c79fba323c..88df9ae5df 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "8d379f37d56db33f3ae447725b632d48b1c13e887593547ac3568e3b42
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
+
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"
-- 
2.30.2



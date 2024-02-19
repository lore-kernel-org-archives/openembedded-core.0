Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424D4C48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:10:40 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.37402.1708333836386700711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=ChqpF8Yv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-664519-2024021909103327f5355544fc817b10-2kl0st@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024021909103327f5355544fc817b10
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 Feb 2024 10:10:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eKSj+fy4RWEcj2OoFl6xijaRHkAj6JzxhfV7nM+u4HY=;
 b=ChqpF8YvZ4t8k6s+Nd8dHyg8mvczZZabI0bYngRYkameFp++WO9AQZqxteOBrofh5nstgH
 O+Zaa4NTOjWScgjEuB++qfjmQssMPeiP+HbQHXJMffFWCKoupxPFK/Q5WEdbbypG4Wgd0E3j
 msTt1NZU+pwcXgPhXFEuMQaU6XrJI=;
From: "M. Haener" <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [PATCH] iproute2: add bridge package
Date: Mon, 19 Feb 2024 10:09:41 +0100
Message-ID: <20240219090941.15759-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195867

From: Michael Haener <michael.haener@siemens.com>

Add package for using the bridge tool.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 640b3013f1..8c460adf73 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -59,6 +59,7 @@ do_install () {
 INSANE_SKIP:${PN}-tc = "dev-so"
 
 IPROUTE2_PACKAGES =+ "\
+    ${PN}-bridge \
     ${PN}-devlink \
     ${PN}-genl \
     ${PN}-ifstat \
@@ -91,6 +92,7 @@ FILES:${PN}-tipc = "${base_sbindir}/tipc"
 FILES:${PN}-devlink = "${base_sbindir}/devlink"
 FILES:${PN}-rdma = "${base_sbindir}/rdma"
 FILES:${PN}-routel = "${base_sbindir}/routel"
+FILES:${PN}-bridge = "${base_sbindir}/bridge"
 
 RDEPENDS:${PN}-routel = "python3-core"
 
-- 
2.43.0



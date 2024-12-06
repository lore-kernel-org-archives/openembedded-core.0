Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31EBE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 18:26:22 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.44262.1733509574044312250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 10:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=m5ek7ENz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024120618261127149ab739e9fb5dbb-mhdthd@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024120618261127149ab739e9fb5dbb
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 19:26:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KrU0gHaLLKdoFhjnN/EkRr6HdmFxuhqPF1THr4blAWo=;
 b=m5ek7ENzB0yC0eCLKyMAbJhtFQsa9llqaRGYOoQ5Q1rst4J0ax0oa7QiqLWj7mjdNbxSXS
 +HISB9lw46tpS0VBhXes/Xl9RHwqVHyw9XHRFY4NfW46P7NF+Xo/MnYfsruBAYjweLJL0UBn
 mdXdNBnkQcWNZbrYQaoqZ37/H5A0VJF4JPOQyh5kQaRMN/X5dN+xTuh9lNZAwJADN1ZbAhWq
 Bp+rwwRyRSqEWxP6EZ0WOr84oXLDVLJ55ScNbLJ43jZlQtO3GlZ1VR4j3iQVWhWdSSsPOlHn
 n9dN7tezJqJQnuzanpf0RGdQT5vQMUKqVF3xXIjQ6CTeSYPqmMHygBKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/3] libssh2: remove status for CVE-2023-48795
Date: Fri,  6 Dec 2024 19:25:11 +0100
Message-Id: <20241206182513.11165-2-peter.marko@siemens.com>
In-Reply-To: <20241206182513.11165-1-peter.marko@siemens.com>
References: <20241206182513.11165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 18:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208436

From: Peter Marko <peter.marko@siemens.com>

Entry for this CVE was corrected in NVD DB, we no longer need to set
status for it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index c7013142c0b..6d2580072b0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -50,6 +50,3 @@ do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
-
-# should be removed when upgrading to 1.11.10 or higher
-CVE_STATUS[CVE-2023-48795] = "fixed-version: fixed since version 1.11.1"
-- 
2.30.2



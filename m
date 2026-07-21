Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE7AC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:00:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31063.1784660425873393431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=V7h6erfU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202607211900235853dad5840002070a-urzwvg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202607211900235853dad5840002070a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=O7J+8GitbRW59XLW+ivYHuj9JQIr5iSp8ioFY40cdGM=;
 b=V7h6erfUFxrogTlFsvYOQTwLWF/788BgOPPdgc72geRXcrZx559vi/WiLYstq4dCeTSNDr
 CPYJfOfocTyDelhxHUu7nfX65A0nJof5v8HRjyTVayVtcndT5+sFdDCfmkG14Bf88PcO/fQw
 Lq+JtICzcsTpfHkI83rQZlTDuk1W1nX5G3vzXu6QWL9CUT4FJrz8x/c0Vtd9xyqe3IlhsI78
 1IhTmSK+8wTuurVP9Yd73Ylos2apSBLeJwn6uCOKhzbCAkpXEALzqIn9kPbPIl659JqExjsD
 2KFVUl/cMUCzfuOiIazBDl0S5MXI8d+Bx7ydJDqJvepVPst8XW4e328Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/4] connman: remove connection_manager from CVE_PRODUCTS
Date: Tue, 21 Jul 2026 21:00:03 +0200
Message-ID: <20260721190005.49809-2-peter.marko@siemens.com>
In-Reply-To: <20260721190005.49809-1-peter.marko@siemens.com>
References: <20260721190005.49809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241569

From: Peter Marko <peter.marko@siemens.com>

The only CVE with this product/cpr is CVE-2013-10036 which is for
different connection manager and is showing up as false positive in CVE
reports with current sbom-cve-check tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index e9873f3163..09c0d95eef 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -14,8 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-CVE_PRODUCT = "connman connection_manager"
-
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BBFC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:01:01 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31075.1784660451835871652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ydac2kWO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202607211900501acafd5c0e00020729-kw8vgt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202607211900501acafd5c0e00020729
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BN47Mxg8rRkYuYhnRJFjAmQv+RGit+IIKMC5h1OPGUw=;
 b=Ydac2kWOdnDoGZ2b1vrDOQrtoKzj783qfyGY2BGBiygLlTwL+Fn7lXcdLEFUzkxXurWVU8
 sqzUpbr8LcfV3n8y690LIT+HrWNkzal7TlVi0AhGmQ8Q1a522YO5HJLuBojNcvhgU86mC9/k
 UE6CJIUErk+6XU3Eg4pWab9eDeEqdGh3Q6K7boni3CRnIQQtRTDSCsHIzXfUjuQdb3kSGpX5
 rf+xjjVlB2fmWhIWNvEc4Iml97a9/Jj3/ZXCFy4dSN2S3ioYeL/8P4wHmNNDi/E8FKSGgTEJ
 +1BsfCdVfM+Vc4CBT8LAjrmtECK2vCHs1hwpCn4orbk2A5egI+kc3dvQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] connman: remove connection_manager from CVE_PRODUCTS
Date: Tue, 21 Jul 2026 21:00:37 +0200
Message-ID: <20260721190037.49841-2-peter.marko@siemens.com>
In-Reply-To: <20260721190037.49841-1-peter.marko@siemens.com>
References: <20260721190037.49841-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241573

From: Peter Marko <peter.marko@siemens.com>

The only CVE with this product/cpr is CVE-2013-10036 which is for
different connection manager and is showing up as false positive in CVE
reports with current sbom-cve-check tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index 6f7093301b..920745afc3 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -14,8 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-CVE_PRODUCT = "connman connection_manager"
-
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \


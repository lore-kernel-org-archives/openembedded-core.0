Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BE7E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:26:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.138102.1734639959522168271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SDpm1zWx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241219202557908df2f8cc3903c82f-fbfdwv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241219202557908df2f8cc3903c82f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CtQ9GB0634YwQcAsdGLWyX2e8VCqvZaZqLiaR50JVu0=;
 b=SDpm1zWxQYqkywNM9axGq7Roq/rO8KN+cRX++jASQNDUDq7aPKevK7HcQZJQRh9HeuIucD
 JMyLCj/M7dXjjJGIv3w4LjY0rnTcwMz0IfVKFX/Ad4ejDJmwEhkGPXykaDfMrIVegcRJzcu5
 ZIF2Wy0zjiRzw3egnVYJPF9rlFH/ykwnFCXAn1gP/TVjRxJcD5jkVueOysDl38byTbbmVTbl
 bd42v55CMkPEV0JKNvAYp7tFX4aojWHTaA7nVYbJku4z0Ic6olbsQPnZdcCjwAgNvQY0bwsx
 9q0eCSrTxQ9xJqfLMwuQOuygVBHXotdTssIR2mgPazthWcShiGe+v0nw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 08/12] spice-gtk: mark CVE-2012-4425 as fixed
Date: Thu, 19 Dec 2024 21:24:19 +0100
Message-Id: <20241219202423.346033-9-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208941

From: Peter Marko <peter.marko@siemens.com>

It is fixed by [1] since 0.15.3.
NVD tracks this CVE as version-less.

[1] https://cgit.freedesktop.org/spice/spice-gtk/commit/?id=efbf867bb88845d5edf839550b54494b1bb752b9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index c8a3f7f532..4ef39f0904 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -12,6 +12,8 @@ SRCREV = "f04479c16f0969fb394ebe74b6eff74e560a42f0"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;branch=master"
 
+CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.30.2



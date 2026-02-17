Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F0DE909BA
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:59:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13879.1771340381923169299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Tuy+jcvc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202602171459383dc2636ec4000207f8-erhzbu@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202602171459383dc2636ec4000207f8
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 15:59:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uBlU813rGY4oOyW3RHXr14LCXtjOvgef73qEPj8PW38=;
 b=Tuy+jcvcruS44JVjwIhdJEv/iIzvrKTzbxiRk2ien8DpKHtAm85sAYrEcFqOJ326uJXWPp
 vQzwfuAtUCPm7RBeiNoXJ3yvYHJj2sodIUNnXtBsxj4UzkrsKRlDwEgG1Du5KknBhmoA717E
 9R4+G+x5rV6rsxDYl9FkwApEdcWqJzAqMOU/2US5CuIC05DULqEcZldH5yutOUiLpUz62ES6
 cucPqHaAZjy8QzZ5MAeqCbZNmt55YddG1qGI/0z/e1D+6UxOYr+ey4U6T9+ZVjQtm8hpbqSw
 Gij5GiWhNOCjf6tQX9+AoqhFURC7WlBqnZPwXChVFXiYON010nXpfAfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] iproute2: update link to homepage
Date: Tue, 17 Feb 2026 15:59:35 +0100
Message-Id: <20260217145935.30023-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 14:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231259

From: Peter Marko <peter.marko@siemens.com>

The old link redirects here now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
index e078bcf3a9..c68b2adc0f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
 TCP / IP networking and traffic control in Linux.  Of the utilities ip \
 and tc are the most important.  ip controls IPv4 and IPv6 \
 configuration and tc stands for traffic control."
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
+HOMEPAGE = "https://wiki.linuxfoundation.org/networking/iproute2"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \


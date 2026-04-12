Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9015DE937FA
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 18:53:08 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.255170.1776019984427675695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 11:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Be48ij5L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260412185300ca66105ac00002078d-zdnohb@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260412185300ca66105ac00002078d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 12 Apr 2026 20:53:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MVyCtxcqmoMLQMN05J2/+0xkOIBrK8/1iy0W6HW8Llk=;
 b=Be48ij5Lq22p/83iSM70CDHJKL7+3FFz46rPFv78C01MBLvZCEXkQ0xAl7j42zab1+0EM9
 CQl9PwGx/8LAyuGsKbS4Gt7qoXrxhJEPVNTVv7/CLzjY+x2aDO8JtVWPc48w91TgznrNtBai
 RTM3w5H1YnofEVk2NeeiDxNeQ6ZOGwhrqQ8W5cs+LdFqGV8Nd9A9B4XXbMq6BHSyiwp/Y7tX
 f4ihB3xuF8d5CCgdu8dUC7XLLHyJuhiVaf7ajd38A9/Q+f1uPi4FdjVvbSkymvY7EcdpY29r
 1yQorIBqBNbgnEp+x+D3HdRFBc9ghh3E0897a0Noxy/sC8wM7yQxp1lw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] xserver-org: update CVE_PRODUCT
Date: Sun, 12 Apr 2026 20:52:00 +0200
Message-ID: <20260412185201.2556780-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 18:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235072

From: Peter Marko <peter.marko@siemens.com>

In cvelistV5, CVE-2024-21886 uses CPE xorg:xserver ([1]).
Detected because this CVE is shown for xwayland recipe.

[1] https://github.com/CVEProject/cvelistV5/blob/cve_2026-04-12_1800Z/cves/2024/21xxx/CVE-2024-21886.json#L646

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index c79bb9e962..59c373280e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
-CVE_PRODUCT = "xorg-server x_server"
+CVE_PRODUCT = "xorg-server x_server xorg:xserver"
 
 CVE_STATUS[CVE-2011-4613] = "not-applicable-platform: This is specific to Debian's xserver-wrapper.c"
 CVE_STATUS[CVE-2020-25697] = "upstream-wontfix: \


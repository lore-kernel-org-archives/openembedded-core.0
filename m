Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61891FF885A
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 22:27:53 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6780.1777156068249604309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 15:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NGaexwA4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260425222746fb7f41ab6000020758-zpbfec@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260425222746fb7f41ab6000020758
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 00:27:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9BxbusRTESqw+u/bWNLj42UdH9LhJP7E1daYkldLeuc=;
 b=NGaexwA4mdEuhijiNE9llPHjUUGUxYqLSBEQB6k2y6YKZFvDPPiw8pyyhpR5cmQz2IXCnk
 1wy2JV7Y2iwN0g4S8akvrNXFP0Pd6HHhrqUxPgcKaibqVFtuA93F8qbER6YD+DnXjn4sGsCH
 S5esAx5h02I3vC4+9d8C/YRj606vcF+08foFK6PTy4tKM4SiX7nnddC1RIDhMhZdygxKuc++
 IVdI6X8edCErjtyRudOTsFgjAUHIFQvhGNlE4uMCuczUU84gbSl8ZteGW1tK3A1aEFZWrCZL
 qToYDhQVeSVFeANLLPB5RYbIIyxIVvN6o47JcsnXaXd9lcpsVAK12l3g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/5] libva: set status for CVE-2023-39929
Date: Sun, 26 Apr 2026 00:26:34 +0200
Message-ID: <20260425222634.44171-5-peter.marko@siemens.com>
In-Reply-To: <20260425222634.44171-1-peter.marko@siemens.com>
References: <20260425222634.44171-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235950

From: Peter Marko <peter.marko@siemens.com>

This CVE is reported as open because NVD has no cpe and cvelistV5 has
unparseable "version": "before version 2.20.0".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/libva/libva_2.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libva/libva_2.23.0.bb b/meta/recipes-graphics/libva/libva_2.23.0.bb
index 63dc5af8f2..39a80db7f8 100644
--- a/meta/recipes-graphics/libva/libva_2.23.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.23.0.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN}-glx =+ "${PN}-x11"
 FILES:${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
 FILES:${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
 FILES:${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
+
+CVE_STATUS[CVE-2023-39929] = "fixed-version: fixed since 2.20.0"


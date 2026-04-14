Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CC3F9D0D5
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 14:33:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20542.1776177183751281749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 07:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VxjR0NwK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260414143258bb1f27467100020765-oovz4n@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260414143258bb1f27467100020765
        for <openembedded-core@lists.openembedded.org>;
        Tue, 14 Apr 2026 16:33:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8jALeW+LJ+4dMjZuqh7VNowZWzRwbuxeP2XJl5QYuSE=;
 b=VxjR0NwKpXZB4DLCrENIDK4QnidqB7xmXr/ZFHoioG+jJnlbRF4k7gcY4hFIUYWHp9Nx+F
 zRSDbV3Gx4+2lYm6nwu1ARVUG8j3w9OuLoMFkTkXUvnlmQfQBBxX2LxGnL0cBhOGfoHEsK4h
 7WEqenv7lT1Tep0D7pdK59D3SvhaMG6cHub2pmsJk+eIrHQRVLgmXKg1HZQ0geMq5iFF6byI
 dWkVF0ljGB0WmAHX9IBErzqDYX12bUq2x6CYg17SLa4/s2zk8RpBr1IxOPaCzb2wSmEqGATm
 u5UFgpHxX+DL/s4yuuFcC4au4PemKaLbLoEUw7wxIPEguYOvMq6ewwKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] mpg123: set status for CVE-2006-3355
Date: Tue, 14 Apr 2026 16:32:54 +0200
Message-ID: <20260414143254.3416-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 14:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235159

From: Peter Marko <peter.marko@siemens.com>

This CVE has only cpe version which is considered invalid:
* cpe:2.3:a:mpg123:mpg123:pre0.59s_r11:*:*:*:*:*:*:*

This means that the fixed version is unknown and thus all versions are
considered to be vulnerable.
Since the vulnerability was fixed in old version 0.59s_r11, mark it as
fixed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: commit message updated with description why sbom-cve-check fails

 meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
index 648eb21500..dd5f8a53f5 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
@@ -53,3 +53,5 @@ EXTRA_OECONF = " \
 #| make[3]: *** [equalizer.lo] Error 1
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
+
+CVE_STATUS[CVE-2006-3355] = "fixed-version: fixed since pre0.59s_r11"


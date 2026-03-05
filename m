Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B32F47CDB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:05:58 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54967.1772744751493649066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 13:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eLB1DPXD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260305210547f683a4868c00020756-__pslb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260305210547f683a4868c00020756
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 22:05:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nQFdiK/F8oYM0LQopUmrczzjzNeweF0UycTh9iv4ndk=;
 b=eLB1DPXDSXMa2MP4X2FTlqVu3NwqCBiyJcVlvazbZg2OTwzv9FNeopTwht7zgRygTGxqgN
 0r8A5i/Qd5m6nwid5QZdyuP0072+7gPcT+pyov0lXDb8KfsMJ/lqTwLvBFJb/f6S9yhUU7Bf
 gKVWdlP0CSy2cnZPeoby/2BF93tjizTy4ElzpUBEQarXqiRPGnpgurZPkz1YNVuoh2BsD5Aj
 geagB2lVH3bF8t7hohoS4kfeFLgyEzwjNxx8uko3oPnrpd/g1wmK1G5Fy3WeqK1DnHi3keEr
 R3rCATaNUYgMsNT/GoPkDG0t25fuZeOpWK1Jpp+vj7iYQ5T3QrJ3/+sA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] vim: upgrade 9.2.0 -> 9.2.0110
Date: Thu,  5 Mar 2026 22:05:45 +0100
Message-Id: <20260305210545.3173306-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 21:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232519

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-28417, CVE-2026-28418, CVE-2026-28419, CVE-2026-28420,
       CVE-2026-28421 and CVE-2026-28422.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 73991ef2a8..9a5ec9652f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".0"
-SRCREV = "e7e21018fc0b60c153c8e668f696d95e574cc5a4"
+PV .= ".0110"
+SRCREV = "7ba60f17c22ef81680f25f8c3225b4edb55ddd7c"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"


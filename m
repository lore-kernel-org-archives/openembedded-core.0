Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275BEC5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 15:58:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16449.1787500677197893490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dVAGebP4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026082315575364f6de7e890002073f-3b_q94@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026082315575364f6de7e890002073f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 17:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gS29b/L8ORGjSsVaJ09p2KRg229H6kRgEbV+Ll4NPgU=;
 b=dVAGebP4KvXCNcofT5pszXc2Z8IA3VESoKllndtHrNQ47RsRhmZy5SK1WOa/pjwbo73C2f
 Y2dFuhizGpCkdV+7NwnPkqmuezUqaDorAlshDKQP8s28rYJH30+oKs4I7nkK2vxGvhJQyqXo
 t5YgdOcV/5+Bfdma/DbSHzPn7enwsoa0Hab146wk50WcZmoxv9VYeaCpmImoPoRprvOHfGEC
 gR/7DPYCGeRMZATaHziohQvWXm2HIPrvlL/l4+PLg0lQSbdg7/mD7dHjwiq/Qc0A9eNRJpht
 DaZvmieERYrSvS0wCe3bMyxACMKnN37F6Vx5ThoDblbwnAcz5tfEKbAA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 1/3] libslirp: fix upstream version check
Date: Sun, 23 Aug 2026 17:57:39 +0200
Message-ID: <20260823155741.2091982-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 15:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244039

From: Alexander Kanavin <alex@linutronix.de>

The regex excludes bogus old yyyymmdd tags which sort higher than real versions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2a60e5db4460cd8ec99b43d8f2ff733ba509c373)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/slirp/libslirp_4.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index 9f7005d709..50577fd4ae 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
 SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
 


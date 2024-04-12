Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F641C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 12:53:44 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.46085.1712926413758949098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 05:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PX4QKngV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202404121253293745b5ed8badd5fb44-d92iwg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202404121253293745b5ed8badd5fb44
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Apr 2024 14:53:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=asstVdPRSm+k26WmTbV6mzVCLLUoQKsePsXzwekel5o=;
 b=PX4QKngV6ThTVz919LK6TRgCKHA458bZ9UTFzKm941rG0sXNzgJFWS8enrq/AgydlIuGOn
 05yvT5xsP6AZcQN8bR7l6X5MKCBrokKLDAJ4OT3Gmx8CJcBP4J1IcTOuY21L8hz4MxwhmB4l
 DTWNmtvKRqU6G6XGJJg2Gbcuy00Sk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] bitbake.conf: remove comment about oldincludedir
Date: Fri, 12 Apr 2024 14:52:32 +0200
Message-Id: <20240412125232.17609-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 12:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198166

From: Peter Marko <peter.marko@siemens.com>

oldincludedir was removed by 506c91cbc6a604a84e37e53ccff430436369802e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/bitbake.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f180d18b0..ba8bd5f975 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -383,8 +383,7 @@ FILESEXTRAPATHS ?= "__default:"
 # the builtin definitions will be used.  Builtin definitions included:
 #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
-#  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
-#  oldincludedir
+#  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
 FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
 
 ##################################################################
-- 
2.30.2



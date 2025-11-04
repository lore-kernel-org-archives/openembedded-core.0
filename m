Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489FECCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 07:38:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12712.1762241910214300838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nn94BTKl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251104073827725a6d43c4000207f4-_8bsbl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251104073827725a6d43c4000207f4
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Nov 2025 08:38:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Svpwu0tX8FxKmLk5Yhil3QkyV0LFgUDVFvCndSp6Eys=;
 b=nn94BTKljabSAdd1ZJfz8+IU26prLfHvTdAM4AYXoqAulFzY8+Y6ZvmhO6byj+Nh7sohvR
 qe7lvQG2SB1TKtOvw9NlIovdr1xu9x7QIloZIFVOpXNYmNQ67w3KbG7T4jPhCDE9SJo2fo6o
 t0HxcSOcOXdqKwXLUA1hlexbJXKeT0i8FoBL/DRImDL6go9wExDGaej+NAWJoim9MVZpSv5u
 TpvaB0V+1gV3EVivVZoqEAPcUzo7rz1xEjAl+CPuKua+RvESyop87DxEflURdglpt4iucFub
 yjGJXrcFc5MRuLdzsS7kfXGnhqfIVRdroq0g2ZhONyGekQHUKBnCJ9/A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [OE-core][PATCH] yocto-bsp/6.17: correct branch name
Date: Tue,  4 Nov 2025 08:38:05 +0100
Message-Id: <20251104073805.8102-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 07:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225711

6.16 in branch name for 6.17 kernel does not look correct.
$ git branch -r --contains 459fdea93914f4db040bd8ebf8bce134a4cd6388
  linux-yocto/v6.17/standard/genericarm64

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
index 51b61b1552..603a967f2a 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
@@ -7,5 +7,5 @@ KMACHINE:beaglebone-yocto ?= "beaglebone"
 KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
-KBRANCH:genericarm64 ?= "v6.16/standard/genericarm64"
+KBRANCH:genericarm64 ?= "v6.17/standard/genericarm64"
 SRCREV_machine:genericarm64 ?= "459fdea93914f4db040bd8ebf8bce134a4cd6388"


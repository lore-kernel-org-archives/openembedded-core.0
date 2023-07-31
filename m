Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67171C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:06:05 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.2244.1690787161847124100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DqvaGEnB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2023073107055848ea3111b72a76b5d5-_952o2@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2023073107055848ea3111b72a76b5d5
        for <openembedded-core@lists.openembedded.org>;
        Mon, 31 Jul 2023 09:05:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=miAhu5vUWKjdaXtBC8nr1Bmo+fTAvNa/iOtv0cs6aEM=;
 b=DqvaGEnBKnGQ/IuL7fvhL9m4GQp3tLoogwK+sAEr0xfAlIj6UEskT7k9Jxbvb20UU6DszA
 /Rwq3GvbT5v/UbG2ovR7ObFdFaezR04o5SN+oDu/hzQJag8QuTbmjQuaezK/j7fJOOEhlXDJ
 uqnpYpzC7d56U4xXGecQXvH+v6Nhk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 2/2] bluez5: correct CVE status of ignored CVEs
Date: Mon, 31 Jul 2023 09:02:32 +0200
Message-Id: <20230731070232.9782-2-peter.marko@siemens.com>
In-Reply-To: <20230731070232.9782-1-peter.marko@siemens.com>
References: <20230731070232.9782-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185122

From: Peter Marko <peter.marko@siemens.com>

Rewrite of CVE_CHECK_IGNORE to CVE_STATUS contained copy+paste
problem changing CVE numbers.

CVE-2020-12352 -> CVE-2022-3563
CVE-2020-24490 -> CVE-2022-3637

CVE-2020-12352 is now for kernel only in NVD BD, so remove it.
CVE-2020-24490 is corrected in this commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.68.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb b/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
index f8405ed091..7c7ad75ed8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
@@ -2,8 +2,7 @@ require bluez5.inc
 
 SRC_URI[sha256sum] = "fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933"
 
-CVE_STATUS[CVE-2022-3563] = "cpe-incorrect: This issues have kernel fixes rather than bluez fixes"
-CVE_STATUS[CVE-2022-3637] = "cpe-incorrect: This issues have kernel fixes rather than bluez fixes"
+CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.30.2



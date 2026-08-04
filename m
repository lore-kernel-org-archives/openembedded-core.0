Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE067C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25349.1785873876529371974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BHZ1yyrf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260804200434f61c882ed90002075a-3nxnbq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260804200434f61c882ed90002075a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=njuGLQs65Arqb7fSe/LWLG8USe1dGe7ldXoCGRBXa50=;
 b=BHZ1yyrfrZwOAvToNTPGKYEnmbsUXoXl3sjQ7gxAdNHsT3I4FkVwtEo0zKs0/7RoRZ20Cy
 D1R5AaptD3x0pFcKqARgQZe6MUUZj9LuecT7OA0blXOTtY+yYW+UNXkJcnRZ/sIM9YNMGPuG
 2C23OwtE6NQUdmbYge2QxZH1S8eWR0aru36kaAWNQtOrHekGdX7vUV9tLX04vjMuCmiwhZWV
 M2pyq3WcGj3YDk0rw55Ia/Vmkgb7SUy20BBu39xDI4UkTAPt6UIyNmepUdzELUCP5QBGDKfg
 56AO7yz/JZszDzDr6Tv8JcQyFMzDzzdlTtfOhIlzGNhvqI54FpmKoosw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 3/6] p11-kit: set status for CVE-2026-13757
Date: Tue,  4 Aug 2026 22:03:53 +0200
Message-ID: <20260804200356.2093270-3-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-1-peter.marko@siemens.com>
References: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242798

From: Peter Marko <peter.marko@siemens.com>

This is a RedHat version-less CVE.
Per [1] this is fixed in 0.26.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13757

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3bb664fbba47febc9c26dd7f7965e508870a023f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index 5a42d0dc50..fde122d3ca 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -44,3 +44,4 @@ BBCLASSEXTEND = "native nativesdk"
 CFLAGS += "-Wno-error=incompatible-pointer-types"
 
 CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"
+CVE_STATUS[CVE-2026-13757] = "fixed-version: fixed since 0.26.3"


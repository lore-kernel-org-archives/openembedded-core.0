Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37702CD98F2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 17:32:09 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.715.1781717522241040162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 10:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IiwbIvDH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260617173200e1444f4cac0002079f-ggubfv@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260617173200e1444f4cac0002079f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 17 Jun 2026 19:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=plJDc5Vrp2NHBz8MIBBm9A4sOURU8tZG+rjJPvxccl8=;
 b=IiwbIvDHi1GovgytVRCzMyJ+xpI2aukBCTGAeathz7ybvdG/g026bmIHMivT8YrSsqrWam
 IriHpbMhKImfiRL0QV1h5CuMXodxKQF5O545J9Hlti/xzttfV/BUff3V954rhqt+8QiC7y3k
 ZxW8oE5/LXJdjN3LvgcCNxpCDTT9nH7Oq0NaHpTnEB1jybAn7DmoDo7XcAhBscqkCSm1t/YO
 LZfinOmOGgiM18Www043a+qagKM2SUeDHB4iMVz+0kZw4O/gAmLmyE14FVXi/G+yCGxOmD62
 OyLyGQYiGNN+/92j2Fwg3+KX+kMCU+0b0LMZEfd9Jw9pCC4UosGE3X0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 2/4] slang: disable pcre packageconfig by default
Date: Wed, 17 Jun 2026 19:31:27 +0200
Message-ID: <20260617173129.1013998-2-peter.marko@siemens.com>
In-Reply-To: <20260617173129.1013998-1-peter.marko@siemens.com>
References: <20260617173129.1013998-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239043

From: Peter Marko <peter.marko@siemens.com>

ibpcre is obsolete project replaced by libpcre2.
It is being removed from oe-core.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/slang/slang_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang_2.3.3.bb b/meta/recipes-extended/slang/slang_2.3.3.bb
index 05b8aff0f2..3f365cb3cf 100644
--- a/meta/recipes-extended/slang/slang_2.3.3.bb
+++ b/meta/recipes-extended/slang/slang_2.3.3.bb
@@ -36,7 +36,7 @@ EXTRA_OECONF = "--without-onig"
 # path. Unset RPATH to stop this.
 EXTRA_OEMAKE = "RPATH=''"
 
-PACKAGECONFIG ??= "pcre"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--with-pcre=${STAGING_DIR_HOST}${prefix},--without-pcre,pcre"
 PACKAGECONFIG[png] = "--with-png=${STAGING_DIR_HOST}${prefix},--without-png,libpng"
 PACKAGECONFIG[zlib] = "--with-z=${STAGING_DIR_HOST}${prefix},--without-z,zlib"


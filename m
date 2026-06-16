Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D665CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:50:16 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6729.1781639412563516453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TBlYY/n6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260616195008a7695155160002079e-hn9v2d@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260616195008a7695155160002079e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 21:50:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=exeiKaWpc0fkNCvspeP7YzyoM7URFqObl8uLdwxnAYs=;
 b=TBlYY/n6icthqsbGME8RZRPmAYmVHjpDV7ij8UH0jQJ0vd91pnr2yjzHg8RMKETBW1W49+
 xRaBBhl5dXfHjlUfjXCZbvCZ8UnXyIzBnau93M6DNqrrinwOpqK3V815VwGGsvilLLtaWMot
 PHNH7cznmdDgun2DYZPchM4SHYdU8lzaRnth5l02SxvgJIGrIXZbSv4Y/HqDi9RnzU0rP0Ua
 zGrbtpvHPs+e7ySroZS/ILPvYoxVUVUKTW77mjRcQKkeYIowqQe+vgPuk7AeVxahwCqJSDwP
 RjT9Dnddy0+y+A0MeyP095+w3G1zkWc3MrEVWfgeWfD0xmLm/9SkMnuQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/3] wget: remove pcre packageconfig option
Date: Tue, 16 Jun 2026 21:49:57 +0200
Message-ID: <20260616194959.3748347-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238958

From: Peter Marko <peter.marko@siemens.com>

libpcre is obsolete project replaced by libpcre2.
Also libpcre2 is the current default packageconfig option.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/wget/wget_1.25.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index f0d3458462..28e27396a4 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -34,7 +34,6 @@ PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
 PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
 PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
-PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 PACKAGECONFIG[pcre2] = "--enable-pcre2,--disable-pcre2,libpcre2"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 


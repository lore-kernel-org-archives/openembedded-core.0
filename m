Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44EEC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:44 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.22404.1672418677096641279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BKpxQDC0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id v3so14508119pgh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWmAjZ211kGEb10fHh00ONRGWpeJGgL7JqKBSYnYGZY=;
        b=BKpxQDC0+ZUxdt/DcF+d3mbfKmbtf0wIv05W4/km2XFzZO8phQbWfbrlTT+FhUjncK
         tSlF8sf9Yr2XA+Yd+lel89gj5D7rprO+nX2dHE34cKfAVBUYHm40Ah8yzNIrR0k8ZaRR
         BNrw1hfHAxNJ7Q81jPUiubpFsJf66qB3CxqPKgg7k8j/VQWYSFZi84t0tuwSvcpszwGi
         kaRBxmXYYEY0yXJ/aKByR278dIw3+EBcA9A+kjkaqcIdERRaPHr8Wwx320cyOhKxvnbK
         ppiExG2kLQ8Ih75iSJPHDNT7u5k7mes+P+9K7Anwjrd1SLLlTMfF3vCAUvDctPZEXcYf
         Gw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWmAjZ211kGEb10fHh00ONRGWpeJGgL7JqKBSYnYGZY=;
        b=lKQvDzB/Cids56STUpb5ss4V35hNT/rF/u69fEfRCnQQFy+9hXAIShInHfFcU1q9J3
         YcGif72gRLVMJ2uuE7sZyaDhyKyOU4WPuEZH/gCWjIEfmzoFYU1qX3WEIHt/sCgPa8Xp
         6uqqjyegzBKE6W7q8ChUIPu31rmGnS7/c1SqdO+1Ak//DMBCWoFV4DE/XiOKREx8l4FL
         cFXJy424kp50a6u/QloUsprCbYz+Trb7zLKx4thTFtxqsfKAK1ZSMrAfyRYITad/03MI
         KBsELh07vFRXcyMUFXC4xWxoCL+2PCOYYqmHgTa05m/OSbh6zW7lP44v65LCpvX5cxeh
         OZxg==
X-Gm-Message-State: AFqh2kqjveOjmYi+BTbJtoN3BdgIP4cXaLHje/JzbMM3YSpTdK4uwimt
	zSnOA+C8J4T2nTP9aL7tyALSDuJ8JXnqqQWo42I=
X-Google-Smtp-Source: AMrXdXsw/5onIKDL/J0W0rZG5oRMpP04CwNer2PRaup4aI57VW13rgUNQ1TfQnFqxrB6epg3L2VGZA==
X-Received: by 2002:a05:6a00:1ca7:b0:56d:1bb6:af75 with SMTP id y39-20020a056a001ca700b0056d1bb6af75mr45930088pfw.4.1672418676112;
        Fri, 30 Dec 2022 08:44:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/22] help2man: upgrade 1.49.2 -> 1.49.3
Date: Fri, 30 Dec 2022 06:44:00 -1000
Message-Id: <e4e90fce7819306e05f4817e526e5ac304a376aa.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175151

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Cleanup whitespace in po-texi/help2man-texi.pot.
  * Add Korean translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6cbe1fa0a3df3496d58788ede4030017edd36a91)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.49.2.bb b/meta/recipes-devtools/help2man/help2man_1.49.3.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.49.2.bb
rename to meta/recipes-devtools/help2man/help2man_1.49.3.bb
index 62e1f67b55..75931a511f 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.2.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9e2e0e213a7e0a36244eed6204d902b6504602a578b6ecd15268b1454deadd36"
+SRC_URI[sha256sum] = "4d7e4fdef2eca6afe07a2682151cea78781e0a4e8f9622142d9f70c083a2fd4f"
 
 inherit autotools
 
-- 
2.25.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CFDC0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.51794.1661624781364166147
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Lx6YRB+9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id y127so4544073pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=m+tWlpDIYgTjfGKyqlemXYiElKqIw576Fyxez1FRcB4=;
        b=Lx6YRB+9MzfQIwKU5KuobevoW/qOUeJTTHeEgirewk/Br00NVIKM/Si8/GcUxaSuJh
         boDMezgkt5seanGGZMj2llprQqflspcJQKLxg+8SHgc5D0gcjlNy8EAsi3NNBBJqPIm2
         zCKtibJalsQ40WidACo4zby1Yem4c0wMO3mJ8TVJi10q/EaEtaf1jPwk+NyCgFP3PnaW
         TML8J/RpK/ecTKG8AGK7xgPBrnffli1nh5RhQVDDOgLpYj7n8NMcy0XyqW7amB1FRcY0
         4RpPd8syAl79BCxTIJ6orn4m6RR32yU+r1nlagYdXIsuFTVV+a2PyAStMUXokMS7/l42
         VqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=m+tWlpDIYgTjfGKyqlemXYiElKqIw576Fyxez1FRcB4=;
        b=4zvNaTUxkNbCEtHODUgW4YJA6kizSgLGyiF4Y80w7iWDEOQ4WkH72gqq1OmL8JcbgG
         5RAsHnRDDuM99yj9vF2fsybY3GyuVe66zAF6ja4zNqevujAzFvgJY83IGEQCBJJXoK2+
         C/ioD+LgVGbZOE4J0g8uMo6tyvmER/4/iRtTCg2mEKtSiSjMsO5N9nbHRUPFfWLW+8dy
         9pZAq0zpoW83FU/SzWqT52FqbLNaYJGUWSi8BkzGU9e3LCHkewOpaRRioKBXiWRXwnwj
         MKFgVNpRqdfOuhi8jMwF3vytYt3pf9WG0ZtdOs00Nvtf+GWO/iKPmdE2QHs3VD7LBa9p
         MJDQ==
X-Gm-Message-State: ACgBeo2IvdblJzhTP0UI/ew3kvY55dHmQGY8NeNbURk1254fZ6bAEj8G
	ERX3dz/gEKtj5yIZbHs1IvYhMCuNQXeEzluM
X-Google-Smtp-Source: 
 AA6agR5S9p8DbXcF9Mnqaa2DbAdHNoUB/Den8gWeWEdB8J6v8hV7IWPtHuxzOhq2x1f1LmHwvS6oIQ==
X-Received: by 2002:a63:564f:0:b0:425:f2cd:d0ce with SMTP id
 g15-20020a63564f000000b00425f2cdd0cemr7740636pgm.143.1661624780462;
        Sat, 27 Aug 2022 11:26:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/24] glib-networking: upgrade 2.72.1 -> 2.72.2
Date: Sat, 27 Aug 2022 08:25:32 -1000
Message-Id: 
 <7ebd4d1585f157394a749f8c78a21ee69510bb51.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169949

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.72.2 - August 5, 2022
=======================

 - Drop environment proxy resolver to lowest priority (#190)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10d01291e67d7308e1758590ac020af24ed0a42f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.1.bb => glib-networking_2.72.2.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
index 41f18d1c48..746d1bc39c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "6fc1bedc8062484dc8a0204965995ef2367c3db5c934058ff1607e5a24d95a74"
+SRC_URI[archive.sha256sum] = "cd2a084c7bb91d78e849fb55d40e472f6d8f6862cddc9f12c39149359ba18268"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.25.1



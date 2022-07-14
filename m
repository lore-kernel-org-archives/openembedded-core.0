Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69343CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.4030.1657773406926155370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cyrrQPJ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 23so490356pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=s+1XNJChUzOPCJRQnxB6gkoxqfC8boz73j3lUm+z11E=;
        b=cyrrQPJ3Wv5+BomivJEvF2y2pIOo5O/V4hm90PjMuf3WnesLu5ILjO1loaJyd4lXqm
         lqk8YsusJ+hlSsk3qq6pPTY8t03rlejttbc8pREW253hOkDzt7K8OIydBS6NTRA82skJ
         aHo/CmpHnHNkPvNDtTaGLc9IaNssGtDwD4/h94wYg/VFrBFYkELcctw7/AYyhORscbWz
         nUhedAcidjLj0Dqdzk5AuuXTV23+bOaTtKxQYvkf99Y3nJdJ7GS9hhDICFTjF4y4KgbA
         j5A8V7RUlcLMokPQRY7SflSMI9U1/EQy+XQgIJzhi6O+CH+zQ8Ml2J0VNYynP3jvkSRm
         xD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+1XNJChUzOPCJRQnxB6gkoxqfC8boz73j3lUm+z11E=;
        b=1RtsSEHEJ94KZiDdiKsgBr8U2nYwlulGTmG8OhN8rvzx5T6/3Oo96/jEJCP5jOCBLq
         v4oMIGyYH5nDQ3JNLTRDsUayWUIqqVn5bDIFOXH1QdlOaadILouXYq/DJvozT83+3onP
         Y198Y8s4L2GnM1sxe+ygaRT6ZKW6oAVOHYzusbcTsfWq+GKcbt9mB+D8rYGc4qYPUskB
         gFQRQd2ROfWj/WgB5F8iPLg5oF7grEevSm5hrN1EKZs29giWYkx8NpxYXPeixYyxjheu
         cMFL5taB4Aw01gHjTFe51VnSgJrP5jznLrLv03LzSWaCcu0cKngalMZNMAB+nMAeVtxH
         AH4Q==
X-Gm-Message-State: AJIora/FKIFbTBH4fIoIQwrEOL783h5aQGjzrhzSJefNQyQ7p8NF9CeL
	e6cjEZdYyXXoTYJl2/ykPJZ8C7ynzYE/GO+B
X-Google-Smtp-Source: 
 AGRyM1tzIJrLYOAFMdOB7VWCUh4FMwWSkzLmQ4AKAZz6ctMwBXt9dNk3MGu0GQOxznqQW5smL0LOkw==
X-Received: by 2002:a63:2bc4:0:b0:419:7b8c:210a with SMTP id
 r187-20020a632bc4000000b004197b8c210amr5985417pgr.439.1657773434663;
        Wed, 13 Jul 2022 21:37:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.37.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:37:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/27] libsoup: upgrade 3.0.6 -> 3.0.7
Date: Wed, 13 Jul 2022 18:35:47 -1000
Message-Id: 
 <a4bfb5ceb5cf8c0c6d27225b27ef10c0b9dceccb.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168024

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes in libsoup from 3.0.6 to 3.0.7:

* Fix leak in SoupAuthNTLM [Milan Crha]
* Fix constructing SoupAuthNTLM objects [Milan Crha]
* Disable mutual negotiation in SoupAuthNegotiate [Michael Catanzaro]
* http2: Do not advertise the `h2` protocool for proxy connections [Carlos Garcia Campos]
* http2: Remove left-over headers when HTTP/1 redirects to HTTP/2 [Carlos Garcia Campos]
* http2: Handle HTTP_1_1_REQUIRED error [Carlos Garcia Campos]
* http2: Read request bodies synchronously for sync requests [Carlos Garcia Campos]
* http2: Properly handle server sending shut down GOAWAY [Carlos Garcia Campos]
* tests: Remove dependency on Apache's PHP module [Carlos Garcia Campos]
* tests: Depend upon Apache's http2 module [Carlos Garcia Campos]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 800e0d32db86dccfe1b54111d01034e4a315cce9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.6.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.6.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 17825ae6a4..59cc4a1d0a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
+SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.25.1



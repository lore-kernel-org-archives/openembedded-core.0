Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D6DC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.22446.1659940965724579115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eISnKftu;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id qn6so2992254ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8l2jKw2RukCY6KJyw3dtJLe5NlZXtMS6hM2lk3zDFlg=;
        b=eISnKftu1HOY1Fz5EgLWMqOq9vKcbtBjG+SmeJidaiMMbasmWYR3jWG1g0tK41KsvS
         BGroHljEVqwnu4vrc7HEOn0iI4GWiBGoCXQZijCxa9SJQH7XNRkSvrjnTa8bx0trqj8t
         +BfWCBeXKmXLwB5C3tHBk3sO4WG4raOUyCZ5oMW9ezpq4p/A+XmkmlYF+/iUT4kjrOJF
         EGSy08L4cCeV6nuS6IQWd7UH0PLnhFM5iw2jboRUCsPgu1voPX76njvzMjDvt5DnG/fT
         1vbE5zg09Ou7df43hnmvQSrTyx5bZpDjhxwLNUkkWhkW9GOzbtOy7iqV730omISrwUYw
         haQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8l2jKw2RukCY6KJyw3dtJLe5NlZXtMS6hM2lk3zDFlg=;
        b=V2+obA/TYQNCWd0aKdj/bK1T1V74hq2QTTHDUCp59PLNgIyiYn14MKetnfJj6T3Znw
         0G8JtqBBjnfYxQYNyOSZSaELU4WV6nGj+AN2plryQTlxFV94mi6NMo7NZ35QBQA4jgof
         Csk2rjcpCayFFJ+RoHrlJP3/gVCSNUj4CxhllXmISxJo5bcDLfv+mf1Qzs001ryiMCZ/
         zqtVYGapzCXe4YlZuLwGND7FafcTWWkpuQuNKA5laX1u8BUfBSJ7dAWrGDMWCP/oP4pg
         hqq+bDGfBUM70qHy2M124HVLNkoWctZHtESwE+j5RtTnam7fLCa7X2ND7iSqoous+C/K
         ZWAw==
X-Gm-Message-State: ACgBeo1geAEz0pqKrg7MJG1KAPPq+fqhLfwa1UCaUAKcZTfxk1dY+nvV
	IhhxZsrxYECT6rvvdG5bCX9c76zo3GI=
X-Google-Smtp-Source: 
 AA6agR4fOmsNA+XCfmAFUN8XS0aAAp801Kj9R8TX2m+7DYme1yptMAaNysA+yMajT0pA2nvasW+3mw==
X-Received: by 2002:a17:907:1361:b0:730:8f59:6434 with SMTP id
 yo1-20020a170907136100b007308f596434mr13103283ejb.745.1659940983039;
        Sun, 07 Aug 2022 23:43:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 25/44] libwebp: upgrade 1.2.2 -> 1.2.3
Date: Mon,  8 Aug 2022 08:42:18 +0200
Message-Id: <20220808064237.3975347-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169049

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webp/{libwebp_1.2.2.bb => libwebp_1.2.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.2.bb => libwebp_1.2.3.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.2.bb b/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.2.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.3.bb
index 281cff1bf2..2d523df749 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6"
+SRC_URI[sha256sum] = "f5d7ab2390b06b8a934a4fc35784291b3885b557780d099bd32f09241f9d83f9"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.30.2



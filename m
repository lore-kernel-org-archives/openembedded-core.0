Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4AC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 08:23:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.58946.1672734226836632637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 00:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/PWPj53;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gh17so71919382ejb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 00:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7x2l41MuRa8uR7OCSZTkd4MNbH6D56E55kIqkULEWI=;
        b=J/PWPj53DEqQjZy0P19wStp2yFp5dF9d+UsuA0PwJ4Wee6BAJEOh+20GGtcnN65LWy
         jBEqiF9NLd0Pnd8+rtbAcpLUCAl89nS4P6tO8qrgUt2yzM+/ZOmXXNAWx1zna5epiIb5
         exCHmng35W60l+A1r3xlHeBz0/d+NO/biZlMIOCHjIdUetT3YY0H9BCdK0zouiPyZ0yV
         c3RwDE7UDlDe7sxqD6CcAK8niAA1HgQhczZR/BWZOSiOb6w1blBDUOmnNkogLwXh2upT
         xjR4YOXpOOTpbfMBg/wSNIDAoqJG8QNTvDlntfVt3QpKHU3ZhQIrD3FLpUeczVdai8RZ
         OaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7x2l41MuRa8uR7OCSZTkd4MNbH6D56E55kIqkULEWI=;
        b=YpzKjHcXXUYcI4CigkVyy+8bhipJSgSVSXEHhRKj6DSTEMsfVeNbDf3A2clfEP0LjK
         6vJtTEyMIndGMT67FUnLJQYUz6OdpTJrM4xl8tObiY+rVpIH6WBhsOvrPo6shAuvlUUg
         DXqA7LNmwsiKJVtmrkga4Yb45JNMWtLa09rEJACQ+7XU4Eql6G392padNWkwSe8d9Fm1
         T2y6c9NIaoaWocr1zJehXGA6bX3Z5oayMqeAq6nsHMqbJ5hhz2CdWNHn2S9nNXsuovY4
         ZP9TgP90w3kRi6E9vorpxDkdA/izbe+OVsN9BY9mczXoY8rfQZR8BL0uqwZIPjaXZNSW
         /6vA==
X-Gm-Message-State: AFqh2kodbN1dEEfGryk9ZMAQ9LHAdfyNNrQICuz2MJxWNNvlI7yU9x1/
	OigV/TAarkSO1wdKKbVo8tspA+BOaxU=
X-Google-Smtp-Source: AMrXdXv9m6kTjsGJrJBs3kufnF8lCfcJNwqbSJ+eeu2G0iG/G4cKLoGbY9KPXMT6EcU6HzObO/DGgw==
X-Received: by 2002:a17:907:8312:b0:7c1:bb4:ea20 with SMTP id mq18-20020a170907831200b007c10bb4ea20mr35548575ejc.71.1672734224080;
        Tue, 03 Jan 2023 00:23:44 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-136-29.ptr.icomera.net. [185.104.136.29])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b0082535e2da13sm13861040ejo.6.2023.01.03.00.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:23:41 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/2] classes: image: Set empty weak default IMAGE_LINGUAS
Date: Tue,  3 Jan 2023 08:23:33 +0000
Message-Id: <20230103082334.288617-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 08:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175337

This is already set in default-distrovars.inc and so this assignment
will almost never succeed. Rather than leaving it to confuse, set an
empty weak default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/classes-recipe/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645503ad..d4bf02784ab0 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -182,8 +182,7 @@ python () {
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
-# some default locales
-IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
+IMAGE_LINGUAS ??= ""
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
-- 
2.39.0



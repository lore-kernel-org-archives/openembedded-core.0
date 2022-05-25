Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAE6C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:26 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.7518.1653489018593534624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PATPTvqz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so1798696pja.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ScUm7isKKO9ZBU1qdcgZx+fNK+hc5jecSezMZpzD2VY=;
        b=PATPTvqzL7Y/R8yHvXjCSM/aqfeH9z0iKjMxmDbxMfn8r6SQrQighwGEoBbW22ScKo
         Uv+XHVG5uXzqichxeSpb0cbB1OwQptBIBbtrd0+xM/GcPtvybzYaHiVzUO7K6+4CCCp6
         9CJgD8OzQcbIkh+r4xK6+akflBALsMy+/5S2De/82cTkWpUhq1s+apTgvw2MNo/8uCcq
         jH7fHOslY4lTQIXu18Wa5sHULSBNgFiaSZ1haaSMq2h9p4daWGVXujDf9apuAolCWSXr
         oQ0xTsDfQuCvdeS75MEcNRAxLmIq/OQCrwhSxOGOFGHRdwrluUApJEqB8+ZGZgb3olzj
         s1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ScUm7isKKO9ZBU1qdcgZx+fNK+hc5jecSezMZpzD2VY=;
        b=vSswaRbdG38zjoEL2LN8QDIeVsw0hn8UNTbx9+I4I9XWJUyukXwRYCsEogzo/OKT7Y
         HBycGMZLty6LQdIeDerYQg/noP4nKbXintR1Hd0tIymOHA2chxjwfUdQzIjykDGqtSQe
         Q9jF8xPxwaMVtAsVrbJq9YdhT8SVtkhue4z5LXd2jCvGUGX4o16X6HJAmCA8uHGylxtt
         n4hLbEDB6uz9pH+EUBvpajFETONIrw9Wa58TsW5HX8ofxV4f1FWSDlo8GYsh9lSvhfqr
         5mXL7t43X57j0JsbvOkimB0TRpUYwgdqExrvw7lRP7hxGYnELuPBegCBukQpChwHriIW
         j87Q==
X-Gm-Message-State: AOAM531xgUl5dBAkE4pmAjjc86A6lbKiiLTGp8hRH2HGk5m7EpBv6EJa
	OK+DxW1pSLxAIlP7UftbjotCcK6MRtCQadxx
X-Google-Smtp-Source: 
 ABdhPJzf15Lf+75PY3lzYN03yeZdwNhGvTxvWODDXo0GYgl7ISlhIZ08xbzPGKHmP2zIRNJ5549/iw==
X-Received: by 2002:a17:902:e749:b0:163:59da:56f0 with SMTP id
 p9-20020a170902e74900b0016359da56f0mr3462978plf.116.1653489017357;
        Wed, 25 May 2022 07:30:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] gstreamer1.0-omx: upgrade 1.20.1 -> 1.20.2
Date: Wed, 25 May 2022 04:29:34 -1000
Message-Id: 
 <2f8bf9e800e5fa893c89cd4d8b9a63f02db842b1.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166132

From: Alexander Kanavin <alex.kanavin@gmail.com>

No changes in omx from 1.20.1 -> 1.20.2

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f9b5b0d8274b5a4990c93edb30c3170de3f87a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
index 835f9a31fd..c4f5d719bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
+SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.25.1



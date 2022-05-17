Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEC1C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.1143.1652811910779712294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3eMqxxYg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d22so18075548plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IZjaBBzVHU7aCDZilD6ORjRw01n+gOQIxDI86Zu1NCA=;
        b=3eMqxxYgV3kZnVGxTms/Z+A4xFLe13qcvBnMj1zVaAzRyiBzgxxsCxZG9Ij+zO5BUx
         gCvJFqxSTYvqMJSfE5JjJV/ocDAo9mDoBT5takOA1FIyRSuRcp0dJ23y5dR0vbEZJn8+
         aJ/I800/3AxkJ2HvGqGuH2jgVmtbeRz8u+pJDoWgz773jhGSmrQXcOQX2HPHQKBt6pUZ
         6A7IGYh06wAFzDV1iMr1hJxe+KxGsW8iumCR9vYem1FHSwjzAHu1kHuGJBFi6xdSUexT
         Xl/6RQL0DwBu20yGDtVQ1w9e9sikQrEGNOQayPCDBbQriD7TERxr9lc/eo4mep+LuYb7
         v2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZjaBBzVHU7aCDZilD6ORjRw01n+gOQIxDI86Zu1NCA=;
        b=0afx2Z8T/Ttu10DTI22NkHn5bv5FSvigJTM15hXmB7f3F3iGEDTwmf8HL7tL3T2cLe
         cRH/5aN7MDLAo4VBSvMQtPlqgLUXqtjvaDc3NzdrKeeoKqOLvapTrfdgDJ2WBqYSQggm
         4uRYnMyLZKNLf+UlOWZhKZdZ6MNBoZGXPJ/zae0NaMX+D15hV+fe2nP9hjLSHnWfMMEo
         G9u5QxWSlVysVmjAbF51qcnPYC/m4bLhtz2CXkyFX5pyVClLyM1NU66+//LFTyZb7R31
         xYIN0QrYem/UBpSUuQ+jlhArVVMjSvdxLi3jNswrPxqqPkiAyTAibiprywxy4cQCRU6x
         ccaQ==
X-Gm-Message-State: AOAM530eI4GupAfoCspXNjk+rLFGprS8KZZ/7jOK6ZcoCIgRSf4gnMPQ
	5n5AjSHyN5y1k3t8aoqSxkmkpYC40i9CubDV
X-Google-Smtp-Source: 
 ABdhPJyN+EthWGAu75WxxiyzsHnSW2X7A/jLv1GMtrVTsgi6wfJOdK2ZdJ/aP/j34WzjbqzXDfaJGw==
X-Received: by 2002:a17:903:2286:b0:161:afab:f47d with SMTP id
 b6-20020a170903228600b00161afabf47dmr3128512plh.113.1652811909607;
        Tue, 17 May 2022 11:25:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/31] libinput: upgrade 1.19.3 -> 1.19.4
Date: Tue, 17 May 2022 08:24:00 -1000
Message-Id: 
 <25b4ce85da67584e34194335e56bdcb4c8f083fa.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165759

From: Alexander Kanavin <alex.kanavin@gmail.com>

libinput 1.19.4 fixes CVE-2022-1215 with a format string vulnerability

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d32d51753aadf6c2747c79927dad0c9a044ad5df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.3.bb b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.4.bb
index a7f13240d5..a7d0c4be69 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068"
+SRC_URI[sha256sum] = "ff33a570b5a936c81e6c08389a8581c2665311d026ce3d225c88d09c49f9b440"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1



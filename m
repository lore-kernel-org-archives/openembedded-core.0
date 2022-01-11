Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45C3C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 17:04:35 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.10436.1641920674825203449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Mz9KCWvT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id o12so58719363lfk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/arFpAYMywMEZldPT4BYnfSBTAdrYTP4tIGinZWF3g=;
        b=Mz9KCWvTm4yl/IUvH1iUO7uDeWSv+Li0XNEALAmsIKJMs1GquUhABB0ar95YQqdBBt
         ZMuBFhdoHvbNIWocmWk/hWdkbFWgmH8G01yMtpFENY/gcDyk7NcR+UUOQvGxnaS+r/RS
         srllQQ3PfCkDqql60wrs62FdIeXHoFyF3xtHrWAu/IZ/J+4q7tmL8AtJ/25ltj8sUPZF
         K5Bm/0Q5w5HvSj6HcQhNuYrQdihfVyKxcNWnLmCv6qqg0N0DQpcrS6eWNY86a9eVbg3O
         2JauU5NL7stMBtmHGwP1HCqg94hYC0YixC5v3HK3YJ9Tslht7i2t5bmAWod6xg+Bwzjv
         a7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/arFpAYMywMEZldPT4BYnfSBTAdrYTP4tIGinZWF3g=;
        b=tWxHKORUnItUTgl4iXiHRIRHEpRnATVsf+20rx92WhvX/Qrfs16aFdyNsJf32OmRxp
         loUKCxUsDz/UD+VT/nOKXskEjoGDCgHFKMO1LIa7z8Zyw/OpY3PAwgEPSDuFCECFLL2x
         IrXg9nFjnwTzGpWZz56BnhI6FM17/BH+6y0tW2aHpVwQa2bYr6bq21zKxV7GiB3a/VYl
         16VmhVOs2l6xOXGgXlzUIxdc7gkrhEIGaGXjsJaeXQGnmFjo6nBqIJ+NlN1nfqUJj6SW
         W8IxWdogzigxXqs1PMpoZkmy/B5o/Wm2KzTxOhkzwkHggpX6aXlLBFtOHBD75m9HX+KR
         kNZQ==
X-Gm-Message-State: AOAM532o5Bqzy+wG/oFM7CnyQkCFV1wamM6ejDCy6P2Q9sKP7xAFoUVu
	y33PCGu4hSQg9FAtTKvjwJ8rSBhwUZC5+jQn
X-Google-Smtp-Source: 
 ABdhPJzUSvXT3GmTji/hToxVe9pGurB9M6zECcwDJ5KmGDgqwVRPY/nC9PnBrpEFbMJMpwGmJ4ns+Q==
X-Received: by 2002:a05:6512:2350:: with SMTP id
 p16mr3983426lfu.107.1641920672448;
        Tue, 11 Jan 2022 09:04:32 -0800 (PST)
Received: from localhost.localdomain ([78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 h3sm1390348lfu.65.2022.01.11.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:04:31 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ofono: update to 1.34
Date: Tue, 11 Jan 2022 18:04:22 +0100
Message-Id: <20220111170422.1904561-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 17:04:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160421

Changelog:
- Fix issue with handling device info of Quectel modems.
- Fix issue with handling callback for RIL dial manager.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-connectivity/ofono/{ofono_1.33.bb => ofono_1.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.33.bb => ofono_1.34.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.33.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_1.33.bb
rename to meta/recipes-connectivity/ofono/ofono_1.34.bb
index 1fab90c08e..24369b3ba5 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.33.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "e4591c5353ad2069cb9c0861fad3f1bf655137f9785fc5f16151d509e49ba708"
+SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.25.1



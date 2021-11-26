Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42173C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 11:08:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.22649.1637924935314219610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 03:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LRhOX1D2;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id l16so17822286wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuFcsMdXNnrTBeCVv9AHs/twarmyxr9Z2S95khHZXv4=;
        b=LRhOX1D2sdp3Wtfu4jk9EYePOunkiiQs4rNyFvRF1skHQZuqi9u2h/JPEsLHdAR2IR
         3aEN8ulE0yBqOWnHXM6apBbZj19G6kTlbZ5lUqPjPHahe4WqgYCJKkS1KZhdFeng/hBv
         zns7nnRbKlUgw7/NlIk9w1RNM7amk2y26K3M+wI/WBwEqkz2DzkzrKJ6GHoZrhgFKqup
         pXVHQo3XUlEmbc5gi9nDU6SIvAYKq4rYRpqYlbHtRzDcHpPxl7DtJr9FV355ihNwOh3L
         XuU9pjhqFVOpJv8rVvjFlQrj72/FodPhYbEEj/LrYYlzXyVUPZAyAXduplfa37QP9K15
         Olrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuFcsMdXNnrTBeCVv9AHs/twarmyxr9Z2S95khHZXv4=;
        b=HjVirTqEu5tLLNPNPFA/pyd35DPlwTLYurTX5IiJoPiqXoKRdzH66lvvy8TQWmCj8+
         3ZT3qLE3+6GbJ44pKUiOpgir7UcmoGchdp0wisFjHWFLCDKxDnafSlcXRkhcmdLq8uCc
         IMhwPFIvWu6F9S6nsUOZTUGITgTw2dCVR9hN1IAbYSy+mSpF+nia5lHI0lqta5uhnY2X
         2i5uWxuI2gOQzdp89SsHqE1fkixkuQQTKXIFzw18Dmtp/Pl0YpS11xUgPkAfTlKD4+dI
         V/Gd4KbA4IyL9HFEeYuwCHYbBjT4nuQmVZs4p2y1WRvSS79sAF0ZXYexHRr8s0iZslwE
         nFuA==
X-Gm-Message-State: AOAM530CyPDkOGErdZj0vcy994s653SlGBDvaNMXMCt9QqFMqWMbklxa
	FclbiWi9nbHeCyOYDTN5uvoKquS1kf0=
X-Google-Smtp-Source: 
 ABdhPJzcBJRTKaWbnnYeWZw2y4lzMPPe7U/pvxrN4QYgZfkJd15heHd1HfN/kkiKmxY9O1cZ/P/h3g==
X-Received: by 2002:adf:a444:: with SMTP id e4mr13216564wra.341.1637924932245;
        Fri, 26 Nov 2021 03:08:52 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.139])
        by smtp.gmail.com with ESMTPSA id
 p8sm5424791wrx.25.2021.11.26.03.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:08:51 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@huawei.com>
To: openembedded-core@lists.openembedded.org,
	timothy.t.orling@intel.com,
	steve@sakoman.com
Cc: Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [oe-core][dunfell][PATCH] python3: upgrade 3.8.11 -> 3.8.12
Date: Fri, 26 Nov 2021 12:08:41 +0100
Message-Id: <20211126110841.10678-1-marta.rybczynska@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 11:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158829

Release Date: Aug. 30, 2021

This is a security release of Python 3.8

Note: The release you're looking at is Python 3.8.12, a security bugfix release
for the legacy 3.8 series. Python 3.10 is now the latest feature release series
of Python 3. Get the latest release of 3.10.x here.

Security content in this release contains four fixes. There are also four
additional fixes for bugs that might have lead to denial-of-service attacks.
Finally, while we're not providing binary installers anymore, for those users
who produce installers, we upgraded the OpenSSL version used to 1.1.1l.
Take a look at the change log for details.

According to the release calendar specified in PEP 569, Python 3.8 is now in the
"security fixes only" stage of its life cycle: 3.8 branch only accepts security
fixes and releases of those are made irregularly in source-only form until
October 2024. Python 3.8 isn't receiving regular bug fixes anymore, and binary
installers are no longer provided for it. Python 3.8.10 was the last full bugfix
release of Python 3.8 with binary installers.

This release includes a fix for CVE-2021-29921.

References:
https://docs.python.org/release/3.8.12/whatsnew/changelog.html#changelog

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../python/{python3_3.8.11.bb => python3_3.8.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.11.bb => python3_3.8.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.11.bb b/meta/recipes-devtools/python/python3_3.8.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.11.bb
rename to meta/recipes-devtools/python/python3_3.8.12.bb
index 2a2472b3d0..cfcc91b396 100644
--- a/meta/recipes-devtools/python/python3_3.8.11.bb
+++ b/meta/recipes-devtools/python/python3_3.8.12.bb
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "5840ba601128f48fee4e7c98fbdac65d"
-SRC_URI[sha256sum] = "fb1a1114ebfe9e97199603c6083e20b236a0e007a2c51f29283ffb50c1420fb2"
+SRC_URI[md5sum] = "9dd8f82e586b776383c82e27923f8795"
+SRC_URI[sha256sum] = "b1d3a76420375343b5e8a22fceb1ac65b77193e9ed27146524f0a9db058728ea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.0



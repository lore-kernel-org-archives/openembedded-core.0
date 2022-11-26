Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1880BC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:46 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.70833.1669472139860172956
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kT5WqsM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id ci10so5798808pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcxHPgaNjKahUfzG2fr9+FwwbMUmAHtMvI8TsZ1IzeM=;
        b=kT5WqsM0Fy6hEKYyjGIn4wPuzCEvhEFlJKadcpjzGTAPo4SWkvWUC/fCMBCqhuk8Gg
         QR0c02pox6myY5+oObYtPDTT8CSOS04JEvEmafU3CmkUW8uOKUepKnGo3glR8Os/3k8r
         fFKgjhIwEMOQeKLCf7dwSsw4+764uBBohwPTOpzGNQnVTNYuoOG7LHWPYWvUlpmLh16G
         Ak0/JxD8JM1DXmxljcQ9p2WtJGwjaaIFoz+YCiMxSbn6CxAYspYHAm2EPIotiH9Xuqe7
         powRHbTsGvbhrH1eXhpbNiC1H6t/3UpsYHHGcK3d6EzMDtkGOLT5jHfmT2LM9dfc1NZC
         VZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcxHPgaNjKahUfzG2fr9+FwwbMUmAHtMvI8TsZ1IzeM=;
        b=IFz0vK8j8YY7suqysbPRl1JZeNr2zPFuPJxbJl28y6mCbGa5XsdTmu+vI05ijajKIw
         fJj40xYJUgBfzsg2UqcM0mX5oY9Me/cuz72fNPa1BC9DB6RXbYVne7QA9ObJFrJX22VT
         42SvHG6nQFLF/63RFytGHUUohcKoQhJR2Id5VOcy8TShe8V8owUZP//L9ax7r/5yMeNd
         QSPSi7XHeEMvNWuH45Ppo9OFehIzvTcvSZZpGvqpk5tns3OGjwL+gEmKF766dSPWE73e
         0f6aqweS7MfITt6qvtxgwy75qcbafsOI9R7Y5JAeq5Mc/SYbAUykOcom13Flahymia1s
         nf0g==
X-Gm-Message-State: ANoB5pmha7+1xlrQa1SLNnYmLQ4Z9Za5i1IhXpEeosQ8jArjcsYmGGF2
	ioJqRjlEHv3FbgNzxTzdXj3D4MzjHYqj1umfwjI=
X-Google-Smtp-Source: AA0mqf770v0tK/XvHTJeZd3bnS9E6FASn7+0EEsgzUcMgUdWqrgzTlSGnh/bqFfucN8tHxLlhPBh4w==
X-Received: by 2002:a17:90a:1950:b0:20d:2f:709d with SMTP id 16-20020a17090a195000b0020d002f709dmr51618550pjh.40.1669472140947;
        Sat, 26 Nov 2022 06:15:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/37] libepoxy: update 1.5.9 -> 1.5.10
Date: Sat, 26 Nov 2022 04:14:20 -1000
Message-Id: <e411248bcee0265ffa83e91249895beab3dfad15.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173809

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes since 1.5.9
- Fix for building with MSVC on non-English locale [Seungha Yang]
- Fix build on Android [Caolán McNamara]
- Add the right include paths for EGL and X11 headers [Alex Richardson]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 436cb3c98c582e17e6ed2491cc6598c56976af46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} (95%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
similarity index 95%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
index b3b26b57fe..d10134568a 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+SRCREV = "c84bc9459357a40e46e2fec0408d04fbdde2c973"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check github-releases
-- 
2.25.1



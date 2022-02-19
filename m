Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132C4C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14270.1645301747885971232
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZucW3nM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c192so7263697wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JByDAlk2TzLT6wNYC9+WpZwSweqcd/agVL3P6LKXf2o=;
        b=EZucW3nMYFwjBU5AEDESRwFzHJNvcyScuQP2qsSUGgv6Wbr9DAxvgAG/NIVpJjn36l
         IZqE21SUMRWgsOGqBvbnSoGpBI6UvX2P0MGC5/0prYjJg1Purj0bHaE2/TwjST/8oyk5
         ug+wSlZd6cmP8L52JzPkp6vChWA4wku3TQwFik9rKF4WEXBBQtqvoduizbB4j6CUiad2
         8UzSNjiIZs+uRxIN7ehUnccYLWlF5RK9TN5rAQc61ZSuxwVRH5XUzXM9cxnlSQsvsC2a
         m+GmBkSnPQ80PdsFHCeH29DgY7vd9XuRaDnfZhooVCWKQrOfBH/N4s1qNO3cdzoQpsMu
         Euxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JByDAlk2TzLT6wNYC9+WpZwSweqcd/agVL3P6LKXf2o=;
        b=zRj7OXyS005u4Pm8fCs1GjoI9g0kpx51CYLrfPeVXXFbW1Oh2uXiBqqMptO1jey7WB
         bKoFMBY81NSIkezciPghOOV+kHtIb1G4Y2ERnselzDX5Hq8Iu+N6YX9WrAitmKsuahGg
         q1oBhDGiyWeGfkMZ4tn/ZErVv3sKKy4VSPljqbatEDtpYotozZwuY1sxcq4dX2ub1X3x
         wUdAbPBNAuMJc+mFpXSDzOmLSBobLbOgtuYYerUFZ1wZHHoIPRklonymDtWKa8KiFncU
         7HIwZCLMydBPyxot1xBHM5YzsN8TK9C4IqwNBeswcEswJKwYrs6qIf9pxwpRD5JTdHaX
         Hhow==
X-Gm-Message-State: AOAM532HFZOzWohYXPcDaeBNlPJpBNplS1MWVd3QxMH7gQ8SXvnRvskO
	Oi1gqanA4m+jdUZo0YrdHoxRGXGmN+Y=
X-Google-Smtp-Source: 
 ABdhPJzCmVyP+IxEUibxw8wikkWOTZtvH2LhPEAizGZ8RTto0OJfGfa3QWcKoOJq//QBFYMCIsQh5A==
X-Received: by 2002:a05:600c:1988:b0:37c:505:d45c with SMTP id
 t8-20020a05600c198800b0037c0505d45cmr12039933wmq.107.1645301746075;
        Sat, 19 Feb 2022 12:15:46 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:45 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5
 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:04 +0000
Message-Id: <20220219201514.1551306-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161966

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
index 5e2cca3864..e20145ea8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
+SRC_URI[sha256sum] = "56a9ff2fe9e6603b9e658cf6897d412a173d2180829fe01e92568549c6bd0f5b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.35.1



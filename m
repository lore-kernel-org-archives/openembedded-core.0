Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.27300.1603635837734285818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m5bqs0SL;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id y12so9574972wrp.6
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lnHvJTsy+gM+PkdyoM0ierp6fJh0315CjRTVITjz6UU=;
        b=m5bqs0SLNEsiCvRKuY8rGunnYfzJVlzuop32BHS4fOpJgXX3bTGeK7nK5S/YGQeHv3
         Z2Y9rI+8+nV+KEWBgYMSQvkOIqtpkK+3Piuve8pjupsNh9Z6hfz4kHveuqJofkC4onSg
         fE8zJq+mHqbWlPgWS/B49/xk4XTvPjElQVS7SRMh6CK3vHInY90Wvg79OPIXQCmv7P8X
         9if8bgHEtzNGbt5f0umm10xQESZ18vuoZTnOwdZNms/7AF1VC2NGclCfkc4L6P/Yrpw/
         2f0C4smoADeBRKkfznU/1uEzH9/K15wxFtr45rUU1iMARjJpcfGqV1J0P1Rt6gCeN3Mn
         rj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lnHvJTsy+gM+PkdyoM0ierp6fJh0315CjRTVITjz6UU=;
        b=PEjHPZPfdAvP9hKV+9lkzX3kzjDGehbSyGkkxPSa4yTkpuk04SMt7ib55R5tAGfD2J
         uzfeJSdUxATb5XRpeBOuaRUcDovDHd3uWqQIl26r9jN5RNW9vtb79IhkQZIVmrrYpYeb
         7iBx76eKHZ0c1jsbtVtCxQKKy6qwHi15ZmuN1WgjMmNyO3t30dxO3F1JiZBscZlatzsG
         1LXY9hzBwac3oFbmtme8HYnZPhzNdoivAThzANhak1fAC4J/SdPc9ouXwAvmWY/1jEDI
         WnrhgyGt6XcpCr19izIPQiNWP2oL6Jj07NZ8CD7vI7FL6E6XN+mQ2xURtwWqOhk/NRtO
         LEFQ==
X-Gm-Message-State: AOAM532d+Qk9M68woGiw3Ye8myr0ZupsIKnJfdBU4z/P+4g3gQ9SAVAo
	ux0h1Ft55sKc9E7zy6Aex7VkiEplyjaxvQ==
X-Google-Smtp-Source: ABdhPJwTkpQhS6bxJosG+LB4mammaWihn32U8/gBkd30IfEbV+m9g3NRqbqDdlc2lPt+/lVIF5M3Yg==
X-Received: by 2002:adf:92e4:: with SMTP id 91mr12880405wrn.230.1603635835860;
        Sun, 25 Oct 2020 07:23:55 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:55 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 02/12] gstreamer1.0: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:43 +0000
Message-Id: <20201025142353.1929717-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 9d92fe1439..66ad3e3381 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,8 +22,8 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
 "
-SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
-SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
+SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
+SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.0


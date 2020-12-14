Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.35815.1607956680781379039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=O3bKGUgJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id f9so12149735pfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zvIqJksPAIKrFOg3tnDVzFNXN/IoVJGYl0q2g786wgA=;
        b=O3bKGUgJIlWa/SXCkvscKu+SMq3f5HrulyAGpSTyfPXiAz/c8a41XsLSzf9iiz/1gg
         tb5FpCp3vVPRxeI0Cznn31w73Cd5adEF7VXb+TBcMN/iEEnr1yl+L0lWHaWBHPm/zaSH
         QxMQ3C++chV+wlS3uGFnxFPMF61vdXfqadKBIEqzrzYYgD5wgeGUtcgLI3/ywOfrL0y2
         TbnuPCG//aYu9hzBC4u/LPeZnbO55ZGvjZFZ5rn37a1evGOiEu7yZzW6Knx3pyR+xZGc
         U7p0XDXr//ACVL581va72o9QFMdpRziUOU/UzLof95HAN9/9lw9QvgDqLqMH/yVulHFo
         lABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zvIqJksPAIKrFOg3tnDVzFNXN/IoVJGYl0q2g786wgA=;
        b=YF8zcVKQI3u5kipxEQEoHGkJICmf5buaYBpUubJ/Edx1Sms3eI7PxRrkaIsgIHCmz8
         oSImNtWkryyCsWcClBySEI7MfJe/G8IqzSwmkRdLF7TYAKxbMSycBtU9vI4vKSnYjInC
         cBO2QKzFDQWnNlev70pyQWfXfoX9b4sl/p34jFBULEWbBitWo86UP1tZ6H/R4ObmjPFl
         NifRRHRaq6GtiTSa1k23uR5hG98hpGz/0GkVpbtropmCfc05ExGP2Me4trbYWp+vqINR
         4iFhaxrxFZ4zJMtIaPbPU5xh4ICGIPm7f30g0M4dGKB0957Je3ENXs6kRma72x2bBd9b
         4Gfg==
X-Gm-Message-State: AOAM530f/NmnM0TBRQmn8ZZv8KvvewRcqE3MOEyJZlyYP9EQXChiqi7G
	K77TJx6GO6unYPWq16NY2ylAXEZVnziNsqUo
X-Google-Smtp-Source: ABdhPJyf6tHnbAOshP9QbIzcEDjePgpgROg9u4c1+2u6ge3PdZUqIuJChKHqWyFMUbOfDWLlXMt32g==
X-Received: by 2002:a63:5804:: with SMTP id m4mr24522366pgb.137.1607956679870;
        Mon, 14 Dec 2020 06:37:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/25] webkitgtk: fix reproducibility
Date: Mon, 14 Dec 2020 04:36:47 -1000
Message-Id: <ea8fc9c19e6fd35fc6cb561ff03fd15dd1b064e0.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e7c673ab8d14766190843c6d8747510b37c71bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index 9cfec83ec7..cf6b2ffae7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -131,3 +131,15 @@ GI_DATA_ENABLED_libc-musl_armv7ve = "False"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/DerivedSources/webkit2gtk/webkit2/*.cpp \
+            ${B}/DerivedSources/ForwardingHeaders/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/yarr/*.h \
+            ${B}/DerivedSources/MiniBrowser/*.c
+}
+
-- 
2.17.1


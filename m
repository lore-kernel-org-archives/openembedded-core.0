Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.197579.1598282125419863982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wJqtEg5u;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id h2so4384939plr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CCRqEYfHIwcbq463dx/U85ykESSNLFnkj4QyMOTJJZY=;
        b=wJqtEg5uGxO+BI2jGzfaJ3vxGvAss6fBgwE0fzJPTsMBD7WXLAj3HKodb2C0iClBON
         Doj/Lt9zxDl2sEjwqOpvj8vPBz6QGwO9ZFo8sAsBphdxULx0jLKXgai24dfNabkvfC2N
         nPDNb57fCLxQkr+r4yG0qIqmZO+jOx5HZrJJja/Ql7Br5CyClRodrsDkip3Cwu22nejH
         i7KdmBJeXaEh3hoVNAF9uoPPqEb/86xbKGucKCKoX97SwuCJytlXb0+ZbK0heRDj2cGQ
         hlSPklSqOVpsLqROjhuKhOeQ/Tof20deMXD7NOmmaHEzZ6NmY/7hwti5wit8ZKkRGNMd
         M+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CCRqEYfHIwcbq463dx/U85ykESSNLFnkj4QyMOTJJZY=;
        b=rzMyvH2Qbk/S76O+z6cqf3pb4Ci99tCgOcjoNVE9xsh4lc8qtuPZRzSENBary9KmgX
         EqyQlCX//WvsQ/zmXkv+avbBgFmj5rpQqDeZeyxWyIkqVCJQ2+MF+teKv9xtKpDQ9ucR
         KPKfV66uoITNMEUbwbeksG61XbXM+O0mFY1KnhvgxxRQRrQ7pWnCLIH3P1CPhHqNysO9
         GleLEx68wxJ1i/tQVzgdXIgKsPe5x3i/RzHG+tfnaUnkDTbd3YL42QS9p0v4nFqWsqgs
         mh9PXUNm07M1JXIpl6PFV6rFR582vhJIJEyGkDIZKvB4WOh987zXbqOQGkVwy4RyHUWM
         RdBw==
X-Gm-Message-State: AOAM53058SDTer9zqDmOxsbf993KU+6xMhFajGTqsVn3Lhp5v2L5gKH+
	X81oDVEicCVOiEHuk7HRN0RoDdNfxhOC1M/tfaE=
X-Google-Smtp-Source: ABdhPJyDQloZeCD4WVourUW86Y8wKD200tu/h8kkjmst2PXgGuxynihqf2YC/eDdKrfH70Mf4xc58g==
X-Received: by 2002:a17:90a:c505:: with SMTP id k5mr4845416pjt.188.1598282123603;
        Mon, 24 Aug 2020 08:15:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] fribidi: extend CVE_PRODUCT to include fribidi
Date: Mon, 24 Aug 2020 05:14:51 -1000
Message-Id: <e6e40f16e66e8720cd7c6f67f4328936967d3ee9.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

For example, CVE-2019-18397 uses fribidi instead gnu_fribidi.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa5d0f2c61a704436d71e5f02042fa8b2940f541)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/fribidi/fribidi_1.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
index 21217aba5e..0654b07dc7 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
@@ -12,6 +12,6 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
 inherit meson lib_package pkgconfig
 
-CVE_PRODUCT = "gnu_fribidi"
+CVE_PRODUCT = "gnu_fribidi fribidi"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.2573.1615661414421232244
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WiZCW0kp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id f8so5144847otp.8
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O5n67NeLHjlud9G+gv5F0EOJP5GiZcaBYF69nIbMuMk=;
        b=WiZCW0kpKv02Oq70/jMyaVs1/OW6pOw1urzJvfVAwsMbXVdB1uGTCpPbug3brbBFgU
         r4u6nPuhBsWFO5CpaAr1sVdlfhdxF7dUrSVseOVQroC0cpENYNyaQlDYiVgNizGdIAHt
         yof5n97yytga25OMG0ALsEdbWGNofPxafhkea76sfO61Et9x06vYWDv5AFYDzALnsolT
         TkHBjKaQO0sZItSIefaeheUFDbvV0eSDE0pcgT3cDyA+qoZmMiR9YBrVIofBfzmxxn/f
         65VwwS0zfqxbIwfm+BZ4NBIH9enQ2V/iIKfW3AhKp0xxqLL2gKeEKxyTei6mrWEPKKJc
         GCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5n67NeLHjlud9G+gv5F0EOJP5GiZcaBYF69nIbMuMk=;
        b=AJ8hkCfqRyIzctYvMFrU4oe2iov2CMrjhg8u4WWAgPhLZhfyi3VlqjrupY5D1OnzRK
         iuga5hVM/wg84a0WRWwEhHZHiCS3fG5UmjLoOZ/2nJpsgEdKg72mTtXdHMPQtT7OiZ1P
         Gcom6/6h5X2LFT6lHNo+CE0441BY0ebQDzpeZsqJ8rDNfoyGwc/xuMXxkkyGC2ZRNGxT
         5JZytzje38EgkUKbimi2ViY6bwU7Lnori9CoDQUvzet5oRm7WPyEcl6pbwXTnWsqqBPh
         QDy2R/XbrGn5P0C+YaJNgaSi8BUnEX/2vOw9NhVbu/1NOiJBRyj13RW3CUGNXo6RzQhy
         //ww==
X-Gm-Message-State: AOAM533mFAJ+RrPFmyT4M2LokUdEFtPS+FEFrhOofJWK9gB+fk1ayWjp
	f0htThHryC0vC0Dd077CO7s80G0hq7ifdW9L
X-Google-Smtp-Source: ABdhPJzT4MlqI5+PJUEUWrD3Ami4fnChppriTgY8bhxJkYjDtyTRdh6SoNljfOG5bSnh4ebl9NVbPQ==
X-Received: by 2002:a9d:68c1:: with SMTP id i1mr7956526oto.169.1615661413343;
        Sat, 13 Mar 2021 10:50:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/38] python3-jinja2: set CVE_PRODUCT
Date: Sat, 13 Mar 2021 08:48:53 -1000
Message-Id: <af50558e2505f2e96bd213cd45bcdd5d33161b77.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Set CVE_PRODUCT for more accurate CVE scanning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aefcc7a7dd012530ed846292caaed70d20589a3a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
index 89538d2f27..9d0666a5c1 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c65
 
 PYPI_PACKAGE = "Jinja2"
 
+CVE_PRODUCT = "jinja2 jinja"
+
 CLEANBROKEN = "1"
 
 inherit pypi setuptools3
-- 
2.25.1


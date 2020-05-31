Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.17617.1590940416041784907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CJ8cft8D;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w7so1749204edt.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hf70UEMLACQWA+jCMEVd0pBZINMQqxfX6uDu/rMkOks=;
        b=CJ8cft8DqNcUJ1Y/KENPgb3aqM09NSNPLAhxKZe+0KL8jN6zx4c0RvhhBCErUrRp2Z
         dIi87GdDSU+GN0lpBOSJovLFMG/FJKHFsukrFHMEfgH8lx80iL/QAhXNuu4c/Ytfc82y
         hag36wXt50NGFywc6dKNlH+LMvQG1HQKb2LBDCR10SQiula/LOAV+/wxdHY8yJCSkBB2
         Y7fgJUbyGfx9MYm9TxAZZkwEAeNTn6ywznQ3v5RhkASYpq/vYezWAN9TbaH5W+Fbdgf0
         uBAxSNqboBgaWHVHuSvLxBXKQqQ0r95mqC6n7r8exKpbpqTXJV7ajNgHYKadJn/0+Enb
         516w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hf70UEMLACQWA+jCMEVd0pBZINMQqxfX6uDu/rMkOks=;
        b=kP0igikP5SCSo5W6PeJKPH04w3sO1UjYNOCMyC+qcCutfiyBiasPS5CHo5fVQTiaAk
         otfje9BjeHYWqmwD47uu6DvCf/mDQ2knCeWzKsI06kn1tMpAzn8w7j+LTqzH3wgZAJF2
         ufzbgqsrbCSRcGPu0aqrO61sUKb5K9hluJX0q6R1F7z9o7+9aNl+mE+5lVDIhkti3lMa
         XAGuEkbQtvyEcaopj2zjudO4nSxVdlSltcZJzmJ83/Bz0Lc+azZIOL7xI9xoZ16RP3If
         sE3hhW3B+l363/8H/i4vqKijD7XIkFz5JnRJ3TWkEg9O9IPyPQKqcvaL0qPnaX2CIRd6
         Ka+A==
X-Gm-Message-State: AOAM5302cptHx1oFfzEXKsIlxGOfO+DVKsRJJS8xgQHIQQ8AKAycY9xF
	Mqd22EbHGgdcFjizWH4btlGiszLd
X-Google-Smtp-Source: ABdhPJw4rcAGGY5RNac25oEF1bpkFjB9r4Fhsg5w6J/2BlLfSeKqM40gcnTpf9NF54pGKxC+8L1sUg==
X-Received: by 2002:aa7:c617:: with SMTP id h23mr18222566edq.305.1590940414410;
        Sun, 31 May 2020 08:53:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/70] python3-cython: upgrade 0.29.16 -> 0.29.19
Date: Sun, 31 May 2020 17:51:52 +0200
Message-Id: <20200531155254.10283-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                 | 3 +--
 .../{python3-cython_0.29.16.bb => python3-cython_0.29.19.bb}   | 0
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.16.bb => python3-cython_0.29.19.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 437e796629..eee567ed2c 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "a899abaa48b68bb679aef45ceb4b89d3"
-SRC_URI[sha256sum] = "232755284f942cbb3b43a06cd85974ef3c970a021aef19b5243c03ee2b08fa05"
+SRC_URI[sha256sum] = "97f98a7dc0d58ea833dc1f8f8b3ce07adf4c0f030d1886c5399a2135ed415258"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.16.bb b/meta/recipes-devtools/python/python3-cython_0.29.19.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.16.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.19.bb
-- 
2.26.2


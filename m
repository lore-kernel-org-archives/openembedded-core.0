Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.28342.1593351269244990887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 06:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tflg4knc;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id h28so10664485edz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jInr2Z7MhCSfJYGXJImcHvgzA/7vmbfSBcVtYO+2UoY=;
        b=Tflg4kncm8i8w02CW917f/mnQiOl4U30DnDvC2Tg8j/D6vWJsDJEX8SIQfXJ6DlQcR
         tTMJxgt5XsCZZkQr72xh7Jq/iJsD7s1do89uR24XQ+5WH9xbdr0YCUgdrCq7H5HiMFAg
         1Bwu9Z5/kM9PepsiEKCMhIxEqJscnFJPwb9n1mlJrK4nTjjBiLBXewXMi1lFbwNSML+K
         mQzrztqSkDMpvPs2Dwh3Tf6Kh1d8MTD7VLOulqtMQFogHUpcuu/Av8JBpsClhAKnvLNQ
         ADEevBWcmmUC1O+Ppc6HpAIrOQrpfRSa6j6zcADafIXgNOuuLYs5b73SCTa4WVio8/RA
         w59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jInr2Z7MhCSfJYGXJImcHvgzA/7vmbfSBcVtYO+2UoY=;
        b=DKhoJuxtiW2Q4c571KxpGyZCYrUkrCGW6s7caDz5v75uEarijww06KB8E5EGqUIOhw
         1zZlepw1nqtTAyKnhaw7HHbrNYps5XTdVpaPsEHRSK+9LcZAzGsHFi0pMKAZQ3Jt0GOf
         1UKT4zwjVFB0RizWpBpvmm8Gs4HLHeoK4W8p0zTIbAkyXVKc3HV8T6KbF+PBjBV/J9yb
         te6vA9V7qQwcvtlk6mgAn1jk/ywQ+rRTENfFmB9n+H9RTlCxspopOZSWvwajsf9+dciu
         nKZm+cEXjmGapgMF+iZd5/vmNOq9c7mUhG8OoV2tp3PDHTDHrpsxfR7lQgitDO+8kXuP
         YO+A==
X-Gm-Message-State: AOAM530gvnI93L7QXRM2HEEGor3DRU9yapdiC/ClQ3SkD7mqBUGDKFZK
	aE6xgm0Vgv+MANJha9uYYqNVkE3c
X-Google-Smtp-Source: ABdhPJyhXyVb5G7ZYq2SJrO12B34L8nW7CiwMlSNryC2nsRFIIl4kE2zHoAgf3vHnrAUWdJXtKibyg==
X-Received: by 2002:a05:6402:377:: with SMTP id s23mr13147251edw.200.1593351267617;
        Sun, 28 Jun 2020 06:34:27 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id u19sm18192024edd.62.2020.06.28.06.34.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 06:34:27 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ccache: upgrade 3.7.9 -> 3.7.10
Date: Sun, 28 Jun 2020 15:34:14 +0200
Message-Id: <20200628133414.3246339-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628133414.3246339-1-schnitzeltony@gmail.com>
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove SRC_URI[md5sum]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../ccache/{ccache_3.7.9.bb => ccache_3.7.10.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.7.9.bb => ccache_3.7.10.bb} (86%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.9.bb b/meta/recipes-devtools/ccache/ccache_3.7.10.bb
similarity index 86%
rename from meta/recipes-devtools/ccache/ccache_3.7.9.bb
rename to meta/recipes-devtools/ccache/ccache_3.7.10.bb
index e55854bfa8..852583dfd2 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.9.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.7.10.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
 DEPENDS = "zlib"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "a4a38afc62ed189904357739fd8f3fb8"
-SRC_URI[sha256sum] = "92838e2133c9e704fdab9ee2608dad86c99021278b9ac47d065aa8ff2ea8ce36"
+SRC_URI[sha256sum] = "447ddf21a5f0ffa6b6d26839ae876a6d17d0d7e3533926cdf78ecd11dad793f8"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.26.2


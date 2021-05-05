Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9853.1620227980425946382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e8xrVXnK;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w3so3464341ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIxUqgAXq5OCO8rbXrOPkh9dpJU31fc0ilDKTBMmy9M=;
        b=e8xrVXnKTGpy2zYVZT2KZmZpwfQGZ/9S6aSgfbJK/8pCqE74+KZp9oign5jrpPpHh8
         XM7Lh4+7nDzR7Qm4r1BdR+reqBd7UpPqQKNbMozhgRSR7QP5RzTA7uzt+lRYGPHMiJxa
         GIFowjIEEegL1p8BvCDRuvkGcALOeUUdNzUtlNjqxT1Wxd1gXau1X6gPvjc4cfkseNgb
         kCHxf4FTaPMffIRttcJjPAIytFGSewNQFCPWN/JSV2i9hCmz+Rhg7Qw4f6Skcg4mFxNO
         5K35P83E14mz4qvCYlKXJEv+N4T7fjs64FSRu5pan+9m/NJmijqP1pBHdKckc87xmfyJ
         KpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIxUqgAXq5OCO8rbXrOPkh9dpJU31fc0ilDKTBMmy9M=;
        b=uVif/1VhzAhn/ezTrgJH767FeyPkp9w/w+3mr+NWeq0mgiaOrA15sXOq1MQlQNJvAV
         fhzAM8sOIjmN2ukf+swKMRsG73eUOXxvBnwXuHU4MeQkMFcFLdj1tteKd0V60figGCss
         eD3zqvNp7KYVuX+PY3TblEio8Mswfj8aswMYqCSmEDWw7bsnsfXFvvVUNV2A/jOXfCXR
         j0U1kBPzR/hHa9MyYtwx4aWnWIPuxM8CrnRE/Nr8e0PUT3B+NcVTMBEFMsF2nj+Q7CCS
         o9CcRNsDS0tFtP8mAEGcIFxDaBNDgPlxYmsXcgPwho+urP0hFSsp/Otnu1jsOAr8s8uv
         y7mA==
X-Gm-Message-State: AOAM530VRSg3/Gfz0Q9iRVJ1kkORm3ZARUt8ZVU4HIleCLR7ELJHk64k
	kQDcHTtUHRy4J9/eT2hK5Hvid1u5G93WYw==
X-Google-Smtp-Source: ABdhPJyrOuBht44FG/Gw1yUbYuX+tZ44u+Fi83bEABsdt/9Lfb/qcygKBAAtHTR3w1EOBAOOOE4VEw==
X-Received: by 2002:a17:906:82c9:: with SMTP id a9mr29133247ejy.58.1620227977298;
        Wed, 05 May 2021 08:19:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 52/61] vala: upgrade 0.50.4 -> 0.52.2
Date: Wed,  5 May 2021 17:18:41 +0200
Message-Id: <20210505151850.660512-52-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.50.4.bb => vala_0.52.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.4.bb => vala_0.52.2.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.4.bb b/meta/recipes-devtools/vala/vala_0.52.2.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.4.bb
rename to meta/recipes-devtools/vala/vala_0.52.2.bb
index 4381635517..b860962322 100644
--- a/meta/recipes-devtools/vala/vala_0.50.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.2.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "58fc31fa8bf492035b11d1a7d514801710afc65bd458b24c0f8d00280a92a38c"
+SRC_URI[sha256sum] = "3a3c460803ba661e513be3d0984b583e05473f602c75fa98e91755503714a97b"
-- 
2.31.1


Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.822.1621536454757224385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 11:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FARJM6Au;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t11so9635186pjm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qXxb/AgZmRB2rXy2imd596mCfISfyJ/TTMbx9eGVHFU=;
        b=FARJM6Au/IX/H8i5kUV3Me7Xm4vy8shfRuZUEbtJUqAfzHMLlANRFX4k1vXo/LyyqF
         SLZraK8jzNbCJPX+0ueEyCo6us8AeXbvFibA7XGwVWiB9bxtdRSwQtSUQhJ1qoDJL+l9
         L0a0rFdJpzfWbH/o8pCuWnSn3U1cfgH5fFULjecDFfqsRyzHe5YpQMSKPBWF5gFC8oGB
         EeMOtHNh5POooyMezXwGEMHGSibBP+QfQqKzn2JFOIEYjaNo8qnRHvVq1Jeovn6ZAw0v
         SVfw/CIykIaeFsda4LpWhFXbwEg68t0+PNawxCyKmUDjqUowDAO5a1+0O+kaL/R1q2an
         tRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXxb/AgZmRB2rXy2imd596mCfISfyJ/TTMbx9eGVHFU=;
        b=Q5cqyPeT2JCsUWMPIsNFTcT/Eoe8fGVQt6N0pAu5F+TagFHSZMu3o7KFoobOgD2S3E
         vdkO1DSPZ4ljDWluTfE66j/b8CHNiQgi1vLIJnzAsr0Xh3vf1UqnZlRWoNswm4djE8Se
         9woLr5Js07ksNsFBLszc7peQlLHmIe8phSE2Yy98QSvPiHrGsDL0v5OxtJKmGYBi22l9
         IFJ71pGaAc0XHXTEqKtUJEPdTwRmq4e2+9yfHYXdGCk+gZxEQqzG4I5ZnsJ+q3Rnen4N
         ZCKWp0v3D12EDD9H/TCGGxnGVr0IafcxrO8o86MkNo9ZIrB1iYTBmfuuVX58iRkVqZ8q
         5q6g==
X-Gm-Message-State: AOAM532Il8A6sciIcZJFdv0nQ6Am31Gn6Icw+ZWhYR+alGHRJ3O+6hX6
	15Me3MoCoF2Yyh+sGMjJnuG3wSiL+/Sv9Q==
X-Google-Smtp-Source: ABdhPJwcMb5G7Ul0w32EyuXk5Bk+xNokMAWPr4/8jawNo4VrnwqFZ+1D7BCH5/8b3GMoBeRzO5Rdhw==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id kb6mr6194010pjb.81.1621536453975;
        Thu, 20 May 2021 11:47:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a746])
        by smtp.gmail.com with ESMTPSA id n12sm2450844pjk.48.2021.05.20.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 11:47:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] xorgproto: Upgrade to 2021.4 release
Date: Thu, 20 May 2021 11:47:30 -0700
Message-Id: <20210520184730.2957974-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520184730.2957974-1-raj.khem@gmail.com>
References: <20210520184730.2957974-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-proto/{xorgproto_2021.3.bb => xorgproto_2021.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2021.3.bb => xorgproto_2021.4.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb
index fa0c69af1f..52f42d4074 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "4c732b14fc7c7db64306374d9e8386d6172edbb93f587614df1938b9d9b9d737"
+SRC_URI[sha256sum] = "0f5157030162844b398e7ce69b8bb967c2edb8064b0a9c9bb5517eb621459fbf"
 
 inherit meson
 
-- 
2.31.1


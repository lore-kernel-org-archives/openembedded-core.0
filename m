Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.2826.1593155964939555639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0brafXL;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id g20so5908716edm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5i440k8GRov468lLKojfLDtCyIFHsvSSJ6LarPFRNU=;
        b=h0brafXL8C4Aa1irGZiVK9kDEehMqvRDZHI4UVkXQzN2U1lRSamNStyw4XwUDXGKL1
         wD+sYhEQ8qVjtFJ69/Q4liWAhQ5mvlyO/BdvMTUucTIfm5KriXhjVmKfp+7A2dXr85q0
         8gSzITnmlfq4o5wo9Mp1EOaIZwO7HP/5TSJK5t2IFgWLwZpCA2w2KRd+SsGxNHUF2+WP
         WBMS27gvCDV/s66H2yOOnk5rlRH3xcBwaYm0//PywbUObJLBEIiAvH6+s0RjZJ39NWFb
         ZyOnsxN34eV30wfDkaHuvhbJoFkZ1IV56d9C4RonAXGoG77W4Wl/P1VNVa4xEm9mqyd8
         fB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5i440k8GRov468lLKojfLDtCyIFHsvSSJ6LarPFRNU=;
        b=E4nI3lgyLQDeyBTkzgXPwX0pU0JkGeW7z0ZJppddGAfEQyowJ67MtPDtKs88jghiyK
         WtSmXApNDW3a78aPQTIlSki4KhZPVCP2thCfsuMbAurYfDsx0I4Zfc741csYXChtwDkl
         IMh75+46ozo+nTSJ/RE+QodrmfQwbxrMi1LJPfDqHrydRylwdYdE1XpJbK9Ut3OCoh37
         DQhbN6jjxrZw4kDR+V/e59jlULNztc2UVUyp1sUMTM9/Jpzn4joGX2ft8yHJ7kC5HLBu
         vN+LPaRgzyTuplfgYAVr9aW05MWp8QmjUuFiCYAGUuuE+BHvIBGwOa+HXDK9DyBFVe6m
         Vg+Q==
X-Gm-Message-State: AOAM531ED/W0dIWUgZYJlEFXXkpAJ22i6WgezP4NpSjwKt6TXFtN8snq
	Aaz5YAgmziCTqZBj0Nhc9lfAl7/qVBE=
X-Google-Smtp-Source: ABdhPJyemGBANR0u2t49BIvvmkDIYrePlqljkgKMb9uKFIHb/ydn2gxAZ2kAuHLgL/jhuIYVd2xDPA==
X-Received: by 2002:aa7:d492:: with SMTP id b18mr1968753edr.339.1593155963222;
        Fri, 26 Jun 2020 00:19:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/30] puzzles: upgrade to latest revision
Date: Fri, 26 Jun 2020 09:18:35 +0200
Message-Id: <20200626071844.29134-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1e530519f3..a0f3b5d9cd 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "66b9e8c7de0eecb3d85d9a1766fab1082848448b"
+SRCREV = "9aa7b7cdfb2bcd200f45941a58d6ae698882a2d4"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.27.0


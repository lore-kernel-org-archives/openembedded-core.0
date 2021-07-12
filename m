Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.12893.1626103963765490652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ddlmy5IL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id g24so10327470pji.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gj1ekEW879Uoz/yw4MtMx6OHkgpM8xJzTWqpEA0XbSc=;
        b=Ddlmy5IL08ncP8cobezolDqOWq5JOVtIRpFV+4tBCqGKRi6AHr/akRspZzn0Ra56Zs
         lp9aZUC+Ed0mUZzlpN9wPRc9ELOLd8FVDOQCFgjvItUKeVW3AIBejVoxehn7qBLAXmt5
         X9zZ73Hnr+vWN5/neOg7q9Iy7xVwLYRqSAGhC/R0EVVkT9SpGqWjPDocNLR9xSn2rm8t
         UIm7qs/d7fXb6wflbuW8+9WCcjsgHikWVMbGIw3WExYDSzPYqf92zB8qB/h83O82AfOF
         BIEf1sPoJwPO3AN3gxm5IPw9T4ouXIic2cU7VKy3y3R+WlO9kHFvdjA0kxm9wfmiy7PN
         ddNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gj1ekEW879Uoz/yw4MtMx6OHkgpM8xJzTWqpEA0XbSc=;
        b=cJHFOt9fZBiVrGHYDrB9nhwTW739dWaUJOlRD7Ex+2owjE7Tf7KNWczfsXtsNPpCWc
         jsrBDEhJyTbfkHPH6TB1Sxfl4tCnGpyDbFxrBjsGGKI+lJdjEmZrH5JzON20i3+daoHG
         n9q35ntk1q/PYz/liayG8MBjNlNgI+4kp8Yh+JnEGt2EMNEyaICDNWdZBGA+2u1U5dFu
         b4g9iphP9ZUoRnx6b40w5EStL+nV5tvkFDupSAEWDXL2yCkpDy6/cSBrUrzahz1NYjv4
         iDLAmaWXMMva3BbQj+WIuihhxMV/BcNK6vhqRJkWIDXnWZRxReBhpjPLcL8JX1EQREAP
         AXlQ==
X-Gm-Message-State: AOAM530go+9ptfIQ4BLelTjxY2LAYBzL7SoFmtYHqhyyEA13yFtrv1ht
	5wolvpjnopGvUhNGkCrGv0mrEvSwTlrFiu5W
X-Google-Smtp-Source: ABdhPJziKtn9DvFSagNgspqvWZumYcy1e5kJTOlPAofCZTpD+Q4lFlDxyzo/HCPzoH8jGYWMPpLZ5w==
X-Received: by 2002:a17:90a:f198:: with SMTP id bv24mr9114090pjb.171.1626103962900;
        Mon, 12 Jul 2021 08:32:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] bootchart2: update 0.14.8 -> 0.14.9
Date: Mon, 12 Jul 2021 05:31:58 -1000
Message-Id: <ed7d3e43e9d90b4b7db006758311e0b8b2b5f677.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4ed68ea38bbdb91729f822a8f1a5fe7e5d2d713)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
rename to meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index a938b2da49..6571c19938 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -97,8 +97,7 @@ SRC_URI = "git://github.com/xrmx/bootchart.git \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "331ada031f1d65f6d934d918f896e1c708c64bf7"
-PV .= "+git${SRCPV}"
+SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
 inherit systemd update-rc.d python3native update-alternatives
 
-- 
2.25.1


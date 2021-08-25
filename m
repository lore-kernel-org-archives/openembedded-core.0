Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.13816.1629891494678410082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OYNDuctr;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso4049548wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ik6ctg6YGRrNSii0qSXEnuNj1lA2oV4vgB7Wj/WveV8=;
        b=OYNDuctronmYHWoAjhbphjX6ZJj3oToDqSM/btSlzI/PkYyIGj6jpvSsCtFT2IDHtl
         6f3ol/Ht+DQ9xDVE/e+WP6hR+gakThRdTwQvE3iQyb2z621SMwfmTCyNsDPsG8/XZHP2
         1JWqMXIgZthdjVDmL1SokLNuK2JZ0IeEWJPTlUlMIwdp2f2YgxhSHWpJ4OP/EW7X/WJ4
         y8WM6s9hLQJ/6W1s3F6L43JiHrQm7LZGKDUHESK0zhJuPQMW2tfrohA6JwvzY+pgycOq
         yfQ81AD/F5vkB5FRVVKIdcWOuFcFrR6fZn7UHzzdvH/xn5SuWIKCl+qg5Qut92g4xOlA
         1aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ik6ctg6YGRrNSii0qSXEnuNj1lA2oV4vgB7Wj/WveV8=;
        b=nOXc+fxOtyS3r/rF8uBqm9K5Y4xp8nb8upufXwDiPcu3DgcB0gv32JYXy+DGyvL+Cd
         3edwB8g6cflEPyPLqed9u6cZ4B/9Ir/l5VUPUt3azoxoL0AFctbTxdlWPbw6gVwvYyuN
         b0UmRCRi6RcA8qEqMWWY8nbZtiC9cH4jdioDVy6urP/7GQTKZGqpJAF6Mr7FiLL4Zj1X
         B959DRBtpryHLa1+odhcq0MgeTUB8VLix+lfZ2+VA3blXipEVkSsjsYcTRmwyhH5OWNX
         kG9Iu4sjJl8sDiMBTi2GtOK7Wwh6ULcsROWalA0MFHVeT2ZzE7KUhFpGOmLnbP1hkOx/
         H0/A==
X-Gm-Message-State: AOAM532ZC0J/zZ2Bjhm5zb28hwCOGVmDSUhR2d86bsLPNgOplqUVYfwD
	WKuT4NmxhqxHkIo1zzChSorDG7l4dEyJbA==
X-Google-Smtp-Source: ABdhPJxhF6HIlhKT8GWftN8XiVvm+UFoa/NYwaJNLQsG/iSN9EBVIdw3v0VlbY+yu4sIW62TvPmiCA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr8814915wmq.101.1629891493300;
        Wed, 25 Aug 2021 04:38:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/16] gnu-efi: update 3.0.13 -> 3.0.14
Date: Wed, 25 Aug 2021 13:37:50 +0200
Message-Id: <20210825113804.779395-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed non-existent header from licensing.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnu-efi/{gnu-efi_3.0.13.bb => gnu-efi_3.0.14.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.13.bb => gnu-efi_3.0.14.bb} (93%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
similarity index 93%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
index ef3061c067..04dadc39d4 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
@@ -6,7 +6,6 @@ LICENSE = "GPLv2+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://gnuefi/crt0-efi-aarch64.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://inc/efishellintf.h;beginline=13;endline=20;md5=202766b79d708eff3cc70fce15fb80c7 \
-                    file://inc/efishellparm.h;beginline=4;endline=11;md5=468b1231b05bbc84bae3a0d5774e3bb5 \
                     file://lib/arm/math.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
                     file://lib/arm/initplat.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
                     file://lib/aarch64/math.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
@@ -19,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[sha256sum] = "2fccf715279c46ee69c4859186af8150d07a13f4d19876e5459cd65be82d3b7d"
+SRC_URI[sha256sum] = "b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
-- 
2.31.1


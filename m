Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.5867.1622798109010877133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=alv7fD//;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id h24so13467816ejy.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cW16QAR+P4M6UtPKk4CfhMVj8uvV7Jtzh3o/D1tqThk=;
        b=alv7fD//JpXDr7fgy51awM1tkeQiuKB4iiBH8B86m6VvieJW2b4Cer2J5fLDKmup5w
         xWhy4+f3xvxyc2M7GKU4eaM+eDVhXDxtO6vm5kQeTrxRY0RPTDYFNS1omtZqa6IHQvPd
         agZum79pVTDqsCdCWmr+6o985Y+rdNbzf9FHCONzcPeLI154A830L9WWBOp5UrGkKPU6
         dx6Kug4HG6DyMC63mgizgCEXzX1TIOvs/Kek2XWtJPo1djE5H/gQHDuMIBkPCL7Pdb8B
         QRvG5Ov+BAAnL5vi7CxIZcqvqlwCpW8stThcGCWcQUZj4x7OwRjTH5WVvcPXnMWxNasB
         QB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cW16QAR+P4M6UtPKk4CfhMVj8uvV7Jtzh3o/D1tqThk=;
        b=GpANVRrRIozfiU/qi0g+EJ8mi4wOOfRGIAP6KW62M7OtIX4mC/8YBOHZTfKHPw9b88
         y3XcdgpRpMYtN6Fpipr5H2XLcb4sb4jgjQbf/y19By00RjYMMqvK93bvKYT83JB6aszF
         AfSctOWUEMt6KwN4NNv5ODb6ipTzh84iEAk040/l/zYCyEBeSscBOthCO/ZOWHDk6J3p
         YJMf/e+88kaxLI+3mxOohfwhb2QPUOownIHm/sk39FP/Rvz0m9yao3LNNz+32nVSQWfo
         PwaibGKCbjRz1cSR9/2NvNPLQfIodznpVm8CIJHGD4iITP15MnveTtnD0+nq6Hn3nKNS
         RNIg==
X-Gm-Message-State: AOAM5320kEzIOOQiwOTNdn1t4KosQm/oN/4kWaEat+a9BpyfbpN0VVV4
	mG8F4MmGOvxYQRKVxuWGO6zgHTHAXCc8bw==
X-Google-Smtp-Source: ABdhPJx9fHJ/mS3dUu0iG+af1af2PNxJixjFA4Lv32rbMNI6zmI5zFML62mElD4uRnQRp9R+/AJTzA==
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr3067668ejb.201.1622798107654;
        Fri, 04 Jun 2021 02:15:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/10] libgcrypt: upgrade 1.9.2 -> 1.9.3
Date: Fri,  4 Jun 2021 11:14:56 +0200
Message-Id: <20210604091458.1381144-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: added terms for cipher/cipher-gcm-ppc.c, still under GPL

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} (93%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
similarity index 93%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
index 34735ea5d7..fd3d8e09f2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
@@ -14,7 +14,7 @@ LICENSE_dumpsexp-dev = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://LICENSES;md5=2dae15d91a37cfde72fe9eae75f8ea14 \
+                    file://LICENSES;md5=42fa35a25e138166cc40588387f9159d \
                     "
 
 DEPENDS = "libgpg-error"
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "b2c10d091513b271e47177274607b1ffba3d95b188bbfa8797f948aec9053c5a"
+SRC_URI[sha256sum] = "97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
-- 
2.31.1


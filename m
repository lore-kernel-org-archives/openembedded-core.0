Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.5971.1622797842445302574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=liGltmh1;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ho18so2439822ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cW16QAR+P4M6UtPKk4CfhMVj8uvV7Jtzh3o/D1tqThk=;
        b=liGltmh12OX+azVfEc1FTnJ2Sf9QBPRgi7NB2LyhT14Oh1gPfp1NZZUzSqJ/aGIYv0
         DVdfYjcPSE7LwRP6NETicOGJI8h81SST575A/t0CxO56OnTz5tfsGKfyDkw5Xl3NFLA+
         YvRF2JakfQFsFdte+xTF8WePLKrtzBULea98PjexyIU6jrpA0WccmWoto14txAM2nlFq
         ns+tlczF0XXkQf5W3nfWD2P2nwMutYnCstV9se4OCNiK2wo0ld8ISDI486Gjzu7gdhJV
         FKcHlym9QysFFhI6jSkJCPSyyOe4shds3SI6UT1ZFog59v0ipVUPk1gXVGZ4kgE5Nm/t
         Ronw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cW16QAR+P4M6UtPKk4CfhMVj8uvV7Jtzh3o/D1tqThk=;
        b=PzROOwVSm/33tqYqNnKWGOSt0AQY1r/dNRa7we1ndbSbB7OAxpVP1/8ithkcQgnl/n
         c72L5UdrUYs74KMCFnu1susGNb7VW3ZaFkXF0GtkEnx2T2buQ9EuMy59MXLqASsS4sgP
         5v3galiAD034iWB+rb2hrNz8qHcMSh8e4s0KaUnVcc50LKJkvLiNvzI/UkQO8K+swT+z
         DowKu7FC8fRfi7BLz4PsWixQrdXkDWMXFRlB+8CuN2kWbTndjkfvp9tUb2ACBKIa85kl
         lWL4skC0PBa/ppmwIOJNujNxPP5YI75x9s3TM2QtTzT44x2Bksk6/63u9ogPP1pt2wSs
         c1zg==
X-Gm-Message-State: AOAM531z2E6W3f0YoM1OmMoxB2UsYJNG40vA7iwRc2IvWJMTnv+PsyDT
	a31WRT2tD7bKOkzwf/BufKy6hqS0L/+JNw==
X-Google-Smtp-Source: ABdhPJzANZkhcGa4i1u/pr+KbmFWHl0Tn5cE50VyD8W0n4XstaGlTp3AaGNk0MaI7MVST0ffBsY4rQ==
X-Received: by 2002:a17:906:388b:: with SMTP id q11mr3296874ejd.43.1622797841003;
        Fri, 04 Jun 2021 02:10:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/11] libgcrypt: upgrade 1.9.2 -> 1.9.3
Date: Fri,  4 Jun 2021 11:10:27 +0200
Message-Id: <20210604091030.1380877-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
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


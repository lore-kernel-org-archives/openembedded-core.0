Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.19462.1608974878793819922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IZgP2Vue;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w1so8266754ejf.11
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZlC7rBMGAVkps/Xrhfj8fQd2+QR3qGJ4xGmHnSYZSfI=;
        b=IZgP2VueABJ1nQ8ODBy4VaqvDtiKsstZmeptuEwY9B6YumIB0YJtwBWTgO+dpHjJ8A
         InoiApW1mq+g+3GZvUBA6PMVkPjxayXZDXcV+RTLWZRCuz1zyO695/MizSP6E7fIS1hZ
         ofj1K6amccd6dMQ/o808e3sg8Pmp1lkkqfIUCt2YymIz0JTHR2J+f6xAlACwOXA45ltB
         ardfdo9Y/rh9RJv0J5bU1+VEQ7vit+wsXXKBLclhwLBrt/qzmTFhW0mKMKDfUy2Uxe9N
         BaQc5iy6TdDD0V3zi6VDRtYXNsNHtLxjTdGUpeMvAch0tgl+HlCFULdRm4/qhagbKIUu
         AX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlC7rBMGAVkps/Xrhfj8fQd2+QR3qGJ4xGmHnSYZSfI=;
        b=TfkI/V5mZd3cxpqdclXpaQDe+Wh7KRWU79WdbHE2IpT1vNjAU0mAHutOTieP/wJX/v
         VVYPbwBbfAvt+5wvWErEBAqt8IUztgFjW5F3+GK1df67e9RZFw9gbRq84EU622+cZv/9
         OlDifte1aqaRYHCshrDUIrcn8rkc6+Yd2JZne4L+z/aemY8EjCkhj2biPpcHh5CV4I/C
         m3wIzdauw1nIZmbXKraX1P3ZYlVINgTcOc7/YIMkD/5QidatvynQqgAJNaOnUvCj+erE
         PQqbyJQyhAZ7Hv5DJVxQ0T6EmncYOoqNv4bx8Mn0gsriBNb3EBWSC3+N49W8mkp0/EIR
         2Paw==
X-Gm-Message-State: AOAM5327mOmF6ayCaj3r3wtu2O0iRYNCfVd3xrxULpDytuQdorKPqGPd
	IUfkgdmLF0xj0LBZTfPzR67+a0/PGTI=
X-Google-Smtp-Source: ABdhPJxTotOPvqvN4DB1ViR0vfwsGWXrscn2od29fAZRwQUa/bFCaiejMyJyGokVVM4O0oEFqalPFA==
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr32955250ejc.276.1608974877466;
        Sat, 26 Dec 2020 01:27:57 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/48] lighttpd: upgrade 1.4.56 -> 1.4.57
Date: Sat, 26 Dec 2020 10:27:03 +0100
Message-Id: <20201226092732.52323-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.56.bb => lighttpd_1.4.57.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.56.bb => lighttpd_1.4.57.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
index 97d3a2aabf..9a9cad68c8 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
@@ -19,8 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "9d94f68c8106bfcdfe7aafa0a13f45a8"
-SRC_URI[sha256sum] = "e4ce84cd79e8ae8ba193c7a7cc79c4afba9a076b443ef9f8d4bcd13a3354df77"
+SRC_URI[sha256sum] = "52ca961b89c12f7ecbb2e4e0c5a9e79b2863c64e33c42832a165e7f894d6217f"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.29.2


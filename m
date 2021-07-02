Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.16079.1625264372506714495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 15:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jV0M0kZX;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id n25so15143817edw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ooIiIN+GSoU5HigI2yrgwl4ElOC7eRA5pZSl3pqx4PM=;
        b=jV0M0kZX9qj5wopKPtV49dW/Yde14kQqeZdNXlJ50ici+jHvtV6iQeBWjDhj3yn62U
         iNZ9JwS/RAabyH21J8IL+Zay7wtDi1OsdpI9aB0aWF6E1rCxwddq4cjrGkfz8aRY3dUa
         ZgeWgUs3z/2R9BDJzU02YWOyDdr2ACRAYsPr92jnGvhnX7ql77jSV1VTBmBfinK8EiNX
         8bQChCQikwkHXZh5FELbSaVkaEySDhBMisIlVERD8NMO/VxoRXMYwu71LtPD5NKQ8dP6
         +eLTplu572htfE9kqNnY+4ja1S1r/RTW3SxsFvnX29FnYSrRKOb9IyiyLIk/K55iw5Hb
         t+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ooIiIN+GSoU5HigI2yrgwl4ElOC7eRA5pZSl3pqx4PM=;
        b=GW7+EMbLaQ9nCPrvVO7gCqyWJpURlNwBeWXbQbkaUs0VNusxcb53ndB3Bt5fL+CutQ
         k7xP6HzN3USYAVJXnn9Avcl8EFNEGn91E0r4Iy+ICSuLJBdb6Llt0I5OFQTBTnLLDSaN
         1MXbIXfcAmVj3oNmPyJ95KoYuXjGcnkfFQTYSbOIBy9roipXa2xunmXplQnVwF55F47W
         chBDzBzrFRYvnxyoaegT1UPjND95OiXtRm3lw0nc0e8oMluQD7uUlXb0muFE2Qw9hH2E
         mbv+uMPy2EDPv1qOfEUuQNNQVTT6iFJ5OkdbQ2Mnaub488+1xwJW6DpSLaXNfWK6Klwk
         3HSw==
X-Gm-Message-State: AOAM531C5rDyKW12B+TYaGcrrUXbP1pbrrHaIzOFxU5PhDkp6G/0oEyM
	Ndnl5VitXK9PY9A5KrWezd4hkEmmeAcCeg==
X-Google-Smtp-Source: ABdhPJwxQDopS6Se/xaQ1AsEmndmBxDzVu8QwjzvVLRr57w1hRZ/Blh3wLMOh8lO9ay7/4pFiYrXMg==
X-Received: by 2002:a05:6402:164f:: with SMTP id s15mr2057816edx.238.1625264370960;
        Fri, 02 Jul 2021 15:19:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jx17sm1492414ejc.60.2021.07.02.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 15:19:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] man-pages: upgrade 5.11 -> 5.12
Date: Sat,  3 Jul 2021 00:19:21 +0200
Message-Id: <20210702221924.2342084-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: installation instructions

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.11.bb => man-pages_5.12.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.11.bb => man-pages_5.12.bb} (80%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.11.bb b/meta/recipes-extended/man-pages/man-pages_5.12.bb
similarity index 80%
rename from meta/recipes-extended/man-pages/man-pages_5.11.bb
rename to meta/recipes-extended/man-pages/man-pages_5.12.bb
index 3cd0bc5259..a5b2c30305 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.11.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.12.bb
@@ -4,10 +4,10 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
+LIC_FILES_CHKSUM = "file://README;md5=92cd5ee2e0b35d782817e7e277b6ce4b"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "3759aee7cd4a229173d3cb651fbba438777bee6206da8d75ea04caaa7c8662b0"
+SRC_URI[sha256sum] = "2684d42ab53184d7607105834e277577daa7e854cdce0d4aacf9f7ad8437c7ce"
 
 inherit manpages
 
@@ -20,7 +20,7 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install() {
-        oe_runmake install DESTDIR=${D}
+        oe_runmake install prefix=${prefix} DESTDIR=${D}
 }
 
 # Only deliveres man-pages so FILES_${PN} gets everything
-- 
2.31.1


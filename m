Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.2810.1593155975517220451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ca+N9eqT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id mb16so8378130ejb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4JYWRxQqHiq4WQRoMVQAoA/oSb1FKjrhga04Xiu/Sjc=;
        b=Ca+N9eqTZqGnaGMmZYlVygzdH+pSqXDuI3HyNoM2FfFkzfZ0z+Ks60fKJj0+a2vcrg
         F5TdQ8jR4bEPRDmxrFNv6iBdjLPIfSZM9dmDFHpmg/ltNBgHYLLom8QH2E4Wg3X0og4w
         EPxMgtNTbV41trWsATBjYu9ZpzQ7sR7AduIobXipNfG2079Ijc3Dj5e/3gjWASEJpqPq
         kJhpvndfL7onkn8VVjmoAbYYHlZZtxlzq9eSB5+z7zFZJN4WqQbTDgnkRgMScr30Dx9U
         PY/fjgz+i6V74/UFVwsCU76c+J2DVVHa8cCE6Xpm2C0azK7dsWbEfDk/F3THnS9arDRK
         aRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4JYWRxQqHiq4WQRoMVQAoA/oSb1FKjrhga04Xiu/Sjc=;
        b=Gr/BWMoimB4KNfu14GUeowOcT9E/MsBMu3LjzAA7F1M17ncUT75+lKa5eUy+JJii/d
         krn1wL267gIHbS/3/H9hBE1rFT2us4Xe7Ux/A2iaAiJ2huJeqwXsVYzNaqorZRx1pund
         rbKPhsGfx8d1HgI6OksKRS2KH+w4p+8jvO7QIt0eYwB3CQUhK6LeQambUe6LjbHAZk01
         +bNSDoHanzFJuBq3MMFKncXsQkFlmIvRVKznOT51wPpLkZbe9Ld5cMSUPlc/4FWZwJzZ
         0Z/NIgVO1j+5TzUzWr/ZTCcelzpTGw5uE9+otqZ65FOdCWvaLygpK1ehZ4PUq4WQnD1V
         J/ig==
X-Gm-Message-State: AOAM53058d5iwYG01Vz+Ds1TrA4ngoRimC8NgZkLPilXS7dj1x7Oy5pW
	eEUURmkM6VczYjoCUl4TGA1KdImmLjk=
X-Google-Smtp-Source: ABdhPJwiLwc2m8t9Nz0RZ/mvV7LZBhy6+zGyjADgPQnXnwgIqazXmtMKcRanBJKJdRRKqa75mxiglg==
X-Received: by 2002:a17:906:7c3:: with SMTP id m3mr1352922ejc.30.1593155973778;
        Fri, 26 Jun 2020 00:19:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/30] python3-setuptools: upgrade 47.1.1 -> 47.3.1
Date: Fri, 26 Jun 2020 09:18:44 +0200
Message-Id: <20200626071844.29134-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 meta/recipes-devtools/python/python-setuptools.inc          | 3 +--
 ...n3-setuptools_47.1.1.bb => python3-setuptools_47.3.1.bb} | 0
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_47.1.1.bb => python3-setuptools_47.3.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5f99cd2512..201e3570d6 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From a8f871c9ebc4fcb99d4163b226aabeef26567099 Mon Sep 17 00:00:00 2001
+From 234c3da52da09b28db5b2c4d33ebe9c800c461ac Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 426301d..55c8062 100644
+index 5a9576f..f5961cb 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -649,6 +649,11 @@ class easy_install(Command):
+@@ -656,6 +656,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 9322ca9a05..ecf1205752 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,8 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
-SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
+SRC_URI[sha256sum] = "843037738d1e34e8b326b5e061f474aca6ef9d7ece41329afbc8aac6195a3920"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
-- 
2.27.0


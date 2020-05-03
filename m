Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.25845.1588523201462768088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H4bSNsuj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d17so17955109wrg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vmb3pasfuNXrAyweWlKUSnaw/+AJw9ehkhd6DVN45p8=;
        b=H4bSNsuj7TU4jFFg+p7ImQYZAg0k+0fC6b1dUdaXcrXvStN0XFOzl+8Gf8YT+JC5Rc
         eL2TphK+gxRHD56BCNX3E+ZG8z4mwCWxBZcVApjx6eRKlnQI4AQVEqBtMCgzgexmzLgv
         BhMYJLnrrlAwJImMz/zWoKrRrr3kwGI68JbtLzasa1S80/g0Ia2Xeh+4R16+n76gM0AA
         KKft8fADrjaPX/slFswxxmQiYkWLd4wWbnWj13JLt6dhQ7Ye3GBjjejDXtX31v9i4Ep5
         ZmTghNJ0vIgkfzWDH6xVG2PRuYd4S0EI3J1O0INnCwGfkBq7FCVESslLXh73Srw59xiB
         K/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vmb3pasfuNXrAyweWlKUSnaw/+AJw9ehkhd6DVN45p8=;
        b=HCspMzOSkVeLXkGOs9OeJ5bFBWVGkPg0FqBXiklOi5AKHZK+yz5hizILQvlb7bJ296
         lIDwGkejFNCUkgJfvSpvXNcvjgzIrN+79YxzgpkBdLe6HbaNa6tznAfahGsxxqp6Qitf
         vKeo3HKN+o7MbKU8BnHIabvJoHICYzIEBbHhb/4Rp9GxRB5mT0nqJT2HkQJJkjZxIHow
         eMw2u1qMqjA+gUgpnjAlfl4Z7L7SyQGTc0AtA5og4WXzBIFyOx5EcZ8Q7+fOzeReLhI3
         BxIVNW80BhRX5+0sM1lR4ZBnAGMbx+7dqFHX7ZYt89AfG+KrKCXyXSz+rZogBrXtxvDA
         APqw==
X-Gm-Message-State: AGi0PuZdaFlVV7ekpj2dI6eqssLWeFvgZ5Je2n3Bj1PJUhwFZtmPnbmO
	OKctC3hm7SzL8OCDVVrCGfG3RU6w
X-Google-Smtp-Source: APiQypKVi/P/jH94vGLSjuuKKSvpDnZKx7C2WCjppUyHObgnKUqFopWuxzkbx+B1vVvdJ1aAaZ68JQ==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr11242286wrt.233.1588523199333;
        Sun, 03 May 2020 09:26:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/17] wpe: update to 1.6.0
Date: Sun,  3 May 2020 18:25:53 +0200
Message-Id: <20200503162559.946-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-sato/webkit/{libwpe_1.4.0.1.bb => libwpe_1.6.0.bb} | 3 ++-
 .../{wpebackend-fdo_1.4.1.bb => wpebackend-fdo_1.6.0.bb}       | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{libwpe_1.4.0.1.bb => libwpe_1.6.0.bb} (82%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.4.1.bb => wpebackend-fdo_1.6.0.bb} (78%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.6.0.bb
similarity index 82%
rename from meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.6.0.bb
index 12499ff281..09c74089c9 100644
--- a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.6.0.bb
@@ -13,5 +13,6 @@ inherit cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
+SRC_URI[md5sum] = "6e8a2c279dcc3617db5ec7ac4c03d628"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
+SRC_URI[sha256sum] = "3587c6b8a807f4bb76b268ba74ca82c6b395b90235db41ad8252224456193c90"
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb
similarity index 78%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb
index cd2f7fabda..3b1dbf1e09 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb
@@ -12,6 +12,7 @@ inherit cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
+SRC_URI[md5sum] = "456afeed22f6749f7b2a97c11660835d"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
+SRC_URI[sha256sum] = "7f5bd7b9d8f97b1655f4dcd39fad92719d0fb3985b251da5802df13aaa09f567"
 
-- 
2.26.1


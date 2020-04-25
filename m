Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.341.1587835720650873782
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=evMsSYM6;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id v4so12482861wme.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHhNxlBf+Ba7fsSdi9dwU3E071Tu0nWtMgRTqeRwVhk=;
        b=evMsSYM6a1J9i6rxG6oIdGcUGYm5CLcQrZmYl76xvcZBx0ir1VtJKYQ3kkQtaFskk1
         BEPquYGcmXYvu6FM3xoQON/blZX5zZXl0KQFMnWoZB/yUWiSVi+ayAyuQHbIby7IotNe
         k8NDgxeUSJdfxuM+ADWx8m+sTkY0FULSu0KDMUctMpqt/TsXjzU4VovPWH18uvQ60K/k
         oH4pCTEGoExTCxcRgZEQoyBjwNtLiX3lVLvTpJXypav8xGht4IUkmBgX4kXu5wPkVDkp
         CZjDCev8wpQnJBtMVRB1/UXA7CzlKSFEYPiEWTHxx9wVvOdz5OkXCkIZCyGoRxRNx4A+
         eNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHhNxlBf+Ba7fsSdi9dwU3E071Tu0nWtMgRTqeRwVhk=;
        b=ngH5y9yE09IUZwHMyERckf/AJuZmS/0BQk/7ARFyohjAR5hdr3+he5R2NgGbbLDIAj
         wonA32xRmui5+CR7OHB15FB233m9j0Q7nmKkjMUQ8xxuEBjWx9hgIU+Yfe2of28YyjkE
         D2Lx/Oo1H5RVQMMoY+0UEIiJErcleKLC8PORQQu6X5rXD23Mre0R2ZFJ/AdjTG0qSIlV
         Qn6lj3yeAXoVDWwjESuC9ll7fiug7qXUyNLuiciNHRWW2fajWN61Qnbajw6NWyUnNHmb
         sH68dCR8yoEA/Y39hkYqihw6/tYO0dBqUkEn0gTCQ5u9SqgCrXzxUVnr9Sj30+oZ2yOK
         5Neg==
X-Gm-Message-State: AGi0Pub5U5nMv9p4YdIkdCfHefU2wMWcjv+o3XpgsKQRtsTr5/91Ttcg
	o8A9GFKAJiRvbW6z86dDGaLs3rQ9
X-Google-Smtp-Source: APiQypLwjVzHF7swqxzM5ShZNFjGcIk7hih/BJpzUy7WTnDeRDrYPU7X7gdmxjoiznVAm/js9Luk+A==
X-Received: by 2002:a1c:4186:: with SMTP id o128mr16686663wma.21.1587835718721;
        Sat, 25 Apr 2020 10:28:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/15] python3-pyparsing: update to 2.4.7
Date: Sat, 25 Apr 2020 19:28:13 +0200
Message-Id: <20200425172814.27370-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-pyparsing.inc             | 4 ++--
 ...{python3-pyparsing_2.4.6.bb => python3-pyparsing_2.4.7.bb} | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_2.4.6.bb => python3-pyparsing_2.4.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python-pyparsing.inc b/meta/recipes-devtools/python/python-pyparsing.inc
index a768c97fce..348b324bf5 100644
--- a/meta/recipes-devtools/python/python-pyparsing.inc
+++ b/meta/recipes-devtools/python/python-pyparsing.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
-SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
+SRC_URI[md5sum] = "f0953e47a0112f7a65aec2305ffdf7b4"
+SRC_URI[sha256sum] = "c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1"
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb b/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb
rename to meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
index 0805fee3e2..d0c3d0b424 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_2.4.6.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-pyparsing.inc
+
-- 
2.26.1


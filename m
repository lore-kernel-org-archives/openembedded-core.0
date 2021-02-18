Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web09.8258.1613661447138485120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 07:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=N9qJex1L;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id r23so5306520ljh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQfPwGew+fvaqIHp0KmXhxGB5ROXvMlbev/QUrgAFXg=;
        b=N9qJex1LSUsKzd/nyXMlDkFODtNRZLA3CeP0Id3ofovF71x69Wv3wpqh3KZjgmgSzZ
         U9XqbdSOS/eAeQsdsqW8wZsrbOuyNW2yYIP7zT7TaSNBE5/6TYAt2hToezIsUuNbArX3
         hw3lPFvzdk9UcLP7Ew2zTO034wRgQFPDq58U1cX6Zwot69UbuF/Nqne5t32BD0R1OVMO
         vQQhYvoxZvH42GOSYOG5+HUpTRALDdPqPVVketQt+UJwahpAIO37mpbeVsL8UKZFPdP4
         W+xIMnZ3wC4v6AGlwKdqdjfHcvtciJMJsSGUMZ0pZfWHOXxlX4G8FVwFO6oTgT/hSPuZ
         V5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQfPwGew+fvaqIHp0KmXhxGB5ROXvMlbev/QUrgAFXg=;
        b=ecWCjvwZpnWUTqvfl+0230TJBnsX0ZWJUGup3iOCgCkPRAQtHGyMt+ePKnX1nbi08S
         SZpE9p1HzZqsy/6C4pU4Q/2IpockFAJ/uODI+2Y7ieKQ+awbDsUKSalfrRO9A183nR/T
         L8SVjQKW9QE/QnQVtoKscQaY4KrfZug422p4WgkUypVVWyQWFBMBcDB+hRVqhj9yb0J0
         lqvyxBNmQtH/mIX2qEEiH9FW2HIDXzI9ll6vpQES3qPa/I8tA2pgU2P0+zzutqMvWrdd
         PiOisY41XRj3yRFox88nNJoMtKE1O6c6+kKxIEB0B5Me3ckwjuLywIfDSp642Z2e9Gnl
         3KIw==
X-Gm-Message-State: AOAM532yUEuvL4yqZFapR9GOVPdAPdlNGSQ4IdFc5d4ji9wWUAUPFewa
	BwDtsOL/JQY34A0Bf+SAemdLi7XnFcoQ3C8F
X-Google-Smtp-Source: ABdhPJya67DMNygXYNvCH8C9+iflcyeSrVmVyI5sdjZ5y6Pxl5am4OaKW3sTtAxLcrA7AN1cXseB8w==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr2805516ljc.463.1613661444647;
        Thu, 18 Feb 2021 07:17:24 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l18sm628973lfg.294.2021.02.18.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:17:23 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 53.0.0
Date: Thu, 18 Feb 2021 16:17:21 +0100
Message-Id: <20210218151721.1779877-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
index 118f416657..811c8a5900 100644
--- a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
+SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


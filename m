Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.20187.1595720646279620161
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 16:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=wtSngtuj;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id d2so1469098lfj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 16:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWYdIdXKqhMBg96BImvf/gqqC/uedfSe9aHOgh9/7nU=;
        b=wtSngtujYnGIEFo3Eq1XX0jBnoO8UO7UVYib7gzGIsyFQborNoWuvuCIjz7n9wUZc+
         MUWc4/wq5+LZ5hSz/BFYV8qvHLWrM6VIcIgUNWItnjWBlgRLBxN/UJkBW7rYRtWJiUql
         n5wKbPLB5Nrt4/oW9anT8W2R8liFdXy2827RJk/JOyOfikKeX6SnIw/Y9KWQzsiYR3+o
         mNlWKA2g1UfDcxEIAizvN3nV27TVOwti3qTDtx8LtbbCrCLxkHe5+goyrOy4olyUP9ZX
         b2+GCIhLREpYzuRU48G9HvPPDNzbR1RTm2NOdukx9v/k/QphnRKzXpmwHpZAQy9a3NZa
         rddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWYdIdXKqhMBg96BImvf/gqqC/uedfSe9aHOgh9/7nU=;
        b=Dz0NaVhyFCk4FlfqK//Bsg0956HP0qMskzxPK8ZP9HjRvGchedL8K9UuzLb6FDDVyz
         dWLNYKTSi14p6IpOLuCLOzBCsmKullpFjEvbDG+hqi+khCNhxgeKZbjWa/JxYhH+vpTv
         owOx9zQ8fH9ibwmIMkf7dQRIFH7uKeL/M2epOq1PA5X2/CVg3DP09Ku20v1zXlS7PS3a
         AW1qd8JGQYZ+oXSvg6bY8KaX+VIbePaQDkrcB+Q+8rTpbcBh20bAWeO3a6C4AwqwLvCX
         SMF/sa0DE5jdUNzoJ0b4LfwGszjFqOJQp4X0rneoSZfYToF5WHxMa+VRws9cg7Ilj5kL
         Eipw==
X-Gm-Message-State: AOAM53029mQhA3opgHAkZnm6UcWK6IrECaj5ONnDsOHRGh79YQQiHnOg
	NHEuCgKTKNUy1A2ZxM1FBKLhAebB8hE=
X-Google-Smtp-Source: ABdhPJyqnuteef8r7wBg8y5RVJPlmGYJXSmJJIM8dreI4Chjwh6pQ8vT9TyJAfzSbtROc0Hn0PS6YA==
X-Received: by 2002:ac2:5502:: with SMTP id j2mr6756014lfk.50.1595720643893;
        Sat, 25 Jul 2020 16:44:03 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w7sm1794361lfe.41.2020.07.25.16.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 16:44:03 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3: update to 3.8.5
Date: Sun, 26 Jul 2020 01:41:09 +0200
Message-Id: <20200725234109.2638903-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3_3.8.3.bb => python3_3.8.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.3.bb => python3_3.8.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.3.bb
rename to meta/recipes-devtools/python/python3_3.8.5.bb
index a7cfbad5cd..cabe5dc075 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -40,8 +40,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "3000cf50aaa413052aef82fd2122ca78"
-SRC_URI[sha256sum] = "dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864"
+SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
+SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


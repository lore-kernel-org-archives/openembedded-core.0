Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.19490.1608974889703718634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V4d8ULuw;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id 6so8312952ejz.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oyfr7ovaiySCQCztse7XwYf617Lsnmfk75Miss2GXJA=;
        b=V4d8ULuw02xwGt627+pCoV1+5Mz8Nyb2zcPdNmFwaKGMCgpCnpVzg2EB1D4Q7hywpS
         53StcCmRrYPKjaI8mNHjugZXOkbyKYBc09H8SvShSxRnGmU41OaKlNLEbY+0Gs5MD9Ol
         jxVqYnfrIm7Ltx27w6DrMFZfRsxVNdJ2X9RYb4mT/uiH4hsGtqMKf6rX/aEUJ5oRylpv
         r0960d+RU1wj6SzrdzxwyxWKCnHI69R5Mpw/M8nVygOrt6d45SUoP7tJc6ZhpdYYH3IU
         81OojmxOcvZL4LWac0q8kICWUfQyz2rzjNmAl38F5QIoggsnXLVFOvTzpybx/P7B/fNa
         pTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyfr7ovaiySCQCztse7XwYf617Lsnmfk75Miss2GXJA=;
        b=H6G4+JxXzDvlVoVaBmKh42FjflnGSJgEhkfIKrkzlF0mmKMvClrY/80O3VZxQiogHi
         oCPzTbvWM5VLwcTD8d3wyJKQr3g9EerfLQLlRAhkNogR8vCQTCF8M/9tjKPvLxvMfFpl
         zz2XIYOaCZn8zwLphax/QJnXgEOhTXmj5eI4CoaYQCpsvDs/X+mn3oO2YJfXbU/n/SKM
         RvZCh6iRE7U+KlfkPOLXkdpJ/RwsS7gY9cNdIbE2KBsHX3vqPIuBmBjNBqo+aHECJzf0
         F9XjnBMC5iOGERt7S24LBLBRoQH4SymskrOCF/fsI7jh6/clIQ42wYj6dqgR5zoBAlFZ
         VCYA==
X-Gm-Message-State: AOAM531VI+IysRC0w6HB1i2wcZkL78fl7SILRPVi7a/quGhs4YMMy0/Z
	9HdXlhc7aIcWdXhdk5VlJkNv5LRE3nI=
X-Google-Smtp-Source: ABdhPJx6W6VZ2JHW1sfSAMBgV1+V8bBL1x1FyruPsnDx51k2Jv58GQz/z0R4I4lnlYzkMKLR6GhnvA==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr32985236eja.409.1608974888377;
        Sat, 26 Dec 2020 01:28:08 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:07 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/48] xprop: upgrade 1.2.4 -> 1.2.5
Date: Sat, 26 Dec 2020 10:27:17 +0100
Message-Id: <20201226092732.52323-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/{xprop_1.2.4.bb => xprop_1.2.5.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.4.bb => xprop_1.2.5.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
index 3280813ef8..b1589a8d75 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
@@ -14,5 +14,4 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[md5sum] = "cc369c28383a5d7144e7197ee7d30bfa"
-SRC_URI[sha256sum] = "8c77fb096e46c60032b7e2bde9492c3ffcc18734f50b395085a5f10bfd3cf753"
+SRC_URI[sha256sum] = "9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1"
-- 
2.29.2


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1109.1608245684061351649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 14:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UiM1FSwu;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y8so341892plp.8
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aomEwa/KUM4O1adGVqJGlsAXHsZDYbwhP4BtuPFPhHg=;
        b=UiM1FSwuW77BaGAHhxv/vc8XUQwiBFvZa7KnFb8J3d+o894QKrB1vp0rgcE0VN5ZCv
         pgYCMH8emoteuv4RPp6Ynep5Xk10Miqkt/bgKnrx3SPaXjNW6kUeR1O72tYbjYrWgVRQ
         scN6+KdYrJ5yaELJPhnLck1UObyG66BO342m/EPeTFX6xRgnOfDmbbnnmq0tpIof9b6B
         uU347qL0WO/1Aiobo4mF6bHI+odvcIH5MdLNqZ4KlFLzGPSV5McvQ5EL9L0RNVB0t+8P
         C+f/6gdg9g96x2NUuTm3cxrtNYerxX7+E/s1d1A9LVV/nV5khxWQtaQ+7uP3zR4ePpF2
         a43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aomEwa/KUM4O1adGVqJGlsAXHsZDYbwhP4BtuPFPhHg=;
        b=LoiZ3S/u9OIWVuxQpPKsw3b+mBYdWeX8UBYuJEhgbGThKKpfRCW5/BvsVUJ18kaN2b
         qpgT9q7NKiFQZ45fZQfoAx8D+2xIC8ihcCZzGnP/oOjZ3upEG6DieCsKLPyqSW5oBEwI
         n4+fp5b/Z4qNCcyh4QPk0xNue5fkfUsvNDUu48H+LkKmdkfThPy4JNXBsxtbE87gIrRs
         8/qCuOE2Prk/XtbukMYwdZKO6SpoPC/tM1/bqykbBG1+7Y2ziVOrL9zzY2qFxgZkOnqZ
         CYlfWKGD6GMVZ6HKKyoQbuflwUmqGsTFB0WolyNkKTX3ULPxQnfTGML2gYPKAMKenHpG
         F5GA==
X-Gm-Message-State: AOAM533pKGW9NIVup68natxhkDIMJBNb8UKhF2PY0ctKIwg5ve2BJqNL
	zHOG5j0Z5RU1G5D48KSj6b+nO3rmuBRuwdxv
X-Google-Smtp-Source: ABdhPJxNbIdIm5qBdjqQjGBwmVPr/XhEKs5T5YCEeTayvX6Ez02dcQX5ibiYV47Gmx9nP5u3aeOFlQ==
X-Received: by 2002:a17:902:8f94:b029:da:d168:4443 with SMTP id z20-20020a1709028f94b02900dad1684443mr1470419plo.57.1608245683279;
        Thu, 17 Dec 2020 14:54:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id u25sm6620428pfn.170.2020.12.17.14.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:54:42 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] initscripts: use quotes for shell variable comparision
Date: Thu, 17 Dec 2020 14:54:37 -0800
Message-Id: <20201217225440.2633474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helps to execute it with busybox shell

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02f0351fcb..a63e71b780 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
 #
 # Check the root filesystem.
 #
-if test -f /fastboot || test $rootcheck = no
+if test -f /fastboot || test "$rootcheck" = "no"
 then
   test $rootcheck = yes && echo "Fast boot, no filesystem check"
 else
-- 
2.29.2


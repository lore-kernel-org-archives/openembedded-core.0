Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.1237.1589308259774076284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 11:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pmim4Z5F;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id a4so6554203pgc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOIxwZtvIdMJtRdFO4WOJNW1ESw7seZfOWeUd7LZmKc=;
        b=pmim4Z5FEOPfxy6LLIC0UVsvJZIkvXwowLVgs7//zi4sRPPvJrmqyGlrYEkCe5xF6X
         L6/2MqggcoTA8sWDvLzg27T7BKufbfPUVtlmeX+29okgwyplvfHKnvKo2wUDrrZL+2N7
         vfocRa47NhZsA862xHAutjO2T/2RmLW5DFQ+b3XxepJE8TmC2FBpcRdG7KehzCaB6OSz
         IhvrRHFDBIjkH2y4fEXwOwPM/kBA379MLaA0nvbo33OCTRE0lZh7dTasSyZvFLjSSJ3D
         RT7f7GCPaCJRnjETaibLumlUVL+L58TlQYMDA9OQkM9TusKeSQOeH/BWnUJq1uAcSHUz
         hfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOIxwZtvIdMJtRdFO4WOJNW1ESw7seZfOWeUd7LZmKc=;
        b=KC6MbYIjBEyzQ646bUK7eeWydfLqOTNaU6wrT5cBoAPWSsugJUQJHd5yAVcUj1Hm3M
         FFIPMQpRmhJ+T+OJNw/aYZXFZFHmC/iBSz0hgks8xVQDRXGdi8rlmcIm8BVeUxwXNRO7
         TPy2bsndpVVY00V64p7IJECK4ZeTSOtg4/C3Ie2bl5tql9sLkSLwuUBFNPPNlO2tiUgv
         zjD5wVqWcKSMDMZqDrZAYJyc1osQaTwsNPi/TCuGlAaTqBd+bukr5hGH1nWvifr0rGye
         6uqAtbpBAygkzoltouqdZqDs7ZxXfsGzUFPNmYoLmy8k52RZJ1yn/TryGi41SITiFWFx
         io+Q==
X-Gm-Message-State: AGi0PubV4WEyjwStZpwNXjCBErohH4Wv1epr06PqwSBPHGDe85NctP9Y
	Hce7bi0QpQ6RjL2SDRFAgEnaP1C9EI4=
X-Google-Smtp-Source: APiQypLpK0r5MwCGLOZNuWTTHuI2lp7+1A2GsPC2ZKqgcy+lwJMTIUhz0bDyUteWE/4QRH9kz1iMfw==
X-Received: by 2002:a63:cf10:: with SMTP id j16mr12778745pgg.242.1589308258861;
        Tue, 12 May 2020 11:30:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id fy21sm13223649pjb.25.2020.05.12.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:30:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v5 2/3] gcc10: Default back to -fcommon
Date: Tue, 12 May 2020 11:30:52 -0700
Message-Id: <20200512183053.3646643-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512183053.3646643-1-raj.khem@gmail.com>
References: <20200512183053.3646643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For time being change back to -fcommon as default, helps us iron
out other issues, eventually this should be removed as we fix the
packages to work with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Rebase only, no change
v3: Rebase only, no change
v4: Rebase only, no change
v5: Rebase only, no change

 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a64c4caf00..6cb40fcb74 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,6 +34,7 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
+    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
-- 
2.26.2


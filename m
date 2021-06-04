Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.6024.1622798108474679222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxOf5SB2;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k25so7937739eja.9
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xXnU/zGSg+nE312qY15ygDweNfA2XGW3ZRA/7s+0W0=;
        b=qxOf5SB2sOHuFOabFjX532Y/Fs4Tq+5Zyheb7+8+8FbBMBkSFVdbAz2nj5HCEDMHj2
         ZkO0Or4xNytUaxq3Q6co3ZecmBwC4iHqfLSqpOr1VEZm53/w+KRFa7ahufdHxPvGZheo
         m1+mz0I+OEHLISMTX/v1MLNlVBnM0G5ViL8p156yEUNPPopwRrr3LCBlDv1bFlQ72Jjk
         i0Q/PhKNU8q5zms63/iF1Dy9HT7rwj3xeshL8URze++pPp/LN2sIm64ZUL1r/kd9XRox
         EVCGMNn6hgr9+RuSPo1a9rmxXTB4MyY6ujHYMN1UqRT/wZAdmvzFT+7ewjw1qSqzYESD
         UYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xXnU/zGSg+nE312qY15ygDweNfA2XGW3ZRA/7s+0W0=;
        b=CRNr90KOOQ6Q4czY6wZZmq81i32f7G44JXKT+14SQlgY+RmMEIupu+MvRbbf/x9iWN
         L6TZb9ABqCqcqbzq0T0Hhvt++vHsjYmhclE3QiCo+p9OJdP+jU7zxlZnKEEqMELauAFu
         fmZWFfrSUf06Kai0QyPPlhtii57QegyzhMyJsYG8Rec2hfKR6g5caexlvqA64sHjqTPW
         OtmQ+/b6heMhcoZj0ObKUD5qhYl1jEx6ta7DPICB+gbUqEKlRAvO2X2K74QvVS+6WDH4
         VwysQcB85y+3YONkjsx+1z6zFr5hhY6E7GgvMjbppQ1ZCJekLRcvk0Z9Nk4bXdUUOkXi
         wC7Q==
X-Gm-Message-State: AOAM530WKasihOo9DsEs/pPDyrza5eGHLn2i7Yjgr2PBxAsJx0cFpW3b
	ZodWtGaSO+vWnRIIi6T6RoRpUfA/MtXVjA==
X-Google-Smtp-Source: ABdhPJzmRGEI5VweTjvyM/91fnHsfVkc2OOVaw1C3dWShc/IjPQZFl1kMoWcVf/pQPzt541E5vWXAA==
X-Received: by 2002:a17:906:2a08:: with SMTP id j8mr3214600eje.483.1622798107004;
        Fri, 04 Jun 2021 02:15:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/10] perl: update 5.32.1 -> 5.34.0
Date: Fri,  4 Jun 2021 11:14:55 +0200
Message-Id: <20210604091458.1381144-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.32.1.bb => perl_5.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.32.1.bb => perl_5.34.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.32.1.bb
rename to meta/recipes-devtools/perl/perl_5.34.0.bb
index 01db924a73..7935a58723 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
+SRC_URI[perl.sha256sum] = "551efc818b968b05216024fb0b727ef2ad4c100f8cb6b43fab615fa78ae5be9a"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.31.1


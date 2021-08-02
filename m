Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.16090.1627879903446499523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O34jmnZa;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t3so16212081plg.9
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bab8dYrQxizsLi1SMcnneQBV1cbmdEv8ywWPkAw/lj4=;
        b=O34jmnZa+ivgGV8O1FhePs2kcrDkfkJ2sFNoUQqHSZHmjj4dy/2dm1iuhIb3U552K/
         3bDJfpu8xpd0aiThQbkuXd5a7xDom7WzIU3O/B1Rq03a+jKuD1cQPuTUUsSApMWQ+mq+
         BTyz+yBxE7j+ZXH/pbIa1kdsTQif/GXeMoDco3evjmLgJYHkCCiAenmLIhNWPqj7V8/G
         Fh/SEqwzyIMEfioMNfzGDARt+abscebDucidLf014V4PbYspdlxxBMuiaZEzHlN5daJu
         Vm3ZaLVJmLpkhqiR1SDSlisBxqR1edX0q//KB96A7wm7DmZFgEkYrVCkNmvsTr+qioOv
         iv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bab8dYrQxizsLi1SMcnneQBV1cbmdEv8ywWPkAw/lj4=;
        b=dl3au8Y/cBj0kH1tI0R4TKSpfdjuModNVqhO3Jlfxbs/NKdF75GXsyk9lAo0o4F/jc
         l7GZal8Ha/4E5sgvb90v9fg9wlf/I30r89/yAXdIhvtaisLR2xuX/IWvhiyKaTwWpMje
         yTz19q4EIehhtsWhCNMWM884cSJ0EfwXFcgkaleAzLby0m3pjCjAYKWEKNWBvZl07pil
         bbiH/RZHN9GxwXcQfN5O0BVX8z19iVP1fhaz9CjGSCHnAqPUY2DFfvbQu3gPRfNDwLYP
         fDNaqm5ZgYuvR29NIvcTU1ZPZUCoSa/kk4GElsWpHSd7uK6fv2DEW42rnmbOKw9Pmpw8
         qbyw==
X-Gm-Message-State: AOAM530Okoh546sIz8yIEJDJATfDETeO6uxkJSkmv9ybMHclTEUPhiDX
	d/SeHx+Gs/f8bKp+cN+SuLMM3998LmNvHw==
X-Google-Smtp-Source: ABdhPJw26RkULTv1WjSXYS+olGwFP2DhHayGn2E42fAPHjxkCnpdhqFvjHjce9CLgkOQIox6dWoCkg==
X-Received: by 2002:a17:902:ed84:b029:129:73d9:b83d with SMTP id e4-20020a170902ed84b029012973d9b83dmr12827678plj.43.1627879902830;
        Sun, 01 Aug 2021 21:51:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id 16sm10153313pfu.109.2021.08.01.21.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:51:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] glibc: Remove obsolete --enable-stackguard-randomization
Date: Sun,  1 Aug 2021 21:51:37 -0700
Message-Id: <20210802045139.3481193-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802045139.3481193-1-raj.khem@gmail.com>
References: <20210802045139.3481193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this has been removed in 2.34 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 0fa601d844..9017e8ccde 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -79,7 +79,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-                --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
--
2.32.0

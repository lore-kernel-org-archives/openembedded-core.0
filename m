Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.6327.1623744786323954940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=abqaomOf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id nb6so892567ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sno3FCg+3LH3DRQGNm2TmtvoFa40bULTHgzrOrV/DTY=;
        b=abqaomOf7UFaavQ24J1Z2/aDQD3rdQi/AczGfxqJT5OLSod23tS3keRtlqGbNpL4WZ
         B62IKj/rdt9uCvuCJgs/+MHRpUn5C7O6O9wletWVVs0+nszJXyGe9a5tDMQgMerc3Kel
         zIwbK6ZxoOHXIMtBCBiIizAEuCLBdQKKDjxpFTQdBMMrsrRJN0k6eaaYZsizQDvhIoPk
         0fwONbp396EY+MA0ZkZBi/ac00HbRL4FrVKSMy2urgwGPTxyBdxJEXpY9XbhoiLhITRb
         3zLnWhepI8SjrxhMzzstcTDvZjm/e9JajBM2fDEz338I8XWwCJqrZJ1cQkxDaBE8htRW
         uGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sno3FCg+3LH3DRQGNm2TmtvoFa40bULTHgzrOrV/DTY=;
        b=J4i42NVHEFeQQUB+8lUeu5MUbgJ0unGZdMtC4kNJtnWkDvKtgQTb0+arV5ffMcdEgQ
         U0MGwO23/lqCnHpww5E7f38OlF7oWnFS1nMDIZtRxvN/kCGP8DciOXdFJZ8GYDl0DUgV
         ixkke4xx0W+lgZRgOXiAh/0NJQcCUXVP9CPlgeeF1YSEbiWLTdZ+fZaWbcuYP6wX2kbF
         8n3tGNzAmch5Dj3hmwrXT/pz8o+XuNtekzPd3Jwbck2m4PJXrggtLCt+Wg5FP4TeA97C
         jLa7fWGDB/8CkfN/i0nFYX73hcx8BtkdZai1+ulstc/cu8zedWJfcjXNcA0U578sC6ys
         8btg==
X-Gm-Message-State: AOAM533/e7jEvqiTh3YAN2E87z8hOm+4KLZ/ZARvgKIPzq6fcqkqgO0l
	A5Ceo0+AtDSbjRTx4w8dFnd5lanTHxdW+Q==
X-Google-Smtp-Source: ABdhPJyEF1LPOdAY7gyB788fPnWXrWm2d7UNLYRj5PgsJtv+v6l0bsWvULewAVXwl0IKt8v8sbVEwA==
X-Received: by 2002:a17:906:c316:: with SMTP id s22mr19930103ejz.17.1623744784941;
        Tue, 15 Jun 2021 01:13:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/31] sudo: upgrade 1.9.7 -> 1.9.7p1
Date: Tue, 15 Jun 2021 10:12:38 +0200
Message-Id: <20210615081240.1734087-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.7.bb => sudo_1.9.7p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.7.bb => sudo_1.9.7p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.7.bb b/meta/recipes-extended/sudo/sudo_1.9.7p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.7.bb
rename to meta/recipes-extended/sudo/sudo_1.9.7p1.bb
index 4685ca10b5..aba6f4a595 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.7.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.7p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "2bbe7c2d6699b84d950ef9a43f09d4d967b8bc244b73bc095c4202068ddbe549"
+SRC_URI[sha256sum] = "391431f454e55121b60c6ded0fcf30ddb80d623d7d16a6d1907cfa6a0b91d8cf"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.31.1


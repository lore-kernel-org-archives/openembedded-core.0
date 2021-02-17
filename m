Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.11571.1613584796541954973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 09:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hNOjQzFU;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id a9so5693192plh.8
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ga1Cv/gtELiF95A9XegNtL+ao2GTZ2OMrw3V1YJs1sY=;
        b=hNOjQzFU0CPyDFItyALJ7LU+nX13sZFO79amWC0noD7MZQ2PrtjwsvScEcx+KZidVl
         hkNVL9VowrU9oMcKV7iThAAyqL/5rzV3EHLKWvSmZfYjLLSKtNEHqmU2m1Lqd2K/33JD
         A8Or+kfPqtHfMQ92+9LaMxyXAtPxP61/d/4GsP23pICYYV4+Jd/cwj2nP3Vl6WrAAdG8
         zzzkk3nYiCtjkmGBr3HtiAUE0XWh0Z/kSXBPQhKXutE/+eb3MWgO9oSSBZMaI/7KQflF
         OrN/FekT8O9r+U+shyBbPnrc3CteanSOl5cb4DMvWI/W2KvpgSS62Uc8xBtVubB3Tu/x
         I+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ga1Cv/gtELiF95A9XegNtL+ao2GTZ2OMrw3V1YJs1sY=;
        b=XlWE7+AJcdO2AEOfxrNz/hRkMHcZB7gwDSBX7YaMkX9cm6vKv3elIg5SxomQYXg5P1
         mAqsJwxhxDbhhdc6Es+GJrCVXnzSVv1VAlSTuMwhJjSJA0hMjL3odtqhV4jmhez2dQB5
         3T8ptalvv2M4ePrNTlVW3cMqVkSYBs0STU4EWCdQU0ges42axyTJNScyNLtFxVt1qZ3g
         /eR/Tfop5sMiJpYMl2QlQFvv/VbT8E3APT5aCmtghlqzDUcKhVDKKjFAK5cMDoo9iteu
         xLqJzFrw5eVI47MLBgSTrUVu1yPoyzewzL/NQqODtSVa3g2VsX2ju+JtkCNQVJgxzQEI
         9zlQ==
X-Gm-Message-State: AOAM532GLaWhfoEznMfW3iiajv4osaFQk0m9K8ELXv3WiwiN1Hp1MKpL
	9dMzpzhM943Q0XpaMdktOMvQPNJAjhoaCw==
X-Google-Smtp-Source: ABdhPJyWFJcr+0o8idbSerTsxSolHOTIvEz6mjvH00WKhY0domfF+mCiqRDPh+/ar88RyELpeNc8DQ==
X-Received: by 2002:a17:902:854c:b029:e3:1a18:6fa with SMTP id d12-20020a170902854cb02900e31a1806famr458909plo.70.1613584795829;
        Wed, 17 Feb 2021 09:59:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id r4sm3287898pgp.16.2021.02.17.09.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 09:59:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libunwind: Disable for riscv
Date: Wed, 17 Feb 2021 09:59:53 -0800
Message-Id: <20210217175953.3126851-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv port does not exist yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.5.0.bb b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
index 089c4064f4..5e4693e205 100644
--- a/meta/recipes-support/libunwind/libunwind_1.5.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
@@ -18,6 +18,9 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enab
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared"
-- 
2.30.1


Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.1259.1614886701076406923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 11:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tK481LXZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id h4so19533780pgf.13
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6PQr1X/JZwg1dpOIkvFcJ6n/u4/LePegaddlZf+6ts=;
        b=tK481LXZ8JPMa4s1gSavnZvQ4UxAPdPjWh/PNWFx0O9WqoV0FV3qddHW4hwlmbPpLj
         +GgWOuz99dRokBBb411/e2tSJ+1RFikoasfiwmRkJp6Ro7zoKIrGVYsL5/gltg1L7+iU
         0aLMmVibRhaqiQk6xrABd/12DkWVGOziMZ7K1w3Q9A1Cn+fszcXWghQk5IHIAhwKnYxU
         ZUgHkxpOugRulxBzYYbJA11aESDb7lBdI1ToPqXn9ER4q8JrxqPuTUAzUGCdZQEmsltb
         qqijr2DRU/Znc/25FWIdAmmica+I+m9Lo8qP1Sm/sq+Dl8NNFxP/08apGffFwHFVmitf
         ogVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6PQr1X/JZwg1dpOIkvFcJ6n/u4/LePegaddlZf+6ts=;
        b=cAFkbe4Bkao0oTzY2FL3XXTh3F3IZyFbbQIwLF7KSMgL5n5oU+wDZkU+ZQixOX57v4
         Fns+zL4hcKEnaUoJjVdtMSJk5IX+YUb3WxwOYD8Ev5IbztyGoGUKNfOJUbEcYIkkm9pa
         Z64BKA9Xhid5ByoIZRkF54Cfj8Nhi1bMdQqfWQ1Im6xcySlpxpNj7xi4bpkRFy4i/tBX
         Me/vVUE99GgMHLN1JzQSfgHQ2Q4htphB1f82sRqFLpvNEVpfbrIDflMJgACRkgFph5rc
         am8wjUtDnWU/OJ886SaZuziO/zhW7UkZGCRZkZfv0plK6IClGACCW6QmqavRAPwloA/X
         H7yw==
X-Gm-Message-State: AOAM530G/aS/uMjYoaMVfljvs5Foxl5jn/srK5VCKb0vzAt9rZubrxXO
	Go7OzE0xPZ581IKpTY4nPALA9GGxYiZXaw==
X-Google-Smtp-Source: ABdhPJxnrp+aHkW5s2yUZ+88b11/XHsd0ssVps0pz7wQTWhURm3zeF08Ox35F5cXJqV7sOO2kxf8wA==
X-Received: by 2002:a63:e415:: with SMTP id a21mr4830014pgi.241.1614886700251;
        Thu, 04 Mar 2021 11:38:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id h7sm201756pfo.45.2021.03.04.11.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 11:38:19 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Package new module mapper tool
Date: Thu,  4 Mar 2021 11:38:17 -0800
Message-Id: <20210304193817.1004351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is new tool in GCC 11 [1]

[1] https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Module-Mapper.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 1e25dad86b..164a669aad 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -45,6 +45,7 @@ FILES_${PN} = "\
     ${bindir}/${TARGET_PREFIX}lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/g++-mapper-server \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
-- 
2.30.1


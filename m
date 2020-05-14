Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.421.1589478696821029650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pwLmrCRu;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id f4so1540034pgi.10
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tMu4gy1HiSu0WthXd2ZCc6BicZIJekcvI25ZUJ52Bs=;
        b=pwLmrCRuhEF3bUUAnmHZpdgz+lP5g3zYj9uEutpHxxIxpA2FV2FCDlP3LmKIEFkkv2
         IAw+HiCjyGhI0RzfpqxqEcMTBrf8KA/KX/sa6a0NE+ijJlYEJc+Xj1FLcw5bf0AbdTuo
         75uPzuNr0SYR0jggSQjGZ29tQWA9G7DgIQj1ZVrE0N9OiGCLEv7X6wD95DFfJW1L7/Uf
         gLyeaW0s+qlvezntil9SKVXPBZbQnYwpTNc4ObXGhnbJUXIEiy9ZeBxFUn1uo7R47RaN
         JCH31JbL5KcIK4c6lDJYsQjh+WUS5SKRGhkeRnva/X5HHw59myjAWstuw4jkf334oFbk
         ghWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tMu4gy1HiSu0WthXd2ZCc6BicZIJekcvI25ZUJ52Bs=;
        b=octJOvDugkBjfKgFdb1juiAYhqs/SMOWyDSf36ylPUIo8S4j/Pna7bPY8PdxImZsMm
         UnssLh4VIPgJCLlazUMx2cpj9iE3A7gdGX3Eq2PbwGYs09wBMdIoTvLL+L6vqunUza3E
         fNoA2r9Z1wUHH+2D+2pQoVoA2yp/SzQzo/kgXdDamhNTVTHgAlmwMVMgd8GlCfPqKf+w
         bvyiNsT1xRAvLiF8HMbNm4OVUX//qF58nQsx5kxuEaocFCilKgps7KAVrL6xtyJhPoy3
         tqZ5NaZOL5Y+MZ9UQ35B2bapF1pAixNzWWSaHMOF+lMInDmssW0j53eIeJo2IeC9IVJq
         zsGg==
X-Gm-Message-State: AOAM533ggn4uoIQQqi7Ofwpkopj6EtUg3CnB8x0zEbwLGiT7q+hup48I
	zho8h4JAmYORgeXBGXIdhc6dhgB+jWY=
X-Google-Smtp-Source: ABdhPJxef1LHAA/uFUwQVsDG8B/xv7ck45CoYeI34AuWficutJ4RCLd4L7ZF+YIfL0JOSuikJOeZHw==
X-Received: by 2002:a62:e419:: with SMTP id r25mr5577076pfh.82.1589478695768;
        Thu, 14 May 2020 10:51:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id h11sm2785448pfo.120.2020.05.14.10.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:51:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH V2] qemuarm64.conf: Use cortext-a57 as default tune
Date: Thu, 14 May 2020 10:51:33 -0700
Message-Id: <20200514175133.5381-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is more appropriate for the machine we are emulating

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Fix typo its not cortexa55 but cortexa57 what we need here

 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 1e2d4f018d..97b4516b68 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/tune-cortexa57.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.26.2


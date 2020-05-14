Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.423.1589480903598840736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 11:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O5d4bFaE;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id u5so1606751pgn.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Px3fKY3osx2Le23oGm51A2ldzBaryAvzAuVpYUnqCM=;
        b=O5d4bFaE3nfSEDbWw9YCNt994GSekLvbMebJ4Vvs9E7CybJ+7/A/SLV+2UXcQ59VVw
         2XcJN70sbX/1A1syBN7J9/jDh+LhkCQSgJAFAl1XItTibGo4ZVmdHkkSAXY66s+WsGlL
         Q96k6bbCBW8UnC9BUZnzY+t/diRvpGfeX1pIJV3lKOt1wuDdxtjud3OV5iLke3kX01ZA
         z4z0wejEWHZ/MtYXiCUVAK8eiiLsNbxb392IRqtj1HeMGwxDqhyFVC1xj7HlA7iegZoX
         ilO5viP5X/H9zhBLRYFyD+9QK5vVtWeLS3FeYmO73dSUq1hUVzo1ja7UdsPgl0kW+g5k
         ULQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Px3fKY3osx2Le23oGm51A2ldzBaryAvzAuVpYUnqCM=;
        b=pXFl/fKpPFio/MBQCpPYs0dD4AE4+wPIBkbxJs3aHq7+wAEXxGJVI+z6JRp6y48qqa
         xkwGZRFqm2Vvx6uiRoSL2JUhgxMrGFdyMMx53GDl9e0nS5clXDpkUJ1vI0x/1COEFNOl
         qfuSrdvvF/m/OYMpDuTAlFNKMwxC6bAHvfNKD9BS3GPZYU2nDU2I1VRQ86as5nqFV8zo
         68WrmT2tkV+7DBD31Tv6+7K45nh+v1G7XZySLmmO/NUph4BfYCB/1Q3h9y21nDCDDgAs
         aFv9NRdxFTZENB507ZbDAw3Sc2X8kQimBvDsMPPHJDLIsJmRwcd58M9O+lBgrt3jZZYC
         +A2g==
X-Gm-Message-State: AOAM530fea0NTInv+R3l0mEhoCHpv/oqVWeJ3hX7bGnwzbfmZXopIrvt
	rGrbpVAH9PRa4tSFLK1al1dSP5y5jeI=
X-Google-Smtp-Source: ABdhPJytLiPp2NtlZBUXu9NTyxgPCOjcI6Nln1R0gGSHAmvNjozDpUflkvG0NGknE3mEUonRjUiVTA==
X-Received: by 2002:a63:2216:: with SMTP id i22mr4974573pgi.359.1589480902766;
        Thu, 14 May 2020 11:28:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id q100sm2568035pjc.11.2020.05.14.11.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:28:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] qemuarm64.conf: Use cortext-a57 as default tune
Date: Thu, 14 May 2020 11:28:20 -0700
Message-Id: <20200514182820.753611-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is more appropriate for the machine we are emulating

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix typo its not cortexa55 but cortexa57 what we need here
v3: Fix wrong search path for cortexa57.inc ( merge conflicts )
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 1e2d4f018d..7965fac71e 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-cortexa57.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.26.2


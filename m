Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.6318.1616721070800054230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aGaQbOdD;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id l1so3513382pgb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 18:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ih9KorCIv1/em5UXRW7aIoPZ+vELWV6C1b7YlRTjedY=;
        b=aGaQbOdDoBQutgnraFZx2+8o+3DvbC5u/qOl3v1YEdTh732IMe+27+8PpymfwnvPay
         WbtQTMEZCZLu6wtLdm39csKoKVMJ0Q2ZPeEZPY8B/rFbcBL27OKu/RjxXHDifsTQ59vp
         Q1voU46E1dnl+fDm/N6wOR1GJH+mxYnqw21jmFKe8vuu/ezr//ETrWGH6//1ubsdeIOS
         BGbMsSR6oqcNh14ZG2Z/Bux+lHb8mZajAQhz12d2p4ukN5Epacd6A59bzvQ+D286j+4r
         vL6XvUb78yYHv7ohpB7DQRMachrwOFMkKry6zpUWKLkS2ZofeISPMsMXw3Smol5sU8Gp
         +hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ih9KorCIv1/em5UXRW7aIoPZ+vELWV6C1b7YlRTjedY=;
        b=XWdPN6kuEP2Zs1b9RpX3dtmYQZ2T6oAlMQ1uOORMrI330IFyG/dY47ReBPQ4j7Jpkn
         KmAruDAlMCsZqYms9iHg/7DvNXggLgvJL4OCnE9/QHIsdtdyyCwP6SYG8asHwb0kgfXo
         VbxRA19MWZGNwdFxFKSDsy0BaAAd5MIaoVR8NnijnlsAPIypeqhy7MXB/ENIk1rtMymi
         0g31bzK0ilJzYoNn4zCohDdr/VQSJn99C1+1Pc04DcVQ1u811ma3ShOXwP+UseBbcgQX
         Mbmyezp7z4wTZ7aWfMQmmBQ6mP8b3dBlHoYljKT/yyjLpSUlQDZD86DkFQL9/xJxGRpx
         Udkg==
X-Gm-Message-State: AOAM533UpbCIo5FsW9G8qqQagIrJg7sLAamPthubRrceZ1JlorbU16as
	rIUULIyHP2LlWToaG7fKp0vx2VHZHT5WYw==
X-Google-Smtp-Source: ABdhPJxyo+hdpNL77vmGR6x03zbw2Kds2d2acSYUH9bkO1dfDga3Kj62koZcUZG1mw4tMpbSLav/VQ==
X-Received: by 2002:a63:5f0f:: with SMTP id t15mr9720282pgb.225.1616721070058;
        Thu, 25 Mar 2021 18:11:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id y5sm7086571pfl.191.2021.03.25.18.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:11:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] documentation-audit.sh: Fix typo in specifying LICENSE_FLAGS_WHITELIST
Date: Thu, 25 Mar 2021 18:11:07 -0700
Message-Id: <20210326011107.1057329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/contrib/documentation-audit.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 1191f57a8e..f436f9bae0 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -27,7 +27,7 @@ fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
 echo "REMINDER: you need to set LICENSE_FLAGS_WHITELIST appropriately in local.conf or "
-echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Commercial\""
+echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"commercial\""
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
2.31.0


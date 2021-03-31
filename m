Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4219.1617183051609071850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=mb0MtZSm;
 spf=pass (domain: blade-group.com, ip: 209.85.128.43, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f43.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so801641wmj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dk3hBcCvhOyUEnhg5Y1Sy0T56kcRjCkRx6C8pQeG8EU=;
        b=mb0MtZSmiUdCYZhIrgKI+OOsqmSkZuIsQ+YnIrAf3B8i4wTguYeKZzbvVdiT7kFMO2
         6Pg9FGYO6g1k4gm/9yriFBecZHzBc+YoYCoHbFNSBn4DoANecOjHBYsMhJ+TyYX/ktoP
         gy1sO7Tnq//1tzufEttUxjHKeqg7c8/bUzshfReVJGuO6U7NJlz+er9W9Y8OBL6uVE6b
         HLo2Jgt1ODFr39+rzNA2xnKjS/1D9GVMxJIqCNAq32GyRnkRU2i/qlsMg2jchB9PnRKI
         +w9FS2fhHBiAMKuljZxJLiH6k73PLSir5n8N+aF07k4aSrDrg/U+18YrDGRYyf0c6tlE
         Yfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dk3hBcCvhOyUEnhg5Y1Sy0T56kcRjCkRx6C8pQeG8EU=;
        b=V37+nScGKhb9b4M2vF/VkHAjM5wmdYaSLel//vjyq8PJ8EEulluJFLRGjcx1X/yQet
         +AxFL+h8pvpa/LKiLnZ1AZ4c2Omzvc/dJ6LxqoMMFn/8VAyZopXQeDDN/vdcclKI3XK6
         3k9uXoCWWHHEU9gALxM5e72AjwghETj6V9QAzeozvZfqcTDZP9TXP+ftXUkn0oKbyh4s
         z/MizTkH8g00XraNeTsGje9FOtPO1rtw2/7mscQ02zQTkk9oVb7mDCrIf0ETDCw7Qt78
         Y4jIBoyXOEHPebmwU61UCNyxw17wzbXW7k0WRIQ213OEiBVuNFsbAic2jwTD7yLG5IOw
         ZsZg==
X-Gm-Message-State: AOAM530IabhCEavqXuQ9WpP+UICqcY3OjuCFb2ouJY0Fs3Scu43sgNne
	WO5RH+AMuULA9WMm2FotbkUpLwaykKVC/g==
X-Google-Smtp-Source: ABdhPJxhDxl7sqk6noYy79n4qhlJidyNWHMC4bfp5Ap4o8IOhMdWd5kqxHRfig2X3/lzp+1/pj7Gig==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr2302696wmh.166.1617183050230;
        Wed, 31 Mar 2021 02:30:50 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id 135sm3346588wma.44.2021.03.31.02.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:30:49 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] kernel-yocto: fix do_kernel_configme indentation
Date: Wed, 31 Mar 2021 11:30:25 +0200
Message-Id: <20210331093025.799971-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/classes/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c6228ad0b8..1ca7ef738f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -406,11 +406,11 @@ do_kernel_configme() {
 		*alldefconfig)
 			config_flags=""
 			;;
-	    *)
-		if [ -f ${WORKDIR}/defconfig ]; then
-			config_flags="-n"
-		fi
-	    ;;
+		*)
+			if [ -f ${WORKDIR}/defconfig ]; then
+				config_flags="-n"
+			fi
+			;;
 	esac
 
 	cd ${S}
-- 
2.30.2


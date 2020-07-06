Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.61689.1594052829672766941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TX3yCyJM;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id z63so35303551qkb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AxEjHKGImMO3dOlVeNCM027hpdaeYmRUfExwS7x4CZc=;
        b=TX3yCyJM7XxRrXSvkeEnCS2pbqqEhbMNRljtu6rwPe6EyK/AExl14uqxrBnkf+As6g
         qrFY+MJSpP/rzGFxAWmBhFT1hWg8cRBgAY6uqOBtNMi9bY6AUvSdXxGPcgwKt1jkcMrj
         tDIkicbkKXzaY0wKrh5nEG0DNkk7JQ6aFWRDgWmer2rtg35PVmnbCih1EclfHijKDj7b
         9STYH9NYQ2DpCgdyXTwBztZNfoEjFF/6cvWDsScrCat7m7L0xihCM3plQHzUoyg6YY41
         j/yc5kh80AgrS5LV5WNy6DI3yJBLwU8PIzDIS5w/rVcskw/2BwlX+9NF6YMDBm2Eqqn3
         bpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AxEjHKGImMO3dOlVeNCM027hpdaeYmRUfExwS7x4CZc=;
        b=p4trRdg9ScdICZHje/5niD4Dc55GP5reJt815g2536DY+aFA2W5qPYiA6OdsaHT0Ia
         sHxhtPeW9GY6zJ9O5Trkh97065AwbKRalf+KSdygSD0x9aQ1j3Lpd2wF7/PVcoKi/1DX
         aSn0rYbFz9co9RRdq7J7NL1fsVZeICJbramDk4eLxLLzhTiE/zU5M5bU/DV5lMvmrTqF
         XEhkPPz0GUz7Zkvbpm/hzGqCotSDQDrIEj2sEWH0T6oA11RFRevP5k7m5w0tkudXnf7G
         TAsEREPrX5y6SiqoK7SSGHqieIlC1pSTHLlSg14DHPV6iwOModLUKRJU7VSFOCtMA8Qi
         D5NA==
X-Gm-Message-State: AOAM533YoGzi3+zUOa8lsyWyfCQet57BKtAxHRoiLfkZcnFU3dfamhgO
	s1GKzJ0jmhtHZDrdRkOYB1s=
X-Google-Smtp-Source: ABdhPJzJME8+54oc5MCxclKRx7PNp41f9gwQnE0HKwgillBwwCmBFBnwdNvUVMKyyZKr1NMVr/69MQ==
X-Received: by 2002:a37:e4e:: with SMTP id 75mr47851958qko.81.1594052828810;
        Mon, 06 Jul 2020 09:27:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v184sm20326928qki.12.2020.07.06.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:27:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto-dev: bump to 5.8-rc
Date: Mon,  6 Jul 2020 12:27:05 -0400
Message-Id: <20200706162705.19104-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200706162705.19104-1-bruce.ashfield@gmail.com>
References: <20200706162705.19104-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8a61b22761..175836ef94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.7-rc+"
+LINUX_VERSION ?= "5.8-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


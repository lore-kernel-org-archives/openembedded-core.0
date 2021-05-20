Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.529.1621543760583256797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XVHrlhQF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6172661wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ELMHfgIsHgndGxSCqtJyldldRborjUq50YpeHkluNQg=;
        b=XVHrlhQFOrW2+O+at4AigvFgTjyoyfmA2BuOX1cgobdE40w7aIVFIrptIigLEIE3qW
         F/3TM83/HzsIqOqxvBa/vkXN0USpsvGUGESiWK1PiDKbgrYdt+HO93MneowxP1Re/zs5
         AnThdyoITXaHtS8aGsJf280bzHYACYCLjTWy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ELMHfgIsHgndGxSCqtJyldldRborjUq50YpeHkluNQg=;
        b=XBT3vf0CVOfKMCh3XMyE07sEhFbiHwXd0IdRQNn/QLfBlPItjjnhWJEyYFDO778YER
         77bl+XbC2svOEN2HzfNRh7nCjzNav3+J+RACPfBtSAHr6AjjcTSCvqJnBzSJL/1NhRfO
         I5drIaKr/OXzgje6krABRAXLS0v+CHO82D7aLIhUem4Uzm61jfKG8Ub0XLgl+73CDV3Y
         xrBa5j/Sh8q/87sPcdyNKxyb856ooEmQ/rbGhnI78FawurAH8bS6xzCZVW+xgD/5yNk3
         brn+3N7e5nsZEWrKA9EibeZQssWY5EgvjU2Q+NYLqE5mS/Si8t3HMDS0QfOzgccgaqb3
         BQ2Q==
X-Gm-Message-State: AOAM532zDcBnhfGCc0EIhc4dWeBCH236X6trV/If/WlYM5eSOp1+cMmy
	WP9nk1mvFo0NVXWAo5wdsvcNOgnple9/Yw==
X-Google-Smtp-Source: ABdhPJwd1dDNNMJrUt/z0Oo9qWyc/TdByI+aMmOsNss+ec9/oDuTNSiCt52htunWKSQpmI3vNg/EPw==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr5836770wmc.168.1621543759065;
        Thu, 20 May 2021 13:49:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [hardknott] [PATCH 27/28] image.bbclass: fix comment "pacackages" -> "packages"
Date: Thu, 20 May 2021 21:49:01 +0100
Message-Id: <20210520204902.2527687-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 353cc671759..67603d958d5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -38,7 +38,7 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-de
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
 
-# These pacackages will be installed as additional into debug rootfs
+# These packages will be installed as additional into debug rootfs
 IMAGE_INSTALL_DEBUGFS ?= ""
 
 # These packages will be removed from a read-only rootfs after all other
-- 
2.30.2


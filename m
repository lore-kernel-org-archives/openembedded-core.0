Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.107639.1597919101507804704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gRVpf7lB;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a26so1890773ejc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k7LP7slNjb0P71+VbTw8AKRYD5lvsdmmIEKIIfOuzME=;
        b=gRVpf7lBbfmHXChEnT1DZlAY/jfYuobFFKOvnqolb/7JiLrmWNrzeDeRuW3KXiMNp9
         WSjw53DLldkYK23zzqeYaWaUnCMNn2a3KZSkcmJztC+dQDAnKdkd3i/BWwZ64hcclM7J
         qcqsaRojlG2eE21JUmkpYl7FjgN8OQvougccAd4CmO6IBNvnic2bkDp1S9G31pjSfA+k
         SLeEKvIqaSaCA0WoIJcYLiRUTsCvQ9gJ1JPnXNYs2xlDdN36LgvJLCNTDcb5r09+5pis
         8/+AMo9Hsw4pMqQiQzQvL9ZzMTU8lQVGevkvBy0F8bqe+M07ufh9tlVgIeNdeFWgZio0
         emRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k7LP7slNjb0P71+VbTw8AKRYD5lvsdmmIEKIIfOuzME=;
        b=h3sJQA2V5GfLT8oH61MY4/mUOV5kR2Kl4phKkFFaRMRyyS7pDRZSe9UUy2zDQ3dAyG
         oCMG1hnNWQ5CwRafzAFLF9c4Ufj6cmR7cjknMOHNjEZyW2ait1yKQms42jBXrfCs31qQ
         pfcTyOYeIdGuozKa/grfDA9ccZIMHSQFGLFs2Mj5g0VNs3NHy/sR+WYEX55bSxFNrNsH
         BK8GDtGZJaFvLY1//z63gZ3Bb7WiNlIHBbTdjAPbpSAPcq8gLWhIcek/zQboL1uXj/oh
         zeoRsp50yo9U7b1UbZC+0g3c4K8MU5kZAetnAkv7du4UMus6+eDIHVBW5z4c/qtiOWT0
         pTgw==
X-Gm-Message-State: AOAM532uMvDrDEGDGWYTC8pOrzglFTEOsKrhbRzto6rDG1XGFDEX4mp5
	CRhN2IMJoD+rALD5mSARyTMKzaxOhHxgWpdT
X-Google-Smtp-Source: ABdhPJyfvZHHBy9WRAJIzTAM/7brz+1SDSVaaN4nZmFeBCHdT6+VosruMTOQDhvJeaTxqzCYXZn9FA==
X-Received: by 2002:a17:907:204e:: with SMTP id pg14mr2663697ejb.324.1597919099606;
        Thu, 20 Aug 2020 03:24:59 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:59 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 6/7] systemd: Upgrade v246 -> v246.1
Date: Thu, 20 Aug 2020 10:20:40 +0000
Message-Id: <20200820102041.28077-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

Commits:

  972391ac396f fix typo in systemctl help
  443aacfcda39 man: clarify that LogNamespace= is for system services only
  5aec8fe54e47 _sd-common.h: avoid parsing errors with Coverity
  f9ad4ea2ca06 analyze: fix 'cat-config systemd/zram-generator.conf'
  dda6fec1dfc7 man: describe that changing Storage= does not move existing data
  2bbd33e476ac core: reset bus error before reuse
  b81504a3c76b nspawn: Fix incorrect usage of putenv
  cb263973acf8 man: fix typo in systemd.service
  73b432e7ef21 network: fix DHCPv6 Prefix Delegation example after option rename

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../systemd/{systemd-boot_246.bb => systemd-boot_246.1.bb}      | 0
 .../systemd/{systemd-conf_246.bb => systemd-conf_246.1.bb}      | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 meta/recipes-core/systemd/{systemd_246.bb => systemd_246.1.bb}  | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.bb => systemd-boot_246.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_246.bb => systemd-conf_246.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_246.bb => systemd_246.1.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.bb b/meta/recipes-core/systemd/systemd-boot_246.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.bb
rename to meta/recipes-core/systemd/systemd-boot_246.1.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_246.bb b/meta/recipes-core/systemd/systemd-conf_246.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_246.bb
rename to meta/recipes-core/systemd/systemd-conf_246.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8ce78efbbde4..25f80ff237a2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5c68ad14af6c89261f31f0abb4850fb1c99e8cfd"
+SRCREV = "7fb880ddf101b871f68aae0d86db652e2c13c5db"
 SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_246.bb b/meta/recipes-core/systemd/systemd_246.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_246.bb
rename to meta/recipes-core/systemd/systemd_246.1.bb
-- 
2.17.1


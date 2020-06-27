Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2498.1593229289410496665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 20:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnFxpxNP;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id 207so5307447pfu.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 20:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=/+JcYrtoPwSrUU5eBL4u99f33cYzAzGYYfZ0HihSxhA=;
        b=NnFxpxNP3R0eBhZrmm4RNgrIXoHr8cNZcIWkZ1/WwFCtkwtmcOGOGM2GD71ZdXGS5q
         gh5QimANuFdztOpEprTQZHw8+6uHgvzo3sdzciOJIkQEHLLwgse4wn34z2kv1+KvpELG
         L8FrCjLgUW2dVMAwzxdevWUusxI2+fBiX/1GhKe6oz8t5Rx809/hOGX4SjK0i8nPcRWS
         PX+3f8oidITf5VXzrbAFTGC75TEz9fgwbOKtrDfO1yd9lA38vkjEc4CM+K0eJYTipLnR
         NAwGAHGCrTdGmUdnbCJUMsUdL/qMRB9tkqao5DgN3eSZVBxVH6/Yx7aG1DpKJTqLzgfb
         Ij+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=/+JcYrtoPwSrUU5eBL4u99f33cYzAzGYYfZ0HihSxhA=;
        b=szhxaR2BSp0y4L9tItiQEip7Y3IL/CfNOxdfv/QmMUrKJxKtUsV4E3TyXF+r43fnsV
         w3O0G2Q3EnuJjszohlWdcxcKrZzlbs/V0/8P0pdtsTOkpMS4iUrYM+MrxEMuVaNAb/+t
         c186nz0QEOu98x+FxM+GvJ4sWLzP+pUeGIsZKsqkKEqBaDksC/k62nCchXPUgGK+GGfL
         +WVxAW3gSiHyh23bdmVurU5VTNOLzPKrhrnzvLhefEnGsG9pCsMA/gNguI7iEQlX/lI1
         T+Wu71Scerf8uiXzdGf+K96e2l+AZ+aY3JNa8n0V1WDRf7kHuX0s+b5cNI4iPpiL/894
         xSPg==
X-Gm-Message-State: AOAM5327SkpUR6q+pgEoZZ9RHVJn25Eg1D4kobfrw2U0oRaJlzu81cjC
	oyV3xseKgmdegRcaXw0h1QusfCCf
X-Google-Smtp-Source: ABdhPJxelXCWiEzkEoyZLW5bzcbzdKRcswuXgelU3L4VtnpZNLPPa2izOC5odbC4ZF5lWdZTU599zg==
X-Received: by 2002:a63:ca11:: with SMTP id n17mr1648587pgi.439.1593229288506;
        Fri, 26 Jun 2020 20:41:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5dd6:9daa:53f4:d130])
        by smtp.gmail.com with ESMTPSA id g17sm12565772pju.11.2020.06.26.20.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 20:41:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libuv: update to the last version in meta-oe
Date: Fri, 26 Jun 2020 20:41:26 -0700
Message-Id: <20200627034126.1162-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Looks like I forgot to update the contrib branch.

This is a squished set of these changes:
https://git.openembedded.org/meta-openembedded/commit/?id=e03b48481438c747322f07ac1e1f04add541ffac
https://git.openembedded.org/meta-openembedded/commit/?id=9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a
https://git.openembedded.org/meta-openembedded/commit/?id=644ea1ee145902b00e4e66856ebe8d8800dfc1f0

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libuv/{libuv_1.34.2.bb => libuv_1.38.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.34.2.bb => libuv_1.38.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta/recipes-connectivity/libuv/libuv_1.38.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.34.2.bb
rename to meta/recipes-connectivity/libuv/libuv_1.38.0.bb
index 234cec37bb..afc9b2f2ea 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.38.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
+SRCREV = "1ab9ea3790378f9f25c4e78e9e2b511c75f9c9ed"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.37065.1622412539222693966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VRPz+AXI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id m18so5168191wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SOpFDAHFhOBboaBfupTT/wxOgT87kYPQ8Hhdlrv/fDI=;
        b=VRPz+AXIW48L1QnJFDn0RJdhQGOyNXA72WubRjHBlKllQtme1U2PLVI32sHIfQuTD3
         cMnCMwIpqMC2xXIVNvFRCUpvTuvhe1q2f8x8J712PxqY0DVgNkkYNDQJFB1nEiUHtQgx
         H+KlrF1PIQNIDUkGeYq/CJd2cr/iXWP2RO49w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SOpFDAHFhOBboaBfupTT/wxOgT87kYPQ8Hhdlrv/fDI=;
        b=gNQzglohAOBwZ/RUE9HkUWm4koQCvGDZZaVUxDMRLkJRiL1xebquTBMc2VYQUF8t9G
         s/Iickvxs8GyfHEIPNzOrk1xONqLrpqDorIMmKKf0wNrscMQf6iS1o1wZCPgBMqTkyZz
         +N6cgHq9WydpLAl2i8/Nmnvw0afQSOIZttdghrItvEbNL4HsbXDvU86JwBwspgUJdbQY
         T0Bet90R346eE9rwN1DpEs9lCuVJk6jCN0mcWpT6u0h3gVrr89JGuaro/PWCddfvvCrC
         PjsJObEyzgnolSNjEmN54MbAJV6wA7HkGIIFunDTOHq7t1kmeO+mg3HrKHfrL411uiuL
         XAiQ==
X-Gm-Message-State: AOAM531PrXWVmfeytozun6N0fCDkZfOLoDm+CkUB5axzOQpM9EAZQe6c
	wWbNeMdxPk9QawqIcU+yntKgJEvDbntRfw==
X-Google-Smtp-Source: ABdhPJyKOobJx0wY/VtwmBlJHtVtWwTrIwimGC5e3n72WI3qROCZpaypCP7mRhD5oc0HUyxqfmHg/Q==
X-Received: by 2002:a05:600c:2d89:: with SMTP id i9mr23124742wmg.139.1622412537547;
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/16] libxcrypt: Upgrade 4.4.20 -> 4.4.22
Date: Sun, 30 May 2021 23:08:42 +0100
Message-Id: <20210530220856.2830501-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libxcrypt-compat_4.4.20.bb => libxcrypt-compat_4.4.22.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.20.bb => libxcrypt_4.4.22.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.20.bb => libxcrypt-compat_4.4.22.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.20.bb => libxcrypt_4.4.22.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index c16068c1614..e4505a666d5 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "e73ff0137de5152e69e8abb0bd260541804dfe5a"
+SRCREV = "3df9620d08db207367c0c5152148665b5ce422e1"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.22.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.22.bb
-- 
2.30.2


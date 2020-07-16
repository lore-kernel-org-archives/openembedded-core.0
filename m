Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.3346.1594933693915069229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZwAwPbND;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f18so13047257wml.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+gPTHJ6eOB7d59HhiNIJPOvCM00GoHguaHZuaqwyxkM=;
        b=ZwAwPbNDpeJXOIgL6IC5lfGxQmSW5Cwjob4pnDMP3k4uy8qAgnxdRJBiVFrZV/I0IL
         BzhvTmUu8IcD+1fNKjGjE32YY0K+tkYhPjJSf6y7eMPAAo7HEETrKaMZNn42TOsXckW8
         9qN86TKyjZyGYMA+wVLDt9aEcHVy1V/zTEu58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gPTHJ6eOB7d59HhiNIJPOvCM00GoHguaHZuaqwyxkM=;
        b=SWnhBom57qqqbrOLI0hv9xw51Ec517BROqbajEvO732DCNrZ7FwAhyKhJXZw/d0N8D
         S7LL4X3yyeiiaMXgNxZJWI8Xq338vwhO7SdZohlL7M+An9mzx/Kkpw8NT5ZNghnGqfxg
         341GWgNFS/3U4T01oemD3HvDLMFfd0/ZQ8n47Xb3x0np7RKSY/a3ND8cbJd+Z/+WveV+
         yN99fXW4Xbqhem167DsgrXQeOJy3bLQOiwEYrs5p0ovZj3fXTeMIMW1seuJVwt8aXWUy
         OT1DNVuyi4lQqj1FKzOuMjI4r18fHY6Xbdp9yexJN1gwJ12AYmpSNDsuwe1ZqiLzvl3Z
         S0Ug==
X-Gm-Message-State: AOAM5308cqLVZnHgs+9GDkVeWfmheMeYRtGOzT4rV13QZxv0ECIBCg11
	bUr+pDnMPyTxf/cYiQRalZ67We8sayY3rQ==
X-Google-Smtp-Source: ABdhPJwU5XNCr/4bUynR6qNDRaqC9b8v3RcFebb8ztnK/Xww3uXnAEH1//wQ4owu0rwdsmRJqmK5fQ==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr6309583wmi.66.1594933691720;
        Thu, 16 Jul 2020 14:08:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/20] init-system-helpers: upgrade 1.57 -> 1.58
Date: Thu, 16 Jul 2020 22:07:51 +0100
Message-Id: <20200716210808.7438-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{init-system-helpers_1.57.bb => init-system-helpers_1.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.57.bb => init-system-helpers_1.58.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.58.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.57.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.58.bb
index e41ac21a285..b591f412c67 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.58.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
+SRCREV = "6a1860c6f5ad295af605ddf588933544e7c24ce1"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


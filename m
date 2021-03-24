Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.224.1616596790331977900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sabpP8x8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e33so14783921pgm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iqTunFCn+RPS7yvpOFDNrrY579uxXqJoMk6jMR4jwrA=;
        b=sabpP8x8LoT7+j+shQsVdvEsS3p19RjlJ8Y653VPOnzAjGbFnW5G3IBNtJIvCtqC6I
         KdmwO7NRoPE5p9BvgR+5VyW90mso/cKsIPC4va+S6TlHwXd9xJAa/qn96u/ZlQLfFAe5
         ZOdcdLwvEG0SZEppdflg4eeWVp23CAc23UB1ZjNIYIW2L8yV5QTT/VIIUo98LTHBmKm4
         m/Qa2LWwJr5TRo09BtzeNdM++ESirVRC3PnIe5+bZPFEcM3xjCvxxh8C/vEz5lS0biqS
         Svbr97tND+xYYGfGam8dxsqeb7yFh8k+knNfyS1xkiIi2kE2J8n9iQBJJ9LI+k73vGTJ
         yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iqTunFCn+RPS7yvpOFDNrrY579uxXqJoMk6jMR4jwrA=;
        b=rhSrhDOOlyzDtbSqG6ZXrasWmuDHyBYedLbDAY5WsXJLLQuSZ2ajTGWMnEB+HEuCPW
         ksZW15efCCRKCb0mdYUbuFWB+OVvnRbdh2Ka5K7gfgm39g0+j5KWjO8tc+AphFcfFxMB
         yxmDwnjbNEt2sztjMPZq8uYG20zEi1i28tPapVQwIcs8qSCesfdCKPvve1Pa0mH3JTy5
         X7QyWmjnbv9Ge1GVYEte2znYnQWOw7DJPkC6P+lv3PAjX9CoQVHkc86rl3AWNP9m5nzY
         UhAYeYknAKzg0lO/9pXSw6CXTGkgpqD5prQY6b7/wAzlVkWVFYqB4dtp5DLYBZZKbMUW
         Ncmw==
X-Gm-Message-State: AOAM5339vmrbxXJ0m36K7JAwdeqmixec3Sb5r7XRQqrmB46KV1ztzI0i
	JOeqmsO2sELT2pAHoIHyaFH2InwNu8gG5Z0y
X-Google-Smtp-Source: ABdhPJyt1T/+E9xr+Vcjt2k4w7cBrIZ1UC/7R+afys3j56AjN+KRr8+xRHaJ3QdSf2jEqB0QTsdWCQ==
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id h25-20020aa786d90000b02901ef4f404bbamr3485322pfo.54.1616596789359;
        Wed, 24 Mar 2021 07:39:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/21] meta-selftest: Add HOMEPAGE / DESCRIPTION
Date: Wed, 24 Mar 2021 04:39:01 -1000
Message-Id: <c1d8d25fffc119adcc5f0a49b10b21dcdc1c6572.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda Bassey <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing
descriptions or homepage.

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f36f176dc0316a79ae288c3b4f6c2eab366810dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 9f905a5198..dcf6c8ba63 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -4,6 +4,7 @@
 
 SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
+HOMEPAGE = "https://ftp.gnu.org/gnu/aspell/"
 
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-- 
2.25.1


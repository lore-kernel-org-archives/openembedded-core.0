Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.734.1603381946304931363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b1ZqitJ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id b19so1189929pld.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0d4SvIyaHB/GGqU32z6W6NqUo7IFxd2Q8b6UqTqV7IQ=;
        b=b1ZqitJ7P1dGmbmxV5zg7f6/4h1XxmbUl7lsi8fdgOs0QrY9GYI0Ss/eLO/I3XdT0e
         piKpEv/SpEWbsxakzXbIGHjV8j0a3zx2xHbWlWshWzkTqtDvuZmJXZddJ7Mnha3idTwU
         /BgVBATuhD9JZCmH0quJLwyLe14Xblc0k0NgTy5BRAF2811vcvau7b7Itid9RAyHP4Zw
         kAQIidJxnB0uAqJc7UqYrWvv2/HL8IqE50ZVGMtTUbDBFB6gz+GOgz8KZvOgniHtMNEu
         Z6P24pUVI7UBE4Vo6+bPPczNdv/Ya0i0CRLbW7yTsaspuBIP0zhGzH7nu4TzTtX5bIsB
         AGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0d4SvIyaHB/GGqU32z6W6NqUo7IFxd2Q8b6UqTqV7IQ=;
        b=j7rbnJpbgZqfbjdJlOuxGzLciT5q/Eqp3vWm9iI6iNN30bSLh7yqopnYRhru8RsBN9
         1+0bKT3DSecF8LnwISGwnyUmgb+zRkSxe4y8dV5vUC8lvPQcS/v5u331Aod85QHss2As
         rlU+JBn7ilWIPzR0VneUFnDr8ni44QJbqSkA+ZaCK68VaHU1xfX6qdzKC+F+sRFtoSur
         9C+RfMUiImELF4spdI9HAKUrY+wCksGDfl1TS5O0ItbprZe9s9vvPIzIMJo5zsJfrOya
         +W8IN2hD3O3OIrF8x4e6aa/VNt8uBjwjDmVF4lejSQzKf6GRWnnkBE2lI52/uXBeSOmV
         YvPg==
X-Gm-Message-State: AOAM531pV99uynBcbZNOVJ1WaYmx4aemU2rcTmY43cYmkLkWb72WKL1U
	3Gp8qyjV8QXh0hErm3sl8PdjLCHIUlfdiNob
X-Google-Smtp-Source: ABdhPJx1NrkrICr5d2mL7yKrMq/uXNQMVv6tu9TytWTricFe2VYaDySHkPtaepZdAYMeBQr2QVU43A==
X-Received: by 2002:a17:90b:a0a:: with SMTP id gg10mr2693792pjb.1.1603381945248;
        Thu, 22 Oct 2020 08:52:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] arch-mips.inc: remove duplicated mips64el-o32 from PACKAGE_EXTRA_ARCHS_tune-mips64el-o32
Date: Thu, 22 Oct 2020 05:51:35 -1000
Message-Id: <c1bc580dc4b4d0743c3939e3415e3c40d623b799.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* broken since:
  commit ae5073c4abd8935c01d14d3e6395124f815bd10b
  Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
  Date:   Fri Sep 23 15:28:08 2016 +0100

    arch-mips: Add mips64-o32 tunes

* fixes:
  scripts/tune/log.fake-mips-24k.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips32.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips32r2.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips32r6.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips64.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips64r2.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips64r6.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-mips-74k.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32
  scripts/tune/log.fake-octeon.mips64el-o32:    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64el-o32

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8f07d1249a9a86307c1121edd4df3b64162c61b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 2f625119cb..451017f453 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -135,7 +135,7 @@ PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips mips64-o32"
 TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
 BASE_LIB_tune-mips64el-o32 = "lib"
 MIPSPKGSFX_VARIANT_tune-mips64el-o32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mipsel mips64el-o32 mips64el-o32"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mipsel mips64el-o32"
 
 # MIPS 64 o32 and Soft Float
 AVAILTUNES += "mips64-nf-o32 mips64el-nf-o32"
-- 
2.17.1


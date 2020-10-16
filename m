Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.11556.1602840412422073786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qq9M+Nrn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id h24so2130111ejg.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xM4uvJwKeZsgi2NUpoD2IgGmMveHA4r+qvCWumNtqf8=;
        b=qq9M+Nrndv2omu8D8PA1d+ghPoFBnUtsE87q+EEIXbqOt0k0fMNSr1nvEz50lr8PsX
         UefhPmcdH+uyWH5wwH5MxGobLMumHAsQ+rDycNmDUpDSwir+81Fm2w4mplLCTPcdTs9F
         zek1mrVlY1GxGFVhcDaIIEkjR8paTVujnc212ychD0deV3XTBuWxUdKUGGasxqh6zSv7
         Nl8hEyYtpPru9xRVDQRiDzrUqDQjyjlJ4bAZiHK0C1bg7aAQQ+QjbuIxb2S/XZenU97r
         SGKJs6c0NNfKbDbVTe8YthoTbm+Fj0XvI5BleM30Yfy9KwoYIIlHHWxcr8eBFDVd35Fc
         omNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xM4uvJwKeZsgi2NUpoD2IgGmMveHA4r+qvCWumNtqf8=;
        b=nwoumC6pWLnXrhvro55XSh4v3JvefSolo8ZbB7QdzqC9EZhkvk08Kur3LssG+OY+FM
         vBqYX8kdnIUVYwu6Ve7iWKk3w10UjPczKPnyG3Eq5kDiNuHANFhqxNOhPOOgs+h+OnEN
         40bS2mAIPM7qZ+5f7/SkuO5324nXWYTZKa+/2S5CPEDuRUHZp3PbM6UfuTdMR/QG0XIN
         ZO5Ds9cFLjsKKzSn6a9hQ05Db+OY9bGRGip4uM5E7Ck7WFLsxt7Xfqt8ikMh+jUg0Mo6
         bZj13bzvPRZOccGqFQElej2271EYYztEnAxefPx5cUscMAJ3r+KhKcze/1ZaCEgqcL+g
         fhjQ==
X-Gm-Message-State: AOAM532n/LRa4DkTjgAfcc936wkJFE/BpHyt1jz8YhmxO58Nfsj8j+25
	8a7E+d7KCLPlO7M9mx5YBql6dBh82PU=
X-Google-Smtp-Source: ABdhPJx1WLUbi3h5WhDJbY28q2W7aIhVqBt8RptVHpAwiKHnEtMtsBK9C2G/TSSu8BVek0k9BNXUxg==
X-Received: by 2002:a17:906:44a:: with SMTP id e10mr2795222eja.401.1602840410681;
        Fri, 16 Oct 2020 02:26:50 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h15sm1170065ejf.50.2020.10.16.02.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:26:50 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] arch-mips.inc: remove duplicated mips64el-o32 from PACKAGE_EXTRA_ARCHS_tune-mips64el-o32
Date: Fri, 16 Oct 2020 11:26:40 +0200
Message-Id: <20201016092641.3860384-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016092641.3860384-1-Martin.Jansa@gmail.com>
References: <20201016092641.3860384-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index b45989a775..cb1a4c443c 100644
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

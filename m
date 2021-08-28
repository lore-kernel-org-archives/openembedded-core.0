Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web09.189.1630174452859445409
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lorjF7Wo;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.181, mailfrom: steve@sakoman.com)
Received: by mail-il1-f181.google.com with SMTP id y3so10889935ilm.6
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SFF7R/q2BHRq5HnXSTHPkAlAro3K9Gc1tRB+Z+VdTuI=;
        b=lorjF7Wo3RsGQ8va8YXt2KSKBMtdWrfqeS0VJLGRcSJ5+hyRX5wXoqvTp/jwn1hbsD
         jPO0pA4ve9v2CcT26CZ7XLfTFIPsDdGok8ly4DvyQpxnYkyReM+I/7U7eNE2qEFmpNRY
         //H97Mo5fns6plYzTitNybiY/X2Ud6ZYWQfvu7yJVqfnFwMGAduY/83XYGvD0IHUeMaE
         p0CZyeE/WzGCZKS97ik26JDXuZXgQYIKSHYAJAP3cBzre2qtDVwi8b0xlLt+MBimCQnq
         vLkpHxyeUTVhu0Eh2GHcucsK7+NSILqTZx43aKbWIls6NT32AS+qZvNAUQQDY8AmAVwQ
         pMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFF7R/q2BHRq5HnXSTHPkAlAro3K9Gc1tRB+Z+VdTuI=;
        b=XXfxWq7T5uAiFTw4p645RF+3r+ofbMH1qMmMsPS2LNVP2pmKLHo6DLXwqRg1XggRwU
         Hw5mJy1R0hnfcGwAun5Rm+dSlSPZ5x1TyeM5JF7xYlMOdtpFnd1Ss/0UNk3JqgbcaIpx
         Hify1QYCqiyowxADumwg3CtwlAbpmFzqF7QXxtrfumHccmqxfMBwFMrDyvIsjPloCz24
         wIOvt5aXoXBkY5UymKKilVIXL51kn1FqY+pttjA+Rk7nIqNhPsKLGRvkkPb7K4Wd60JJ
         DQmjiZflw1fPhR0F+CXXeu/+a/OkGFJLj+sNerU3obmo8uAYhVez+vRwhZFxfFdLe+1U
         jUfA==
X-Gm-Message-State: AOAM533eZ8AKHGxP7lkGrv6CEUtSiGEQ/TfUt+N1dhSgpw37zMaBBZkG
	qUwktL1hvExHUSF2mfKqcP9b6yczzkEIZ07h
X-Google-Smtp-Source: ABdhPJzfDPHoT7DXgaDY4BUWb3kCS5UdOEue/pMRtZrEWKIPYS49rLOCSSdcp9AByf9Je30jXjGQ0g==
X-Received: by 2002:a05:6e02:503:: with SMTP id d3mr10688595ils.107.1630174451856;
        Sat, 28 Aug 2021 11:14:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/36] lzo: add CVE_PRODUCT
Date: Sat, 28 Aug 2021 08:11:15 -1000
Message-Id: <69e33b9eee6ae97208e766fd96353dfcb8c20bd5.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marta Rybczynska <rybczynska@gmail.com>

lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) were
not reported.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366cf8201e36df1ac836e49de04ccda1f763ca9e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 85b14b3c5c..f0c8631aea 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
 
 inherit autotools ptest
 
+CVE_PRODUCT = "lzo oberhumer:lzo2"
+
 EXTRA_OECONF = "--enable-shared"
 
 do_install_ptest() {
-- 
2.25.1


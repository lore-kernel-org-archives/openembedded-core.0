Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web09.10207.1612636531935419596
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 10:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=fNDH3Gyl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id r23so9480253ljh.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dhZZ6dwBJIY68ORtlOTauHBuzOyATZ9iRgtUhVdhKRo=;
        b=fNDH3GylZEMt9nt9GoQ20TNJQADrffO/MOJXTIlG2oeFiWmXKqNyzgDwx/IDIgmWU4
         B5iUrl8Xly3IzzYHsIUJboMVX6A+KF19wLTOKJY1QtwnBwuneSdSSpSjaXgXAkorDRB9
         rptxhhUXt45JD9gUjlRSpVV7gwoVc+S2plF3wY4FYcKNfrmQmPaFoJ7zAOPN9t5jMeNQ
         Wvhg4M8O0kkuLiPE94xNC1Pz1E0wdz9sxpUdj4bkvpsZrf+f9uPlO7jF3z3qndNegkY9
         kw67nmawinUBhc7/dexFhBOE+7neokdQ5a4CLCmoxf+lyk76JkSBUAz/F5reVNEB3SVM
         Pd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dhZZ6dwBJIY68ORtlOTauHBuzOyATZ9iRgtUhVdhKRo=;
        b=WUt9FAOEcyGEnOZ70x2IguEzPpHEvp2IPzvCkueiHnRH8mfEQWLYyShXfTvZXeNnAe
         O34WeliHv0nH6h1tZ/drcFI/8ebAymeeKtWFdH4LiIYrQ+P77fKB4dt3T0J6B6LsoNzH
         /rikJpY+2QmruCUxOj8//AJS6TPFNv88P/+hNMLBfA9rLGV8jv0IGqI+1yaIpXHHpGqm
         VbGpszfy0Y1naUBnLpR9Zfkdnnade2cVreE7duOZ6n79ldl3PNescsHBrGhDy46Q6WGF
         EdilNKGxSwBHZbaf9Eterg6qG57DqPayvTuacjrK/2LEGGXgodtJqOxBhWhtVMPaSgrV
         QfRA==
X-Gm-Message-State: AOAM532JhLMLpjFUz2cn3GTtS9owcxvw4c8QjDbFNjoo2el+sJ8zgXdp
	/vPB7IggkEisRkLLTXyTHqImCJSojAKoz+Mf
X-Google-Smtp-Source: ABdhPJwd4cIYEQhfvCYMt08LgpVS2qCsxRJmM3GTVZm/zJu4YVC+gKBowRpLhdEUkTs1EM5uqfFhiA==
X-Received: by 2002:a2e:2c11:: with SMTP id s17mr5967211ljs.468.1612636528310;
        Sat, 06 Feb 2021 10:35:28 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q16sm1393863ljh.139.2021.02.06.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 10:35:27 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.37
Date: Sat,  6 Feb 2021 19:35:26 +0100
Message-Id: <20210206183526.3385016-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Fix issue with D-Bus filter messages with no interfaces set.
- Add support for PKCS#12 certification loading.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.36.bb => ell_0.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.36.bb => ell_0.37.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.36.bb b/meta/recipes-core/ell/ell_0.37.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.36.bb
rename to meta/recipes-core/ell/ell_0.37.bb
index 4535ec2186..e442b02198 100644
--- a/meta/recipes-core/ell/ell_0.36.bb
+++ b/meta/recipes-core/ell/ell_0.37.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "2f99e743a235b1c834b19112e4e0283d02da93b863899381466cde47bf159cf6"
+SRC_URI[sha256sum] = "30027a2043bbe2faca7849946bb2ed7d5e48c1b9d2638bfa8f5fdef3093c4784"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0373C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:11:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.1798.1683310289195142987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UFPKS86U;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aaf2ede38fso20143105ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683310288; x=1685902288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mLnnM7OriKhuQ4sTjQycFScck4fa20zNYSwpXfllO8=;
        b=UFPKS86UNNV/m2rzvhN2e11GjYGmExpjsSsaLu2eEYgOuusOkt3r+y6Ehi0FG22DzV
         bFpN4DKuj98XWYcHntamZfZGAT2GPYrnAxSDoXiYdmYRFI0LwpIEQ8N3zLGiPWxE8V3E
         5uDhZHaoh2yNOHbBndzCECGrB0V2LYF9bl4Td3NZxsKKrJ/rx2ttPIc5Ppb5PG6ZBlSt
         6OPoep3gS/Eg7EVh/UZm1wuX5H4wil9m2jZ3QRbXliUm7BIWa1ybq7qRDM+0pOt55q2w
         wAMr5AS5y/OEXS2RwYSOmCb9H1mRbbAamTdJa5d6L6TXc8k2F54ZiNkAeqHcur3Nbpsc
         6qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683310288; x=1685902288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mLnnM7OriKhuQ4sTjQycFScck4fa20zNYSwpXfllO8=;
        b=iatQiCkV/kYQv9xPNZRyPltHfENWSeZHzhMOYm6KN8zqeNdt+s4TVYUWF0zGSwWQEK
         qmJLkDYNJ8chEjX1lrJPq+bJI/sPObIv1ZeK1rVnCoA09H22Jxu9Tlu1K8e/wkqdC6Yd
         SPhaWReJGjnOg+Dx8mUL5vY79CcP28aQvdXESuLkYx/TG+mJZ2igFlKat6Ott5Z5y+v8
         Tcxd1dfUksBcVawd6PbEdgEJuCW6blXzXcB5oVHj21tL0QAV64Vaa48c2O7Zl4Ep0EtA
         RHOR1t4fK96RjJTR80NolhWBkMnplUgPm4/HAddWCbnL6oc+4isHD3Vx1nqeXlGARWga
         pDDg==
X-Gm-Message-State: AC+VfDz7f/DHBIBfXYLU4wFfW5PDQBOyZKRHPmYEgI7SEAmE/MIv1SG8
	qRonPf4ChCbHOKzSzwGDaCW2ZQCq25A=
X-Google-Smtp-Source: ACHHUZ4gL7LCtyoIlXXpAknynpfcFW9FQsOWff1YYcIFEhhT/4wtzCpBN8mq36PEnmIKpHNHSEW2Sg==
X-Received: by 2002:a17:903:1d1:b0:19a:bbd0:c5cc with SMTP id e17-20020a17090301d100b0019abbd0c5ccmr2345557plh.60.1683310288022;
        Fri, 05 May 2023 11:11:28 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f14c:d805:2423:6146])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902724700b001a63ba28052sm2085869pll.69.2023.05.05.11.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:11:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-attrs: upgrade 22.2.0 -> 23.1.0
Date: Fri,  5 May 2023 11:11:26 -0700
Message-Id: <20230505181126.2886327-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180964

* Change inherit python_setuptools_build_meta to python_hatchling
* Add DEPENDS:
  - python3-hatch-vcs-native
  - python3-hatch-fancy-pypi-readme-native

Changes:
https://www.attrs.org/en/stable/changelog.html

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-attrs_22.2.0.bb => python3-attrs_23.1.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-attrs_22.2.0.bb => python3-attrs_23.1.0.bb} (63%)

diff --git a/meta/recipes-devtools/python/python3-attrs_22.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
similarity index 63%
rename from meta/recipes-devtools/python/python3-attrs_22.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_23.1.0.bb
index 8c1ff330e7b..c8e2e514a43 100644
--- a/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
@@ -3,9 +3,14 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "c9227bfc2f01993c03f68db37d1d15c9690188323c067c641f1a35ca58185f99"
+SRC_URI[sha256sum] = "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
+
+DEPENDS += " \
+    ${PYTHON_PN}-hatch-vcs-native \
+    ${PYTHON_PN}-hatch-fancy-pypi-readme-native \
+"
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-crypt \
-- 
2.34.1



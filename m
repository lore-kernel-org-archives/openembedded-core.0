Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8998AC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 02:44:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.18528.1683254635858626469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 19:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FyEwz2vj;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6434e65d808so1436918b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683254635; x=1685846635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhkg+rPyxbDbQ6+c7t39OwyBlCAI8ox1Ryn+yMEcgkU=;
        b=FyEwz2vjBHUd34rCRhEP7as5ErKdAXdzP6nnHyQdY0FqgH2x66Vx+vZO/hFVhcsamJ
         ic8O9mu82a/IK5c5k1pT1p9ADq71QlRJLCwnsMjV2fWckOBjbjxtIN659oe4OUx5CyGn
         ERFuj7wzWO0DezgStM8TJTyi6m6ywVjaTsxDILCNNOhRuCpSDWR13TFHE0q2u50IDybS
         bh3xil2geerlFqPZXAmuIQ/bxC2X89ryEUR8OS7gi5HcjKq1uQwDE3bqZrws9JCj65ZL
         e6ZibCoAm+43HFbIkWOe36WJjd2FGhP4lojM+rCZCkfhghTOe161npbclNPYJVWM5NBx
         hvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683254635; x=1685846635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hhkg+rPyxbDbQ6+c7t39OwyBlCAI8ox1Ryn+yMEcgkU=;
        b=HMVqAPkk5OBDEs5HV+UIxEFo/wz2WcXvghPwzwUasCMdyFvRR7uENZU3h6D8WBo4c8
         7Dt0bnDGFvzY0bezw/ErJ8dtNezlEPySaJetGwZskYwwDet33cPHdyH4ZysFABMv8cY5
         UHo7S3rOP2OHMrLsxQm25eV6Qa69OQIJXOgL3bp/i+H8T4F3MxTr9FyQ6BbT6te5RkVv
         JUNwzdQR3CjXundVUw1AfYXb0oMSgowwmFpaGacS+71tgK/Rfpi1fU7GgDTLm1vDdlFG
         rMUYRWV3IbfPtZcTZF46ihzB9yYVUFZ2gQLoXhJz036KqmNyTAhPaGl38dyMwiVufNyn
         Yg9A==
X-Gm-Message-State: AC+VfDzl+97hM9lQMKOwXHfBydp9VcRJMpHke+ai6XxUTISLtAupiKoJ
	3ZAHZ7+XUkHItMF8kQdguS2YqF/atoA=
X-Google-Smtp-Source: ACHHUZ5KiuB5LLVF4lK071DYhF6U88RfP+sK4wfBj2r+34pVv6otUy9BF3ccrW/cIBDFxE3FPYpmdg==
X-Received: by 2002:a05:6a00:989:b0:63d:368b:76b4 with SMTP id u9-20020a056a00098900b0063d368b76b4mr512756pfg.17.1683254634612;
        Thu, 04 May 2023 19:43:54 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:7c39:68:fc13:6b3d])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b0063d318699f9sm415942pfm.48.2023.05.04.19.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 19:43:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-urllib3: upgrade 1.26.15 -> 2.0.2
Date: Thu,  4 May 2023 19:43:45 -0700
Message-Id: <20230505024345.2726882-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 02:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180893

* Change inherit from setuptools3 to python_hatchling
* Add RDEPENDS for python3-json

Migration Guide:
https://urllib3.readthedocs.io/en/latest/v2-migration-guide.html

Changes:
https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#202-2023-05-03
https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#201-2023-04-30
https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#200-2023-04-26

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_1.26.15.bb => python3-urllib3_2.0.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.15.bb => python3-urllib3_2.0.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
index d2de7c4c022..bc1cdb009f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
@@ -3,15 +3,16 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
+SRC_URI[sha256sum] = "61717a1095d7e155cdb737ac7bb2f4324a858a1e2e6466f6d03ff630ca68d3cc"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pyopenssl \
     ${PYTHON_PN}-threading \
-- 
2.34.1



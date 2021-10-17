Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F3EC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 01:41:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.18269.1634434891808311807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=itwkFH03;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id m21so12362661pgu.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JsPq2nR1veLZYZCJSqc3i5zr37efMIyZ7yoBkVDInJA=;
        b=itwkFH03Ad6o16lq1HCC569Q1Ah1xTI3Gy7THfPnZY9hi2xWVrCBv+8vEmXUjjYMav
         vX70B1opXB+Rv8sF/u/goswj2jYlVv9B1wggkis7M+plSNQW32Rxtl9Vawp20RdvFgwn
         voYCR1Scvp6rW3kbiOd9E7meLRSe+9SnGwNMlytP9P/lMXp8NmcfLqG+vrsLll8SoWYI
         uktomKWXeYb0A9yUew2oxIKWLpAxxWZjVCiNWMxwjsHJdzHSJYho43wsFT+Be9oyomLn
         i6LnoN+BIfrwLpLC3Rm5G7cepIdWSgOe/4n3S4oT9ffuBt30j+AfJ3WoQ5knzcYX+D5g
         N2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JsPq2nR1veLZYZCJSqc3i5zr37efMIyZ7yoBkVDInJA=;
        b=PXrJiZAKaHnShWEnxWN3nB+Rx9lVhsUO1Ok3rx77ja1w/6+kWkerpivVpNyxbV0rHP
         qXwS9/M9H/fqjwWj2BByhZYUAc2MsV5tKVNMYxt6KM3jW2h4IdCpSBUdkTvmCkDMgfxR
         t+sfGSnI+eklNtA2lD0hxryKPgbvZS1j9ZngqHSN2mwMO+ORRYV0ZuEC+I6EY+GLlELZ
         ScQwVyEo9vljtf7dRwESXJBh37dOf5FIWKaOrCzznDrhxVpNw/Ssms0sT7MsEm+0/GFi
         pje9XZaGLty3UUfybm4sVi1sOo0gMv4I8F71e+0TNgKk7cj5LbFIOKjyR8RtIBbbbLGF
         BqCw==
X-Gm-Message-State: AOAM530T21Pm/fUWYOA1fHB54UEeEidofLEHcRkERUkOqKZmCYRMuLgF
	/5xEBNttRMzjDKZthAypvaTvLUYf68U=
X-Google-Smtp-Source: 
 ABdhPJygWIWVe7Q3rp1Ehw+bABdUy2D6bcwIOfOZdyBXD6G0YqXPpZIsKvZHkJgLRWCqHkJAkKYxDA==
X-Received: by 2002:a05:6a00:15c8:b0:44d:9f7e:ece2 with SMTP id
 o8-20020a056a0015c800b0044d9f7eece2mr10629089pfu.86.1634434890865;
        Sat, 16 Oct 2021 18:41:30 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 gf23sm9227891pjb.26.2021.10.16.18.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 18:41:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/3] python3-packaging: DEPENDS on python3-setuptools-native
Date: Sun, 17 Oct 2021 01:41:19 +0000
Message-Id: <20211017014121.414803-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 01:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157021

Not python3-setuptools-scm-native

Upgrade to python3-setuptools-scm introduces a circular dependency.

Drop python3-six from RDEPENDS as this was removed in 20.5

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-packaging_21.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.0.bb b/meta/recipes-devtools/python/python3-packaging_21.0.bb
index 201b583de2..aef3ccae9a 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.0.bb
@@ -9,5 +9,5 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
+DEPENDS += "${PYTHON_PN}-setuptools-native"
+RDEPENDS:${PN} += "${PYTHON_PN}-pyparsing"
-- 
2.30.2



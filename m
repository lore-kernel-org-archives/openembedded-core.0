Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675B8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:11:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.306.1647979883503482148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KkCELnMy;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: flowergom@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso2616385wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB4JBhszZmpsz2n4je5bIsmPka2PEyHmW9gqYmkPNuo=;
        b=KkCELnMyLvAjYBgxcRPS5jRL08S/MAZ3caNAFM2pN+yjGVz4Epxp4QOGLwF25Y0Ihm
         OTvOyGcTV6tneEW6cs//QKhy8l51GaYiLXSuReIoA3vAhGWIgH76y/BC9GHAT11wBnyd
         rHPXF6Nro3HVewk19puTeLSuhRcD24CWVQZW7f2pRFBhD9Fuz9NXsCbAIYprPizHB/Jw
         4nnkFCZGaXywMdTCkxWfPWPX6qCNCiJfWL+dayxX03AjMno353u0u6bmWA3b4c8X7iEJ
         kv+rmYuZThF/25mQDDvympjPo+77Gr1xTE5vegqXg1lR8nVGzoN4RBpddiZKnEldRoZ0
         YmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB4JBhszZmpsz2n4je5bIsmPka2PEyHmW9gqYmkPNuo=;
        b=pS88SS46AuxBtTmgdzbR5MKF3aucYdtMPfIYs2VKrN2nC8wMKP246KYnPRyT7dN1v4
         oP8jW5CKWyKzxbErQdGrlXdKHARjmDzqgaQb7jKE0afQ9R1xGnLHzpwmMoRHYOQG1J8M
         wVB79iNSZUYzqR9mxDKipUrJiKIUBLYvZTa5vphr5wtYhDnlZn5RcbwA0n4G9AChYjs4
         EfDd63O5tDaCEsFhJN8SpfKj/nIclMXAOygZBMVHKL1UtT54T19bPzNu/aQiniLiq6ji
         r8O+7zuGGJfXsaO5vT2Rk6PV64wYeL8xr8taoBvOlVLqZ/Jt83nhDEuW/x3+EfoI+fT0
         oFJg==
X-Gm-Message-State: AOAM533bb7ByJIulabb1icFTA+QJlmHIKSqXunElbINHhTwOtN2DPrkI
	jTfO6qRAD8M+U1X8VTb0val27oGsS4EmyyGw
X-Google-Smtp-Source: 
 ABdhPJyBI5LRlXS86Yr6zNU96lpS/UyQCu5PDJd+YKtoybNTSpn7Huqq0S7sfINpQb7jEmypyZqPqQ==
X-Received: by 2002:a05:600c:198f:b0:38c:a9e9:754a with SMTP id
 t15-20020a05600c198f00b0038ca9e9754amr5593228wmq.146.1647979881651;
        Tue, 22 Mar 2022 13:11:21 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 m2-20020a056000024200b00205718e3a3csm1942776wrz.2.2022.03.22.13.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:11:20 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [hardknott][PATCH 1/2] gnu-config: update SRC_URI
Date: Tue, 22 Mar 2022 21:11:13 +0100
Message-Id: <20220322201114.2595-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 20:11:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163571

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index ecbd60e72a..da52c943f5 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "6faca61810d335c7837f320733fe8e15a1431fc2"
 PV = "20210125+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1



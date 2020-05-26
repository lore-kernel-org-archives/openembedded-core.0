Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.46667.1590480760511331799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=s0/LEOX1;
 spf=pass (domain: googlemail.com, ip: 209.85.218.67, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-ej1-f67.google.com with SMTP id x20so22766260ejb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4YczQ7rqjLjrTV/enZJn//TEXCjYxfnAX3zqLnFDCo=;
        b=s0/LEOX1T2iM7ZrHH+7/kmG1YDtELtukN5QnfecVRHnHehlS2VtM18pnQBEUr/J84x
         4ytGc1oKusZedc4jIH82v/WcytkuupGxXLr5awS7+wlSG+RzbxOC7oL6naIWHQCaAULz
         +oOPGfESdo+qqtpPCJFlk5JyRBRohjwmwENVPR54H2mm6MQ8/nD70wS14R9DHTJo/RmM
         K+ogs0bsExv8SwGgDtbmcCGLcruCRurnipH4obcWDsvicAQLXfZjDwIYjS4MGv2erkC3
         kF3iAwzxXrnozuXhg/m8sda7JX6ttJHJap95nA1d11Rgj3a92DQrlvWpjeJOqVrY/Ktp
         DC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4YczQ7rqjLjrTV/enZJn//TEXCjYxfnAX3zqLnFDCo=;
        b=MQqTf6kXqey+pyPLfcX1iB8heZcdhU/6N/yu67qiB/aNrEt3CVBMbCXR/jtyU15bB6
         qj6f2r7OkqN2i/swh9xt3VFVXnaIq6Nc5izRbmcJLz8ULSiFQaU3FIkkZFQE6kBBg/tY
         IWq0nB9gc4Lv4YXs64bHMVy+HaL/eiqTvrDu6li9CisYbYIdav0n9TXnYI3M3pwtTa3U
         WpdUnUjVUKq92FbnjLWBOKy3kt7ZwP8HTaRJZ0rSNfxRXT7duJ1HgnLSXeRWxy7YxFr+
         6YToaQ2GhVHeLwNHAjSgwfDw7EVJV5E2uou7oQ2Ld5FqaxiyagGbNjGxPGLigbEZztEL
         or6Q==
X-Gm-Message-State: AOAM531IVKOgpz4pd7fz9Hfnu0ewwAw5/pph2TconGRHHRZ3mcnnfwjB
	em2gPa8SagLSQbq93TDN02xWuRyPjJg=
X-Google-Smtp-Source: ABdhPJyFfoQMRaAeIWLi/tJRRTS2rK/itKQ5z/3I+6XTfOdGtqB9OO681IR5j2wV8II6X61Ra5ieAg==
X-Received: by 2002:a17:906:6a92:: with SMTP id p18mr84377ejr.233.1590480758747;
        Tue, 26 May 2020 01:12:38 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from michelle.fritz.box (p200300f85702e800eba7f57533fa7a37.dip0.t-ipconnect.de. [2003:f8:5702:e800:eba7:f575:33fa:7a37])
        by smtp.gmail.com with ESMTPSA id w10sm16944519eju.106.2020.05.26.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:12:37 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [meta-oe][PATCH 1/4] libgcc: made libgcc-lic "GPL-3.0-with-GCC-exception"
Date: Tue, 26 May 2020 10:12:30 +0200
Message-Id: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

libgcc LICENSE_${PN} is "GPL-3.0-with-GCC-exception". If libgcc-lic
is not also set to the same license, creating of image with

INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0 AGPL-3.0"
COPY_LIC_MANIFEST = "1"
COPY_LIC_DIRS = "1"
LICENSE_CREATE_PACKAGE = "1"

will fail because libgcc-lic will have incompatible license.

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 meta/recipes-devtools/gcc/libgcc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 6d48ec9809..2e5b1fe492 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -35,7 +35,7 @@ PACKAGES = "\
 LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
 LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
 LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
-
+LICENSE_${PN}-lic = "GPL-3.0-with-GCC-exception"
 
 FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-- 
2.26.2


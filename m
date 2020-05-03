Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.25046.1588520680763851650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHIzaBxI;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id v10so7158259qvr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJW/3/Q8j7a1WiLjVOF1ivnc87eDIFWBomxEXCyMMKg=;
        b=gHIzaBxIwWJiH4qSemSDxPnv1nWN7XEvypAbdKyBl8sC+I6w7fExgbXyU9Ng0KP+nb
         PV4DZV77UUJpke2PIMOJwLDSIcXi1S6pCH6v+1fqzb9CNcg61QY6QXf6Pl0ZKhDwTGu9
         gvdcF6KJJ5fvwyKDr5w2JF9tEKokSPtoIkv6a6Bm/y5WERqph/27WEOOSt2hpdKhsOUE
         W9sgbX7w5rok7Mjh4tSMkBSkqLeAf9/Gs1jHthzZyCmmc+YOwDfAm9WniKVjoB2IXpRe
         GGROYoZFcMYMWnArAdAalkGM/aJYoWizaB+tcHP1qFJoyKUYCvRGkWlXXu6Acfsd+Y4O
         NlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJW/3/Q8j7a1WiLjVOF1ivnc87eDIFWBomxEXCyMMKg=;
        b=Gg3QBxwhVKNN5QaBO2RJInK6zgCpcc3tCPKqi0cCReVK19VEhqPcorRR+gD6pzTZJC
         odMzZrLsyEFUiFe3y3lLtQ90U0trAebMcGSapkIRIY1S4CkH2WOTTU8258dyMINoIaHe
         fVVIyTAJ3R9f8YKa0M4H+ZUFq4W9a0QGcwMGMQG15uO0qGDRqr3uscAdVoVD6cW2709S
         t0gycceu6P6+7O7cwc9WOBDYWELICKXC22j+6/Bi8AZjjfvbNkJgpnca2KoUslRFh8t0
         9kMGVmN7ydXJ1pFgal8sSf1y4Rdr3CnmHE5riEM9f+sYikTUiQQGrTRjFbhN023TsLbj
         UZSQ==
X-Gm-Message-State: AGi0PuYxnV24LFsmHVeOevedePMxFXIbEmqF+w38UYYEThgPfRRaGnLu
	jTr+y1k3m9prX5GVvxfcG1088YLMdEk=
X-Google-Smtp-Source: APiQypKnImlC2uEI4W7HMNagMOxBvpgWlg2ORG7Q1CRA8C1hllgRUF0D8dH/s1xgmX8qpG83yUG+1w==
X-Received: by 2002:a05:6214:3ad:: with SMTP id m13mr12705280qvy.57.1588520679929;
        Sun, 03 May 2020 08:44:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p4sm7771506qkg.48.2020.05.03.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 08:44:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 5/5] linux-yocto-dev: bump to v5.7-rc
Date: Sun,  3 May 2020 11:44:30 -0400
Message-Id: <4cd3bac95c10b1195728dfc8d17614ed95c87639.1588520452.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1588520452.git.bruce.ashfield@gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 06a9108fab..8a61b22761 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.6-rc+"
+LINUX_VERSION ?= "5.7-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.33875.1607949673982916593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vXCOj4RH;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id c5so12586581wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YlbwukCs2VpTpV5KP5hnHlGFpiD2Gb1/JS5B5VZyEkY=;
        b=vXCOj4RHM3+//1RxcA/ljl+sLcM5MRb6Kd+R9DOFGCaW5kQoWP/u0sLVCAUS6TjgXB
         dA7kfNYaUCyAzW6vDremtm3SoToO3JKL5gtNbBupZdue3glFrdibBliwglktEnw3vNQx
         NbnGUC3Yseo6MRwWu2u1qn8+9ctdwZ2jF3LyEHZPVXRJaViVzJCTS7Nh10InUrjJlW1V
         +0bMeTNLzTzsvS0VsDfov+JfCfKhOQbig/JfOaSRNpjDsCohdClEvMI/2v+iSvhrt1Pw
         TWNtVg+M0XoaanmC2S9JCi/mHSZt1vwo6+3YQxadXlGnRqBVS+w3CtB4C6G+dQbA5pNV
         yj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YlbwukCs2VpTpV5KP5hnHlGFpiD2Gb1/JS5B5VZyEkY=;
        b=pzKgdTI9JfHuSx6L6BIa4xSBZqerrc8dJpZT+Utoz+ycIxFEtBlozNUdHENg9hwXVJ
         kxdag133qwIPKe+CLWwx7ilJtwO5rO1TsfJF3cdk2piAdXi5e5sY+MAWvxjvIKk7DUDp
         Z4bvuDUVvCBGHtViSHqG+lkXWljH0O8EBRfgMUMl1GquUdtzIXc9qx148aeQZF1oAqC+
         E6YS6/HZBYg6rSuHDlch3KKInK98PSQSpRAgEVtGGvP8ftn4OH/KxR9IQCJmnUF26Rvx
         DwLD1wPujiku+FK0JieBqPI3SwWDEiEJLFGkVWBMcjrdGddvR5auZeK+eVfRq8PqIkWi
         eNFQ==
X-Gm-Message-State: AOAM532bd4MS+0+avsNGmU+WoScSrPDh9VZbbkWjwzEdfcUGSumBSDmn
	4j2I97PAXK4rDfo/iXqMn7NOQEhz8IlMgQ==
X-Google-Smtp-Source: ABdhPJxv7yAvicIOghDqXwnyNSrbrkrJDfUN2OYzTC4A3PB4r00MvBx4dKig/XnLm/9x6vSq/x/w7g==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr21900463wro.231.1607949312208;
        Mon, 14 Dec 2020 04:35:12 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id q12sm32029605wmc.45.2020.12.14.04.35.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:35:11 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/5] systemd: set -Dmode=release as recommended by NEWS
Date: Mon, 14 Dec 2020 12:34:56 +0000
Message-Id: <20201214123457.122655-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214123457.122655-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201214123457.122655-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index 09dce2e07d..f20e86d94b 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -210,6 +210,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
+                  -Dmode=release \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.29.2


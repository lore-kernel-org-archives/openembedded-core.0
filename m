Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.66456.1629354826697006147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 23:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JVlLrh83;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id u1so3171766wmm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYDALobzHzgPiXMyU1ZcHFT8eIyv+WKMANFJ3ADKSl8=;
        b=JVlLrh8303kLdOgDVrSM6DVhyhFc9t9ugWF2XIzjcdRkBkG+o2et+t2RGbbPbWfbAt
         bs/2ipXYC49zr3eHMS03PqiKkgG2VPYFHFBoGI9l4f5Z8R+t9Cmu3VorBus3omUynzem
         OXK0oIux5JVteCRWQNUq4/JptwKZx4c3/VOkU+5zZnhn5YidXmFdoSC21pKP0H89HR4O
         QGG21iivRdkynRiL7hoGvm7s9zAEwyZ9h/6yxwQqEmMyn+4bczPD26Xf6xLLR6YD3AN+
         Fgk97KKYXWTE0nT9ILRg+tjbXVioVWAlweFWqs6tYJ4UdAuwncMiGhPxH3obMuNrx8Ja
         2MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYDALobzHzgPiXMyU1ZcHFT8eIyv+WKMANFJ3ADKSl8=;
        b=V3/fur5d3L5kpw4tKqsLbm8hvQ5kvMc6bNRKtjjrwbs6ing2kTixASEZy2dBGmJr2R
         3jwA3cmwlihEQBXr+iXRMEFCuq5TcysS6Hgwy91TI5LV39/EUkp1Y758STemayFSnRPM
         471zkL5rbVn9o3swYnJRCqsWnS6TxJ2zv5LLBUi8GhmYJf6gBbls8zE17UbVnbIbhpK6
         qvCXr2w00Kfg6LOXaMy2A4hZ+jLgwQguOpTUBlGYUs3qL4Kf0pJ6Is9n/sdXNUoBisIR
         rROfNphv2ROoo3TDNkPaOEotoU4bpSMdnld8jCpeO4cPPkct0W825GHhHnPqWuPUHYy3
         f8lA==
X-Gm-Message-State: AOAM531V9S1NKzH0a6RWjpfrDiR+Xejel1aamUVk4abg/G3u0jNmpcmz
	ZbluCW28YgSj30toyTiISntao3pdldI=
X-Google-Smtp-Source: ABdhPJyJk5dHz9R+vDH6OBemwkoueipfUbEZsZvugBKIbv5qVTE7ZdpibPsQumqz6x4OXT8iJTTM8A==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr12660578wms.115.1629354825083;
        Wed, 18 Aug 2021 23:33:45 -0700 (PDT)
Return-Path: <rybczynska@gmail.com>
Received: from localhost.localdomain ([80.215.210.42])
        by smtp.gmail.com with ESMTPSA id e25sm2297628wra.90.2021.08.18.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:33:44 -0700 (PDT)
From: "Marta Rybczynska" <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	denis@denix.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][PATCH] lzo: add CVE_PRODUCT
Date: Thu, 19 Aug 2021 08:33:35 +0200
Message-Id: <20210819063335.3670-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) were
not reported.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 85b14b3c5c..31a229c7f5 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
 
 inherit autotools ptest
 
+CVE_PRODUCT = "oberhumer:lzo2"
+
 EXTRA_OECONF = "--enable-shared"
 
 do_install_ptest() {
-- 
2.30.2


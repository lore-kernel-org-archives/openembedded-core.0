Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.1023.1589490317463433183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbdn21jp;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e8so249507ilm.7
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Cip4PLOQTCqs10TtzuwbUdUOaUOF4IrKm4XJKAiG5s=;
        b=vbdn21jpoJrmxc83opdT1+cNKQcnp8BJqmD5ibmp5hbhb3fxGnZgoQeDpjSsWnnbRd
         IH4J3VM3Xkn8gwQhmQjCibsKkC6XJka8tMVgPt6UtQanGwevyChRuAordYtTZjvTJOp5
         hjOai6LUNE506M+OuEh0l+95Lol9RUkVR+TMN/iZO1+DAn17SrIYOaVd95M3bpQtCBm5
         7JbKcOVeF5FZGcxXz4tUmhB62yq2lOLwR073ruMesw7YT5wWbl3uBk3zgjfiaNfFJocv
         A3Gu6dNiCCpr5QtMco/MoLgXO9bGci7PI1qUR6gvvbdNmWdtaIXuUGjZAPRsHaazXjPQ
         ++sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Cip4PLOQTCqs10TtzuwbUdUOaUOF4IrKm4XJKAiG5s=;
        b=ei3/+qdU3YuwXe3S4xOA1dhWY6S3LNqQtKMeuDLHaoEGsKpMqYqdKonlIaA6tNKmjm
         zojDWf2yqcznDSks2RUr9cEIhtoyuyGTcyghFyPJf+oSRWn9m/ak7kwQwolUJzweMppV
         N4PoJtcwAmI8Tqqi72DrXTn1/wiGVchmEp0jCiTzoAevdWuqUr599Xvmjg0UnVm/5y9f
         I8hp2ct1LQ2tInMM1OkTbaVUOHdoPynR4rGbx4ugHGIAkSkxdlW+8I8avpW78+iiqG5Y
         YWQ8bJlA5+jkVzdPHvsHMUrCLxxTVbb55g5ArRoWB+bAuwWLTr1XvozptrzUQzyMcSVP
         BMeA==
X-Gm-Message-State: AOAM532Mt0LUw/s6p/lytSzGSohfux5YnJ7FFpi6d9bYjcLDQ4yHTAVk
	hVcreEwjghKJG8NvrsztFg7Puc2z9lA=
X-Google-Smtp-Source: ABdhPJwvv/kq+ofGg+cPQJlqnqHRlLsl72ASrLbnQokd/yTPCre2CITap7HZvYL9rDtpGKkiI5xdkA==
X-Received: by 2002:a92:c401:: with SMTP id e1mr120127ilp.134.1589490316666;
        Thu, 14 May 2020 14:05:16 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id t20sm52356iob.27.2020.05.14.14.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:05:16 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jdmason@kudzu.us,
	denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/4] python3-pyelftools: Upgrade 0.25 -> 0.26
Date: Thu, 14 May 2020 16:04:58 -0500
Message-Id: <20200514210458.33543-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514210458.33543-1-JPEWhacker@gmail.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...{python3-pyelftools_0.25.bb => python3-pyelftools_0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.25.bb => python3-pyelftools_0.26.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta/recipes-devtools/python/python3-pyelftools_0.26.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-pyelftools_0.25.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.26.bb
index 03d96db3c2..575dfc4dc9 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.26.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+SRC_URI[md5sum] = "0ba0de4b47127249c4d632ae299cb0e8"
+SRC_URI[sha256sum] = "86ac6cee19f6c945e8dedf78c6ee74f1112bd14da5a658d8c9d4103aed5756a2"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.17.1


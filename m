Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.1241.1604335791011998221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YpEoHmVW;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id oq3so17944388ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvVsfk31dWoEM3gJ9+ZvZTA7yvzadUtn7xOq1o14gJw=;
        b=YpEoHmVWG4ag49XvnKukAulZGTZd4TwLUn7mqaLH7Xo+TXZBBkGTsLOlH7jYMFq7MR
         bFr0JflyW/E6ltwkpJG8i73j+l/ztZLXQp/axVRTuRa9Kxr6MeeQpe6gpoiFxmtNRJ9z
         sRF7cBGtnutPATVPMbUFSElbVbXZJnU7fiwI6hfy56J0F0hrRcRtWuaSTLvEVLTuJAjq
         ECzhx5httmbHP2irfrX09WzPlO3+2CIZQMomtXv8Vyfue5/xYTck9Y64U6oJZy7itSrl
         yVX+D/sH+Ib3q++k+q+fPEPSTghkQlB7Bw5Z4qLHeZZcjUfHy5Ci/qoKNFIMhWzo+bVC
         V8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvVsfk31dWoEM3gJ9+ZvZTA7yvzadUtn7xOq1o14gJw=;
        b=FAT9ed3vKTxCHWHl9YL11qsZq0H/znGzsCrlXzcUi2QkcaeJCxl8QMR97z+RZtEK+o
         PLBje0X+CEwor05arMzPn7CouZe4W9oCsyCMgqSM7xiD/JiLupQbgET8ezXoeEd/LQ4a
         LGGQd2ytG3+BtMBoyXxoICWb7tEkYf1vBP46wlODx23uJCN5tITPGQzXxYARD/5bVnis
         TK27oMS4K3YdTVi8++GtcGg7MltgXj6gQEce+dCmKAws1At0FEl+721DUW/NjWg+lkYj
         NjbvCeDE5yAotlqxuMUx5WWunj7RFD+88vFxy+rOT7sAR4iuwgf+fPduhTa7ajxAhEv+
         QcpQ==
X-Gm-Message-State: AOAM531CUo8fjoKq3iSPzQYhToe9njj1vrbyJIEdLb72OmyUMj98o7h1
	Y0msWZWJLFatn2wDxXBfTW0ytaCeLIaqjw==
X-Google-Smtp-Source: ABdhPJwAZmltyJucYV01kj+Ifpy/jKTdGbkmeOYrZtDRRJkUGQSbuslSPd/iEXKJZFd3uMgd6do9dA==
X-Received: by 2002:a17:906:2b83:: with SMTP id m3mr16076448ejg.456.1604335789259;
        Mon, 02 Nov 2020 08:49:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/80] libva-utils: update 2.8.0 -> 2.9.1
Date: Mon,  2 Nov 2020 17:48:23 +0100
Message-Id: <20201102164907.27572-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libva/{libva-utils_2.8.0.bb => libva-utils_2.9.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.8.0.bb => libva-utils_2.9.1.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.8.0.bb b/meta/recipes-graphics/libva/libva-utils_2.9.1.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.8.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.9.1.bb
index 78e3805339..feb9ce1662 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.9.1.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.8-branch"
-SRCREV = "af101a46d24c3f71a12b9f1ddb0c63626b19b3d8"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.9-branch"
+SRCREV = "50c7f19d65e2535940e31c6711352b36d6d64fd7"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.29.0


Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.34732.1622398509045486456
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 11:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvHjxFlw;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id r1so6641063pgk.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8UdQD2va90YFirrxLv6olKLMWPFT+gkkMVqQT5w309E=;
        b=BvHjxFlwnw81UUtn2TSt9hYj4FPGFpbzYMXuISXZirVoHPDpMD9T21Pmk8lOL/NLQ6
         Ou5xzzad/Smqths9/6n38AUwAyaauMSg77JvCHgTCriJR/Q/oIxnSJafIbtSmA6W+09u
         JdaxLbLFC35eas8JLw6HDmeHqRd0uqspRx2eZoTezBvKjhKZNrhW3MTcR7j67kmGmJS9
         942rUHAjYrzZwz1Yvg+IawWyqm2XA4pkm3CoPhVg+QKhRixWI/Bv/twmsWAOkwHgzhh6
         svJtkD9U9vL0X8v/q+1A1M6inV/AAlJCSAEFD7qIU3jgDlDczTC2ABT8COHrVNH65IRz
         X+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8UdQD2va90YFirrxLv6olKLMWPFT+gkkMVqQT5w309E=;
        b=LtjjYxVhnwoBFOHrBaIwfFe+PpGE554LTnnXuuAs8o9MEgP+0KWX+gZKo7qmfWFgUZ
         hoHHStLaNH/cewwUqxoJaPfs9fIwJrQkgEzklk3T05bQgkmhwrXz059xD5i/NWzz7g4M
         sYFA/LU7jV8Fjr5JUtE7cc78CbcxcubfIuFe/7HyuZBIsnen+BsFaZsHcVFaa64JFR/r
         N2NJ8A0ISs6uhXuU+l7lGrCErTaA6CJ7iDDx/zqb6KNcaBRfXIEFJB2J0g+ecBbEhCUD
         gK3dAP9T0PQZuHO4fEjhD7gf95nW1oKpmDacLiUUeaqeufi8FxdaCb+jNU+Yq/5wd4oy
         w8AQ==
X-Gm-Message-State: AOAM530DMYZTX19xqiI4FudYUklP2/CHO1p8FrCyq5Pj8uO5mj1wCZRA
	WrJoQ8cUa1juUJgPjHrW624KbtSV1pH3Cw==
X-Google-Smtp-Source: ABdhPJxcoSW12XRld1GLyLfeSzH9nRLEYQVlQN/RYTd0BfZnb5cebL2hSuyLbWWWMDH8x8DqR5UoDg==
X-Received: by 2002:a63:3fc3:: with SMTP id m186mr19414332pga.166.1622398508246;
        Sun, 30 May 2021 11:15:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id x9sm9109752pfd.66.2021.05.30.11.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:15:07 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH] kernel.bbclass: include kernel-kfrag
Date: Sun, 30 May 2021 18:15:06 +0000
Message-Id: <20210530181506.582273-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
v2] fix typo in class name
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be8..4e72ccdc328 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base kernel-module-split
+inherit linux-kernel-base kernel-module-split kernel-kfrag
 
 COMPATIBLE_HOST = ".*-linux"
 
-- 
2.24.3


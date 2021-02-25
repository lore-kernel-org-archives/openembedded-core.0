Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.370.1614289130507930965
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MAzC1SOn;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id o34so5249509qtd.11
        for <Openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qgBRzi6Q2KKUE7E/w+LOl1pCVbvBbCkliDNTKxc5bBY=;
        b=MAzC1SOn2qKPgFEIDqeoxKg16YudPSQKzQzAvxu/GSo4fY2EvpOCh0aZxzKBwreeg+
         pHJevqcLLMm/Ok0fEd+/A2de+NEuLC6vBSCoEHUiZn7rTgb6Cyaeoat7Bs0+shjJvfAf
         BL8EK/AOmqC6OCekIw4PeicfnhvyErfuRdFDKONgzPfTPNvxC77b+73c8llwkjr+8vRH
         3PdtYlAbU/uBTUF9Mzttvf11IaDoeG5sqaqE3icR8Wua/8NwLO+qi/9aVhsH2aMjcNwh
         t06i5dma6YSDENwRbm6flkBXvVYSVz9qdttZv5n/Mb5Q9aWiGaWUQXGCdOaMNswKp7Qs
         QcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qgBRzi6Q2KKUE7E/w+LOl1pCVbvBbCkliDNTKxc5bBY=;
        b=H07sbsxtALQ3zMI2UayE3m9pupVhWBNa6LEsUoPZbvYP8KGmWAsZl6WnFVgosnXSlv
         xldfFKlwl5wG1dUXNPs3ipFWTwt4IcWYgp/YhzinlnmiVbj9BFROfnxBKoSspvZY4g8i
         1VcLXH0xxRBc569hkzCCG9ZnccVgUbbwzmwP1vVHn9MBZLGkT+geHB+BqPgLUw5HAcFC
         efZhTFa5yKYjFtsZx89ouovW2dgKsjfsIFUg/g9J0WS/FVqJ3AG3oIttb/wUBBOdD8RZ
         Ej1gDsF0trwV91yPoDHO9lodigrdsQA3Dem5nUsOFMkgxRACbJIbhM/6Mi6b6TQuBxcN
         vQDg==
X-Gm-Message-State: AOAM530E/fmlxRwVrZbWG/HMSi5JPNkdXXdkFwc5xiW3uksYe0FBtK3K
	tyYZbzCndykYMViLZRACyn9aZyjnt74=
X-Google-Smtp-Source: ABdhPJy4jqdTNofhMZ0wlaRAkH0MvUR6fv1GkDhdNOhTaxADLqcj0uJmm6lplLBkYk9kwF1IAwIRUA==
X-Received: by 2002:ac8:6f21:: with SMTP id i1mr143170qtv.72.1614289129340;
        Thu, 25 Feb 2021 13:38:49 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id p66sm4741232qkd.57.2021.02.25.13.38.48
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:38:48 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd-container: sort RRECOMMENDS alphabetically
Date: Thu, 25 Feb 2021 16:38:46 -0500
Message-Id: <20210225213848.2744615-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort packages in RRECOMMENDS_${PN}-container alphabetically to avoid
subjective sorting and ease future additions.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 70700820d7..aaed047e63 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -447,9 +447,9 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                         "
 
 RRECOMMENDS_${PN}-container += "\
-                         ${PN}-journal-upload \
-                         ${PN}-journal-remote \
                          ${PN}-journal-gatewayd \
+                         ${PN}-journal-remote \
+                         ${PN}-journal-upload \
                         "
 
 FILES_${PN}-extra-utils = "\
-- 
2.30.1


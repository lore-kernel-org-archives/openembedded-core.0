Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.20532.1621847648813243398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZZDqFEm;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id a25so31064403edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5cg/r0s9Gjba/VbvfgyCYrLtVRvx86qdygyyqtudG5U=;
        b=FZZDqFEmAH1fE+G7mqvdfqGpImPflK9WZPgdOIUGSmVB5d5+gElBks1Bilq068TcVb
         d5UVxkvkncihBCDp+WSdD+SvBIxp3KNGcXCncnbdUTRQpnouyODkdwHaiqMN1WIgdvgi
         DwjtTAC80Y8mcf8+Lbht1Fc6mwYvUs/gDlRozt/jIaM8Xybn+9Fr0pweOlffd/9pEbIk
         /F2E6g3iUSbcI7HOk8dc8XkDP1LdOio6Ecl/YqxX8Oqp1ueAEHJBqkBVA7R/XPVxbV7a
         Z3/lau80g6kIwTDb53yWwJD4hF/nsB5sljkkqZ6aauPzXtSX1t0P5+2HpGid+04RLmx1
         KEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cg/r0s9Gjba/VbvfgyCYrLtVRvx86qdygyyqtudG5U=;
        b=ZW6DE/8KB54iEKfKMvXVW/r4RS7U/5WtCJbfLmOZMsgxE+qxnkqn856slWr5S5oH4G
         yEBbYf+lbZOwsd/J9oveq2cNDKUrwupThgX4FLoPVsxJF4QJX/Mf5MNbwFdrn1xj3qtm
         N+OhbLq00LeHjbUWfuO2sOo14ofdFO41z9oWm13RA1t5ypZaEnTXDVMbx+Awn3DkBH3H
         p9Xl9MiVGaVPhWEQG/Zd3secgaX8hXgDtcluB15RLzrUsr2O+ZUO3DwO3W60kjvQ15Ey
         SMfm+wElnTSizvMlExne6hcz1SC6Kj8c1wF7xtdSuXYrdoOCjCUrC/n7gnbd2k+MHvpu
         hvcg==
X-Gm-Message-State: AOAM531N19CrN45TINmVRRwScKhX7whYSMKnXvhdHj/NUJn9IrRhf3fZ
	QZLeVen1+YsclpNFbedwy0M1qF41H3w=
X-Google-Smtp-Source: ABdhPJzrG8lIIW2DuJt65ObyAfULJfDEsQingMaZ1bpThqVSBPOjHYvN9zVXueiHJTBS8UHRPi0xFw==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr24235900edu.160.1621847647493;
        Mon, 24 May 2021 02:14:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/21] python3-smartypants: fix upstream version check
Date: Mon, 24 May 2021 11:13:32 +0200
Message-Id: <20210524091347.419253-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream has never published the 2.0.1 tarball.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
index 8acc971c35..ba3408247b 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
@@ -10,3 +10,4 @@ SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c
 
 BBCLASSEXTEND = "native"
 
+UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(?!2\.0\.1)(\d+[\.\-_]*)+)/"
-- 
2.31.1


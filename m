Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.6404.1623744770460785409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HrQWLt1p;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id g8so21078038ejx.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdRiPTc0sMa4So2EcX1QYuEgYlCrsKo5a4WIPtZOzMU=;
        b=HrQWLt1pgHSl4jc1ei3FJUk2J4FgN+NheR+zlkBjUnll0uDNN0WthhljgVElYi4RWJ
         ZDXrZqHu+1Eqic10Rz8Pgbyo/uECJwH9qT1WD17Dze4YQJTa8TMuVvmW9kYkaTv2X5mQ
         aSoBO0tHeyqWyMM9pWLSHwwvhHAz6WFMJKghO1Oj6hiQY9RmDwLXtxhzbSpI90UJ/e96
         B1X6KaBHxGv3kDc2mwvF1Cdf1c8R95DE0kQYVT4LVlOVUKGrBCjULWUBIjjIV+0BeQQL
         HVdp1fyyiZgRD8d8l3jFPiZqCULAnZ2ExXZE5/Zvb7pdFRML3H/GfMJPJV5a8WDKycSy
         rv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdRiPTc0sMa4So2EcX1QYuEgYlCrsKo5a4WIPtZOzMU=;
        b=iwh8FCARWu5A8QawEv64G8P9tl4uZnpcVGKskF64cCWshdiG3hwMznR2TrmFLU4SER
         qrj4qFRw2PkOwmaHzeB6c26ru9/ZBOgpnpO+Ry0Cg26tOVLKPyxjxUCfZEPFTqOv/dap
         AR4gtOuLUSG1Bk/HCh8NJAi9pXazlbB+zKhofpYJ/gmBixcVY6+PCoqIwcHUH96Vek8k
         LuSSc/tsiwTD5/oJnF6UfS/rMa/FYCeytT1Ez7fvy02SUhy+WIXs3uN6kFkYLpu/krph
         S9v1QpqIp64y5aIC/4P6U9saBQnuPkFk7i0eX0Uc4kJ2tcLE0WlochMoerjtvKMXR6ME
         2otA==
X-Gm-Message-State: AOAM530qfqt2wLCIgmNpEM7MEaFj1oIkaqi7ICH+KLItfmZ92F3SvM0r
	p+6Gjw+ffM9paOuUEm21AVozzNKEcQb7/A==
X-Google-Smtp-Source: ABdhPJx0gr0Em1sxDWiButn1nxn1LXKshHRYzB5FQM3YqO1JvkUhF/hvooVbGmuqPB2HioWYkusiSw==
X-Received: by 2002:a17:906:eca7:: with SMTP id qh7mr20021719ejb.143.1623744769140;
        Tue, 15 Jun 2021 01:12:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/31] m4: correct ptest failures
Date: Tue, 15 Jun 2021 10:12:15 +0200
Message-Id: <20210615081240.1734087-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index c28e301d50..5f3d59226e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -46,6 +46,8 @@ do_install_ptest() {
                 chmod 0755 ${D}${PTEST_PATH}/tests/test-mbrtowc-w32-1.sh  ${D}${PTEST_PATH}/tests/test-spawn-pipe-main \
                      ${D}${PTEST_PATH}/tests/test-spawn-pipe-child ${D}${PTEST_PATH}/tests/test-version-etc \
                      ${D}${PTEST_PATH}/tests/test-xalloc-die
+
+                ln -s ptest ${D}${libdir}/${BPN}/${BP} 
 }
 
 
-- 
2.31.1


Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.8765.1613486587528536219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 06:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=irfxPJ6r;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id b16so6754454otq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 06:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvJ3ODDvjMLM3WviLowU8a/mfgyUKt4658VW5oJMD84=;
        b=irfxPJ6rufInkzjOymIZmOcRBidO6DSS0IzYdhLrVxo6wPVov3oKQ2H0dlGtXZau/4
         3J3OTmxR+EApE59GMu3HbWNy4Pdl1Dq1ovor3XABU491iE7tE961ZkLWs0wSATupLlKs
         emcNt/VNKQSInB1TRAx5MHn6LaZX49IHuPVaxzjrc44liOdMKdaZ6zAvOINO4vaW/oe/
         aJhsSC1wJGraW5MR5tsPpQ1Ku8m8eB5r3wHHb0W77jgH4LXz+v6uGkj46TldS7Eo41eJ
         JaTPUCw/HVkdTHQnkof53nNwyM9xGX2XxvwGjenbaHG8Is4xLL2934ny6NY/Y/V9p36d
         Qlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvJ3ODDvjMLM3WviLowU8a/mfgyUKt4658VW5oJMD84=;
        b=XXOSeRARRPP5HHShkwzVqTnTQXt3PpFcYiafEDtXMz1B3G5UR59d16cDqbMm5j/npx
         ULJntatRMcfMY6xE/CbXdsetsndeTDwjLSUhim/QEmmalw88XKylQkPtFV64UCcaFOqI
         4eK5XryIdZHKFjSCUE/LtMd0OrJjrCxTFqpZh11WT//SwJPAoU8MMF+FclMQZM5NrrCL
         mYqu43Z5XXfjkzYhNuTJeKRs9cREcA8d5bI2BtnuVvjVVtWGZDguQcVQEn6vpZS8KO2y
         F/oSyTvIjXwX1x8miY/1aBk8eTbkA+YNQRwHgrUJ+RrDXHPMVuErGp3aUwrXrN3TKtgT
         hB+A==
X-Gm-Message-State: AOAM532xTI5PcUYPOvzoREgTU0ALjkWlO4Qo4MY6nqWsBEz+MkqgWjGs
	EDcmu0i5/B4d6ykQ5SYhhw3+G4wOkdk=
X-Google-Smtp-Source: ABdhPJxJ+ERp4BAA6M9wRuxcR6nmGwKYr4SKkwHOSzxLqFECnRCdnVuqY0d2Wp4AL85IJ31prypCEw==
X-Received: by 2002:a05:6830:115:: with SMTP id i21mr14756805otp.96.1613486586622;
        Tue, 16 Feb 2021 06:43:06 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id z24sm4291909ote.1.2021.02.16.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:43:06 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] Fix acpica reproducibility
Date: Tue, 16 Feb 2021 08:43:01 -0600
Message-Id: <20210216144303.33986-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the reproducibility of the acpica recipe

Joshua Watt (2):
  bison: Fix up file name mapping
  acpica: Fix reproducibility issues

 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 ...001-Use-mapped-file-name-for-symbols.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.7.5.bb    |  1 +
 .../acpica/acpica_20210105.bb                 |  2 +
 4 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch

-- 
2.30.0


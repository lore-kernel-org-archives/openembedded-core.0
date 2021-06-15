Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.6426.1623744784930813101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lOAO7V5f;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ho18so21068089ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPJxOAu87MiB5Cs3GDs8vWAAy5sI+OxSDB17nRMOzXM=;
        b=lOAO7V5fQXX1ZZrvBMoUR+JzC9pymWOG+zaePp+Qbrk6jrLKnE2NbNNIbT3QGQTDX4
         L8JreR276kqwYDRfSpn7oEieF8mBIs10e6whiuPEqcjA8Fy5pw8d+1BV5+ChXejv0jQu
         3LRsOrMckXp4D3gFZNjsxN9QKy+30Tp0a/RY5mqL/+OO2hGHTHxQg9IalApqvLHd2lRV
         osFd8LjiaJ0Y2S5JEFpKMtqFpU9wStaSCrnrTFWPSRO/9iE9eA9f/NNwkfrRmUodF0ng
         lcvRVwOx1Bx0g/WaNNbP8TUbwdNtOH3BrJIZWF6MvuaanJ6DhOizDL1SCE0y+TUhK3gb
         S5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPJxOAu87MiB5Cs3GDs8vWAAy5sI+OxSDB17nRMOzXM=;
        b=ld5La/HTP4BEN0ISIe70YgfchErPQgd0MBuTRcqlFITk54xihLYUrIR9pt4EIdrr02
         PKI3SqmuXzfCUh334GpVm4CvRHY7u3YmYUuha20eYtPAZRfaPpcuU3AH420ND4r/RSnK
         mPFdpZ/2gf79JpnF2OM6Zv7WDg/lCoyedv8WafxKUBx5P5yOoIWek9dC8yn38rRlqyJG
         CEuMDxrjxQ80AVTtRxBTioAiBQyPEJT0IM4QhkcpTYEw3jtRpf1WUt5XgvADe2k2v3d8
         MHngBWTNNgp3hyjD/UnYej3LKM5R+Ne6l98Yn+JG1ExiqLC3Bk7PSGmNcKJ1VKWpyPlu
         vgpg==
X-Gm-Message-State: AOAM532zCC2hGGyrKVZRbjlgSQQ/5aPqhOAuwTqhvBI85fN5N/1Bl0rU
	4qhxYpM9RHU0dJfNwICQyTqvjfPaimwiIg==
X-Google-Smtp-Source: ABdhPJzpZumEK4VKzrKpt4w3bZhT50rCLEd6Lxnzncj/2gprx13NWAXLv12aQc/KY726B1zfoK7XIQ==
X-Received: by 2002:a17:906:f156:: with SMTP id gw22mr10888099ejb.490.1623744783597;
        Tue, 15 Jun 2021 01:13:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/31] rng-tools: upgrade 6.12 -> 6.13
Date: Tue, 15 Jun 2021 10:12:36 +0200
Message-Id: <20210615081240.1734087-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../rng-tools/{rng-tools_6.12.bb => rng-tools_6.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.12.bb => rng-tools_6.13.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.12.bb b/meta/recipes-support/rng-tools/rng-tools_6.13.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.12.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.13.bb
index 9673700981..fb2fd63c5d 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.12.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.13.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "a2cd12bc253a014328b87137559fd4e1ab296d9b"
+SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


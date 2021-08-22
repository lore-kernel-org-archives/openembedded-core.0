Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9671.1629636676745069168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bvG1zL4K;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id x12so21740412wrr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gpHcu2Nb2qa/bPbcvMF4O4Xe/95MT+sGHl8WqpwvUMg=;
        b=bvG1zL4KehjTGrXNbtJwtxWCwiwArjEMraIBFDprAehXY7j07sGqVEm2UrwngODDfd
         owaiI2B9MB84HQ34LMRzo9+TQr2FPfwvfysWQknwnwfy6NrJlqQ754vG+KOjwBLvGbT4
         7W33Ji5WDW84DdfVx/2of0VxcjE8XlbLPo2B7zQpm85vJlVCmBmhqzHcv7SImTTETKLF
         SEcLIjNv3ZFrYlFNSQDECiMR/CLu4hDGwD8jhpWsBEADDOE2Rr95DLzi3e+ROQaAf7nL
         +gM6ZMmrXj7+Cj1lE4AiNvG+ysTNpNt0b+QtYZ4FaA5PrZmdR4WR0hMKMPqEUsACaEj9
         ClWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gpHcu2Nb2qa/bPbcvMF4O4Xe/95MT+sGHl8WqpwvUMg=;
        b=V/R28Lf9MiLZ51/Umo4foJWrgoKaOvxejMVKlKSIlIJEYTP7hl0TDo7zbBR1IeT1ly
         pSz0a8dF1VUGI7TUyFW+mjDCFl75U1HTYvXgaufy4fX8FPq7qFuFi+3SHRibHBCU/n62
         oYWVoV9kkFJlQHViHxBM9y/gvxQSj9L88500gOkiednxXErSmteUXqEvuHd6KIY0gFT6
         MFhYTkwIgUCLBGQcIeWW4BP5+xbw2xwM7f348E/VqEGwEEyqzI8T61mwXxZ3jBwMCNcE
         x8f04roodZV8udv9nCE9uacO4hou8zOkAnLxsm08vdN4IPQUS4JxJupsVz0vWfIAGUdk
         N9uA==
X-Gm-Message-State: AOAM532LBfYG30dpsiXE+L9P8f4mZYIADQw4Zv3KPAskuBlHnfLHQLm0
	bJRi2OMkSoz+ZTAZKZtm39w7j3lh98R77Q==
X-Google-Smtp-Source: ABdhPJy50QlRgqpK/Kf45aZ3wzb/9CzomyZaoZl+QPXxpZ1SzishhnF7+zfEowJK0SBwpwdy2DpyGw==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr8411330wri.259.1629636675219;
        Sun, 22 Aug 2021 05:51:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/55] python3-numpy: upgrade 1.21.0 -> 1.21.2
Date: Sun, 22 Aug 2021 14:50:15 +0200
Message-Id: <20210822125103.310416-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-numpy_1.21.0.bb => python3-numpy_1.21.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.21.0.bb => python3-numpy_1.21.2.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
index a4d222c3aa..2d4c62af81 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.0.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "b662c841b29848c04d9134f31dbaa7d4c8e673f45bb3a5f28d02f49c424d558a"
+SRC_URI[sha256sum] = "76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.31.1


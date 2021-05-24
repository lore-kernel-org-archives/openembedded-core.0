Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.20563.1621847652847288309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X562WgT+;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id lg14so40642645ejb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iWHUZJXQmsdPIhM54vN5+5SUFQSi/7SShI7yuH6rGXw=;
        b=X562WgT+F/KsVy7RXMJg0JPBdV8IGoY9lE67zRUpjkDdCuWSWGoHLuh6JaVjCwcV7k
         CASqPRMpBYDSKrvLMQyzHvzUxXMbWs0ZE4PXAOlEn/W3UT655+/pRSQJ6tncI/9G8lQn
         llLkslcNKhMET295UIrh2yGlbHv1SF/bDARizSI2XtuXykI/YUWXaU8syQB5YW0ejUqx
         yDgHfPD+SiP9dGpD0y0SJG0HTg1pbNPHwAKU7RLHSUHlwy3RkhRvcUc9HSPG5v/MJDgl
         hzxTGKrIgaw1wBj3wATc5zconItcT/xNT7ydXmwlhw1qdWDJwurzgr4kMg1DYe1Adyva
         KwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWHUZJXQmsdPIhM54vN5+5SUFQSi/7SShI7yuH6rGXw=;
        b=SJwIFfps+uGkfZBrWg/eBd4zqRnI2IaNFY18UhDZXHNh4xrPnlArEWvFn/onn4zZpe
         HgrAH5oC3Q5BxcjaVnsfkSHBOCw9egOQQJPhJzl++z8Hd5ZYgipfzAScMdEPuFVqus48
         OzPLbHn8eg/Vg7nQ1KafgZBzLCQ/CbEAJgwWoEwBADy+JEgp+XNATZrKG6ltP26kcOcX
         MaQiV5xfQGgW550MMG8LuqzHwmKm6CB6Gm1dHgqczu3T4nG7pd6O5F+DqorjJXaMKy3m
         c14YU6gDF37ByGdmiUD5CaoY29FvHq0RTc8adTEfDGNFsEwmoOlCyjHDEh/17xYAd7/A
         ebBQ==
X-Gm-Message-State: AOAM5311IuyZELPuLkIJ+gyErv4SE7Pc1MkODOP6YXsh9rGsXxyMfb5N
	C+h4eqoQwsBi8x9Sp9vmAOcKKRWr/6M=
X-Google-Smtp-Source: ABdhPJw3+WoIHKB7sWCnBEPA6E92KXHbN/qhbqTs5hr9BJou1BnCqNgYElKo4OGcnV5TerLbtf1o7w==
X-Received: by 2002:a17:906:c010:: with SMTP id e16mr22686870ejz.214.1621847651511;
        Mon, 24 May 2021 02:14:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/21] vulkan-samples: update to latest revision
Date: Mon, 24 May 2021 11:13:38 +0200
Message-Id: <20210524091347.419253-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index e89f75baac..a177d9a391 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "5646820bdd46365183adc2b326556c5bf7d8db76"
+SRCREV = "04278ed5f0f9847ae6897509eb56d7b21b4e8cde"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.31.1


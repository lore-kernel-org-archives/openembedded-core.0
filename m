Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9606.1629636680927518878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lld5t7fE;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id f5so21722911wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRNZiOoGkdihPzsz/0yIwSoTVQiyHBG783yW+2FqW7k=;
        b=lld5t7fEYgCJCrEHBYHJeI7i2D0GcOxfkhx/tPml/hdRLf0S55/YCzmHvYFZPikQK4
         ghoSdd70e40JiwNYIMk9kofmsvv9OyLD8J49kW9HoQNLDNanoGnyB2ZDGWBmAiIiTTdA
         hAomJIsehdAhDOymQQe4/gpw2OZ0v2njcU73PvJD9xSXciye0WfHK0f4zsxB8eftpAlw
         n07bJlJ7WtreYdLJghrClAhle1j2hObJeQKMwm1oXpHXlqKurAuNXGMCsyGLTN54DbJR
         /KxdOMwHSIdp9Iid5b2B/qaWhbGxY09RYQBdPYcGSe4ndE+g+mW9ug5Rx0PMCBM+h1ob
         TVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRNZiOoGkdihPzsz/0yIwSoTVQiyHBG783yW+2FqW7k=;
        b=TrL7rsIWnnkIQnCnZeYHDJ3UryKZBTPGHwEXvXuNvLeXe1ICfsFX6wmAq8aebHrpr3
         llQ8ks0ScCF23AliprnA+yYc3yckOzqCEgrlT5i/M3O2FbS4ABxdYFOYutcAtniugov3
         8r1+oRmrgsdDxNLpCemhXj8pH/o03Ijl3pRtHAd89pyf21y0bfLhA0r5IKRZEFDmFvr/
         nNQ5+k2wqx5R4j5mfu5nZxVXXdotqNHQ91KEg4L8pUi4mvmQzIW2AvdqB18uyPnSvb+6
         ZAghpYRsa5pRk7k9ek8KOHX2A3MrSlYqufseE4q/cIIRJSbeibTMUNtLSZHcuuIhk3no
         gu9g==
X-Gm-Message-State: AOAM530VFbL6Kr82v/6iZajsPsWlYdyE6hL8YyGIe9IWhDIgSCjCcVYL
	M1xOKvrcYkr9iWSrH6OgECTUTz4izAYUbg==
X-Google-Smtp-Source: ABdhPJyT2oirfCv9rTmbPRcDsm+ObIh718/MObmGSTqUUp2G+YM7XJO9TMmTyo7+xgLTGbu8cGbLmQ==
X-Received: by 2002:adf:e788:: with SMTP id n8mr8610303wrm.214.1629636679606;
        Sun, 22 Aug 2021 05:51:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/55] vulkan-samples: update to latest revision
Date: Sun, 22 Aug 2021 14:50:21 +0200
Message-Id: <20210822125103.310416-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 6488c00924..c5ead19482 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "43ee480644a20dbc8d4983b22578068f8bed7571"
+SRCREV = "d2187278cb6632ce35920575832eb6f6e2b2e46c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.31.1


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.7174.1588683738469503636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ts1gT49r;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h9so2685523wrt.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bdTnhnBJWfZ8X9oX0JOc7kxt+cpLoNkbEXQr9sudFL0=;
        b=ts1gT49rSD7AQeiPUj+4aBjF6oBchizJ6G6DY0CET6nWnJsA2EKL7fNIBv3cfa9RiQ
         aIQK8oSH86YvwRB4eCajBO5bIqMVM5VNjk2DfTEPDHeCJo6QukUR3AUUUjp68iGWheuR
         WG4u0xOd6rPj4C9C+sOdVQ+fbJlduaHnjmf8tWV9Ob27PlHNwYGC9aCoX4Xro/vuNVML
         4gn2n6A7Aiq3nE3jkMIt3kjQYo9Bcw8wEVGoGP15UMxqMPWtBWxSFTwmcW3csJAPTupO
         V0JIuxku5vQEMObnFsbcipDJVencISu2UUNeRwL1Ngl3S+ikbvcAQVf9gS9SuGe1gCLI
         /ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bdTnhnBJWfZ8X9oX0JOc7kxt+cpLoNkbEXQr9sudFL0=;
        b=U5eKjH2QLDlVUiX+g1B6gCzXQGGID6tNMn76tkLxTu6yUjf83qZD+8T4EM7Pw08iyt
         XEtO7I113iM/33XHhsy0DwfoFRwIeHBYe08LHxRWz38XJH5ggouVrTfX5KcZ8nbiHeQW
         JnP5nFCYaDtFWNr+5HYZQfQa+Ub3rXBWnZeclx2SAqVfnv1fYAzVsZEeJl04nqRpKxMD
         KR+mPTjO+jxi4iIO1QoClHdSCMvPrKu6WpdhcsMn2NwO/x/QBBuiPQcZchWjgXvgo0cq
         whMWE/6Ai+gGFL9NvzxXvSiGIATCr3ZHnnNuuI43fcUmx72U00x7aHF965zaw59idfvk
         ezyg==
X-Gm-Message-State: AGi0PubHhIvu3dXeISB9RCkOnCiAxw1pualVVjZaTBYEZq4tvVBXP2u9
	JuS0YZfw2OuYOeJttyyHksHhVhDv
X-Google-Smtp-Source: APiQypJZ7KVSzPiKuTwITqGmsz/vhD8Cl19kYSNjyFBNpBvSFSgn6I0xcqOEOT30OFV/Dpm0hzL3MQ==
X-Received: by 2002:adf:e90b:: with SMTP id f11mr3617144wrm.364.1588683736818;
        Tue, 05 May 2020 06:02:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/24] vulkan-loader: upgrade 1.1.126.0 -> 1.2.135.0
Date: Tue,  5 May 2020 15:01:25 +0200
Message-Id: <20200505130133.24930-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{vulkan-loader_1.1.126.0.bb => vulkan-loader_1.2.135.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.1.126.0.bb => vulkan-loader_1.2.135.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
index 504cf85a2b..8bab58f0b9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.1.126"
-SRCREV = "4adad4ff705fa76f9edb2d37cb57e593decb60ed"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135"
+SRCREV = "86429d9e7f3542e88fb98ffa7d8a82c10c9828ac"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.1


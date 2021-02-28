Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7684.1614526642206862763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+0vLtY4;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id g5so23563709ejt.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9oBQEtoJCFyiwIUNuXfVzIKA7bl09YwvH8viwQTgPE=;
        b=R+0vLtY4bGjUSSACX//y8nVnU4TrLxmE5gRHU8qpr0f8zMFjvpDBhOCtzxGM8AXcBx
         VEXgJSG+MFFFVek9KvY9tPZMxaHNM4u/2rm9hXAd7JL3IlSQNzP14QFn2FheXOcrSOJ/
         a7OinEhlt7KafVLE78/uXZAZ9mxPmW+Iaxv3zl8Io+EK1Zn5RwPQihzxlYqB1ZArP1FC
         M7PlTnS+0eSzhI335Jz5JmmdpdKNwZUdZpefsMy5/+wXpc8pK0b52NIU0I3Kuv6FsXLl
         eaUTPUF1GrLiEnfJiMPP6NJnSE4b5TakQF6ZI5mn+Cv4RJhlDGIrG3HK2d4OFkW1Dlei
         0rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9oBQEtoJCFyiwIUNuXfVzIKA7bl09YwvH8viwQTgPE=;
        b=HRFsACqxqnQ5JPkXDMYUC8m+LVA/on1VnFEnW5Vwc0oCxxtj1sr2AZYR3yJwVWT5UX
         Ou9jFSXkIQqWrVhS/LO/nq6uWAKZ5SpRyQ1pDxY3uaeE5OqHQMga3Dyw06HkurfJgfZ3
         oBYJLPEMts8irzsAmfQv09e+F2cahXnPbmFyokRPH9pJQQpTFZpe8PvcUIUk9ojmYDgb
         r2cqfNCvW9jTHeuGNn8x4qCmdRIbQxZR27hwkFWp7sHljDaoWNj0Un6lrEk8jiE08559
         8Y6ESAnRRRtMuK44mV+QAHa2gCTpxsy78lOABlQThUi64E1Xfe09z35Qte1jJ1Z4o2YG
         LXyA==
X-Gm-Message-State: AOAM532MVBf/E1S43DFjw4RghY4wJrmrttxr0EFGqL4ukl+Csi0QvOh3
	SCDjgggRXVmuvRTZoDZ213LCWlN+YANMiw==
X-Google-Smtp-Source: ABdhPJwFjpexA19bMZTy5BcOGB/11VPSMrUwLI99RUAkSSbST8LzZ6ifZ0nS6LflciFMIYbxpOPakg==
X-Received: by 2002:a17:906:3916:: with SMTP id f22mr12182435eje.328.1614526640785;
        Sun, 28 Feb 2021 07:37:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:20 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/24] vulkan-samples: update to latest revision
Date: Sun, 28 Feb 2021 16:36:51 +0100
Message-Id: <20210228153702.498275-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 05b9e855d7..f3985c8349 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "524cdcd27005e7cd56e6694fa41e685519d7dbca"
+SRCREV = "55cebd9e7cc4153a3a7b3a45d42274c0e2a17815"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.29.2


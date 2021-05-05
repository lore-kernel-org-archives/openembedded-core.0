Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.9824.1620227952759218920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Au6cJSTY;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a4so3488879ejk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MRA3F9mYpLTzICp8mE4RGjB3a7ibqmRD6R71udRC6+M=;
        b=Au6cJSTYeTx2ZuDBJowkqi0SIxK9bo/iWC/FRXQR1QT9VivzTWZ079sn0TVfgRU1+Q
         C+rlDI/qQCoxI0X4gUKappQXhPrboqjReX6dtgCAfk+QAoamzf8OBgPq22rtx365fFtP
         OlL5IQPphfV1fM40iTFwASy39/AEBRqz7tJcYKwYOCJaLmg1tjSjpmOjbUdFbSRLuEXE
         zsi9pKY/Ve1UsYmpj5p7pfDsF7M/bwccHhydXVMnS45mSdBVYlSNi5noxAmXZZzmyXmT
         BnE4pg7bvmCyu85MVAxFqSxbJ+ichlvz8A3OVkwFYN7Uey9JJhcjki67Dzvy5acf3hOa
         q19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MRA3F9mYpLTzICp8mE4RGjB3a7ibqmRD6R71udRC6+M=;
        b=A0VtyMMy0hkEw99yRHQY11IW+N0j4PsOgXF0no4FxNaY14xHhp+6lPfaqoPwsLOZ6h
         A3xnq+mLYNI7OAzPVCYgGcnD/4ixb82izihgGStHaYRt+imngX7YmgwrZbA6kH1+TRbO
         O7pJ8hL6Y3mrfmnzsVGyNLZPQSC7EkmxoTxQR9WxpN4enKbg1P/vwKrIJaxbYfSRoXNt
         4dNtGza5/J3UEq+AVhAOAG9PXs6nkLD9R8wcpWevUNtxJqNRYC5q9AhhyUDXAL+fIoEq
         h1krYdHZtdNuI+w2Ob+FTGhBkSsmv247tQfVoRn17nP5rU7+7Az9lCPI2G5Pu+A/ODxo
         Xf3A==
X-Gm-Message-State: AOAM533VSnjZobSADPTCoXlmQsr3SUVXo4OkgnaQK9RcuxMua5AqWKOy
	uzoC0vCXhnx1RDi8Wcu/ag/tO5N1PLiaFA==
X-Google-Smtp-Source: ABdhPJzhFNoS1KfzkkyhmALzKVCrHw/WzeDvpldounbRoerpq+5R5TTDyK8zf0jGn7sXZRh9FhiS6g==
X-Received: by 2002:a17:906:c827:: with SMTP id dd7mr28499409ejb.225.1620227951357;
        Wed, 05 May 2021 08:19:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/61] vulkan-samples: update to latest revision
Date: Wed,  5 May 2021 17:18:08 +0200
Message-Id: <20210505151850.660512-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index b7c38f6543..32502a1f7a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "55cebd9e7cc4153a3a7b3a45d42274c0e2a17815"
+SRCREV = "a2c02a074ba3f71ea89a53fb2e2d189c87cc4af8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.31.1


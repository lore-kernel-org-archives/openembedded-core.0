Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF35C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 04:38:17 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.27719.1753850294356566067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 21:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyX/cysN;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313a001d781so5429802a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753850293; x=1754455093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCH3YuZ0H6gqGmtD3NG0kd7tvGlmIeWtTokP5nJf71M=;
        b=gyX/cysN7y3j1LSFemiWf8m+KQViwYbMIMmbF9ml2rQqGWx5yLM+NTjQdkEmfYLJ8N
         07h0ImTxaHUnwAZucgSJKZM//3e91E4a8TKCrlQyelwB5JbcMpnfXoS5CATYIqalYPxm
         huF6BbMmKwyYgC0wGCvdvzGe9MQa2qrZ5JM0RGeYRRZqN/s3ciO4mVYx14uiGL32KzCs
         hURIYMqkypFWLp9J/SgPseZAxWssZDGeMgKGKf2UqGicTsiMBZm9vq0aJWA3hppznTy9
         EdYLC0kJbM25LG3izUIvONq7QNPBr9fMVuUqjTqkOtAApjCLsvTHdSedoAIzIZgEeQIw
         Exfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753850293; x=1754455093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCH3YuZ0H6gqGmtD3NG0kd7tvGlmIeWtTokP5nJf71M=;
        b=xBWefcJYNVcetu3Wjgo+DkR8Wwq3J7bCS/fiJv4qiE9whELVRZne0TFTRq32BrwxRK
         MxADp+9edMe/n8mW4rMDPnx73PUYSSjREFO1Of56A1ufyBZler/qBDFhxSvECClHvVVx
         UymSeVqT5PTiWAUNbcgCsYE40Jm4ruKxVWEb915sVTdznV7Opiuxvm+txIj+qLq5ruya
         KPusrP3v5ih/qJiZSRL/CLGJSfOTLAqjtlO9kjF2ZE3wQ31aiFv8s0AdKv4tnl19rKIb
         ufuUlZHdMOiueaMCJVT6Gh3CAKNE02HaYlFd66peOukQ4BLMHziN177dZfl6REK6JSC0
         8E8A==
X-Gm-Message-State: AOJu0YycxL0ibW9hSllVOXIXTn5P0zfTWAKk5/rUebOe6enDQABvkwDH
	4Sp6dSZ7970SeIKh+sD6VD9wNwV3OQpcxrz66+c6qygqf/aSv7ON7nIS6RJ+SSD3WX8=
X-Gm-Gg: ASbGncsCiO/Jy8v9DVjnLTj1Qck8waDv5vBqeDwd+lA3XoziYNjEzRZFhDo2nr41Rb3
	+eEkSR36BXfMzHxyqxZ1XkvxlghjkM7sawcNmekYPSIjkC/1BY0O78GPr5eIm0MSDx9Wy05/WdG
	DL1DDEfn4LAtgjvhJt3p5mhn3L0cNSHprhT+OLbxv2N/BxUChMVuky9BEbmK/ci8+rQJNXRZnEF
	SWx03hD4DaJJ/KoOxU1NjDXVcGWUCHSG6DheZOYWGz6wZVKF59XW4PZe6XAMkP1ow00FbubGxKq
	BcZsjx/ShVtjAbMIM1dYlfzn800bR86LamvEgsnTR0qf2cXW7PlfpsYRLUHT068T8+oL0nD3cYn
	g8ESFnLfeTnwrHg==
X-Google-Smtp-Source: AGHT+IFGHc2/42/H7TjdTh2I7DO0gvjJSs038eHX+M5dWagvoukeoFrI9L8OpIkJD/8J68lpJ+UN8g==
X-Received: by 2002:a17:90b:578c:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31f5ea6a0f9mr2581261a91.34.1753850293306;
        Tue, 29 Jul 2025 21:38:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49ebsm689957a91.19.2025.07.29.21.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:38:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libclc: Point to native prepare_builtins binary for target and nativesdk
Date: Tue, 29 Jul 2025 21:38:09 -0700
Message-ID: <20250730043809.1486481-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730043809.1486481-1-raj.khem@gmail.com>
References: <20250730043809.1486481-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 04:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221099

This is not needed for native version

This will be in utils/ directory starting with clang-22

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index e508959791e..7e63ce9c759 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -21,8 +21,9 @@ B_NATIVE = "${B}-native"
 # Semicolon-separated list of targets to build
 LIBCLC_TARGETS ?= "all"
 
-EXTRA_OECMAKE = "-DLIBCLC_TARGETS_TO_BUILD=${LIBCLC_TARGETS} \
-                 -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
+EXTRA_OECMAKE = "-DLIBCLC_TARGETS_TO_BUILD=${LIBCLC_TARGETS}"
+EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
+EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
 
 do_install:append() {
     # Convert absolute symlinks to relative ones (same directory)


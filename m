Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A2CC433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:30:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9.1652988602506916147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qstm8qh+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id i8so5610338plr.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FSAV5fXxxRiwvZhbWQa3Qpel0Vd6ViSgFKGQZ/vIUY=;
        b=qstm8qh+9Hh/bnLiTBp+fRroErTFpIF24y5zL/EHoHT6siotORYmS8YnLs49EUHXiu
         KDWjTUcAfwven93OEhYgmUANQKMvM/Jj8S0NscKrm9Bd+yphomMjZ+5/lE6HLtUFc8jc
         26aEoYq1Wv6+8CtaTXT34tjV5KNbnMYHnPojSvc0IehhzvRhXEZKdNsKGtRWOrr1dHNJ
         xQ1lnu+hLI+sx3Ly7hWU/9K31VUR2ojEV+9kWY2WDF9mmuIqPBddJnJOUdPs+AIF4xUu
         Va/EeucRoH6+XNM7O5SpJ18QLlsUMb1aCxP5qKf3Y50wPX1YvWhBHvpZXLoHHCQUaCFo
         2I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FSAV5fXxxRiwvZhbWQa3Qpel0Vd6ViSgFKGQZ/vIUY=;
        b=EUQjiIoKdBhq3Iq63/2PcRFT1zkjlznWB+xrguFBZg3507FtPY/0J/Dw06ohzMvA9G
         9GZii/3Iz07Qk7ZWqukETJzyW204IGNpx1DKLDN0Kdp3gcay5/552c7m+Rn68poQwUlY
         vOZ3qpZxY+qOHUvGE8SUrJVCk93cbUbCIAsA4j4TmHIK10LEO6YnxkhuwYdSJ4fuXSdF
         g+fXLZC89YeyjGGMuV+wOGCjWsTPDWudhR1wp9kCOi6yk1yMXnQRBOyQJyxHgCZ8OFjO
         O4L9I4SZk8ve3FXrSupkQ1Za+eiKEGxfU2pQzQVip6KxBX6IoAhiAGKVKQUx06GPzUvH
         4CbA==
X-Gm-Message-State: AOAM531sQcBOendPwsVzlfwHP80ZRJDH3y/ptIybK1Fp175vKrraWLsw
	JAVYZfubeKwg8KOKUYh0Rmhp6zEgszNtWQ==
X-Google-Smtp-Source: 
 ABdhPJxfl1VLLvJQniW6zMmYOZv7NqSkeCOe0sWfPEzRFVdXOChcLVap56UsFtH63PgGD+neb10qjg==
X-Received: by 2002:a17:902:c950:b0:161:84b3:2d4f with SMTP id
 i16-20020a170902c95000b0016184b32d4fmr6113056pla.55.1652988601642;
        Thu, 19 May 2022 12:30:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 f62-20020a17090a704400b001dcf49d92a1sm177894pjk.28.2022.05.19.12.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 12:30:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: Document future actions needed for set of musl
 patches
Date: Thu, 19 May 2022 12:29:56 -0700
Message-Id: <20220519192957.1129486-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519192957.1129486-1-raj.khem@gmail.com>
References: <20220519192957.1129486-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 19:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165906

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch | 3 +++
 .../systemd/0008-add-missing-FTW_-macros-for-musl.patch       | 3 +++
 ...fix-missing-of-__register_atfork-for-non-glibc-build.patch | 3 +++
 .../systemd/systemd/0021-test-json.c-define-M_PIl.patch       | 4 ++++
 4 files changed, 13 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 18fcc6e48c9..dfe41649009 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -6,6 +6,9 @@ Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
 Make it work with musl where comparison_fn_t and __compare_fn_t
 is not provided.
 
+Revisit this when upgrading to 251+ systemd since systemd does not need
+__compare_fn_t anymore
+
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 59bd81c76fd..4cce9a3fe6a 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -7,6 +7,9 @@ This is to avoid build failures like below for musl.
 
   locale-util.c:296:24: error: 'FTW_STOP' undeclared
 
+Revisit this when upgrading to 251+ since most of these defines are not
+needed anymore except FTW_CONTINUE
+
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 1fb84c7090e..e7b7269f95d 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -5,6 +5,9 @@ Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
+Drop this when upgrading to 251+, systemd does not use
+__register_atfork anymore
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index cc20c3710af..82a01f732e1 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -8,6 +8,10 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
 
 Upstream-Status: Inappropriate [musl specific]
 
+This is fixed upstream where systemd no longer needs M_PIl so it could
+be dropped when upgrading to 251+ see
+https://github.com/systemd/systemd/commit/f9a1fd2a3b2d8212ba84ef1c3b55657ced34475e
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
-- 
2.36.1



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13357C433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.22332.1638602021326217925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M0OLKIQ8;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id q3so10518616wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVNy0rW3Mo/ccDZxCVp00hY+O6k2e0Lr9zrICt6JZAs=;
        b=M0OLKIQ88msUe3L49cGkGWt5pCc4eT+GSagoaNSdSJkCmvTOKVFChPX0lXDsxBjXq+
         Tg3UmycupXCUpqVqYqLG4795LIo0gbGVn7xQ3J0LpmTmZs+18GkscWcAABrx/k02Xmt+
         4CSWwNIPqjXjz2WMSyHS2e91QMzwnFsbg5e2GqGWOPNgfVnQfPkX+rjS5fGirupFbq3+
         uGcZZE7jsqVCUb/ocBomH3Vogtjw+8onkwqlGX2DGbQt9xhIZvPIMjWw44GDsXwWHQVo
         PFKv69lZW+b2V8R+Kw3abr9vJWy2dfQlSQvu8LRCdIWLuBB+7h9YR1Ujwp9DGp8u/2m3
         svGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVNy0rW3Mo/ccDZxCVp00hY+O6k2e0Lr9zrICt6JZAs=;
        b=Eb5FlFyBP1GJgF3IrkExx4/Sezb4F9x9oHTSE9wSht/GaQp/ZBtI/VPEtUzFRzLSc+
         jb4ZzsjWJLyYLT3VSC57NarCMqxz+jBNhLRQoMfJaZGyKLjuROraAY/NQloY4fLk2x5d
         RRd3oFAYGW8cXoUXrHwEc9+qPfVlMVRY1FrfsfZ7u7xTqO/JKjo2Xe9jy1hZOrZpRrRk
         +IWVxgSSGDEQhqdV5+N9fh3XBQCyC7HVrIlLdGZjm0Yc69A8twVXHJ/xNgXiWhK3lz6E
         tPkCv5GNkuLBMMa5JZYle45sV9nHIcG3uHA/3rvTiWNsLVrfOKdc9XPP/UWouoDFWHUl
         1bOQ==
X-Gm-Message-State: AOAM530bEIAYV9hnDZ4wFVAMoPl7UVSfQxO4NzQ7ay3UF2cjPUdh6kvV
	f2f9oYvnoDVonFeONyerOhpM1khm8c8qfw==
X-Google-Smtp-Source: 
 ABdhPJyBBEISX6ZaApHB7mlY3OFRtiYKKKNVF5CKyXjvR59kfm6/8yH0m5SMhJr23HCWfYNBEGq0mw==
X-Received: by 2002:adf:cf11:: with SMTP id
 o17mr25986425wrj.554.1638602019928;
        Fri, 03 Dec 2021 23:13:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/26] lttng: submit patches upstream
Date: Sat,  4 Dec 2021 08:13:16 +0100
Message-Id: <20211204071323.2480163-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159166

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lttng-tools/0001-src-common-correct-header-location.patch   | 2 +-
 .../0001-lttng-ust-common-link-with-liburcu-explicitly.patch    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
index 925b51c3ce..24fcce41cb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] src/common: correct header location
 sys/unistd.h is not guaranteed to exist, and does not with
 e.g. musl C library.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-tools.git;a=commitdiff;h=8f14767d33f786d895e50633fb46b880249b6c54]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  src/common/kernel-probe.c    | 2 +-
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index 2d61dfa525..d3c451fd2b 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
 
 Otherwise linking errors are seen on x86-32.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to lttng-dev, Francis, Jonathan]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  src/lib/lttng-ust-common/Makefile.am | 1 +
-- 
2.20.1



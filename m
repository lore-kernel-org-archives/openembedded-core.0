Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12426.1607604804492640592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 04:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMkmEHHt;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id i9so5369115wrc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 04:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gKsyFr2fMmDT2ZcirkKBWNG2SCNC5sGzNTkktZfPS6w=;
        b=IMkmEHHtIR8v5rrrOk2Rul9abROqOo+3cSieVES7eP8kMmQRlq8SYARGHqQOwc2yLu
         ARGnuX9Po8BVZ9fTYXZIiABBNT7n5U0VCgqE9oYVQQygNaDmhGuUCWw4qDQQF9joQpsr
         z5nZHu4oNGDyx5K8iPIPxO/dH4TakdLLMF012+DSsKRTv2Onyv613QwRhgEYQSN1r7nn
         YkfCShPqLClO9mVXLGO41l9ytqmodZu+QM/hstlLi95biMh8gOoJbhtJMxYWuFbA8TDK
         VX8rzQ4vlbQnk3qSEM8Atu8p6AAVdVQsMGS63OjwwbMrXV1haqGiULBpFfk3ZsYT/keP
         mdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKsyFr2fMmDT2ZcirkKBWNG2SCNC5sGzNTkktZfPS6w=;
        b=ZD7qku6666oXzT8jFnPl8q+M3Z41erd2lDoPos2ouKha1WcUqXgUl2hayK02cqeHy1
         txzlzNKLJC6y7GYYJs8C6poWBbWr68WUC2JkSZi9XMZh0hQ8A6lpOEuhfdoyftggOFnA
         Tjk/Hj3GFDJbSyiMeXfWHqfiDmZJKoohL4JJS7Pl5XIVcLFm4ggyqeEIPB9Ug6zG3jDI
         3/tcAFXugBLcIZ2LpEy1+fpVMxi3SBx7rmTNmeSnKklKibHyG5g6ecW76EAQOo6qFesb
         JzDY+Qe1QqalqO16a2MJ+2jfQo8Kd+qtPKafayVtHURdWKeGuLSUWKXEYKmlHPwsFBr/
         iZLg==
X-Gm-Message-State: AOAM533G2d76hVWFVOOHBPy4zOL9EJclY96xIZkU4AFoCHweQEDjBpRE
	eYttM9bYnKADIrqypSekTDJUONvT9EhaJA==
X-Google-Smtp-Source: ABdhPJxIazQFn2h6HWdLItbMI1XT2ZdcYIQpwrfL23BZ3DPIc1g7t3ptVGPqjzcXFrNBFTaeHUm5Tg==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr7986762wrs.317.1607604802767;
        Thu, 10 Dec 2020 04:53:22 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id g192sm9545467wme.48.2020.12.10.04.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 04:53:22 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] systemd: ship new systemd-dissect in -extra-utils
Date: Thu, 10 Dec 2020 12:53:10 +0000
Message-Id: <20201210125312.3302065-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210125312.3302065-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index f20c2cffb7..09dce2e07d 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -471,6 +471,7 @@ FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
                         ${bindir}/systemd-detect-virt \
+                        ${bindir}/systemd-dissect \
                         ${bindir}/systemd-path \
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
-- 
2.29.2


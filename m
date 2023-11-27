Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A45EC0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:20:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.100524.1701105629840080048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 09:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUnN0PVT;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so3468261a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701105629; x=1701710429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3rDw6Bjj52cBl+OZpGosY4t1kvXszTpsW0EaXzmF9M=;
        b=IUnN0PVTXpeHTWlhYMXcyyh0DrMJFPyQEGHOrSatqOzsUxMan7WqHyyD18N52KBY1Q
         XULMrKiQ4BDa++SXBHodLGRJLnEtjtmpqtRwhPLvATnXnsG02XZksoenyLR8UNhFLPSH
         lSoKi27ybBOb/sITWmOMXJlvmIMl+h546TBwPZlmpcqghsJ3e75D5H9LcSBCB1RUV/WC
         5JjU/GVa99f+9vwWJjarmPEqZZ3P++QB75NhLWtiVt4pviEwxaotuXvURVpUTZAhCKHK
         xp6DgpmHwvo/018UEYhGV8qAWVdFATHb3sKAQsMa/Oyr2ZR8hclEa+Z4Ar5LsVDv60fD
         KaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701105629; x=1701710429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3rDw6Bjj52cBl+OZpGosY4t1kvXszTpsW0EaXzmF9M=;
        b=QAJGPh79JUVE5ySN+TuMUsNmyfjubawe4Wh+hJ3oX4BS32R/WDEn1mhWnM+NNkrWLU
         Sgl/8xGOOZCI98o7b5W3A9lFvrxUt76LOWp4Z1hew53VR3Kf9KX2LJwf5Dhu/J6oNI6j
         SLaXXF1In6HhzwIiiQ3mxPZOOuMm9zz8A15FuoYUbyqkYtEYfxcbqXVF0UPHju8LhHMF
         sA/9uGXF6gtP14tan6oV034iTyOb5m7tZ03k/bMjxUAQqm6vt8QwR/xcuYfAsgJcBE34
         r5qvWS3q/Y7cLb+m1BPC1soWPZBNr1/f9XugH8fFmJ3RLRGOQXY+EkiEmZE93KsB40Jg
         rUOg==
X-Gm-Message-State: AOJu0YzQseHt9ZG+E3gs+5ADM5CLbvmST8Fkc1BU6h1Axq7pQGJmfuDv
	kGa7GejjCijZuj5t3kJoNKHxQybQ4U2lXA==
X-Google-Smtp-Source: AGHT+IGQIIdgWuoBS6Kw1QAmItBxzgt6K+qEqFUCbW3dtAuBtlbnW2+yQOXrkL0X8usNUKe/1Z/DaQ==
X-Received: by 2002:a17:903:1207:b0:1cc:5cbf:50d2 with SMTP id l7-20020a170903120700b001cc5cbf50d2mr14068033plh.59.1701105628834;
        Mon, 27 Nov 2023 09:20:28 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:74b2:9b5a:59cc:ad2])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001cfc2ec5de3sm3376080plg.24.2023.11.27.09.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:20:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] vim: upgrade 9.0.2068 -> 9.0.2130
Date: Mon, 27 Nov 2023 09:19:33 -0800
Message-Id: <20231127171932.3974232-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 17:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191314

https://github.com/vim/vim/compare/v9.0.2068...v9.0.2130

CVE: CVE-2023-48231
CVE: CVE-2023-48232
CVE: CVE-2023-48233
CVE: CVE-2023-48234
CVE: CVE-2023-48235
CVE: CVE-2023-48236
CVE: CVE-2023-48237

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested vim and vim.tiny on core-image-minimal on qemux86-64
vim.tiny complains about defaults.vim, but that is not new

 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a37310afd84..6b440d89472 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2068"
-SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
+PV .= ".2130"
+SRCREV = "075ad7047457debfeef13442c01e74088b461092"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1



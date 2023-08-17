Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F205DC2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:56:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.181945.1692258961574050037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NovC0jjQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bbc87ded50so47797075ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692258960; x=1692863760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub1WLTQMPhy3RMYO81rhNsRii8Uz9zeJmSBPrE+FynE=;
        b=NovC0jjQZ4XbKcEx5eLrDg0LQVamVZ3rnvHFSGxASMcK6jaslQRMuYw/qMPeHP2r8X
         C4EcxOPS2pvWIDR6BVsg6WuA8APz0g0Ts63aFh2A1yU0fO/HuPddpmVuLGlDT+QaoDCD
         wEXejaQnbjC5JyGRKpubOeYI1Y5v/ENjgmESiqB+fCd9E/9j98GHjpim+DeWZqT/4YRA
         LbLnFJ61S9KI8YNAywAyZR86kq0Iij34HiwP9tOqeJU3dvEZ+FvhjGPykZMElBHjmC+X
         evGJIHMwtYGduXbJ3qF/8TvlXU7k8CjRxdeV77WJvRlX5YB+5WK/5+webxYBwQs0wGta
         YdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692258960; x=1692863760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub1WLTQMPhy3RMYO81rhNsRii8Uz9zeJmSBPrE+FynE=;
        b=EUnGGWeUlkhoq52HXYdt1CN2XJrk30xCWokbf7FPhggelUm1lu6q+1+MwyhEBOXXfp
         8nNCcJOdAJ1YpM++7nxn/exusHILoxFIr+8KLzJmCbEbjHZLyCqczwt3eqFbVfRPM5Sg
         Eigq2dWl/srEDA/ApOUcijzLJd+2E7Eomc78GXWxHYhzrvJ7BWaLwnhpZTzqQBVOQKk7
         KPrwRpoatOknIjCAS+TCMgzItlUjbrowKwxe2nKOvoNUR0zy7ykicreGyvvwtI7WA/nF
         JRdNUJUaaQo9B2stuvIY9dPRZLlTsoAxPMjx7778iM5IFJeNMdkp2vk7FtE6mGNf4bq7
         YTTg==
X-Gm-Message-State: AOJu0Yxl7rxWxxkhUb+HWEhDd+2PX3KwyfoXjEhi9pflTAjIBeSnbMjX
	H+bLiiTX+dvL92K8+I4zIpIrPvx55WI=
X-Google-Smtp-Source: AGHT+IGVl8I/sft4XS7QohLted+ezDrYH/536sBwh33faO9Aa7VeOpw0uqm259/QUFgnY7pAzO1J8A==
X-Received: by 2002:a17:902:ef82:b0:1b7:e646:4cc4 with SMTP id iz2-20020a170902ef8200b001b7e6464cc4mr3696539plb.28.1692258960443;
        Thu, 17 Aug 2023 00:56:00 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:3a:12c1:821b:c7bf:f1e8:d61b])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001adf6b21c77sm14464683plf.107.2023.08.17.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:55:59 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] pixman: Remove duplication of license MIT
Date: Thu, 17 Aug 2023 13:25:13 +0530
Message-Id: <20230817075513.40575-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186295

Remove duplication of license MIT from pixman bbfile.

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index d26d7f581a..a580d73185 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT & PD"
+LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.25.1



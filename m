Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6499E748F7
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.62163.1696176054344492117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WJHs/HrQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c736b00639so25170215ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176053; x=1696780853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxaJUqRphE4nHg7foT2Cj6FbhiScX9pFhLf1GrF8xS8=;
        b=WJHs/HrQZYs+ONZL9OB1tbY7bGeUGOKwCt56rDD98YSrds/kQihZcymYYdO/bcQ43x
         ldFdZN3Poxshmtt6SKRUZPj8n3D4cvik3lCzpEZ3SaVeSw8pRKefUPZ6nCsByRlrw3Fz
         5hhK+PsvXbRJkixrKGA3KktQyHIX3MAEyRR/5389bp1f+6//kM8xoaWmMVJkpOFHXuOx
         lP8nbPyciAbGdN8Gal2mESR4ytvH6KzGudbwVxLlqa3L7pPyW5uVF5Qk3ovzCOCgoXv+
         L/bDIB3b2i1vQBxmnDknuWZUTcbJ7r0LSWuFQ4SYGSbsjA9cJIBpvgiNhr1z6M8pc0bi
         7xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176053; x=1696780853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxaJUqRphE4nHg7foT2Cj6FbhiScX9pFhLf1GrF8xS8=;
        b=oKnZ7G8OYojXIFxfZllHNVvtPzVnJQRbhAddWvp3uL97e29jAXysF1puSpFsVTH4CC
         5UipkCfORSJNmPjz3LmB1BWAYoleKt8BbNdTozzIiBTXS6B3mCILZH46A5XqfJNXbuoc
         gaXMw4OBK5ys8rWx8376VO/YI5X5JDJlehwXG7u/hTCi1+P7vx8yrnlI80TLhSlWxVTt
         sQCK6zx+RP15+yv9VldbmKvsoF2oL8xWk63AB6nV9msfkmaKEWrBM+EGMUDMehvY75f7
         HPaW9EBwIBePHc+FApIslhMXu4NwgPbj0/xE/uCM47Pr8n+z37y8DrIKbUVv9+zPKoOp
         PD9Q==
X-Gm-Message-State: AOJu0YxZseE7emyPof1UJh2JzXXLgukuDsHuU6lZo2u753o/Wp8hs0E+
	W1PtNJM+UA+GP/wC1StdxM2fPyQnwuMddHWFjywHwA==
X-Google-Smtp-Source: AGHT+IHrxtae5Ess1Ey67xasOCPIJWrnVd03vZPKdX5Kd8GT+lrBadG1ys2DkmvBnA0SOeuG79eXOA==
X-Received: by 2002:a17:902:d4cc:b0:1b7:e49f:1d with SMTP id o12-20020a170902d4cc00b001b7e49f001dmr10388236plg.62.1696176053394;
        Sun, 01 Oct 2023 09:00:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/23] README: Update to point to new contributor guide
Date: Sun,  1 Oct 2023 06:00:06 -1000
Message-Id: <b39533ce98a106744738b92d473201bdbd2f643c.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188508

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Now we have a contributor guide combining various wiki pages, point at
that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43a3ab6b412186b6c7494e928809662c4ec462f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03..31b1bf52b4 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-corel@lists.openembedded.org
 
 Mailing list:
 
-- 
2.34.1



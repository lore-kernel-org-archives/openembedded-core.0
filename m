Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA934C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 19:49:14 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.25266.1708285752994165367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 11:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vpf4lQ6o;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c132695f1bso2894039b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708285752; x=1708890552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfxWdC34UqyflgR1hhFaOkMnMlFLHJSbrVtOrVPG/s4=;
        b=Vpf4lQ6o+LT0Kas5WrMjeMV/OS0hnkoTA1WQfq8nAwBxYbM/5ID4TydVUNhSsIo4S8
         ab2qEA3SZBWHaWexYFqcJd2CxK7VSiirIWwyj3wviZsH6CepzpLNu5N0Gz6OF9276tlQ
         QylvXT6ggI3jN+R5lnR++Y9P58u7tlMgtjKzI8h2M89RZbpXp8fwvd8T4WH3ri4GV5ad
         kGndbpHI/v3O8zQGeSXqAv3UHk1qu3pOpyDl3tfLkJvxbsW8CIyGzpi2DjZzaBHamCgm
         RG/7IIFCv/RbJKT+V/DSdax9waNbg08fjL4+aybdNAXVFD8czukl9GBfXeiHvHNRlWM/
         CPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708285752; x=1708890552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfxWdC34UqyflgR1hhFaOkMnMlFLHJSbrVtOrVPG/s4=;
        b=qk0gSBt8ns9kRhmt5URxs0CJ/D133U3xFe0Baoa8G3nc1g/T79+FV6LD0s4f1nCZNM
         XB2lbt1C/aimxYqwXejBQxIZUrK/a9KiNQR91x8666r8TPYj6mpUjUO+y1Ez44afQz0Z
         bZixyHm9FlZZ2LlpIozw+W+h+DlgPxrDeDhXI2et6g/ZdiRKkGfvdbXEEGXAORyDyR8f
         0RaD7jYopL5pZEbq+VjC+d/fDx7xA9OHroo0B8peKvaGg3CADI+UjcX0aTbLUV0d2GnA
         R74+D9YHMeiCcKqfL1YqBr9V9lq7nadKTepQrgiT/32b0D74UohcrcRc87hwQ5RIUkix
         HtUw==
X-Gm-Message-State: AOJu0Yym7q1RUEzf1r7OcYn1Q7tmO0E7vVJhQczM+WhlKLd5psQY6eJM
	14UiZrBaWAC9itLwuXhHdzmBq+gMxs+jHB3yaUYX/eUpdASN/4P4GGn+vBCo
X-Google-Smtp-Source: AGHT+IH8zwT3SRqieRj1GeSc/aFwWFIb1Osd1wVuyMIbIXsRATcBKRALHLFN5tWa49iWUFUyLLVNaQ==
X-Received: by 2002:a05:6808:1205:b0:3bf:e15d:a6b5 with SMTP id a5-20020a056808120500b003bfe15da6b5mr15443870oil.13.1708285751817;
        Sun, 18 Feb 2024 11:49:11 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:b5ac:91fa:12f2:46aa])
        by smtp.gmail.com with ESMTPSA id je13-20020a170903264d00b001db40c0ed33sm3036499plb.61.2024.02.18.11.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 11:49:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][kirkstone][nanbield][PATCH] vim: upgrade v9.0.2130 -> v9.0.2190
Date: Sun, 18 Feb 2024 11:48:50 -0800
Message-Id: <20240218194849.705593-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 19:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195848

This is the latest/last of the 9.0.z upgrades, since 9.1 is now
released.

CVE: CVE-2024-22667
(includes the patch for .2142 https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Changes:
https://github.com/vim/vim/compare/v9.0.2130...v9.0.2190

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6b440d89472..906aa53a163 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2130"
-SRCREV = "075ad7047457debfeef13442c01e74088b461092"
+PV .= ".2190"
+SRCREV = "6a950da86d7a6eb09d5ebeab17657986420d07ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1



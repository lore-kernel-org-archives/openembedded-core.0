Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB38DC43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.3765.1668003669253245391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EyaoJxCn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d10so16813756pfh.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK/8ef83TdtuAphd9qYNh6x6fdoMuVOqoPyOEAH8Ing=;
        b=EyaoJxCn875UeobHFnwRdSeIMTTX8Qk737wvLVBlNcqar18opIOZPHdNZCOFaDNp6g
         Z3zyDxarxJru420UGZOuaLexNwWjK/HppxubUywtAm+pkEwCgbHRIJzYPoOxHsSZ8MWS
         8YL67CHqF9a+gwMTQRwA7irGOdcTfhwPdhUvkLS7elGTJkr3bZ8JK6vI5P5zphQG2Jrj
         +hF3z3DmGueDkgHkC1ODBaaw6XxOC1vnm45nnoVrNqzUsJkVcauXvoJjwLPYf47eNQ2O
         yxl3gWQK+JXIYe+OxSFAgg6E0mKRWy3rBjwjBT53ik3XXs5RCuQUIu13iSslHbbAwgFq
         pHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TK/8ef83TdtuAphd9qYNh6x6fdoMuVOqoPyOEAH8Ing=;
        b=sPr4FL2js81rHpPcRjULh6NvxjZrJT3sCnFrGR+OsCJ1PQKSM39EF5F1XRz++adexx
         /SRv0rJLI6ejbq5g6AgD0dOSc9SQ3u8olY+JqQL7YZT5DjEnBKThIx+OW9CU0qwTYOMe
         LJsp6nwf0swfH+LPsGjuAPKhoyf0Qubl8A8+7GOZC4Tiq7v4b9EsMgPgYEbvWZXDAz7B
         v8bR1hhtEZ43gGYlXbAIKTIuHNaBQhK3vSa+yrX0VeVvvu2yeTUIE05pk2RXvIbNkIs0
         3tm8vMtlceyxrcJEAHqWUp5R4+uZFcZ+yxkjD+3KyZ2PMwbWldAc+Fu7N2yLvBIDRs7i
         g29A==
X-Gm-Message-State: ANoB5pnJuj30r877V+52GqMOVRI5FXn3L+W5vXKPyCoyKE3+jsHh8XZ8
	G9yGcNChCUcHuL56rJUND1sXieLZuTnZL0lb
X-Google-Smtp-Source: AA0mqf4NXoTSJuXXMGlZYd5eiE3z9JZNTLzodnQxtwDPLV+Gj5wGCSo590Un/wcIOal/a/7sIXKolg==
X-Received: by 2002:a63:e50d:0:b0:470:60a4:892b with SMTP id r13-20020a63e50d000000b0047060a4892bmr17553910pgh.148.1668003668234;
        Wed, 09 Nov 2022 06:21:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:21:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/10] create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED
Date: Wed,  9 Nov 2022 04:20:40 -1000
Message-Id: <88ca1b07abf1a8641a0eb8382e9322349a150c98.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173029

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14948]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 89f1abd5e00807cf179ddf658f74d48119523b0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index c190ad3889..af6afcc653 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -21,7 +21,6 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
-SPDX_INCLUDE_PACKAGED ??= "0"
 SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
@@ -431,7 +430,6 @@ python do_create_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
-    include_packaged = d.getVar("SPDX_INCLUDE_PACKAGED") == "1"
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-- 
2.25.1



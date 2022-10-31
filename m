Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F089CFA3746
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.8230.1667216867236486199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dkfi4zgK;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id cl5so3935656wrb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CY0g8YTY5aNNDvAy0Qyd81Qwu8ENi9vDGPndaecgOY=;
        b=Dkfi4zgKdBzjiaaju29LOThrbvSpa3h6OpO7EHeUE4gy2nmW3QJJCkCg0C0Cbw4vaJ
         dBNBuebV/6cE3HnuWFlYeosxMH1xiMzDnrpExM4fQsyiUvP3ECUHm2EG/t0VaWLBuDXj
         61HEa8IfnNPbX8ANyKvgiAQqpNhSgv+A6/LvZYMfYsFYXm6i8hDJ8QF07ZdLW/VzYl0r
         h63qIiR8dobN/EgigfLRf0J8h2xYicfsNVULM/NJxnsisNku7w8TotrqcHulPXJEqqbJ
         VOXEvRNQM+Na4wro7Eq2L/4j5J+QOi9yWRDos/MJ3570yfuWZy6ybwDbOucUibOI8hJI
         ZElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CY0g8YTY5aNNDvAy0Qyd81Qwu8ENi9vDGPndaecgOY=;
        b=egNdGOfJyyWgqS2iKA1Xlh7y/2JG/hlvYL/vGpVKT9OdBk8oUgufIl1rrLdE4MQ939
         LvRXgVq84u0E7Xde0uO3x1jBlL5L0uQUnp35ap2OeT6XvmM5FfNc64wFjMUQb+Oenm/F
         QcVaeCVtWAciCta1q3MpfdAbaRwSzbMD0oE02fJaiO6+0PS85FaTMTwESSs5Q8ALgnop
         i0iJOmQTLirKR8Gi9rflQD3LoXtuseHLrWdEgqwLhubjDmiI/tcUkmjwXuvoIIBf+8SJ
         djActTiCP7NiiNYuW/5cyEVuVQW9CSkID0e407KprZRGfj+g1cq7K+wiyuRrIJDJ8GGu
         tYPA==
X-Gm-Message-State: ACrzQf12AkfP1bs19mCxXcP0O34B+2i2f/3GTiqHIUAIl3HoAZKHjRkL
	CKOdiF3vu+rEbIMU8sYVvRM1uDQiYmo=
X-Google-Smtp-Source: AMsMyM7CXbNM0QuHflHvvsEEu/+TUL49yyxdSF0VxQAu+9F2J2pxvkXqaGIYo6d437tlW7t1H+hmEA==
X-Received: by 2002:adf:d1e5:0:b0:231:4ecf:7b7f with SMTP id g5-20020adfd1e5000000b002314ecf7b7fmr7863609wrd.678.1667216865745;
        Mon, 31 Oct 2022 04:47:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] ovmf: correct patches status
Date: Mon, 31 Oct 2022 12:47:17 +0100
Message-Id: <20221031114719.2725967-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172313

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ovmf/0001-ovmf-update-path-to-native-BaseTools.patch   | 2 +-
 ...seTools-makefile-adjust-to-build-in-under-bitbake.patch | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 89d9ffab5e..0c3df4fc44 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -10,7 +10,7 @@ tools. The BBAKE_EDK_TOOLS_PATH string is used as a pattern to be replaced
 with the appropriate location before building.
 
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe-core cross compile specific]
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index f6141c8af5..2293d7e938 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -6,8 +6,13 @@ Subject: [PATCH 2/6] BaseTools: makefile: adjust to build in under bitbake
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
 
+Note from Alex: this is not appropriate for upstream submission as
+the recipe already does lots of similar in-place fixups elsewhere, so
+this patch shold be converted to follow that pattern. We're not going
+to fight against how upstream wants to configure the build.
+
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [needs to be converted to in-recipe fixups]
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 17 +++++++++--------
  1 file changed, 9 insertions(+), 8 deletions(-)
-- 
2.30.2



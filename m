Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BB0CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 05:08:27 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.20907.1697692107539157807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 22:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jOqfNXXI;
 spf=pass (domain: mvista.com, ip: 209.85.161.44, mailfrom: sdoshi@mvista.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-581d487f8dbso1377882eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 22:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697692106; x=1698296906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h32+gOq23Ukb4jtkSOkAIiLRNA0vFD4SzPNaqkAw8Vg=;
        b=jOqfNXXIkiVzc7st8P17JfNjQVnge2U+1yn8SA5nzjx+4+Qwu6gM1SIU2qab7CXhaL
         RP/Qbm4/eAuxlG/VmrqJBiwkUAPxMcnxN749pWFj5rz/6XC34XYMwoA+UALLo0EBST/b
         /WeagP/tnwt4ZOGQd6OUelcbZdrG//5fV1PtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697692106; x=1698296906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h32+gOq23Ukb4jtkSOkAIiLRNA0vFD4SzPNaqkAw8Vg=;
        b=fawlOSNxQ2Q+zXAG1DPaSTmjLggsjd3hL1F4yy0sfYxSYURr84rrJjNqOnbS9ljZBe
         y+NQSMalnH/BRcR7DAuFIFTyjbrd1gvrocnJ1TIfcepxEQmABleTEjnSgAKx2SnqICnE
         ymS8RPvUCc+qeqnyE+RjE3seh8z52qYUhyocTVaIgQCPIW3EeAhV5VUNm7F3yJkl6Xqt
         YkVB6hWEx1yJVPF67P48bW5p2uqA+07htKWVGj6DO7bmbEmar079nFFX4GjuMiJsipWV
         8UN9y/qYVkrv9rtBFKY1SjwGXSTj2WVXntcEbPSTsM7yvLX6HzrtnW1fNe3TdBVQ3wNl
         cSnw==
X-Gm-Message-State: AOJu0Yw79nHKoDxdj2lpyiXV65IfuH4POzMeM1NBcNdLo/ViGM2HlD1f
	6Fa9ISkM2C2GfV8Xq0q9Ehw+Ml5UGs6rC+8keLU=
X-Google-Smtp-Source: AGHT+IFuwomlqaPBtYx0NL62ew/1IArwXrptIEf41NHRhviiOD3yI8GqVU4XrF0YRVja14cBakmEag==
X-Received: by 2002:a05:6358:c62a:b0:166:a6e3:cb9c with SMTP id fd42-20020a056358c62a00b00166a6e3cb9cmr1046213rwb.5.1697692106245;
        Wed, 18 Oct 2023 22:08:26 -0700 (PDT)
Received: from localhost.localdomain ([157.32.47.210])
        by smtp.gmail.com with ESMTPSA id x15-20020aa7956f000000b006b8bb35e313sm4161321pfq.103.2023.10.18.22.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 22:08:25 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Thu, 19 Oct 2023 10:38:18 +0530
Message-Id: <20231019050818.7014-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189426

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 51247cbe0a..d8e88af22e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1



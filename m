Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2240BC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 18:54:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.697.1635360848208789836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ofRrhZfT;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a26so3549006pfr.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idLD2kfBlf9rozLQP1HTk1cHB+xJXREUi4qFan1cBts=;
        b=ofRrhZfTN1yGYizSxnMjv6uaNOb8zmXTaxQ+6L8K7pUoGl4XqZ7pjrFk1Ulhm8d1vt
         ZmhVPNNZse7SKRHWcpFgmKpTVonl150TzfI+u2UYtRV0P7TKWzTPD5NqlogBWmcf6j61
         4LdWknyVPZMpFXKP9GIiEol69qJxDK5MuJCKg11yzkgzoLDPzK31cR6cM9BLEcEPk4jX
         2Q5d3KS1ft3ykNTfsJXOMWADTf+ZiGp5ETDdemdTlmFAp6+xvvFschQNi4zeatmd4r8+
         iedL363+l3ecvh54My6pexZGqb6R9Vhd2NkkcpXtMHPeJWf0j6J8GqEi9MZNzwyHQwcx
         Y9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idLD2kfBlf9rozLQP1HTk1cHB+xJXREUi4qFan1cBts=;
        b=YuRsX3fjWT7vYKVmVPaCPMwW4Cy9eyuBnrUa9wspfRBvGut+NDuCnbRU7ZTLKXgjZz
         IxN3e6xkQ66vPvDAcSL70MR4QCPbc0G71D419xW5p56hK8CT0ww6/BUBs/oV9my903iX
         KuQv6QS6fF/PJ7MlikJk8sYiQKWti6g4J2DOPEeKcqpsxxqOjut2zlk0pKZ/jqhWsBX/
         i0cmTmogmAWolEqh3rZEMIrvRlnk6A5sverocNEmTtF61kb7No/CJrxOKDfgDnFwDoAx
         qjtIc6CtnomshhI55qZaxWZ8UyzLG8eSDv8YosNITdvMyyvNH8Vidb9WiTUJrHiLfvso
         a9HQ==
X-Gm-Message-State: AOAM532Mh7mnWUJdHUkpSRpnfpIyYQFP+WJjwaWMYQMQaDIhksdpBGrg
	mGSbIKvjRQaU86vkvq7BsylMbbN8RLk=
X-Google-Smtp-Source: 
 ABdhPJzHC1psaLC8sgyQZjCoypdH4t8/wRDI4D3jNK7k8XO8Lg70UwhDKsHi5TuVZXr//cerBLxLcw==
X-Received: by 2002:a05:6a00:230e:b0:44c:4f2d:9b00 with SMTP id
 h14-20020a056a00230e00b0044c4f2d9b00mr34741567pfh.24.1635360847348;
        Wed, 27 Oct 2021 11:54:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 e15sm5092635pja.52.2021.10.27.11.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 11:54:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of trunk
Date: Wed, 27 Oct 2021 11:54:05 -0700
Message-Id: <20211027185405.3939665-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 18:54:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157565

This brings following fixes

* b76f37fd add qsort_r and make qsort a wrapper around it
* 7be59733 add SPE FPU support to powerpc-sf
* e3e7189c fix undefined behavior in getdelim via null pointer arithmetic and memcpy
* b713b8b2 fix excessively slow TLS performance on some mips models
* 3eed6a6f fix error checking in pthread_getname_np

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 06b0e060d0..82fd9e9079 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
+SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
 
 BASEVER = "1.2.2"
 
-- 
2.33.1



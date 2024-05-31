Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C81EC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 23:01:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.26610.1717196503809095505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 16:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBO7EfHE;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6265d47c61so147855466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717196502; x=1717801302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1yYBMub5lOK0Q+Nv51Vm12GgPz97RR4222IhNeI3y0=;
        b=MBO7EfHEH88ZUF7mryosBRw7s2aaiDGQTrMhEnB/9M/MMTUD4arO52+Bn4/waXduBK
         d39eq2hSfjmd5E2rOSgds8UaeWCbHBk7F9NJAL6hBC4aKLJHt/fn5wWDth0nle/+T5XR
         5+8iSqN+AW8l2490zA+fi/3FKWnTTt74vcK+nW5tQzkBNQ6ozNRKAe5D0v6qZzScusvQ
         IUHNxpug3YIESjZFbv8emVAzf/liHm7NfB+YDgiFEzWQr1BXGhRndHh0V065oHTHYR0o
         oQB7tWegNOhjsRynB1rwg6lQ3Dty3PEBCxxNZL5o9TjLIG/E+9GCXfZejMjrzT8bIybG
         fKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717196502; x=1717801302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1yYBMub5lOK0Q+Nv51Vm12GgPz97RR4222IhNeI3y0=;
        b=ary0YBOIjg1LYjSbQLI7aURAvHOpB3S5C8JR2fdxgOKRC3EM8Pjzyif1432wA1Y1Zi
         eVS+eg+s1Ex057W/gS82xrsz+aK25BFNMCHWUwKy5PrtYMudSzilYT6IUgh+FUcSc9dG
         y3MjLTglCi0ppa/OjgeKQVSpAEWwwALhb3iRAQl8zytwJJb9LHiI+7MRRFq1xFoeDwnK
         ijvC1qvktpynukBLOSM2iYVyexWUFfhQ8pxIlkoSR6/HUmE+8eCor3aEReuZtXsvH35Y
         ijkaKZfDkNVmKRvxTKpT/BYvOumlgbXknPqDt6l/tBdI7lTWWcnlZ2TxO2Sg23Zktqfe
         0/cQ==
X-Gm-Message-State: AOJu0Yzn136gJu5WluL6fYZKt/+Fw+NBhpJmUB6QLchBz4SyFQKyAYij
	C2ZU/2sFzNYnnocGCZxtTKO2w1HP8qnqcSbf/ERAtysdQALlvFpT3nAWJA==
X-Google-Smtp-Source: AGHT+IGO2ZWabYwZluPv2j8dzsX8s/JnAHikT8mMoAhX/bwruynlYBNAIPJrz2nTXtV3wGyo+gmesw==
X-Received: by 2002:a17:906:b094:b0:a5a:6bde:c3fb with SMTP id a640c23a62f3a-a682022f83emr210195966b.28.1717196502054;
        Fri, 31 May 2024 16:01:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eb344426sm130286366b.215.2024.05.31.16.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 16:01:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv2][PATCH 1/2] gitrepotest: add Upstream-Status to 0001-testpatch.patch
Date: Sat,  1 Jun 2024 01:01:24 +0200
Message-ID: <20240531230125.2404729-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 23:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200090

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
index bccda17ee9..c3f99455ca 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this is useless patch only for selftest]
+
 diff --git a/Makefile.am b/Makefile.am
 index 432a9b4..bbf7c74 100644
 --- a/Makefile.am
-- 
2.45.1



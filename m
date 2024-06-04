Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947BEC41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:10:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.16404.1717488629854477828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+5TPPg+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6267778b3aso459486266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717488628; x=1718093428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOy09+aZez1XJ5CGH9LAEz5qo80QU94Q22O+aFgKJDA=;
        b=X+5TPPg+x9VxWk89h+rR8BtQVqo/779tgRvu/ZWgz/43dP3M6WCn097aP3mPelyvjc
         xsBMkIbRroUtLF9BO/77RsdipIdoe9kI4jxVvOcmQkFoMtIyYef9xtRjL9dzOzyRY4PY
         hgy88rNmqBsjAZwzcrhAOzK/Xa227M+uU/D6pqTzfPmFzZD8Ec4AjXjqkBDORLYf4Ezh
         ivInoQtr66JptY7mwc7Hn/NWgxgZgX11TimsxdoBGk5Gvt7IA1dH6gsmLb7IcY+39t5e
         JB3lNeH6uj+yUhSCvNyJaXWpi+XbskxaXpTjU+Tntko7D75pZgrOnH5cLio2zHzWZCkQ
         ywlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488628; x=1718093428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOy09+aZez1XJ5CGH9LAEz5qo80QU94Q22O+aFgKJDA=;
        b=kVdLTUHD575nD8EnonFV9xXGZgXKOUjHDFPWATAsf/IGBoebkrYrBGlL+HkI0JajcY
         gPAQgM0W+V0W3CA+hSNd6Xw3xzrMbT1Qdol18w9AHjeyfhl/X6x7/HQr86mtIIFc6tgX
         NbAyt5vhR36Qc88FUgHzLf1yiFV0v6RW4HEu8DPt3p36pppRQvwiubqnFn5ZuYSZKEQw
         /f77+eBM0lJFESUx/Xa+2cXLvOomr0vaVYP0VokzkzLH3rGbSjrSba8QqSKXYu/QvJ/V
         29jPazdAIXYTgbQN7VUIwI6+B6L3slC4WZWrm3K676e9/Md7zWXUSVSwYWyj4LezJz22
         c8+g==
X-Gm-Message-State: AOJu0YwGx4avmlgM2KcfayTxo0Of8dA/Xh8eYySCfTj40D4Xnn0CCWq4
	uwQ99C3A3yTXwt1DfWnZF5rK4J5cvmKJLg5qGQ0hF2ubgBwM9px8muudEA==
X-Google-Smtp-Source: AGHT+IGL02Z5hHSYbi26dwB5geAIa8ZoFnY+N4eb82+efmSJT4AgueFPu/o8Lf2ek6dT46mGxIIsgQ==
X-Received: by 2002:a17:907:11cf:b0:a69:1a9f:7985 with SMTP id a640c23a62f3a-a691a9f7a2fmr226403666b.77.1717488627993;
        Tue, 04 Jun 2024 01:10:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ccf77cd3sm408428366b.13.2024.06.04.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:10:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv3][PATCH 1/4] selftest: gitrepotest: add Upstream-Status to 0001-testpatch.patch
Date: Tue,  4 Jun 2024 10:10:20 +0200
Message-ID: <20240604081023.38549-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200304

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
2.45.2



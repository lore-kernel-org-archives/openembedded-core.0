Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C7DC2BA16
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9693.1718288467290678556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XPnTcQ1h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f6a837e9a3so7634785ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288466; x=1718893266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG1RerpZa3QVLhf/0Bs5a12z+kgMhczagZ2ZDx02T8c=;
        b=XPnTcQ1hRcH8J+57gAlqeDuzSKk5JPzaz4bdFBhhdf2YReUyR+1wzUWm+OdQ8JBIJL
         3J4T8jfzrKLV0+aQ8G2L08JZxKzyVnms2hG81flyiP/FRoCVzHL4iMKHXDBhiHm0uWHg
         kSwUGxKWK3EclolD8M2XCW7hGch5cIiQLaYQt/FeZc/VSvi4PGCweQs9AdTvBELHBzgm
         1affsZkDTr3/Fj+Los0mXFmFFJ9bdztQSTOc3HmMHfh7PiVp0F4t1zPgFi7OWmOBE0HY
         ry05NYwaLk0wyWnGLhddJ+ge8U1B8KSdTXdsXjcUXr1ym1wpvyFFfehHLDl9w2+L+Zfu
         DVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288466; x=1718893266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WG1RerpZa3QVLhf/0Bs5a12z+kgMhczagZ2ZDx02T8c=;
        b=Hos5VBrMDx7UE+CmoqZIgxWs3Yf9YWlkVfVUhFWXw63OFtp4gvG6ifoYDZkn+Qc/Gb
         71+2GFAn4bqpQ2SgfLziHIgxvOnb8x4/H1mo0eeNry8B7BLguvaNLGF1zJtY/Q5I4taA
         RmgVbotcFNxZWsVVLrtB5/tasWOvdTN8hHsZ3M+oy8snXQ/HnezgNniKIvxwfTciszZC
         vOMAckQ8ghFK1Q7e4Kr6geL/kw2vA6e5R/W7+urB/EqNVQeBSf0zQaNZu2CM+NIb1kJu
         rwsmOXTPGzJMwfA4hYjcPwbVt6GRG3EL/ZQvRMCx20i5t0jCLWHcFd4bzxXu+W812MeQ
         rNxQ==
X-Gm-Message-State: AOJu0Yx5gO4JaieEasmDjiri/6BAIT7wXeI5Xa+wbRXRA3mDc05dPg3U
	M2/koudHeKlsJ+xbigW6ps8WQKAlUJ/k7P2DUCp6R3Knc/CnxO0TKD0xZo+7Gfq5wnGqqhrkP3T
	8
X-Google-Smtp-Source: AGHT+IE4ChRBHq/aOuGk6Pvr7+2H9OPBX3qksk8NMLVI11mCd9w9Nv77JrA+02G+JyZF4MXkCTRtVw==
X-Received: by 2002:a17:902:ea12:b0:1f6:6de6:9274 with SMTP id d9443c01a7336-1f83b716bbamr58004185ad.59.1718288466249;
        Thu, 13 Jun 2024 07:21:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/29] bash: mark build-tests.patch as Inappropriate
Date: Thu, 13 Jun 2024 07:20:24 -0700
Message-Id: <e796f05f243ac981082c63f816ce2e5e715bd347.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200622

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d82d44ed6822b7a276df355311e384c02d36c43)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash/build-tests.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index ea38bace9b..c1b9b8261f 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -4,7 +4,7 @@ Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
  dependencies.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [ptest specific]
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
-- 
2.34.1



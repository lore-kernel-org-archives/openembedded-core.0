Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91502EE49AB
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:47 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.1053.1692634305371299353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sb8JU3La;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4ff9abf18f9so5171704e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634303; x=1693239103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ08zWm3YJBW8vpIJ55BBYcDMLEYJPQpozpMQfUvfCg=;
        b=sb8JU3LaLrlU6CHIn6yepuzfIuhtxpojVXnOzIxrUb7nM5zEY6RCl9f8FkxVxG78by
         6xgWERdH3Wnhrpw55nTX6KaMhu/tSvJTNWRCf5jbXGko/UYSGG8GFjdf6tsjY5HaXqgk
         QxIk3AtmTCRWOgnJwWEf/b1LQ20xccNTEhK7ff44EYfwxMYhzuF+nLo5IcYQ5dKeCUyy
         1dYNlvJiYTXoTXZU7s+FNdQAaNlpHz8OSA0n5lB1XIQXxSHxUvpPXxEClwAW4t1b8rXb
         uDBc9rIL2A6B3MLICOdDjJDnLHXp+iXIS+9jitJEYXBZqoMP9cc3o4i8v71OUHQmRQkr
         mTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634303; x=1693239103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ08zWm3YJBW8vpIJ55BBYcDMLEYJPQpozpMQfUvfCg=;
        b=bDSda9HjExmxOwrGmy7rpHlHMwdDY69f5iugW2OFKWHKxYzJ37GhqGBYqpsJUB0d+Y
         rnMypxqiDRGQ5NOxRMgm8kpMx27hYdMWsRI3r7ffz4y5Hsg9u6F3WCuT2ebkRK9tIO1V
         oSSi6hB69qcsMgDgZVymYV/cSr5vZyxM39NOXrpYCz57Z8umFsIaHiGF7eFjXCLbGXpM
         4sNYPir70DzoPO0k7VHjiHdRW6Y/pj25Cf58Q3xBUb6uxXxkjAffUy5y8XMXv4HEOPN0
         AynQuBe1rykG/YKbZJzSVYzRaDhzrAiDvVg/qKibyT1FKveHAkNIiX5D/oJyNTuOBGrx
         9LfQ==
X-Gm-Message-State: AOJu0YxKIsGBkbZKjZeG6tmmzozrOUd01pnqSd2e2ST054i5X37lvQ/9
	17mzwLdqyrq12J8ULvwc5hAaJBNAJ+U=
X-Google-Smtp-Source: AGHT+IG3e+AS8b5l9ZGDTVlmaNW0w+Fkm3dJMQ0aq+NQlPZmqtyvSHzMSvenBCml9Uz7Sn6oe2uyDQ==
X-Received: by 2002:ac2:5e3b:0:b0:4ff:8863:be01 with SMTP id o27-20020ac25e3b000000b004ff8863be01mr4451441lfg.8.1692634302836;
        Mon, 21 Aug 2023 09:11:42 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:42 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/14] gitignore: vscode bitbake plugin folder
Date: Mon, 21 Aug 2023 18:07:04 +0200
Message-ID: <20230821161120.171956-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186464

The vscode bitbake plugin creates its own build folder to run bitbake
independently from other bitbake instances.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 8f48d452dab..ca11ee36de2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@
 /*.patch
 /.repo/
 /build*/
+vscode-bitbake-build/
 pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
-- 
2.41.0



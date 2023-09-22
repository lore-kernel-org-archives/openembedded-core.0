Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE80CD4F30
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.16357.1695367495029436230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kvk/GW6Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a64619d8fbso224115166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367493; x=1695972293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ikuH4adpHS9UUVA14whDFv0N+FsZaTYgWz7+VsAFmU=;
        b=kvk/GW6YiJ1cQrzIOKZOljxnyaIIy1nPO4/rJ+YkMdhokeM5IHQJ87F5RqZD+elwgf
         f3PSx74shkHk9JJ86q7pXqxJGloBw5vbxZIOOSFjdApclnH/AXiZlUjBjJUxLopx/AyV
         dNBbnEIuUom2sp5kkHmhwv0M/xdcSuYX6aFb5VlEHOW6HyfAiZvbnNzMiDvlpXwjNdU/
         zRz8kegd3kpkxvhulu3icixO/8M2R8jkfq1rLsBIzdvW0VeziD9+DUqNF21WSKfN/7YV
         HdqgTLlchWZb2/M8TEC9ihE2QMum78lUolVOWB1jWQacIg/XOH3HaUKFqXrxQwE9JV2q
         WVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367493; x=1695972293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ikuH4adpHS9UUVA14whDFv0N+FsZaTYgWz7+VsAFmU=;
        b=qhNb3o1oh3MDIfcbo9FkHbcdNFqz8dduxfTG56R48jcOguqUGKOfJdHSw7TyANmk2b
         Ugq7dlFh+qt+eHvJyLJmZ47Cx3h7JDYFvZPmIg4LPVpIPEUi3WLoskyz5tlwoZwr6lif
         xeifDhBTGY+t8LwV3FDS7f3SM5Od+Bl+b5ZMVjNNDrifXUC0INVeA6vsVoEMJdRnYApY
         tB/IdJ92v6nI2JKKJUuTKaOMxqApM40xZGbfut7GfMicLkYS6IGYw1Zqeqblk6Qn93/B
         5IDqFRn/eOGWFrm39gPDXUkjmORZ/CHblaLbXj9/dEUQiqpvIm2TrbTXBy6FBVlRgLXk
         X39A==
X-Gm-Message-State: AOJu0YzNj6o7qqFUC2aIDaPZw2INy7dfSt5zTixI/sk9ENRETezR/zg9
	QoI/lAmfGEHem8y2xppWqf/Gmk6sX9c=
X-Google-Smtp-Source: AGHT+IFUyJVCCUUoDtL6//XE54yLcGZ/HIChJirYP+rf5efRzIwXObJ+f4udpkcXqLN5IwSz9K641A==
X-Received: by 2002:a17:906:7488:b0:9aa:63d:9ede with SMTP id e8-20020a170906748800b009aa063d9edemr6888568ejl.9.1695367493487;
        Fri, 22 Sep 2023 00:24:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/40] python3-git: upgrade 3.1.35 -> 3.1.36
Date: Fri, 22 Sep 2023 09:24:21 +0200
Message-Id: <20230922072431.1481743-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188072

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-git_3.1.35.bb => python3-git_3.1.36.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.35.bb => python3-git_3.1.36.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.35.bb b/meta/recipes-devtools/python/python3-git_3.1.36.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.35.bb
rename to meta/recipes-devtools/python/python3-git_3.1.36.bb
index 9b2e36d5afc..ab1b0f23532 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.35.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.36.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9cbefbd1789a5fe9bcf621bb34d3f441f3a90c8461d377f84eda73e721d9b06b"
+SRC_URI[sha256sum] = "4bb0c2a6995e85064140d31a33289aa5dce80133a23d36fcd372d716c54d3ebf"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.30.2



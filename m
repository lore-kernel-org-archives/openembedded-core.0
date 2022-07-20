Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444B8CCA487
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.51644.1658306707520253040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTyO9kQS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x91so22892504ede.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3R4p1uCxSuUVhSUdLvVwa7PJyOGIGbSt7AXsYwfkshw=;
        b=cTyO9kQS9ufyvrwfXylFGd1fD0b/raprmxkfER4O+iSzSqmF/H2KbaD9Fbb5r8AYBk
         OVlQ10e/09rs7Q+OIJ5LMHJo71lSkYXegs5gmLbBT0akzE88SOQfGbMpnO+SVHk0M9bW
         bFxJgwCagpxH8iHs8irShCs/xYweY22VSU2pzpXRMRMHTJpeSJAxwTKhuukCykOKJHG+
         JejPbt5oPukX1365AiMJGvQfFCudlhN2M0N0S4M5GcRXNVk+2vSrmq399EVqr8m4jZtG
         /pnT62vAVKIN20w3XNdgjG1SyAhUNBmvY6bWUq1njnpnipHd98bnueB/J2NWSfw2ByU+
         t3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3R4p1uCxSuUVhSUdLvVwa7PJyOGIGbSt7AXsYwfkshw=;
        b=eCImo89yCgk/oRAzqx+B3Xf8Li6/TnCgYrkp/QBSiC0h/b5sM+xY3wUNQC+zXyfkpN
         hg1jUIWqt6zzeg6iAt8xi+A298tQeIAlh4CjoMYFc0i9leD8pCJ9Z5lqRXXquKafDE+l
         ho8PljCOunSUD6wZCbPsTJ9r+aLVh2mWWE1VTqUM5xX52RMc1JhSnlk3Zot6dt01nPHY
         pU8JCA+Gk+RO7mvSomTuN+l2jdt7PLItZtWbPzn4Xe3jgLVon4ARCjB78SksMm9GeHcS
         f3IHqovNEImEwTzpIwbqiouJYEprj1K4flOLHMkVYeXt2clPEaeFwSjreIHP8G8QcY4v
         JN6g==
X-Gm-Message-State: AJIora8Cx4MkOxfxrnt36iiTO/TyToLozY+YeqgJWyGg+M1nxjfMcq/x
	X8QxYW/9Ebs5Eh6MJ7b/iHrZPyDAwuU=
X-Google-Smtp-Source: 
 AGRyM1vYd8lOKyN6a7OsCeuIk4NBw/YA5NYMEO/vjsxxCPM9MiM+va7VGsbAObGN74EXS7tRglFW0w==
X-Received: by 2002:a05:6402:3301:b0:43a:9ad4:633 with SMTP id
 e1-20020a056402330100b0043a9ad40633mr51336283eda.261.1658306731983;
        Wed, 20 Jul 2022 01:45:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/51] python3-setuptools-scm: upgrade 7.0.3 -> 7.0.5
Date: Wed, 20 Jul 2022 10:44:34 +0200
Message-Id: <20220720084442.2940187-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168336

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-setuptools-scm_7.0.3.bb => python3-setuptools-scm_7.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_7.0.3.bb => python3-setuptools-scm_7.0.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
index 72529353e5..a1e719f54b 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d"
+SRC_URI[sha256sum] = "031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
-- 
2.30.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27E2C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4639.1642588904844326886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LhbHB175;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 h206-20020a1c21d7000000b0034d95625e1fso5422982wmh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bywL44Nr5QrmIji/Bngw+PGwtkBj/LR0N11ZpiUUbA=;
        b=LhbHB1755ElZoJZg7PQZ0hOR1P01fGLSVPhfvVegC5xPiqsEYe64kSSoFZOkuTak41
         vHPqZWBSn4B2OciG3Rm/04tTjD+M2Y3DoN5P5WVSBkqZgrgT/LllJ6s7TLw9ffy7S+MW
         4DbDxeesyLlG3WPQNJFWLSxdzOrukj85nzMH8qsHvyTJRlh5R2Qi+Ubt/7bBNdst5jd9
         +PFQNbJAhjRLQ2Qoinkw2SbUgGxmIHEWmgScb9PkYuiJf9ThfUEgKIirP0XZdArcDc41
         rNVvqYjRmK+mLhbGLFVEePCUHGHe9TdEApYfv5kG7rVbknyPlGc7bbozVmiGMvqg8aTb
         0Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bywL44Nr5QrmIji/Bngw+PGwtkBj/LR0N11ZpiUUbA=;
        b=WfGO7vIo0LHV5x2nRRDjgszkDScdFyqFPjRxy7x6mxVnYENusSbdkcDdR1SA8GyvUy
         lXVeROCx3VWoM4FJuYI1/C2nowHrTmq4tIY8GEizd0Cg4EauKbNtbWznLOLDdNt/DdnA
         0JxawMawT73QRu7/edbnSqOVkYDlCJPYd4jYHnDkA4t6uO11Vd50jHxXsZNizyanZmWu
         TKHMvFRZMuWXtVDnZEibOu1lrbtX2IbrqrrMSe0vTzyM3Rj8F6Z8weFsxSTiyF8H3htd
         ztKMfw2mVXB8mwYh00RATkIlU8pKCL3hBrRodl0lf/Qyh2vYJVbo44V92so8IuTo9SGr
         QU9Q==
X-Gm-Message-State: AOAM530Js+oQrKI14Aj9ABkkHkru8LrrfrYLmzzrDx+TYsBMxk6JwL+S
	WHfZEV54+2NxGMuxakG2ca2JMiSpxvU=
X-Google-Smtp-Source: 
 ABdhPJzqHbJmVA+xZ4M+Wgdlg8zVD0uy6rMnu2cmHb3kM5DZap7ekUEPQLBCq4ahbgk9rMQbKgE11g==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr2937628wmj.82.1642588903491;
        Wed, 19 Jan 2022 02:41:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/39] python3-pyrsistent: upgrade 0.18.0 -> 0.18.1
Date: Wed, 19 Jan 2022 11:41:02 +0100
Message-Id: <20220119104117.2120127-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160716

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...hon3-pyrsistent_0.18.0.bb => python3-pyrsistent_0.18.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyrsistent_0.18.0.bb => python3-pyrsistent_0.18.1.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
rename to meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
index 0b4d2564f6..4c9b8ec1dd 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Persistent/Immutable/Functional data structures for Python"
 HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=a4b94c2b800b582a8d3925a9939cbf44"
+LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
 
-SRC_URI[sha256sum] = "773c781216f8c2900b42a7b638d5b517bb134ae1acbebe4d1e8f1f41ea60eb4b"
+SRC_URI[sha256sum] = "d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96"
 
 inherit pypi setuptools3
 
-- 
2.20.1



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FA1C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.22336.1638602020725748337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=onIj6NMb;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id u1so10465411wru.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jR4wWGRakJ2fsk5zO6WNXZ7lWjX85ycKsA5/Qd5JxJs=;
        b=onIj6NMb346NLCnmB1nQLXl/4C/HxfzKayeUO6HUMZ0x6oDMEr4eutsmEDa7mDQjkP
         eK6QkpTvhyFdu0ckuCDKL/xB8GMtJ1XPxVDHsmnJHzc9CbkEqxJmGHV1LOwLmZOLKaLX
         OHnlYRyVY/J7sbCU7YiDVh+/R/5jfNhcUpw6JTPvE+qf2C2PNhDPAGkXK+uGXmHlIMaQ
         x+g2YjD5lcXpv32WehZgj3eDd99qAp1PHQcf0HhlGSwDOxMIwqgN24Ugh7jr4I2J32n7
         807GQVIlu7VzbMvKW6FZMQwOzC+nj0itjf60eBp1QAP0JUaUa+7UoKrUWB8cVLeZ6XLG
         437g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jR4wWGRakJ2fsk5zO6WNXZ7lWjX85ycKsA5/Qd5JxJs=;
        b=03VKYElT3/RR5b/lXL/TZWpSEjiV7ioeYSsOYxO/9BMJmnX/aIwsAclvLtktfFjA0+
         DuwgVF4a+1tFGPkRi6rYf5QMXNh6wQisBmxlTRooKDvEPFmqymkM5yCI/VoOQpTI+xPa
         iNOs/kE4kcBjbjrtPsK3if2BmRIWkBjL0rUPeYzOP6zehMPwk95RUSdCQuNQA+1sgLT/
         S4Vqs0+ax5nhcsNv/3EFUBh/hwmscwL6wONDl2R9nCeUICLruSGUYpaGTm8W85eUUtWQ
         AKTKJ+3czO+To9VDXxumm88dDFoo/BCqm95jxrBWKtZvLQ8ei6vMsMdGrKf6cymCd68L
         UtjA==
X-Gm-Message-State: AOAM530tjN9lgg2/96OIPEv7Mk5iLeHOuKro8ENsst4Jk/lGsRQ8zouz
	9kWuhnm0VT/GzJ/cOxJMlgSpQzLmILuX4Q==
X-Google-Smtp-Source: 
 ABdhPJwHbuUTV7g5Jnt/N+mHOCYcF81hXCCDd1NCfo2+9EV1xdfvUCes6d2eITNIY5zOc74JvO1FEw==
X-Received: by 2002:a5d:648f:: with SMTP id
 o15mr25621291wri.381.1638602019283;
        Fri, 03 Dec 2021 23:13:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/26] piglit: submit patches upstream
Date: Sat,  4 Dec 2021 08:13:15 +0100
Message-Id: <20211204071323.2480163-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159165

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Add-a-missing-include-for-htobe32-definition.patch     | 2 +-
 ...0001-framework-profile.py-make-test-lists-reproducible.patch | 2 +-
 ...1-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch | 2 +-
 .../piglit/0001-serializer.py-make-.gz-files-reproducible.patch | 2 +-
 ...1-tests-shader.py-sort-the-file-list-before-working-on.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
index caa48e088d..7b0cb17925 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 1 Nov 2020 20:08:49 +0000
 Subject: [PATCH] Add a missing include for htobe32 definition
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/609]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c | 2 ++
diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
index cc9482c047..c90f601cfa 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] framework/profile.py: make test lists reproducible
 These are created with os.walk, which yields different
 order depending on where it's run.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  framework/profile.py | 6 +++++-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
index 8704f98500..cb675e8d99 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 1/2] generated_tests/gen_tcs/tes_input_tests.py: do not
 
 This helps reproducibility.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  generated_tests/gen_tcs_input_tests.py | 2 +-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
index 2efba6f866..a1db2987ac 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] serializer.py: make .gz files reproducible
 .gz format contains mtime of the compressed data, and
 SOURCE_DATE_EPOCH is the standard way to make it reproducuble.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  tests/serializer.py | 5 ++++-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
index 8321be8490..dee876bcbe 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] tests/shader.py: sort the file list before working on it
 
 This allows later xml output to be reproducible.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  tests/shader.py | 4 +++-
-- 
2.20.1



Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66657C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:29:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.45808.1722439747055413418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BDZqxbep;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso33186625e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439745; x=1723044545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dp+Sac21wVgKeyQaZgxJHvcbzAiY8v0pzh7luPHt90=;
        b=BDZqxbepqnMYEduLXyoaA+2QEIjmat084pY6KosWnDJlFJIwuK2X8eexjGfVa1ueeu
         T0jRvsW5h5VmU8WuMvhv1TV7SSmdVhoauuvdeEsGJ8kKSSfj0x46H7EdFUXe74F4KX2w
         kZ2ywqe9aM3BC7A0VnPH0OjBvWya5M8l8JJpw6vUPDZ2dqR0lztzuWSnPJO30dg3gcVQ
         tBr9QUD5LERNaUin/D93In62k3eoQMAQYJ32PrQYrQQ1+wfcObRhzPLRY/PpaEYljFAV
         2T7x0cF+hYuiUfDKOsEEa03kGTZMkw62eeoq2qzhDicSNkx/G2Y+oTceavFgEG3WfVGK
         XMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439745; x=1723044545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dp+Sac21wVgKeyQaZgxJHvcbzAiY8v0pzh7luPHt90=;
        b=O3fztq0ebgJRxRTBQEUqpPKuKPmX4j/IjPytn5qFc6vNRajNXS/FNVQJiu9N+c1MQl
         jOeHeJe1qGBUI/0+Uz205ddcXIbqc7w4f/bjJEkOR/xO/8yPXUmELz9RpkbIaLIMrAq8
         U3Jk3ABmYzZnO4VXPriqQKPBKQphMNV5ButLHS5zn/xDm58aBHROOiGnoQgItlx5WzCF
         TUVJpBYWFtt6sW8enloWzElz7YGag1GRAVTKqDVsapE5Pfa0Ygu7sp+Jxzc/Pb9QoqEj
         SCcPAJgHepHUD/jsUnUZvcwnQt7ENnVBe9AHYCCsvUqarfzHmv+wKqA0prkzYUkuPf5b
         f0sA==
X-Gm-Message-State: AOJu0YwIt3xqrKdqnHcKKEdjB682jtXodqJ5Nsw/XC56Nf/mlpjW3356
	Bzr71Zaad1yh2qppYQ1A1HphK7hI2IaXcKmYci/QjmzUJJvxkv6vDjk/OQ==
X-Google-Smtp-Source: AGHT+IGJG+hWB6IfgL4w6rECQJsIoxQj1NrhqDTRJle1y3RHFzj5uyUtAvy0cVeHfSfF1s3h7RN8HQ==
X-Received: by 2002:adf:e808:0:b0:367:947a:a491 with SMTP id ffacd0b85a97d-36b5d0d0e60mr9044015f8f.26.1722439744562;
        Wed, 31 Jul 2024 08:29:04 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36b368638fbsm17154647f8f.103.2024.07.31.08.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:29:03 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH v2 1/2] appstream: refresh patch
Date: Wed, 31 Jul 2024 11:28:57 -0400
Message-Id: <20240731152858.3340807-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 15:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202713

From: Marc Ferland <marc.ferland@sonatest.com>

Refresh patch for 1.0.3 release.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index bc811d67b0..d4d5517ab1 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From fe9ebb8c0fa7b84a9c5c667386b8fbb3baea2fad Mon Sep 17 00:00:00 2001
+From 03f00252c2fc948c0bce1fc0a6ee87adef71d1bb Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fa171d5..79d5168 100644
+index 5f2eaa22..4a2483a1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -185,10 +185,10 @@ endif
+@@ -191,10 +191,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
-- 
2.34.1



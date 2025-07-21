Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC08AC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:58:54 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.46588.1753117127812555549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 09:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Arj3tyM6;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so4410631b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753117127; x=1753721927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjxMVR+UUfSCbY4t2EOv6aP3z6f8ylL48MmQkqx26zk=;
        b=Arj3tyM6w7tAim87zJBe9srjVqzLlutAd3h3j2TxvEL5htkz23JipkjtyRzMCD1N/O
         0gtQgy0brJ78WcRu0Y79jJ13CeXmo0IGhWfgenLjOM1k5X3JcQAHhRdxUybE0kjEv9lm
         49X9JQAGibL7S2XsEUzMYjmCg500gFyIvKCFSf6bI0Y5h6hEJ5sp5xAF+5O3HybcDvJm
         jJpNgBs6S33ovhUBtyZVbgP3ClXqOpUwU6pfHsl46Ox32gMWj5Foh8fWPkLn7ALTCTMs
         MJ2TsJuC/2tdv8kfWUI74ztp4ItRNcOZ9j4p7CAMzwfo3EeF7GkKoxb8vSGH/GOtsmkt
         2TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753117127; x=1753721927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjxMVR+UUfSCbY4t2EOv6aP3z6f8ylL48MmQkqx26zk=;
        b=m++231F6Jju9+iLV906s75oC9h78GCUHHiHAkE/Yv9H+FfDtseHUN+oM+ZvirqLKUI
         AX9seSI44k6GMfvF7lsVbkT3ecN72VzCHvUwNnzv0sSpDdOujphg9ZdKHOOX+OOLugjE
         8YBKrFLOsmTJsZ2gJonvfHUk+GjrRzMcO4lM2Z663pbGSwjJOwSA5RA2b8MEQQyyQ1Xq
         0792awRrKYILLtRN2/wQr94v1WvJ2ihNTJgw8YrxLSM7mbyMfMYaF6mLXIyoOc9Bc+Oh
         z7UB/teXnZtRMbitjVMmsX3OUg9jms+r0JfomPRxaUx6a7UiHhFRZQoxePndLTJMVHin
         ftaA==
X-Gm-Message-State: AOJu0YwWPzpCo5AfhDkVe3Bif2dH6MN/ssFZKBA3GH7sKyp+H07MKIWN
	JAf7qt6Pe303ErbhnQAmiKvPt+VxiFGj8mAu33hDklQQ9y328fqQt5iCPnmpjXcJ8gw=
X-Gm-Gg: ASbGncvEvjRWSDoAr79nmSw1GU+RddLX7cvObPSSbFe/nhZCvzUrZOv1CqVlXYWGYV4
	FLYDX8dY+vq5GEQ+hj0ySkkGjlvOQg9iERkRxjFfdnG4YkNtbG+jIiZLyescEoQ3orr/UUYgh43
	RHjKPn1+jxqPtSgGTicg2vOHTC1dkEezlpE70krMI8qeeF7xpRbUrHcyziHyzWL+ygWB0vZSf5D
	uNbFtaqGg/xyAVPD57XO/L1zdJXCgHkJubvBTNcVqqdyYFHgtMBsYB+1MWoxUznJU5BBWKUfqs/
	DjE62XL5+z3p/4TwNXMJUCu0Fj86+y+PEF54ITfnAk/vbm+zeY5TOlBjD0oDIrmvrN9rDjOmXxI
	shWolIrQnll5waQ==
X-Google-Smtp-Source: AGHT+IHCAXjSswTm6IR74hE+0a0gd1FsJl9aQgGf1PfPZVqtnFjLaZd9RnV6nyG0C1mgxzv1d3yxAw==
X-Received: by 2002:a05:6a20:3d1c:b0:238:351a:f960 with SMTP id adf61e73a8af0-23d37d8fb7amr333435637.23.1753117126799;
        Mon, 21 Jul 2025 09:58:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::abef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62eb0sm5590460a12.6.2025.07.21.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:58:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v2] feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features
Date: Mon, 21 Jul 2025 09:58:44 -0700
Message-ID: <20250721165844.3092533-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 16:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220706

When crypto is not in tune features then add +nocryto to
-mcpu explicitly. This makes the behavior between clang
and gcc match. Currently -mcpu=cortex-a72 has different
behavior in clang and gcc in terms of what features are
considered default. Clang's philosophy to enable common
features but maximally, gcc on other hand takes minimal.
Clang therefore enables crypto with default set but gcc
does not. crypto is optional on cortext-a53 and cortex-a72
while, this is not as common but Broadcom SOCs in
raspberrypi3/4 have dropped crypto for cost reasons [1]
This results in illegal instruction traps [2] [3] when building
components e.g. chromium, qtwebengine, weston etc
with clang using -mcpu=cortex-a72 for rpi4 target.

Adding +nocrypto makes it behave like gcc does today. We
do have separate tune if crypto enabled cortex-a72 cores
are to be targeted (cortexa72-cryto) as DEFAULTTUNE

[1] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
[2] https://github.com/llvm/llvm-project/issues/85699
[3] https://github.com/llvm/llvm-project/issues/90365

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
---
v2: Move the change to feature-arm-crypto.inc

 meta/conf/machine/include/arm/feature-arm-crypto.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/conf/machine/include/arm/feature-arm-crypto.inc
index aade6ce08d5..8202de78e46 100644
--- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
+++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
@@ -2,4 +2,5 @@
 # armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
 
 TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
-TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+# See  https://github.com/llvm/llvm-project/issues/85699
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '+nocrypto', d)}"


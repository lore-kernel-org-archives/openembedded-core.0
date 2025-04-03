Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171E4C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 22:21:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8126.1743718877210933308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 15:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXDVT/AB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so13704675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743718875; x=1744323675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9T4N5+KbHUaAi+x6bvXDFumXWx2/Lvcv7VlVSy+oT7A=;
        b=FXDVT/AB5BEcMz58KRT7+0VcuxXyqx5eQvoKW4dZcj7yZhevUocKRrCkup9fT4vLBC
         cZ/xs/EIeSNTJTuTd0/09+/Yqdxh67QFNXmgexMkY7/VuvbbQ4H008xd/Ec7oqVwSVlh
         YJ1iMrnTwYNjyDul4KTAP5opwzZ4aFlSWdg9W4gE6l6x3g3XzUsMMUnJC0Y+Z11xGNQw
         BSOU2M8EE6hAzxl9ALPSkXLIYValtvNde3D1Q/4VLJ74Dg+ZF/1hqzy4TZIBAfMMuSI5
         Np++JqpR1im4jv4Z9bjpwGoUCa5zOBTwGuOzG2ypM8l0QQvMHDJjo7Cfqq4lzxc1UwaK
         Bqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743718875; x=1744323675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T4N5+KbHUaAi+x6bvXDFumXWx2/Lvcv7VlVSy+oT7A=;
        b=CGmEP7binwWmF6Ldjs8KEWUJdSBjfzpUEm8E7Uo+eCtb0FcWVB+F0zPuigxdcZYagh
         eqjnp8QAiFwB3MlYLOr7JbXsI1SnSflalEe1kqyA07Ya2OiloRcL7vRyNwWv+hNFNcDn
         qeG8gy7R4hJqMd9lwYd9S9eIRwsj6r+2jGa6ut1IE5VH0WtFvapfx311N2wD+koL2MPW
         M1FoVZdWncUXL3cg1uFCzHftjG1vvszx4kqrjmxwgoQDkMeHoEyatJ2/jBq7Ke5GO75d
         K9bFZ6ykpIRqQJdaJ2mj1hq0h6siNS8oo+snC4JTDJs9c+pG+4ng6K60gYQyIvPYkhqF
         b53A==
X-Gm-Message-State: AOJu0Yw68APCnqWx22y1xHFzHrt5NT7lXweISLrzhhbtpmTf2ncMJUjU
	tJN4qAWDd9peg7sfh+P6KcROvm1xODQZRExSmgm1VMI2z0QqV/b4j2cjiA==
X-Gm-Gg: ASbGnctUBfV/paBBztSmLwkOQvICGqjlwU4IQD0xn4TXujp2Qy0qJdodoZpKHKmH/h+
	6F7s6UycCk/aIUD4DNLn1Lwi7uGByeqh5WacMqyFamJRZfrxwH1YOsimpa6yXlD1ZVfs41FOD0r
	OP6vohjgqqH20+kAcrNHLTodYaeqgSe6bh9OQTSCWWEAPrZxuzhj/is4YY4Gl+6I8LUh9p+k4Gj
	R1he+242FU7ja3321q6ZnXTEjL79dnqc5mqaBbM7d6KM9hJuri4nb840/+uOz0qj4lo4DBmoZbx
	YPvzvL5DBiUMVTpFhdmVsqjKLwq9dkg+w4jq8YsWi3klYEZ87WmLnnMKcw4vJeX9I8WR9w==
X-Google-Smtp-Source: AGHT+IFOomR/anHRV6NE3hFevN7YdZsYKuwx8gSnxnEP98ZG5KZ9Vb3ERN2nYai54O6llfB6PSIPXQ==
X-Received: by 2002:a5d:5986:0:b0:391:466f:314e with SMTP id ffacd0b85a97d-39d0de17029mr389767f8f.16.1743718875003;
        Thu, 03 Apr 2025 15:21:15 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b46bbsm32436505e9.36.2025.04.03.15.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:21:14 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.80 -> 5.82
Date: Thu,  3 Apr 2025 22:21:00 +0000
Message-ID: <20250403222100.3761090-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 22:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214330

Changelog:

    Fix issue with handling BAP state transitions.
    Fix issue with handling D-Bus interface removal.
    Fix issue with handling MAP and supported features.
    Fix issue with handling SDP record for Phonebook Access Client.
    Fix issue with handling AVRCP PDU parameters length mismatch.
    Fix issue with handling AVRCP PDU for SetAbsoluteVolume.
    Fix issue with handling AVDTP bad media transport format.
    Fix issue with handling support for LL Privacy setting.

Full Changelog: https://github.com/bluez/bluez/compare/5.80...5.82

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../bluez5/bluez5/0001-bluez5-disable-aics-tests.patch        | 2 +-
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch         | 2 +-
 ...tests-add-a-target-for-building-tests-without-runnin.patch | 4 ++--
 .../bluez5/{bluez5_5.80.bb => bluez5_5.82.bb}                 | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.80.bb => bluez5_5.82.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
index e5ece59cec..4e8bd040e9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
@@ -1,4 +1,4 @@
-From 9958e88edf74509faf759099896b37477625913f Mon Sep 17 00:00:00 2001
+From 2140aa879c24dcc9dad7e733c77c1bb212fe1ddf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
 Date: Sun, 30 Mar 2025 02:20:24 +0000
 Subject: [PATCH] bluez5: disable aics tests
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 90c5ebdcc6..c421d84206 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From 0787e67bebbf8492b6c5f03ed816cf881edbea64 Mon Sep 17 00:00:00 2001
+From 8667217e9e7abf6ae50a1bd09dc9f7142a861211 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index ad04a46a36..5492509577 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From b6438d9e6cd5bdbca05b444ff6d955e5b70dbb2e Mon Sep 17 00:00:00 2001
+From 9d5141cecea46fb3d6f918b11705cf0b6c673bca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0821530..e7cefb5 100644
+index dc9a27e..949d7da 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -723,6 +723,9 @@ endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb b/meta/recipes-connectivity/bluez5/bluez5_5.82.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.80.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.82.bb
index b7bca4f12d..f8d73444e3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.82.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "a4d0bca3299691f06d5bd9773b854638204a51a5026c42b0ad7f1c6cf16b459a"
+SRC_URI[sha256sum] = "0739fa608a837967ee6d5572b43fb89946a938d1c6c26127158aaefd743a790b"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03535CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:51:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17333.1761216661730902310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jOm2jWbj;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4711b95226dso7165635e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216660; x=1761821460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcVrOLy1gbHvzk36fuxeY+2Y0FIYQozaBCPihUfci6c=;
        b=jOm2jWbjXmn2znb/mSFGXMrLOYaJx8iSXRMEJdD25BBHdHABWQSoGVU0dXWK7DT9u4
         pTNaQIVPHuKWRiovLuu/iJ42gbxMG3MR/O1+G5h3JUD9VIYYW/5xEByUyYbfllc82Fc5
         CnwBGsPR5gHktNXrdJ7dWxRyT7oPVMxJeprSMGdYP2ClHdIPlA2zj9Tim3lC6E8uodJJ
         MQam50Lymlnz8F8L9nkDwZoOg8n1tY4pb+ZAc6J71/7NAjwEKcVYLp4ABf6nr1V7iMLz
         FTAx+yozTzdESi9FO4gfYgK34wFNWU6nGlDxzpnJMJShKQJh3Z1xvRG0hhDCFY797HxF
         ZyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216660; x=1761821460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcVrOLy1gbHvzk36fuxeY+2Y0FIYQozaBCPihUfci6c=;
        b=kuxREWCbadhGC8Z+2ZxVY/Yvq88mzjRewMo3ayuTrPmaKJyXf7z35kA2gwKgbJlMol
         F6V574TlV44MFAhrXZZtJfod4URc8aS+zoovUA3bQGnBE6KvwZeedFdESSMXzyIYAKBi
         8pBc+JIN1sUy16LxsSbh3E0S7FD9hBvFZWxi5RqiG01Y9B8ZAM0+fJ70IYK71fGeiRUV
         +buLw2EdLDUIicg75I8SHQ5Ip/NlqbSAHQT6Ova7vyCoyCPGoPIYIRJVmwjNIFoM8Tkd
         kdeD6QOhAJC1hpBELxX82XarYZSrczcfrA6kWVQtmQZm/tO89yvy5VZ8xkomKY/hEx5l
         HfzQ==
X-Gm-Message-State: AOJu0YwcvU9Fn5t0L9zLFYjWRzaFZ2LOllH0q34YP8etaXq1K1Ehmm3+
	ZbN2rUViCyzrWPAIbBJ5K+M+XlQ0lzQmHPLYhBt3yk0bi6W/tURFdMK7P9ch9g==
X-Gm-Gg: ASbGncvxdTzNmJNhaEaDdOifMmnjE4/bHH13W++A9+mmynVLlU2lIp9M6xQfPwsyCuc
	OjVG5I9pH6WIpL4IYGZA/HQXcwTaowFAZ64i3q3L7A2DUFMVIP2rXxeh/lm47LfMVskdC0I/IOb
	AYZOa5GeLR8ZCz8rXWTqPB6FxD0PmJ69CFE7V96UQyEBzsVdrMbxc5DSlrtd0gRjwxE72MwAJDE
	Hy6kcZBsYKBGZJS2+yiRS5kDyfkva99j22mnov9PIAXsvdbjAS+mNC7RJPaefwSkZZz3hwzwEnD
	hJBEeDOo2uD/Wmvwt8etT64HxpuwLWhYgnJtDlArX8Bv2idx6rvKboyR1j4M1vp8UBHw0I8fHTw
	fSWZ2rzhstKycExUlYFIk+xLD3O0iJpvEuO2vBg+olSeIfn5Nv0v38dWHVeif+MHnPPMDJRXWMq
	u85HeL/uC6
X-Google-Smtp-Source: AGHT+IHjcOAZXXQyIw+J1Jvv9RPTEEBRkfJ3hmWn8/Y0t6/3p4w9aFD2+fyaTbTO5Wr4nIhbcl8NJA==
X-Received: by 2002:a05:600d:6357:b0:46e:3d41:5fe7 with SMTP id 5b1f17b1804b1-47160986ed2mr98490445e9.29.1761216659620;
        Thu, 23 Oct 2025 03:50:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342860sm89590155e9.11.2025.10.23.03.50.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:50:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] openssl: extend check_cwm test timeout
Date: Thu, 23 Oct 2025 12:50:58 +0200
Message-ID: <20251023105058.4187144-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 10:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225231

Fixes [YOCTO 14649]

The default 3s test execution timeout isn't always enough for the check_cwm test
on the autobuilder in case there is a high load on the host machine,
and due to this this case fails sometimes.

This patch doubles the timeout for this testcase to 6 seconds to allow enough
time for execution even if there is high CPU usage by other processes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: change Upstream-Status to include issue url
v1: https://lists.openembedded.org/g/openembedded-core/message/225228

 .../0001-extend-check_cwm-test-timeout.patch  | 32 +++++++++++++++++++
 .../openssl/openssl_3.5.4.bb                  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
new file mode 100644
index 0000000000..d02d42f1b5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -0,0 +1,32 @@
+From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 23 Oct 2025 11:24:36 +0200
+Subject: [PATCH] extend check_cwm test timeout
+
+The default, 3s long test timeout isn't always enough for this
+particular test in case there is a high load on the host machine
+(assuming it is running in qemu). Extend the default timeout to 6s
+for the check_cwm test to avoid timeouts.
+
+Upstream-Status: Inappropriate [upstream issue: https://github.com/openssl/openssl/issues/28983]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/radix/main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/test/radix/main.c b/test/radix/main.c
+index 4a1e886a71..39f8c61ef9 100644
+--- a/test/radix/main.c
++++ b/test/radix/main.c
+@@ -25,6 +25,11 @@ static int test_script(int idx)
+     int testresult;
+     TERP_CONFIG cfg = {0};
+ 
++    // check_cwm test sometimes times out, the default 3000ms is
++    // not enough if the test execution starves for CPU
++    if (!strncmp("check_cwm", script_info->name, strlen("check_cwm")))
++        cfg.max_execution_time = ossl_ms2time(6000);
++
+     if (!TEST_true(bindings_process_init(0, 0)))
+         return 0;
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index c222b1533b..e760baf3a0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://0001-extend-check_cwm-test-timeout.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \


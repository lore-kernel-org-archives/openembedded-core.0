Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4932DCCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:52:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7084.1761403936886974014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3kjLAzu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47103b6058fso22440765e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761403935; x=1762008735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BanQgkUjtZ5Po5Bs8zj7tcGQFSNhT3wYJw8aHaHC/o=;
        b=O3kjLAzuGoz4T4Ct9M/Yz1PF7IJEk87zvf2O17SGbEwIwQzEWswryv/c8Jkc/WpBP4
         see2DOL24dLf2bHciJjUTpUu1LMpw3jscgxK8Z0DTk1wUy+wj7nZsNyxlW69UhpaGXM8
         J9DuQpICEQvsENbAcGxDyqGQvtPF3QJAyjWFv30sa4KP1D+rRx1E6MB3FKPRD40f14cN
         kp7fmWJSSwtnjlW4RS84xv8YIrqM14EL1HVANrToIKuZ0sHt2tsUrrh/gN0Wg2EKbNb7
         DAGkb93r49cQn8H7blk+yzPIFCD7eCONpyqIr9q8Nua5qVd+9GTzLrXBgOs5Cf0DEP/R
         o5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761403935; x=1762008735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BanQgkUjtZ5Po5Bs8zj7tcGQFSNhT3wYJw8aHaHC/o=;
        b=oQY9Yszg7RMbAH3cvkKg2lD5ER+OAAiU1i7kd1gEaKiXlF0008XPRe7/IrsZqdHoq2
         YNYks8OUUW3OHTz9Mxc8hXQJDrd8PLukfcDhRWrBtM2pkSavs79yMmsiIuoyVPU208bZ
         JFxWa40fEoB89m/y63dUod/ea/8mlK0K4KmUQaTMlC7ORmuoiUAAiehm/WkHouJSCVrr
         iciJw5wN1dhMCg4ksBNebRspFK0NMBrOmaIfn3pZLqFzwnRqNmgJq4+X+eRD7pbclMAK
         kabLs4gW/b9eWrTuczexTpqhIQ2qKYd6HdHw8oKJ5bXAu95H0p1C3yL5IF7y1zjpxmEd
         uLLQ==
X-Gm-Message-State: AOJu0Yw664PsaWMVasng5YaJy7a7Q9MAOdznbnFi7i82exhCtJQw4Vbf
	8uUk6STpCjSz/OuYdUDlTouEp+c5BK+uH9++YTbroz4AUcaK084JUQpeaDCo9A==
X-Gm-Gg: ASbGncugahos0km2o84+LL3IZcNy0QsMPywQnGsgLUKcfZcKywhCBm1jWUw5oVALJlU
	m4nPJuTder1drlsAuYmvfSd5T17qLZFfs1uaDfew0Xrc2dW7MNbsm5oY9JDzczseHHbTuZgkXsj
	+lAbqDrS13kTnxBAVs6iDatvDKHDwKg0AlOHTmqn1qAnetOWg8A4t7+PqeOSaPBa6xzO7Ywsg/A
	WxhMklPrm3+nX6cY4MnUxO0sMp+wgT0yMMS7mPwEcCpdjDLQwuXxPYb2q1PF9u8B7nIRevDQxAm
	SUUuOnmf8KEP6KajdjJ5k0u6o8ld0fd/tBCBMb/LCZBk2O72EhzVzEZYd70v4iATj5Dz7tJEc9F
	ggFslZPDY5lhfdE6ntkOGPq2qgOHC1ezEHYfxkWGoqkdEfcWfenDCHbMAwEU7lt38UYzTh+bf6q
	QqvJHApQwQ
X-Google-Smtp-Source: AGHT+IFiVKp/6fCVHx+Kqs6gG2rVkOZJ1bo9wnPq65a5eZWL2pWuRYJE20PizQZdI5ISJmSJqOYcTQ==
X-Received: by 2002:a05:600c:4451:b0:476:8ce0:a737 with SMTP id 5b1f17b1804b1-4768ce0a95dmr8553015e9.14.1761403934898;
        Sat, 25 Oct 2025 07:52:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4a36easm37359015e9.10.2025.10.25.07.52.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:52:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-perl/run-ptest: set exit code
Date: Sat, 25 Oct 2025 16:52:11 +0200
Message-ID: <20251025145211.1567510-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 14:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225309

Set exit code on the run-ptest script: though the logparser
looks for PASS/FAIL state, it can be still useful when running
the tests manually - when there is a lot of output, it is
easier to see the summary at the end if the test has actually
passed or failed without scrolling back.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/files/ptest-perl/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/files/ptest-perl/run-ptest b/meta/files/ptest-perl/run-ptest
index fd35357b42..51e467abe7 100644
--- a/meta/files/ptest-perl/run-ptest
+++ b/meta/files/ptest-perl/run-ptest
@@ -1,10 +1,12 @@
 #!/bin/sh
 
+result=0
 for case in `find t -type f -name '*.t'`; do
     perl -I . $case >$case.output 2>&1
     ret=$?
     cat $case.output
     if [ $ret -ne 0 ]; then
+        result=1
         echo "FAIL: ${case%.t}"
     elif grep -i 'SKIP' $case.output; then
         echo "SKIP: ${case%.t}"
@@ -14,3 +16,5 @@ for case in `find t -type f -name '*.t'`; do
 
     rm -f $case.output
 done
+
+exit $result


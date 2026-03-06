Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693BDF01814
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 08:41:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65349.1772786502354724004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 00:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=udZ3HWqe;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48336a6e932so56942635e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772786500; x=1773391300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khd0F+RPqsQllMbwMvZJI2Vrc1rrs/LkLO6LWJ6cFMo=;
        b=udZ3HWqejF++DtHB9yPw3onjJzT25kpWcL6lzPRIXcS48LEby4zBOUcEXy0QKjg8tD
         IYdGWSjesQuE1E1qZezoV+giTfJjA8Zw39nbEQ68OztNb60eoLHu2+9tkZVXkCraNXxn
         whlZyN+kLlvbHD/S05/9dlfkKNomkh6i+ZcwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786500; x=1773391300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Khd0F+RPqsQllMbwMvZJI2Vrc1rrs/LkLO6LWJ6cFMo=;
        b=VU4EbZeRbfwA/FnwIwjAJZtTeafYfZWAr5T35MTSaH3Sb0vLY8HAi2GCNp7YE/c78G
         CILp2mjRauLaB8qR1wSDaOTHih1YM3Edvtxs8Vw6wqnQJwY5wdWNA6mdOxad8JQ4KxN9
         eFP2oHV9LbmeEU8A90q7AmgoDCJMx7az+HUs6r0+LQzehB3S0G4a4HIZ1pQ6pQr3hmvv
         f0Ev2ZtImF818RiJ3r0CVX0R6MdibiCWh68pWrNPgxZa79cInsSCZc+6eF3etgw/dCqq
         1Fz8Saz6uVsfUv8qKStTqwZGrB9moDVCpXp9cE/4QiZRLxDvyWEnqrd5WmoJnYiN6QJA
         uIoQ==
X-Gm-Message-State: AOJu0Yw7x/j9nBal2CsFcH0SJFMXsur0L89ZHk7UnMWMgzNhbGWM+epP
	QvKRrcIcFq+o4Ldxtg1XX+evD14s/E9guM/6UXy8KhDr9lHueDkcA1EsWNFp/W/+5TXGbvrCzs9
	Mp/18
X-Gm-Gg: ATEYQzxTZnRK+sluLsa2FhZh4bxZH6DZQwYuzDxshiYDJp6AP9kbANvLNC7OgwXNHUW
	dF1UZWXbiI+7p9LEuQA6Gf+Hf2xlMsIxPEm6mO5ResLVLDYZI4uJWrqVxQCFKSQrkqnjF1TeFVZ
	LF1fv9h9uq2Bjy2hSdLlXG5txLbVjULXKYmVGX4JYqaYbHiMKdr6rW9XGNjEvJJoVjcgyGxnkpP
	I6qRQkjwXWFcVmewJPKmS9Ftkz8AtrsQhzGRctW8bPwJmcNkJQ1a83yiv+jjyuLEb+WlFr5dreR
	EWAPk0VUJtSwbNE0RysETQrculLEAUTDJTM7oLDAds0HlxxgzvJwRPUyqOaw6hPXMsC5cKDbHZ1
	uEG0LTcAy97woO7ldM1zAh1kK4SBznBMPnnA7rKu9kdR+9MBgeosccuM/UnAF3WwtaopjG1N6Jq
	CsDJxHbtZVC6SUzjKjCifrqlg94ymSbMQIImEJofxR31ZcfuZKZKI9MnaQX4bB/EIVf7F5+4cac
	z90ZLMAdbG8XVCAax2cfrcSR1sDPMCiwkmV6Lo=
X-Received: by 2002:a05:600c:46d1:b0:483:6de6:37ad with SMTP id 5b1f17b1804b1-48526979684mr19455585e9.34.1772786500505;
        Fri, 06 Mar 2026 00:41:40 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm190610255e9.9.2026.03.06.00.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:41:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] ptest-runner: Use git tag in SRC_URI
Date: Fri,  6 Mar 2026 09:40:44 +0100
Message-ID: <20260306084043.375192-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306084043.375192-2-yoann.congal@smile.fr>
References: <20260306084043.375192-2-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 08:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232558

From: Yoann Congal <yoann.congal@smile.fr>

Also, remove an extra line split.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
index d9ec0baf799..607fe4b5ff2 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-"
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https;tag=v${PV}"
 
 FILES:${PN} = "${bindir}/ptest-runner ${bindir}/ptest-runner-collect-system-data"
 


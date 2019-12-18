Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 386E97FB3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 08:42:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id w23so554685pjd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uU79ZyFgnfTE16fskDvluN7JzmuiCYIRBaSm87lzxPA=;
	b=Q/MvFYnh4raGnAPYYyZ4BGTZNxttHZzJjs8dgodlO5C2agtYuafBRaUuSwVWWl83aC
	MlrxhzrnX8mEQS1ElsQG4LlcFcInhxlzmHaACSjpWvqYhTBVNLvzzRAzVsF1cpg2zgCa
	dAWF2oWn8EhsAHo0uEK0AAYkZqFWH+i24B+5/UAkleSSCrnZ0Unp6aDQ1COwP69Zu9xx
	3AgQcseznSed7X/302EdkPkq2mZtEAOeU+dA4788sX1X494IyyGCFc/62qN6lIvkRuOn
	clGN8GH5HZt07tZjk/bdEGrM/FQUu8RBEKoePI5hYQYh3KZLn/a/ytY6lzTqpNfdDVUW
	cP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uU79ZyFgnfTE16fskDvluN7JzmuiCYIRBaSm87lzxPA=;
	b=SOOepX89BuzPUAcLcRxrCvI8tDtYyhzXM0i7vzNhC9ATYsB6chNri8WN5KqCgq1zXi
	RmFBWC3VxZf+1kl0E1xtJF0nQKj64aRvSM/iUfBWdhbOSKO74JhK+2VgB8hBXMw5NyoU
	hOUUTVZBLjIELZfxF6m+ComxuzTW1AzFI5mWdyloW0CtBXgIKb1NKyr7l8T8rWRolVot
	k0cY5+ktYK0Rdsu6ZnH2BZcVfGRJT0/2NFZLkpgLNAxBPHrFTZouqTkWlIoaprRN2MSv
	WekvhPS1CupjdTZZZbnq1Foj+Wz3WeITGhfcQl54Whg6WBmMssxjTV7DvvMJ4e3yaDhZ
	IOcw==
X-Gm-Message-State: APjAAAUT3e5ZXI9l6+VUdSvD4QTqquTL0bKeMSeEhXj7ZE7l5ZetUs9k
	7rEh9dAsmwvRNP7Qulfp3PnNvz3R
X-Google-Smtp-Source: APXvYqz5+rQMaXQ+Wjcne8NlVeVRAEPdiRtJc1ikADpJHfFEdGZ6tTPmHkipQQsdbjyytPH154K1zw==
X-Received: by 2002:a17:90a:804a:: with SMTP id
	e10mr1445082pjw.41.1576658575283; 
	Wed, 18 Dec 2019 00:42:55 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	a12sm1988889pga.11.2019.12.18.00.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 00:42:54 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 08:42:45 +0000
Message-Id: <1576658565-16680-3-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
References: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v2 3/3] u-boot: Move B from u-boot.inc to u-boot-common.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 08:42:54 -0000

Use the same value of B between u-boot, u-boot-fw-utils and u-boot-tools.
This patch also enable the out-of-tree builds of u-boot-fw-utils and
u-boot-tools actually.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0f9c41..48402e4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -21,3 +21,4 @@ SRC_URI = "git://git.denx.de/u-boot.git \
           "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 55d8b47..ec77762 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Universal Boot Loader for embedded devices"
 PROVIDES = "virtual/bootloader"
 
-B = "${WORKDIR}/build"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
-- 
2.7.4



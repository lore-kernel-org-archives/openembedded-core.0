Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id A869C7FDD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:27:19 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x8so1151685pgk.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VV5JStUB2G+sxtHaVFTO3fA8B0tvrGPDWEvaZudCeYQ=;
	b=XbCyUkRQGYmBt9F9Axt8n/3dbt+0JAwgUKn27qblo7p1mIgMY4Mhyyf24zJngr3VCY
	zOhspCP0crPFN2a/l4OI2tY09Fj01wEr0hax64PQZnCJJoA/X3IzuodVac5ZhwkFxII4
	HYVHYaZPf58cCzi6DaJ304KPNxXHCKEwH2DlvWi3XekgqLc7VzZiUQ/KppsfXujLsYHJ
	DPdB6MAz18wW/8YZwc6pE5W6aDRg2W6nYwhj2R61qQPEnQ4H+JMLmYRXNjH5ruXZY7DO
	cZzoRUGsSNsXYOa7flWR6br1uEbDKPSCIjF6ZeCer6VFBeIhAs4C3gm8xGrGJoiyO+9J
	9cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VV5JStUB2G+sxtHaVFTO3fA8B0tvrGPDWEvaZudCeYQ=;
	b=Le0ved0uB62wMLqigmXTbC0W9ETq3ADjNVrH7XcXlSgXMT94WNkcySy8NOYxtn6hkE
	E5/XAmYZ01mCKdWCZoscKTybwRCfvgDMRFxohwEpocVMpZH+djOTKvBwCuiFb2zEwXYu
	0Hm76pLrNw/obhCkI1WsxLOWL5x8y/TKb7f6dhMk2IgA08Dt9MNkp5n2Nk2W4ieOU0/V
	BC9KcVdOkJ5gPHoZdAAIqv5kyW8sxVZQrI45u8p85YomyA1ZgzovES2YwDCODNsUmBDk
	eIU3zJ5SpKBGvnGbjP5eTYmHwNY2nZoWoI5PpWq1MAPD+vapKV3w/5c1+t+R3kb5Vula
	9NoQ==
X-Gm-Message-State: APjAAAV4a/6UlmqIodG798D9/fwsgLhBr9jZ/DY4+R2CpHJhpdErEY4u
	g0haXrHdVw5vDCJxmsid7OrFFDWX
X-Google-Smtp-Source: APXvYqx1hfDDz+uHnn6wOejNsDcCAzNENIOpg6UMo4vSR1iYi2QQNqKc7X3s+3qBRpEbJ8/ZTknVfA==
X-Received: by 2002:a63:197:: with SMTP id 145mr3242391pgb.11.1579775240707;
	Thu, 23 Jan 2020 02:27:20 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	d14sm2155702pfq.117.2020.01.23.02.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2020 02:27:20 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:27:12 +0000
Message-Id: <1579775232-23446-2-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579775232-23446-1-git-send-email-yamane07ynct@gmail.com>
References: <1579775232-23446-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v4 2/2] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Thu, 23 Jan 2020 10:27:19 -0000

Use the same value of B between u-boot and u-boot-tools.
This patch also enable the out-of-tree builds of u-boot-tools actually.
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ce07055..edd0004 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,3 +18,5 @@ SRC_URI = "git://git.denx.de/u-boot.git \
           "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
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



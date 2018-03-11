Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2288F78916
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:08:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y186so3060552pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pbl6y1bCg8M79hllzKJ8sm+bfh7zXaKH+2dR2zVAMNI=;
	b=df+Bq8h1uz8xI2Zs6UGSryP0ZbRvhZ45v9l0ZzmEbch6kqz2Dob+mWRPCKqrnQnbCc
	+KXsiuAztwqjuYUb6P/I3y1GocUMzfCMhaVt5e3uur6MZchsf3+aotqUvxsXLnFjXyeF
	4elXRHxGwD2jCOQU0aV3+4CPI/tHVYhA4gN2nuMW/CQGGkgmtO03b2WGj/0/0WyAxy9Z
	gdceENiRQAr3ahwg9X09tPeDYHv19VlZJTMJQbZMuUTELkmPBIoR9AnKuHBVbCagT19S
	Dyt5RmYXqeIK6Y0h0TlJTuqCoZ7Gs8o4V3OIlvwmIvO3h0S7RwrA1R5p81QTNh/O1uTc
	LW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pbl6y1bCg8M79hllzKJ8sm+bfh7zXaKH+2dR2zVAMNI=;
	b=PF7/bxV5RT3JSBbzFFw0kee9xIYRLmZbMdFvqf2EGKUcwIRcEgHpdf9dCEJAeCJzwQ
	wAiMQN8dxCMgVgZ82f0W6cfhfgJa4ZqbsDgbhBCQuP2YUS7UGGvfFKSh6AJa/c9NFHoR
	kW85GBz8snp3DrAL5sM6V45YjhZzDSlrpSRW1o3Siz0arEuBnKBchKa/hUL8rpZX+8oB
	ZXSrDi/1QtUKI6On++aalBqq6yW1mIhpcYSRp90QAlbHVdeAuFpsWzMuOpbuquWHroDE
	GPxUODfShGMwmXpnY177jjupsQ6Zy8nbWyT8EJZVgKwW0ETqsLQE1GLJWXB4wUP11vYk
	6wGQ==
X-Gm-Message-State: AElRT7EPmz+Q241UstruLzVYrbtFQ62hi/CjaYDppEBZ2N5X3WwsqyiG
	2B4yX2sWCZoixspN9StdkLTPLA==
X-Google-Smtp-Source: AG47ELv3apE9ppl1A16eojNgaY5DNHnzJnXgsaXXhp3c1ay/rfqU2CKcTUVBghg7a+mMpYRWC2u6+g==
X-Received: by 10.99.120.197 with SMTP id t188mr3465247pgc.358.1520755692223; 
	Sun, 11 Mar 2018 00:08:12 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q6sm8968184pga.37.2018.03.11.00.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 00:08:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:07:58 -0800
Message-Id: <f11a8819446efb7e8f887af9d90f4bf41fb5bc4a.1520755515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520755515.git.raj.khem@gmail.com>
References: <cover.1520755515.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] risc-v: Pin oldest kernel to 4.15 for the new kid
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
X-List-Received-Date: Sun, 11 Mar 2018 08:08:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7007a6e9b6..93f57f3c9e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -423,6 +423,8 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
+OLDEST_KERNEL_riscv32 = "4.15"
+OLDEST_KERNEL_riscv64 = "4.15"
 
 # SDK_OLDEST_KERNEL can't be set using overrides since there are
 # none for the SDK architecture. Best to set it from a machine-sdk
-- 
2.16.2



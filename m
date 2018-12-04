Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A937E6C50C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 13:42:44 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v5so11959704lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 05:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C3p52DXiapL1t16vwyLlzpYfl8ESlT8v7QQrq2YFgT0=;
	b=bOgs0oTqNLQ9plPTF+38dA6FLeZW3zkt98Zh+Uz6wZa/sppWr3sSWvRrYpF37k+nUK
	jp7Nd717L4hWLMIVNC2RW3ZRA6Qle9GYSVE/TkK/duqZcyeYwjoLsftf7LO8ZF0hg6VG
	bI6OBzI6y8/RpEoJyCMtmqlYjhwSYTBB5Dx2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C3p52DXiapL1t16vwyLlzpYfl8ESlT8v7QQrq2YFgT0=;
	b=YaDhCbsN/8Ok/46YI0gSa10YYVE5lVltq/eqCGF/t5AQI0lcDqVHrBRcWuA+ZYicdT
	x7eOPthVmcqvx3rSn2hQKYvQzlbONHcPPMtfVreXamjqgG9PhVknP8rhU41sPib9e0Xj
	kmMKwafThQ8gcvyGkV0JvqpE7B0sm6vT9Iw133e0BMT2s2wSejKSlJ9r8r2OTxNREFGj
	lGKEEYFrbhzM2sR14eBk1HprdXeHmuyXamiH5hdVGGof2DjvvBYlvZH7Iw9gzUfrTbO6
	3fNpzHJjSWCFBQC9xFj2UMvczc9tvEe8o2iON7qjIXNs7n+CEaJVd5tCsNvgUQcvKaJ5
	/LFQ==
X-Gm-Message-State: AA+aEWYlkycFERooF3EBAlfGEkLdhgCVTTIaJYAxOT585zgzd1oCvUOv
	XxpMlB01dwOsoBYYaw1cicy9pXDu8rjmyw==
X-Google-Smtp-Source: AFSGD/U08oroOjKJFFFhS3M5QCo1E+Vcmse8aWJ0+0nlGdM7ZJysBpuigxTelI5YPfqNeCx1myLdGw==
X-Received: by 2002:a19:be16:: with SMTP id o22mr11502127lff.22.1543930964690; 
	Tue, 04 Dec 2018 05:42:44 -0800 (PST)
Received: from localhost (c-732171d5.07-21-73746f28.bbcust.telenor.se.
	[213.113.33.115]) by smtp.gmail.com with ESMTPSA id
	15-v6sm3428956lje.18.2018.12.04.05.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Dec 2018 05:42:43 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 14:42:33 +0100
Message-Id: <20181204134233.12495-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: add coreutils-native to the DEPENDS list
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
X-List-Received-Date: Tue, 04 Dec 2018 13:42:44 -0000
Content-Transfer-Encoding: 8bit

In newer kernels fold gets used, see output from a build:

.../kernel-source/scripts/atomic/atomic-tbl.sh:
   line 183: fold: command not found

Rework so that coreutils-native is in the DEPENDS list.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 880c5ef17283..8d83ca4843e3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native coreutils-native"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
-- 
2.19.2



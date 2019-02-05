Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 96B557C0F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:46 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id h3so861752pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w9TodV9k4PQU/B/m/IOCGr887+Vpn8DqLO1ZT0Tjpto=;
	b=FCsLYkTGmmmX94yx0N11TK0k6s9Fx3ktpKkJna83XT3XWs8RurNvcmbuLkPJEKGst5
	x+V/tzxinxzFke1KIODJilkbNh+9osx6x8waz1cUsNvfGpW7+PjwNUZsAhF7ULoZ4cQk
	T0EkER9gKHQfD909LZbIY/hkDF31xCPYoOI/bcHRYPuBewYYXJgDRb4wKkR6u534JEQk
	2WQ8QK7vFbSUK1yk+cBGgPrwBWIegLrpMmEugYsyP0hXrOlwDf2rJerZMf92nSrHnWvP
	hz1dg+Lz8pP2yEh2qgp6gaHbdM54duH63vyFg4b6sIwTr0veJh5eCDIp8Wb+8BAL+kbB
	Ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w9TodV9k4PQU/B/m/IOCGr887+Vpn8DqLO1ZT0Tjpto=;
	b=UsxZDN9QS8AaPPJ8dJ6Xtrm04sTVk+X1XkQg4oUA+JBrcHyAZ80abr23aqj3YLrQYk
	fgKs0mzgE+nAg0h3MCJYGhWQhge6ETO88AXE2VHKAl3sMrXjndM4TEhdtlsGoAb8b0L1
	FZhNoWqBYmrYiArLDoBPgIjVMKn5M1o+4kCBO6Se5rKa0s0whCWttYK0uVtLON53cL2O
	DUl29x77ap2bQXRBeaXoA++eA4JoktxZNTILAFXIN81OB5W8apOo28dA/lk7U9LEZSRc
	m6mcL37oqCePEd/SOXab1ZBcvuURR2dHYR62EKDQr65Z8hFqlhgYhd00vHnW935fDA+X
	LyaQ==
X-Gm-Message-State: AHQUAuaSJGbdJ4tagLuQj76S3H+RgVKbV1V31Yg5kPHuYBNi5lKb09qD
	f1IlSzvwdTCK905ImIb9oSy8bzjO
X-Google-Smtp-Source: AHgI3IZwhcBTVjaJrMR6QecxAgU/SxHIO2dykFjw+dMwejI72gMT4eqfqCQpXFN2mFQ3WIOLbsRHfA==
X-Received: by 2002:a63:da45:: with SMTP id l5mr2455443pgj.111.1549335467331; 
	Mon, 04 Feb 2019 18:57:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:26 -0800
Message-Id: <20190205025727.1937-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] tune-cortexa53: add tunes for ARM Cortex-A53
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
X-List-Received-Date: Tue, 05 Feb 2019 02:57:46 -0000
Content-Transfer-Encoding: 8bit

From: ayaka <ayaka@soulik.info>

It looks that the Cryptography engine is mandatory in this
platform.

https://developer.arm.com/products/processors/cortex-a/cortex-a53

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa53.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
new file mode 100644
index 0000000000..a9d9cdd1f5
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "cortexa53"
+
+TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa53 cortexa53-crypto"
+ARMPKGARCH_tune-cortexa53             = "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
+TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 simd crc"
+TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 simd crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
-- 
2.20.1



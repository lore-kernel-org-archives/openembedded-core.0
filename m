Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 910887C0C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c123so864384pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7LpKoklZpvamEUVSIX54lVQc9fSDKna37w7gsiE97Ak=;
	b=CbQ55C+DHpqhyNbSNtRZE3Dn+Ys3+SpEQFZbj1rGXJ/kMCLdYOP+ZbAIqgQWUiCkJH
	3CvkNbjj5o1PX/n+so4BlkdDsJo/FYuCvhHDtOKcacL1xXQBY02ZzdGloAj/YM/4JeEW
	F+wkoV/eOHBSl2TX9K3MZ4yUwr6LGItzfQsXopFXRTz7qTGTirsNHP4OUk7q/tubp4Sb
	cxMPIGmolwYBu68QCuhuFro4vn8Hq/SISSClHikL71M7cmRWh3k2/0P9Vjdf2Tv3OkmO
	MTkgS5UoSnGL0boHUDBdIFkCoFUxZd9OF9N3UZS8JM/8g0Pnwxv0irFO72WCMaw0udsC
	EzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7LpKoklZpvamEUVSIX54lVQc9fSDKna37w7gsiE97Ak=;
	b=Oyz4YaMKj8j0u2hAV5nLvGYQ8160QFlm1Ua3Q5myPinVRhLFfcROkDLKAL1xolsmpK
	cUU/o7gIDlPF/0qb53RQlIBWeWfBGX3zzGcWAEl1+NDeV2ulm2XXum15eky/GvREfmq3
	RNKN8eYmTdorr1A9LPjSD8a3O2DEka/P7VG2DE8dx3jxsX1lM4+3Yf+GeBlfiSQ36fPH
	bFYAl9mWpUFoPet9a4UnMcR6UCbXQBFhGTNZJDSlFT5LnV1gBRq8sIC4s4Y5zqxSQNIi
	cJYvhXjoX7/KtqqnZRQPUEEsKr3ZSDIrazN2azkpQVTU5sfImsPxCU8mJuqMFoaGgCFE
	uhrQ==
X-Gm-Message-State: AHQUAuZ/H2b2eiYcVhPgdiUaU+LIGra8EKiIhfwKS7bLhPt1ylT0Ckpm
	x2beFHyb1NLyYQlvM6sc/4OgKbny
X-Google-Smtp-Source: AHgI3IZe90MCxr20g0zvx6D/J0zNSyjNuoXpeLS1W/3o1RsnfbLoVhf3l3pIF8vmsxIxlNjJi1WmVg==
X-Received: by 2002:a63:4f20:: with SMTP id d32mr2427610pgb.47.1549335462096; 
	Mon, 04 Feb 2019 18:57:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:22 -0800
Message-Id: <20190205025727.1937-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Tue, 05 Feb 2019 02:57:41 -0000
Content-Transfer-Encoding: 8bit

From: ayaka <ayaka@soulik.info>

There are some addtional instructions apart from bare armv8,
also there is armv8.1, armv8.2.

Most the processor would support crc, except X-gene 1.

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
deleted file mode 100644
index 5e832fae6d..0000000000
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ /dev/null
@@ -1 +0,0 @@
-require conf/machine/include/arm/arch-arm64.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000000..323d0d7f0f
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,28 @@
+DEFAULTTUNE ?= "armv8a-crc"
+
+TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
+TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
+TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
+TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
+ARMPKGARCH_tune-armv8a                    ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
+TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
+TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
+TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
+TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
-- 
2.20.1



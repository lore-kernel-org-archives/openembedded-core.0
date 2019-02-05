Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF83A7C0D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:44 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id d9so813606pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QrkjdaVzP6UiJeYhTlyLgM7CdMk/5oonLsfYdSlohyM=;
	b=dSEUxU6VuGOseQQXJLiR4USJH4ga4lgpoBZXUd0CFePXgpgtpV4cCnz4oCgmegxAyd
	e9aN0YeytOYVzOj2PvpJuTlySLtarxHQYwSLdqDsYUWoW9tm1hj2cjAkSkkBJ3BoplVM
	VwLaLupZOzwWNZBMAHofYZajGf+Saw73Eb/feZdxeH72pZx47pUGlDZQBNr7dKqAhn7x
	GRI4p5hhPhluzX8S+jodlKPAXvFW3QrXuKkIZlKHHyuF3PR4d5kwQDHLZj/GmoA9OWWY
	h0E14E+MWrdjfAE4QVzqDh5POFrN7t8hcmtOteOSv1purj6KvDy9zO+9ATCBWFGb2HxZ
	+Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QrkjdaVzP6UiJeYhTlyLgM7CdMk/5oonLsfYdSlohyM=;
	b=ikGUm8jPdjQ+g0WTqL/w1PXwwmXVJxP5rHqAOnTbvwRQSlKR0wzURa56DBLLecz0af
	U90EOAuPEjHm0jzAxY5m7OsT8C0btp7xxv0xwdmDzTWI7HY+kdpNScBLcxpm7hzoDJgK
	ZLUN1UwP46xUEOMENhIJmppq1yOiuFGaEIGVzBEdbDbxGPUyc7X5iJJKdtjZWEDcvDEn
	4kZStYhsNDrXDaq63C3u6iGONgt+5pqstnsqdKPqK9BCvjWEuS4pi8t4kTvuY9tbOP53
	H+Qe+4y0qdjvrjUdM8ozbz460EcUkURmD2M/niNfqXGDlahxu6jpwQHxr++HhP7/dh4s
	E3og==
X-Gm-Message-State: AHQUAuZnW/lqoZqgtzUl0GCkFcDHT9etzcpgG5DcBDkT81ddzvBP/h78
	5opwb2rvU/4mnOFpz4OWsMvL70zQ
X-Google-Smtp-Source: AHgI3IZX+ruLNIbIK5ER6SBpKQWVG+DZoeLWqTT6nV535w0Q52C1Aj6EwEfcGJVcI6xVxRoU/hT5EA==
X-Received: by 2002:a63:4c07:: with SMTP id z7mr2469691pga.319.1549335465594; 
	Mon, 04 Feb 2019 18:57:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:24 -0800
Message-Id: <20190205025727.1937-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] tune-cortexa32: add tunes for ARM Cortex-A32
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

https://developer.arm.com/products/processors/cortex-a/cortex-a32

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa32.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa32.inc

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
new file mode 100644
index 0000000000..b66ff55e9a
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -0,0 +1,16 @@
+DEFAULTTUNE ?= "cortexa32"
+
+
+TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa32 cortexa32-crypto"
+ARMPKGARCH_tune-cortexa32             = "cortexa32"
+ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "aarch64 cortexa32 simd crc"
+TUNE_FEATURES_tune-cortexa32-crypto   = "aarch64 cortexa32 simd crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-- 
2.20.1



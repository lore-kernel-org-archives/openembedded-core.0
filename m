Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8207C0F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id e5so864703plb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/4Ddcm0AIVu73Qtr7sFAFphMnj+EQ8e/gxpRHdj72Vg=;
	b=NRJjCXykAoOf4phyAMLkZd8e6TAT08ITHiy/WTAz6T5T1eaCwPSnRWu7kGorOOVn02
	w5oxBiatfdYMrr7DAOBmrYRxXJR/T5Rk5AH6DQySaNVBdEQwfgnYoO+ei2PVeu9z+E9p
	rENPvheXS3CXQbr3prXrafgsXa7TggI1B9MsqxSDVNSOJdH61jd3jCzH80tOv57Oi91C
	D3O8J0agfsesZY9XUG9k6tQ5Yg9DXiFfl4O8isSw1zTVcy9Ok7C5BcFqJ10p09Q/MBQ6
	RqIeILXxu4/ZQpyfq4tujA0Mw5Iavcd7PzUOsnZtH0XfBXhr/9SaJw+RnviYs20Rwu6o
	KNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/4Ddcm0AIVu73Qtr7sFAFphMnj+EQ8e/gxpRHdj72Vg=;
	b=Sy3xBTRnuCcPTGgQaRzpODpNwDbjX+/2Wwl3YyqrPS3DnveZ9SyBnaibjTuVQMTAnO
	CpC87hDm7mHZofrKXAskQ+yg+m97c8k/A/uXz20YZ0AEB/hL+9Zuc0r6ZTATiGj7VTD9
	CruNmUNcREqXzgxoCgfLwbfmicUxDPffgjxivE0ejswvW9JWHS3Ip4gifAtnzcIywnOp
	ALuM9idmzNEyRE9MhTJpAlY2kJOX6rZJq/gV7V4QrxuM1+2743iMw7Xiowg9W12wiYVE
	Kb8Vyyje/FtoCqyo4Gu4ub9PRDvY3Kkc+nXAEdJQWCXPy+9K8/+oqxmBJ5w8bARPkM8j
	BWaQ==
X-Gm-Message-State: AHQUAuYm6biqcpeqiz4qDDhVby8H/yHyHikcTJwvFWMpkGEwHiecdCeS
	8JeYmGydJmgPs4ZVPPkvihpYSYjz
X-Google-Smtp-Source: AHgI3IaGzOz39VbKwODZtPAgH6HrccX8Km/kXBt9F+NP6DdHRzjrBYXPICrSCobABwyAVKwWWr+9lA==
X-Received: by 2002:a17:902:bcc7:: with SMTP id
	o7mr2760169pls.281.1549335469113; 
	Mon, 04 Feb 2019 18:57:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:27 -0800
Message-Id: <20190205025727.1937-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] tune-cortexa72: add tunes for ARM Cortex-A72
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
X-List-Received-Date: Tue, 05 Feb 2019 02:57:48 -0000
Content-Transfer-Encoding: 8bit

From: ayaka <ayaka@soulik.info>

It looks that the Cryptography engine is mandatory in this
platform.

https://developer.arm.com/products/processors/cortex-a/cortex-a72

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72.inc

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
new file mode 100644
index 0000000000..f5a524fa04
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -0,0 +1,12 @@
+DEFAULTTUNE ?= "cortexa72"
+
+TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa72"
+ARMPKGARCH_tune-cortexa72             = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 simd crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-- 
2.20.1



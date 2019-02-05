Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 103A07C0F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g189so803407pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0+Lur00Wt98GhZd1N81u+ubEOSKR8tIu6EMhBW9xGks=;
	b=vYuR9jsElCe+0WLvlGsdoq2iZ+TyfoIHe4ANKfoGbNXXa23J7Q6viFFJmaHJ3tJr9m
	z3XJAm2eS7iWwDHUrmg/DMqo6mS+8qNIh7yccvdfpaJ8WlKjepzXOWpAOIrkn651en5z
	BfXCTVeky3S6p9XNJm01WqWjFnJ02Atp6hUfNjIVo4xNYjMeUkmaJwd9+fqpg6r8zmSM
	tpywUm1UFUOvMaASEyU8L5KxY88XVk3owZ0Oww8X+jhgf7Z9C8ZEA1sEkphKX8VlpKEU
	IyrvvpC8Z5+kBsVUl2czIbX6TvzV5zGBCL5x/yFi9+j8427BmvkZjqJQPL9fn5aT3qLs
	xqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0+Lur00Wt98GhZd1N81u+ubEOSKR8tIu6EMhBW9xGks=;
	b=n3uTszye5CBPiAC0SJ5kTxFQj4Xwqbcds1eupw8lb+enZ/kYEmyoX/YrzkSvweu/va
	uBImGptxVIka86xUHXseuuDiot20KGSHSiG5GWqojgeMe4TJZVHJ51asThqrQiK1tR8h
	kWdpO7dRJBDcSGEkwLq28+g6/OZ0VB2bC8/BMAVjrXeM+NpGAwOh/huRlSluohwBW57e
	tqetCtabvcOvW5GP4sI6yPQo5xKvewBQdVHlbtOuN9biazfl47XpzSOuW0ikxxW8VqYM
	kEdRqqSf/U5BgkBXItMIphEFxfIdJesFnNtc0lfnb8KZRqMcQiSv7969o/KL9i1EWFBd
	PNdw==
X-Gm-Message-State: AHQUAubJ5BRY381SCPF190fPZYhImbGo5cZlGaaovpuFe03RZxX3xTJb
	tZCEq7jXicAlNexkx+pHSBoVXUfk
X-Google-Smtp-Source: AHgI3IbmcDCptJQaLDsEf1FJBWqHKF4MTjJpuc2b3xJWNUrELPNPuFEFRXvKXJ9AfW7KWnUoIQqfJA==
X-Received: by 2002:a63:d005:: with SMTP id z5mr2474585pgf.64.1549335466381;
	Mon, 04 Feb 2019 18:57:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:25 -0800
Message-Id: <20190205025727.1937-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] tune-cortexa35: add tunes for ARM Cortex-A35
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

https://developer.arm.com/products/processors/cortex-a/cortex-a35

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa35.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa35.inc

diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
new file mode 100644
index 0000000000..4cf00844e8
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "cortexa35"
+
+TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa35 cortexa35-crypto"
+ARMPKGARCH_tune-cortexa35             = "cortexa35"
+ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
+TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa53 simd crc"
+TUNE_FEATURES_tune-cortexa35-crypto   = "aarch64 cortexa35 simd crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
-- 
2.20.1



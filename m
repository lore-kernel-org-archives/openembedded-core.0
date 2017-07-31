Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D41F785D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:16:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so31665784pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h1f9ba7vNBEXeQBeOx3+dNSylUED2g88xY5LhJM5Cdw=;
	b=YvoN94sw37AFQSdxaFnkZ8wSYnGtSrYMd0qchof2hEmsC07mIezzrmHH4XpDkdVPdz
	b7V/F7ngk6FwCTeGPqsDjIVCxgDeQ22M4xUlKDqTlwr52g8IZIMstu0LhAW20NI/Y5x5
	NgPx4XBBRsXpd8CM1tVWk3pLlKzC67wuP7z6D6DpYNYaX+zTs0XC/EenbP75MnGoFwNG
	5+iZAO8IdHSnUfYSX3jIb6AbXOc+ZhMTs0ZsBFMAC8x7rwYd1jHrgwIs9qCjuuNWpeaF
	kggYTPUJ0IWw1chv5i24tR0IbDhAZbAcmVXOkHue5J4iFwOO028kBO3IDL3o+Ve5UZfI
	By3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h1f9ba7vNBEXeQBeOx3+dNSylUED2g88xY5LhJM5Cdw=;
	b=GQMe22vrO0irreRoMq9YuYTbADzB7c4t9/A+0PJ7YXYpVa7L+fgYNWUGuROR2GGAnX
	mX3PQ4tEyGKJliVTe7buieD+Ofr9Zx4YlQJmfZxzLmAWukmdD2XNNkopN/z43GNeVyBG
	Mnt4poD3wpEmdbK/J3nAifoUqA42MU8GhZVGp0S4ZJPXoWtMwaH3kCx1X56+iurXCklX
	Ys+dUKIqT+qPYWQoPfN5xf3y9upgb1B+rekyaPNPo3yPEs1hLFBKMySgL9wL29V58wtm
	EtvKLygZM3bSyct4zOnePic73f/hk+D1EIqqAhHBKVQx5fF5ZkdYZp8eH0jBfAT2OvEi
	vG8w==
X-Gm-Message-State: AIVw111NAiNiMlYdTRjth5H46z7zdWAptbiGm0O4gD9jkvPAMYl4bu8D
	LgZcsHxGP3S93SKO
X-Received: by 10.99.96.150 with SMTP id u144mr16470150pgb.338.1501521370785; 
	Mon, 31 Jul 2017 10:16:10 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v62sm51191868pfb.170.2017.07.31.10.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 10:16:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:16:07 -0700
Message-Id: <1501521367-17192-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] new tune: add base cortexa53 support
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
X-List-Received-Date: Mon, 31 Jul 2017 17:16:09 -0000

---
 meta/conf/machine/include/tune-cortexa53.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
new file mode 100644
index 0000000..557f43d
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -0,0 +1,18 @@
+DEFAULTTUNE ?= "armv8-a"
+
+TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+
+require conf/machine/include/arm/arch-armv8.inc
+
+ARMPKGARCH_tune-cortexa53		= "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto	= "cortexa53"
+
+TUNE_FEATURES_tune-cortexa53		= "aarch64 armv8-a cortexa53"
+TUNE_FEATURES_tune-cortexa53-crypto	= "${TUNE_FEATURES_tune-cortexa53} crypto"
+
+PACKAGE_EXTRA_ARCHS_tune-cortexa53		= "aarch64 armv8-a cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto	= "${PACKAGE_EXTRA_ARCHS_tune-cortexa53} cortexa53-crypto"
+
+BASE_LIB_tune-cortexa53 = "${BASE_LIB_tune-aarch64}"
+BASE_LIB_tune-cortexa53-crypto = "${BASE_LIB_tune-aarch64}"
-- 
2.5.0



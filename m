Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2874D78589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:16:08 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id k72so23564444pfj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FPb74NdXHYgqpnPj4l5h/vOoUJlsXTLLEW0xPL28AEQ=;
	b=lWyGPqsZegBfkM9nLIzWSmopzEwb/Bh+Rgb+QdbkLfxo2Hbe7qS7o81RycwFzCmHlD
	K9pEbj8qjvv820jHFZajDLdVROocbjM6oKahQxX2hcoD4+G75/RyA2YN7kUBbkmPoE4O
	5kiewF0vG864n8AqbtTbevWfl2sNM6UaBVDx3Xiu5BT3vsdf5b8efIEn/GvEAlwuCPtp
	TPLXoEdBJqcHt2ldVSVLXKtsDf5MhN1sKJRT24Fxw2DUG4ujfp3G6UisiX/3S6C8mo+n
	pK+Td/aTA05WPIxRiZ7CVUTtWe+EgO3yPsapQsOsoH4gOEO81UFIHfvk7Ywpcd87n5ar
	KkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FPb74NdXHYgqpnPj4l5h/vOoUJlsXTLLEW0xPL28AEQ=;
	b=alCVVsZUmeIEY5mKiQ2dNWy40cb8wZHtktlntEjO2hh364s7AcnBidO77YRaQ6P8zN
	MRhzHF5PElRTKSN/Qjzuf+3OvofcKlbkfFgDybflbFw+bNoAavv+RprqRVKflSeW5ysn
	zHrgIn22+6fGVPA4TGTnStaLI3tbLhwSwEkxWBiqtmBrZqcXcQK5WwKBGfVmCaIsOP62
	CkuNfSIKabYKVJb+GuQuzRPDeV9YqaE1sAQOOncTEieqWztghL9FrzYFHs1bj2pxOA8G
	dgkg6y54syQPVbqgvY0OOrseCGBKD4Ir2oxnYT9zOI2VsT+1rn2vFidTXIPkwY/m3LrO
	sOZQ==
X-Gm-Message-State: AIVw111WB1mJTngIkvYtCufFgNoyygMQxUYWchPOtQ7EYJePYbkV5fY2
	TiU/4HkPd8S4aQ==
X-Received: by 10.99.114.19 with SMTP id n19mr16096002pgc.436.1501521369827;
	Mon, 31 Jul 2017 10:16:09 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v62sm51191868pfb.170.2017.07.31.10.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 10:16:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:16:06 -0700
Message-Id: <1501521367-17192-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Mon, 31 Jul 2017 17:16:08 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
index 5e832fa..dc1ba5e 100644
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ b/meta/conf/machine/include/arm/arch-armv8.inc
@@ -1 +1,26 @@
+DEFAULTTUNE ?= "armv8-a"
+
+TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"
+
+TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"
+
 require conf/machine/include/arm/arch-arm64.inc
+
+AVAILTUNES += "armv8-a armv8-a-crypto"
+ARMPKGARCH_tune-armv8-a ?= "armv8-a"
+
+# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
+ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
+
+TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
+TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
+
+PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
+
+BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
+BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"
-- 
2.5.0



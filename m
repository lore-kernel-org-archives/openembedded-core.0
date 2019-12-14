Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21CA66BDD2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 00:54:55 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id a22so1505405ios.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 16:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=goIl72/q4FLvju6+LwFjgdVXUv/STQPIECnDiuoyfzw=;
	b=fwvjFSqgQS1NSdF3jTz66qrm/2lrVcYCWbDKf+Q6xkuNP3LFNmo+6z4KOvhT3N4ySD
	c/d732zhv/e+h2BdjEjgWw0qRCMyyqZdNhJfqetQ+1LKLYVbluQB+hcfdR6/VyWCGQYq
	M+gqDzX30KNe6eLuP+D0fhHPZaSKj1M7wO+Q8lf1uNPCmSIc7DIFthW2KW4qimfx2onW
	HwaHamOBvZWIcceOt/cE/66TJy2x7K7O4UOLuHx/ezrKrFnwuDBKTxoA3CayD0kr0Ukw
	pSroqTsD9QocbJDP5Okh/ixPLhpfr9b2+2loERrBYqegdeDcv5FC4Krgmu0+FE7b3Abl
	tdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=goIl72/q4FLvju6+LwFjgdVXUv/STQPIECnDiuoyfzw=;
	b=sMa742jFkN7gtTUNOXpmzbilN/SaWLrAxH04Eh0c0iWgkvfY1SDUxFnmCs6xVicI3m
	O/Az6SB3Q6iEj5iPEwdH8bAH02h3uNjNyi/0p8X294eXpGRLHoBXho6LdXi+36zTul8I
	gfCj6L0xdY5RSZjXSt9Z0Vwubh7boFt8ZXyIhHpSsZiH7nEt+iLKEG246VR8f3Vrs60E
	UBiYpXvrw3EAUvOWev2dxzBtJyA3H9b7ZBRT+O0qtb9oEWZbimLSz77bafRVLohbpvr0
	K34RcfPRbYRPSCQVmsCrJaNFhHwYRHXBRD4yKPTQVn9rQTx1Mc2wFm+E+9GaVuuugsD8
	lQvw==
X-Gm-Message-State: APjAAAV248xQneVgvaAcObIvthY6r8tukFU7aF31sDr+fLPA034SC4H9
	DINpdPRAeJ9C/JTzQMxrO2sIp2kQ4a8=
X-Google-Smtp-Source: APXvYqw301MOeiKhEYA/UN8/ZtBhGmLz9OJ0o6D2eZzokXE+wc3o+fvstu0gNd2+AwkG8C813ewv1A==
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr9999775ioh.175.1576284896643; 
	Fri, 13 Dec 2019 16:54:56 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	q17sm2511002ior.51.2019.12.13.16.54.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 16:54:56 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 18:54:48 -0600
Message-Id: <20191214005448.162460-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213220309.3964324-1-JPEWhacker@gmail.com>
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [PATCH v2] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Sat, 14 Dec 2019 00:54:56 -0000
Content-Transfer-Encoding: 8bit

Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
crypto extensions), e.g. Rockchip RK3399

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../include/tune-cortexa72-cortexa53.inc      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
new file mode 100644
index 00000000000..6bf3b83abe9
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "cortexa72-cortexa53"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
+
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a}"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crypto}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto} cortexa72-cortexa53-crypto"
+BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
+
-- 
2.23.0



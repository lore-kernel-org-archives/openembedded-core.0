Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 38A1674553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:16:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id m16-v6so2632974pls.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7wzgHbKAzBFCybyDO4jWLP9MnFAieBTakGfvZ7Cjhic=;
	b=H2LfDk/QOXpkkAV2QGtu3ed1VEkU7/K/CROoH0jjgtEWcJuAIcGx547xo5ovpAUB1d
	va6u8mlvpvLXXSmAK6KEc6o1r3ms8A5X7tIRHr0sa0Ti3e/goSkKG7stgfwk5EfDM1XL
	tR3u18eyhb9bfy79X0qZbfJ0475y4ogzsD9I3rJIV6LH4xV/IXwtOVlgeQLoCbwZwgri
	QbaWsmBP0k+RFdCvlbrxw/qmA4SAE75unBM0nB8M54K0WdU8WPeZeOGYNdROKRV0wpZO
	UlzmoSd/NuYLUAfTI3VL+RSu1bPhkGXCQzbh/HtGLqCqEDKBBsUXJAJwcDZTGkOrb4g2
	tEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7wzgHbKAzBFCybyDO4jWLP9MnFAieBTakGfvZ7Cjhic=;
	b=jMTc+UZsTEZP3sQPWOQIAEL5jrC51lA7p4/uIAKTncxBIlQyCjVHHOoAnjdaoX0M47
	TzVUrCNxsfUQ0lE4wIxrXMW1cYyKLXHZrb1PvzU0tYTcIZKK2lEE3fnO+LhR/Q0Nobt2
	hdIFsqSSqrgbbaZoF8CjWYt2F44GJ2Vs4uRQ/6RVUDWuphlveBclYzPByUVTSAZjsxjh
	UItONBpk/GIrseJh1BGUEON2j22RWMPbg7VMUwvKDjtHUUVNUD8OFIlx3f1am4mmXSuC
	MBEWAbUJWWZroYS7hutNRu37GEu1ZzQzKJ4mvNK0ge8AJTTi1wVtlZNJ1g/cxyOucsNR
	kI8g==
X-Gm-Message-State: AOUpUlF1iPdpzLcirXVqEFTgPRNjMf/ifZA7OEia0gmICu1RHLjV4hnH
	MXsj2xR19l3FFjXt53K9o1iuFXHIJxM=
X-Google-Smtp-Source: AAOMgpdQijOZofjoIV89zMBiDbs51wmzYh09G0QqKvcEdQ4e8acngBaop4xohoihD7iDUldSnpgLUA==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr19593887plz.26.1532488585978; 
	Tue, 24 Jul 2018 20:16:25 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm19294548pfp.6.2018.07.24.20.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jul 2018 20:16:24 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 20:16:13 -0700
Message-Id: <1532488573-19987-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] binutils : enable production of EFI binaries on x86-64
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
X-List-Received-Date: Wed, 25 Jul 2018 03:16:25 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

When MACHINE_FEATURES includes "efi" and target is x86-64,
enable the linker to produce Portable Executables: EFI binaries.

Supplies "--enable-targets=x86_64-pep" in EXTRA_OECONF.

Enables building the EFI variant of the Xen hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd..eedcc7e 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -69,12 +69,15 @@ python do_package_prepend() {
 
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
+ENABLE_EFI_BINARIES_x86-64 = "--enable-targets=x86_64-pep"
+
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                ${@bb.utils.contains('MACHINE_FEATURES', 'efi', '${ENABLE_EFI_BINARIES}', '', d)}"
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-- 
2.7.4



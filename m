Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2247868B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:37:04 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b130so5343797qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 23:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=oQyPcF/HYfyKSpyxVSJ7NP2t62WhTJaHrURFtsA8Q2k=;
	b=nNr2Y34+kG6K0uYnopsnoKH4wTiyZ3YOgsVFClzis4Oif/siOgwke/1V54Pqf+GSKK
	7kxOfgPzPquAA+w/grCkhJn9Y9LGV+3PVdC+0rVdkGALqnwT3tewbBwZe8hNZVmtURCV
	CyxuNIzjU3XOs18FEY53A0mXXWNglv8YbwMFO7a2Joriv1OhhfxXD9KtDdgh40y73wpB
	rkyttFiRdhDpy9cP0zhPgaXUauh+yvw4qqzGPz7/S91hBhxOt1/8wQAowWQ/sflWTgds
	KkwyYEH0mPavJ6hXGIXTE2iuvK4BaTLwQlIDJy2GS6hF3Eetlurw8sP2qa6hFhCPTv+1
	D33w==
X-Gm-Message-State: APf1xPAbNR82nZS67y4+Jci4i77cELjQXriCbYrEUYFaVLpI3h1dYDm1
	gh6pIoY8BbAJwwpWtvbNI7QmpQ==
X-Google-Smtp-Source: AH8x225e+ieXhqR44fgRuZaP5xVi5n9s4IYWe3Q8Me0Em66bL70WjAwCbyZT6RG47H6q8HCCXjX90g==
X-Received: by 10.55.64.21 with SMTP id n21mr5836938qka.186.1519285025682;
	Wed, 21 Feb 2018 23:37:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	53sm22291469qto.77.2018.02.21.23.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 23:37:03 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 04:36:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 04:36:47 -0300
Message-Id: <20180222073647.31860-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Thu, 22 Feb 2018 07:37:05 -0000

The dtc is used when generating images which use Device Tree and we
must use the OE version to avoid relying on the host one.

Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
index f1fc5644922..1d55f2899a1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-common_${PV}.inc
 
 SUMMARY = "U-Boot bootloader image creation tool"
-DEPENDS = "openssl"
+DEPENDS = "openssl dtc"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-- 
2.16.2



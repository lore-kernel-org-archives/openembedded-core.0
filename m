Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 06C3278512
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 18:32:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h42so5871217qtk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 10:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=uqj9L9JPKKQIyFQzzewIN95akSFuaOlSexAUxa7Z0Zw=;
	b=EYbN8WldupucY+0UFOnDSn55Z22BtAP0/sS8L9EgC8i8UNVwwxO6RynooMq/V8kwse
	DeLb55Dzy8vN7tbGPSzk+wyrp2VHhveqN8rYGel/iVb9Nxp8Facj8tcWCwyU3S7hgX99
	XZW2EGNaEZg+F/uYtz4YlmMaSqQwyjrda6BJKm9RsicnU4LRdmElZC0xDvXAlnz9LSTU
	YN7dypOYMbb5attQ0Zgr91sICQijQ5PwTn2g0JguYDiR2vYRo2vtcArjVwvtQtU2wEk0
	4XsG7m3gGVLHJq8h/6oTE/GGi8p0SSuBBmQO2ITojngzUdlIeW4C8zX3fY/Rbuan3MQ4
	h0Qg==
X-Gm-Message-State: AJaThX6Eg2zbv/aEkDCuPIAeFmupJM5hwTWe4BY9wYTxKrFpHDYSjeVH
	WKU27k96zinxWQsCWGG8a/kBTA==
X-Google-Smtp-Source: AGs4zMY7qsu2lVyUa0Yq23X/nAzK/YdZQZgjFxY3MAX6osJ1rV5lyKkiXrVcYD/XkHRTD4dpIT5NWw==
X-Received: by 10.200.47.105 with SMTP id k38mr11182339qta.195.1510684358499; 
	Tue, 14 Nov 2017 10:32:38 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t65sm5183944qke.36.2017.11.14.10.32.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 10:32:37 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 14 Nov 2017 16:32:29 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 16:32:23 -0200
Message-Id: <20171114183223.7804-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Tue, 14 Nov 2017 18:32:38 -0000

This upgrades the U-Boot from 2017.09 to 2017.11 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc} (89%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
similarity index 89%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
index 02e51242cb..bfdf1a0d8f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
+SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot_2017.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.09.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.11.bb
-- 
2.15.0



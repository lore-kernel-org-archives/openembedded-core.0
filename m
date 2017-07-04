Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3C871A65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 22:01:36 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p193so13888467vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=+u0clRcGJ88RmmW/X8PFQTjUT1eHLqpjzyFYPmvzSuo=;
	b=ILrDBt8KqONzYmz+kk1BbEWL1nERZJZ2XZ42dZQkezuzZaRZ3g3lB68ymas5Pb5Mn1
	E5Ty81kv3ZEiYFz/2LOG9DLD73PlVFfIpdhjf7fRmk8TsPoNXD8+V3B9QQIsgSvVNepO
	4LohrFWcFTmgeaA5wGg67T7+tdnc+LDvYL8+JqYGimCQdF1jFx61Oocm4WUe2DuScmWa
	G/FxAki6D2+F1gBtzVdDX3NT5yn8u1VmKt9QQAP2UkBjUV7Xq/biM0iVhDN6voDLRkJr
	96x4x7rj9uqd/MsZ+32se1oXjniVDc68GyGuiKaKK/LryUefWKlTyfHTXwPysFtDSAJi
	2NvA==
X-Gm-Message-State: AKS2vOy1aM2ZhhTYFsXUNC6BWVZ2rqqpmoDtt0oFw6iG1FUcZg1ndj0d
	0tD00IidXGLF3AfT
X-Received: by 10.31.218.196 with SMTP id r187mr22460313vkg.96.1499205697282; 
	Tue, 04 Jul 2017 15:01:37 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id x1sm6469654uab.14.2017.07.04.15.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jul 2017 15:01:35 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 04 Jul 2017 19:01:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  4 Jul 2017 19:01:28 -0300
Message-Id: <20170704220128.28747-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: marex@denx.de, Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFT PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Tue, 04 Jul 2017 22:01:41 -0000

This patch upgrades the U-Boot to the 2017.07-rc3 release; for now it
is not intended to be merged but to expose possible problems prior the
official release so we may try to include fixes for final release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
similarity index 88%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
index 0e52f27df8..3c0ee2341b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
+SRCREV = "2f4c1d83f4e838bda4a02a408321aebc746b9eaa"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.07.bb
-- 
2.13.2



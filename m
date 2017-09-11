Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF1577E96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 20:31:04 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r66so5933970qke.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=hj8ajD5Twb7hTS7HmMzT/gLw74ISHmDId/Ozruh+VK4=;
	b=cq1IfreXvZcY+4HWYBLYzCXCUROQiJp/AuEy55ykcFNeFxxSGCqEM4RZhH1XHCuPl2
	lPnjjM+Gx7TJdrHwkkF0MkshCyvzmyuDH/+XGgmuM3G8mmPXvNEXq3HcRRg1rl+pF3mY
	cs+n0O1/PhYMwSiecpqZ4f8YpgzK4FnUVid+FkCjvfl1WRySiVQ49ctMU68h4rK6Y/+M
	ncNv9MyELlWeLqUp3nfBTd6nrAktbaZgRuP5y4rBXbmz9FRIzLlCAMnCudxvFfpNvKYo
	YhFbV0CBAYjfWokoq7YOdtZzIo8slCPlaZZ+e5zAAtvXR1lHarhLTVLDPx5Vrtu7pLBG
	eVNQ==
X-Gm-Message-State: AHPjjUiyoQkuhnyGtRxTnrIcfcHZbtzgncN9B6wtrE0CWTiH+uOVa6YY
	P1/R3azicDEaJ+tF
X-Google-Smtp-Source: AOwi7QAR4Q+OX3iAb+47owH7cS4hVP8dGud5cDtpexNSWApSxs5WRYVqr3dTg2C7AnpBtiWosikteQ==
X-Received: by 10.55.123.1 with SMTP id w1mr6951693qkc.114.1505161865801;
	Mon, 11 Sep 2017 13:31:05 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m93sm6584491qte.72.2017.09.11.13.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 13:31:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 17:30:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 17:30:56 -0300
Message-Id: <20170911203056.22156-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 11 Sep 2017 20:31:05 -0000

This upgrades the U-Boot to the 2017.09 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc} (89%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
similarity index 89%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
index e37f5fd409..02e51242cb 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
+SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.07.bb b/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.09.bb
-- 
2.14.1



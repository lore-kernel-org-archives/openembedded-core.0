Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3FB77BD0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 20:08:19 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id d188so5330186vka.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 13:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=nskBOocghCOcwoYBudLvnHGDB3sjvkwwlqXx69xq7Lo=;
	b=ngkCLbM0zY1fYw7TA6yNse8InqFnd9Imj62p3LygMnVMaa+5+nqkqWD/L+AjQskcts
	Tbr/iJRJwlxC7bu29Cc5QPMFQ9Avbjr/e9Ufzr1OyQxuUbnxYZimwDl7IH6gzDUXK4b2
	7Yh483nHxkqKEfNdGv8gq0ULOiZt7dAbHSypGVlnHqr2OTCsss7Ju1yRuPc4BuEZQ3dl
	qg6iqI/v19ODr6NaSLBbaqvGrlbz3pr7mtZl6UnXJ4Z9+XIrhi2PdRnlGPEuBHCu0zFY
	DRVDOSeeTt/KQ2riYPwIt8iomqKPv4aeKvZl6/mVU6toc7T6GKHrXFXCj26dP7vg0lHR
	ILlQ==
X-Gm-Message-State: AFeK/H35tiMZWs1aEuS0NjHdjAV6BV6/D5+S9tIBVHTyaqbtXvioKjkovQ9FI4zRKAmnEA==
X-Received: by 10.176.80.66 with SMTP id z2mr9371666uaz.151.1490558900473;
	Sun, 26 Mar 2017 13:08:20 -0700 (PDT)
Received: from localhost ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	b94sm2546773uab.30.2017.03.26.13.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Mar 2017 13:08:19 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Sun, 26 Mar 2017 17:08:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Mar 2017 17:08:13 -0300
Message-Id: <20170326200813.23705-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.12.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Sun, 26 Mar 2017 20:08:21 -0000

Ths 2017.03 release is out since March 13th 2017 and is the latest
stable release prior Pyro release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
index df24c853dd..c115f36831 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
+SRCREV = "8537ddd769f460d7fb7a62a3dcc9669049702e51"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.03.bb
-- 
2.12.1



Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC88177805
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 17:07:38 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id z22so6137051uah.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 10:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Iyu6VdmnPY8Nd67wXCGVSEUFrjDF0QpAd1ObFHhZLLY=;
	b=uBM1rhnGz3NXkQWQbkl1qdoYXsE3rib/R4LSmZTbJQm/+xBoDSkNoHLb/rOVSorKI1
	UFJXfLOVqhBkoEErQHtVMjZOJ9MsQC8DsXVaaoHJBhTrvqzG/+WiDl36O2yPxEALiHbh
	24GJu+ohIoHSxgtrKygmoGVu8VGcipEE/jeqyR7TCsC/7T+jqnaW1QoIUexDOvlaVUBH
	jvviwhhiZXUUFPFJX1/ZaGqP7yVqQX+F/rWbNMDy21yDIOi05HIfJJeLr6KEBshkw2GE
	Q+YOA++EZEPJF8Xx1j0o5/iALz+8wQOeQsc+VP3VphGYWqSDFccVQfBMJyH51hphDrQ/
	/1eg==
X-Gm-Message-State: AIVw112gGf5Ipx3k4rpTo60Si+3YNdHxWULTMCsrbSYpa9Rilb+YOVqy
	zedme/ufxAc4uV1h
X-Received: by 10.159.48.69 with SMTP id i5mr9020064uab.106.1500138459505;
	Sat, 15 Jul 2017 10:07:39 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id
	s47sm3524493uai.17.2017.07.15.10.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Jul 2017 10:07:38 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 15 Jul 2017 14:07:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Jul 2017 14:07:30 -0300
Message-Id: <20170715170730.27740-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: marex@denx.de, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2017.07 release
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
X-List-Received-Date: Sat, 15 Jul 2017 17:07:40 -0000

This patch upgrades the U-Boot to the 2017.07 release.

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
index 0e52f27df8..f27989daa1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
+SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
 
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



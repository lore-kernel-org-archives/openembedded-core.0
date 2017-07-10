Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52EB777CC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 18:37:05 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p21so13958441qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 11:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Iyu6VdmnPY8Nd67wXCGVSEUFrjDF0QpAd1ObFHhZLLY=;
	b=UbEN84HdwYC2CBkWZeFrE4v9KzIOVERgGqrPnJUvTFeGyBLrKKYEhC7u2YQRhScc5u
	BCMvdGzA6U6AymzYwQjmr45jGm0H33igPq6nDEJ7Pt5/KQTe9Grlr5RhHgmhuge4Mgns
	kmURkJh2mZuX46A3VMopBdyfPmfNyk6lWDgM1dvu0PkW4lg16sPGJSO6A2bpRIVm8zu3
	9X7ljHXxnCuUF+DsLkWd2f7ewSlrm69w1M4miZx30GskM4WMIdUo/bW58PcXAA8JRF7x
	mIJIKQw9XaY3OxX2AiPF2JLjWtLflLWn0JD717u2eyaiory8caSSTJPkY9i3HxjjxJZP
	FzwA==
X-Gm-Message-State: AIVw111Dl5QT9t7Wi1kLFfiKQ9IeLElveEobUaVX0u/H+glrylSD2+8U
	+NRykpDO5Cud90jS
X-Received: by 10.55.169.150 with SMTP id s144mr5347275qke.115.1499711826754; 
	Mon, 10 Jul 2017 11:37:06 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id
	a62sm8724161qkd.14.2017.07.10.11.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Jul 2017 11:37:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 10 Jul 2017 15:36:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Jul 2017 15:36:57 -0300
Message-Id: <20170710183657.12885-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: marex@denx.de, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 18:37:06 -0000

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



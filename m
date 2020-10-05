Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.2545.1601925422209234072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 12:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=h1Ruk6CK;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id A67F0602B6;
	Mon,  5 Oct 2020 21:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1601925417;
	bh=pHi54iJoIoIGpYEY5cQah6YYnr782wiYXVOOU3DYTH8=;
	h=From:To:Cc:Subject:Date:From;
	b=h1Ruk6CKwzff1TMM6rO85ADPVlbLUxBDwJw17oxQ7Mt5Yun0ByxFXZhgvYsU7TuxM
	 k77jeDABqyQq1U3EBUUKjmPndx/djIiW/I24cP7UrAyHfeUVczlpsMEUy1JDjgUa/R
	 xzvZEEL4qZa5/Bsq4XR0tSOeqqmHWVGmj6HVxSx6N/aPuQzycO2S3YaSfJkhupd7I3
	 5pbKcUAOqc4pFSvLmvtixze+TtbS2O7oqPEYqFFJqgStnyJOVVKRrJtti6CiwaXgTB
	 zdcuAd1Qapr7RHE0YjdYPe9wm/jskWmlqAvWX2qqKL+5M1kYdMamFW3T70Ucf/HOUW
	 Otq2uRXlXCnlQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] u-boot: upgrade 2020.07 -> 2020.10
Date: Mon,  5 Oct 2020 21:15:28 +0200
Message-Id: <1601925328-16676-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Announcement: https://lists.denx.de/pipermail/u-boot/2020-October/428516.html

License-Update: add MIT License (see [1])

[1] - https://gitlab.com/u-boot/u-boot/-/commit/824ed85b77da741a77fa34c8887c37c5151a15a3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                             | 4 ++--
 .../u-boot/{u-boot-tools_2020.07.bb => u-boot-tools_2020.10.bb}       | 0
 meta/recipes-bsp/u-boot/{u-boot_2020.07.bb => u-boot_2020.10.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.07.bb => u-boot-tools_2020.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2020.07.bb => u-boot_2020.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 9199bbf..cbce408 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
+SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2020.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.10.bb
-- 
2.7.4


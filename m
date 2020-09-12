Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.17614.1599917860477337081
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 06:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=lYefhDZF;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id 07DAC601ED;
	Sat, 12 Sep 2020 15:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1599917858;
	bh=QPuQhsVBOU1Y2OJYKMkxrBhEH5yD9KwtLf1RtW/Zypw=;
	h=From:To:Cc:Subject:Date:From;
	b=lYefhDZFIMiQgT/JBzU4j/BYnTM9pgoJuMlGCMOVMUKZjmAYTVoROtP/eyakMe0Go
	 34LzmqabPRVIv1bMYLk2ylREq/BhL26T+w3Yqule+4gmKbmec5wHyO6U/WP7Q3scvQ
	 fT2wQtWJ9o0QWrmRXIjrSebBawAXcK0JqSY0WGyHOLtJdxwLyeLtAhdLQ5cKMoikVx
	 TqLirg1S5bgqd4LXAhcXWcPN96T4Nxy84YsK6Wjtt7RfB9i34D05tfdRDmwPP4StHb
	 2N7BGZkHyKzZ5zjUvlkwYUGtn22N/tkRd9ORBkU8X3SecUhQs4JgvHz6c/CDbtNA1i
	 mhsFuwp+oduIg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: sbabic@denx.de,
	Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] libubootenv: upgrade 0.3 -> 0.3.1
Date: Sat, 12 Sep 2020 15:37:08 +0200
Message-Id: <1599917828-7283-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a bugfix release which includes the following changes:

824551a Prepare 0.3.1
ca6aaa1 Fix file reading/writing when the environment is in EEPROM
a031dea Fix regression in UBI volume support
c91c150 Define SOVERSION to indicate API version

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} (94%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
index 0771148..613e316 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
+SRCREV = "824551ac77bab1d0f7ae34d7a7c77b155240e754"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


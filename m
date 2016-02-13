Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE34601A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 06:12:59 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wb13so151438958obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ITcmwyDz/A63FLLO0EDYjW4WMAgj8H+zBdrW5x9pPk8=;
	b=h3y1Q8rOIX4dRHloiylxfCRuyKRcZUz6h06HWmgqncSxF9EWSs066XqczvPRTMm0FU
	BpeYhqOzTs36lcz2ePFfL3GqrOzeSR3VKOD4/eljUZclFvMi+7UVP7+fRE3m6sS2H/Jm
	ZG3XqHMUwlv3fVErNTSfmRZpZPSrz1+l5ShQK5SDYLRo33fNJuktUgNVCEeU+T4YWamh
	DfqKF2L/LWeSgSckJXhAPR6clq9JiPiFAJf6OVCpVMkvprAxswV6yYSo4nc8hbR2JZvE
	vkOOjdj9UBs9IDbOl40oLlAb/Yacw3GD1RbDdYgQZcdD3RZXXWvKxvRwfxd6SwlgFaOU
	nSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ITcmwyDz/A63FLLO0EDYjW4WMAgj8H+zBdrW5x9pPk8=;
	b=FF7p9Rjva2gdq0BYcwagw7kI6agWCzegltME/TJucrQwtSpnM6XxERLWr73gojw9bt
	aILLW+E2/DfeQHwTOXYjMUOLwP6AoKMW0J9IXkHT1gCdhXqLCRP3iAj7y7pkGQK14VHE
	nyGqzL4iwVviXWeAHkpHH/w+YgGh1hxvCbAp3VXvI86DEpohnXXm2CdrrI3M5/I3VprV
	PEI3Y5fz9D4r9jv7QsTN7jRraGp7PNF8+QFPbeHVoHfG2o4XskdFdLqPsMWahk4+nmsZ
	d9ZzbK3KwXM4xLGRCWXcyAG3FQfjyeM3SDytFRC9+7aU1vLk30pxicHIafwRL58NhKTp
	xsrQ==
X-Gm-Message-State: AG10YORt+iTUhIDuHJaGC5Qvumfc70X706tGA1R4HU+Fkt/w6hfaEJR4v8xPPHKtLqz7qw==
X-Received: by 10.202.243.193 with SMTP id r184mr4421593oih.24.1455343980079; 
	Fri, 12 Feb 2016 22:13:00 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm10543206obc.10.2016.02.12.22.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 22:12:58 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 22:12:53 -0800
Message-Id: <1455343973-26176-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libgcrypt: update 1.6.4 -> 1.6.5
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
X-List-Received-Date: Sat, 13 Feb 2016 06:13:02 -0000

Noteworthy changes in version 1.6.5 (2016-02-09) [C20/A0/R5]
------------------------------------------------

 * Mitigate side-channel attack on ECDH with Weierstrass curves
   [CVE-2015-7511].  See http://www.cs.tau.ac.IL/~tromer/ecdh/ for
   details.

 * Fix build problem on Solaris.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc      | 2 --
 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb | 4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb | 4 ++++
 3 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 683be78..5478253 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -22,8 +22,6 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-PR = "r1"
-
 inherit autotools texinfo binconfig-disabled pkgconfig
 
 EXTRA_OECONF = "--disable-asm --with-capabilities"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb
deleted file mode 100644
index 1ed4291..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "7dc7d51cdbf56ad75e95c4166f90e985"
-SRC_URI[sha256sum] = "5c2076212961712e4774abf32c85cb58537d544d6016a2464fb32783653d1b6d"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
new file mode 100644
index 0000000..717a23f
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "f24fcb684932d4b5ed85f2f05cb1d9f8"
+SRC_URI[sha256sum] = "202bf109ccf2d614565c849f3e5687b94cde972167b35261e094252367627bc6"
-- 
1.9.1



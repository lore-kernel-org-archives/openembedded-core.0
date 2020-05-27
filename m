Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.891.1590560709777909299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=C4e/CsZ6;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=grsk=7j=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49X15w02Qhz3l;
	Wed, 27 May 2020 08:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590560708;
	bh=Xntue2MCfi6kPao18smX6OZDzV8u+QIw1Ek7AGId4LY=;
	h=From:To:Cc:Subject:Date:From;
	b=C4e/CsZ6haPY29z9NUDOx6JeUw8jXsMX4+B3HB2f4oiF9Ef/7sp4ZgYLQZIfx2TwU
	 wlquYvAV38xEc9KXVbNIRBM0ws/mG8KCIJBRYKI1Po+g31V73liFm2hPRZmyJ8GkTB
	 GHTAPYGCcVHeZ7EgdmWpI0srhTtA3hei2rtBWNw9SEop6iewbQpbbBdH2dHgA5G0TV
	 oMA91IDCXSNI+lUEV7BfEXDfeQe+QIDlotBkLuXpZd0c7RffeNRHCh/D1zb5XxEotM
	 eX+DQbWd2lrwJlSpa0w8J8X7aGj0VyNzSGQ2aU5A4czehPAfj6gFMU3ClFERx7nGZ3
	 eBEqas7I+9ZC516dT+gi2keeK/s7MScDcju55MmosvuaRNZXM6E/unsYi3MoE4tehv
	 mEkuuRxUisDvoPffTLyrJ72avsJx2zBOO+tn/KnWLCG88ZYSEar9mkf4CxpXSirBb+
	 ZI7iEp4MPE7sqix+7y+zcYrF1LCNQYWVsdwbBRKmlwJWpdmpFMghvGCD2cQLNGYznt
	 FssMZHZLCHp8dUD1fwBKfdjxODtBBy/K9ptlm/xh3oXGUix98S5MNip/AvXq/DOod+
	 2569BQ7o5ewkc4YmUf17bDTKqqw5j+HPg1p/Lp8OEBgC4fOqwq96HCf6sLvgdrr+EV
	 f7ZnptSoTD5GKpoaRmzVDTAg=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [OE-core][PATCH] libubootenv: Remove the DEPENDS on mtd-utils
Date: Wed, 27 May 2020 09:25:07 +0300
Message-Id: <20200527062507.21433-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

It was only used for pulling in zlib, but this is now
a direct dependency.

Also move the DEPENDS to a more common location in the file.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index fa90a12bf8..ea29b668e8 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -1,5 +1,4 @@
 SUMMARY = "U-Boot libraries and tools to access environment"
-DEPENDS += "mtd-utils zlib"
 
 DESCRIPTION = "This package contains tools and libraries to read \
 and modify U-Boot environment. \
@@ -21,6 +20,7 @@ inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
+DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
-- 
2.17.1


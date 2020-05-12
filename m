Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6560.1589292861171904397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=lGHCur+M;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DC1L1RzJm
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292859;
	bh=PUg6v4rtpbUvNikYotzPhZzBLJyjm5l+luBRnubIhPs=;
	h=From:To:Subject:Date:From;
	b=lGHCur+Ml6nqmr9b3lTMERzttyjr23dw9B8w2izDMZ1rFyzc7+ejZ5Y04HrS20Ag6
	 rrV3FYBHvRZe8NmhJ57BG3kzpd4Gsth0a1ujsuHDPJjLHV0xte9v/xtcMy6flC/wB9
	 lUnoH9VenxBp/ouPIO8Y4rurmBzwT6icNT59Ye05/s5Ne9saTYo0fZ42A/7TNwsAIW
	 tWWupAtwyjguOAVQVH26jRz17IQDKpU/f2q6NBje2Kq0PGRfalsasEZqd1LmevRzZv
	 5cb9+/oMKQsJYESCo1+8TolChCXLyMJZYNck6Q0QmyXw0x6ey4tspPziUXJVvzaCS3
	 RMWk/Fzb616NpivpJHGUcOtifugde8FpkdcKumz/2rQJX/yZqOz+ClJl4vJLKt0Kag
	 r5fC1d73f5o3GMAokkzgSsOKDO/Ib5o0T0yM2w0dKDGhKZj/jAVX4Sg/bOkzMXW6mv
	 8TAe1BkyubynPrqb54lOMy06krSCyqg7ymoBISIVwtmGim6tO1tlEiJ82rS6reqxaR
	 l5p57hGcXngY/4OZtmfUPWHOUKl1glbUHaJ7kCs5ZH2/7SUmlklINK8ZjrSYkatnxR
	 UBzgUujYDwq7L2ojlTRUq6yrndwPbKPw2yqVG+yPpbjLF1SGjqV1NB+st9eoPoSrWX
	 njkAkgFINxXRzOdeFuC7zY/c=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] at-spi2-atk: Remove -fcommon
Date: Tue, 12 May 2020 17:14:13 +0300
Message-Id: <20200512141416.5327-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 2.34.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/atk/at-spi2-atk_2.34.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
index db62ae8fac..107d312d14 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
@@ -17,5 +17,3 @@ FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
 
 BBCLASSEXTEND = "native nativesdk"
-
-CFLAGS += "-fcommon"
-- 
2.17.1


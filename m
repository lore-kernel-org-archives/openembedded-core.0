Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.890.1590560702582547056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=fPFSqjJt;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=grsk=7j=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49X15d0B9Qz3l;
	Wed, 27 May 2020 08:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590560699;
	bh=Xntue2MCfi6kPao18smX6OZDzV8u+QIw1Ek7AGId4LY=;
	h=From:To:Cc:Subject:Date:From;
	b=fPFSqjJtGeklugnUZAyA7qKOMVMwDO9K+rR8fSNgK/tnvlmve1FBYM2plG8lAd04l
	 MP4pT/lSicln5eo+RGxs4y9CcZ64A+5E9DzHlUKMnhYEbtJCHYn6Na4umORvlS9KX2
	 qqbH9DpIWHB/Z7Z3Fxz/c6xU77pKr0QjfwkXfWm/wqPtTZaFR+n71faqA8Rj1c8Mn1
	 Dc6rfpXGv+O/hyyQ9+eiiXzPDDmzrhJMZJ73CTOEY2DD70SODsQYSMEPDRvwxqqEZm
	 L0SP2KTEKRvs2CYVpdllc7woj+FkHm5kLkdhXwkCZdKstN4ChGNydmQ0utqqi+yPmj
	 SruKcQSipACzKYSIdGHsZvXNYg9nwvJL5jaXs+gmzJfGYFMKcLntz54k7e5+azhrKx
	 DfGpZyODRGGwJCKmrkRX9mRaaOd05+5edNgUDLQD9DW5vKBacnRKhMpeL6mtKj6Vft
	 u86HsKJ21YHyH3XSxW20mI4FxF6aTat90tuKGfe3fgQ8LXaTXaW0txqT0Jx6oBUSsg
	 msPTDVZWq+/CGTliNRzfamu8v044T6+pmasOP8QaVrJz46PB0etHE164BDmLl5QDve
	 EbCB5zIwhqfac+3l+NM7CuvZpSl1M/dA2jQC06wQXVNTI2YVfoSMU8bgg+Ixly2bGd
	 Jt0iBbNzzITYzysFw+w89LjQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [OE-core][PATCH] libubootenv: Remove the DEPENDS on mtd-utils
Date: Wed, 27 May 2020 09:24:30 +0300
Message-Id: <20200527062430.21381-1-bunk@stusta.de>
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


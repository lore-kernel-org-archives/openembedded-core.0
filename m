Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.14648.1589553851269925857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 07:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=M8qLZ7r3;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vty/=65=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NrlB2kbRz2k
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 16:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589553846;
	bh=YGldr/nhrtWxfL0Zv/Duq0M8bxuRXEcFvN0DDUi0EHw=;
	h=From:To:Subject:Date:From;
	b=M8qLZ7r3KtYj7aWxPxznLHBHAdE1oFPoG/jeHoaOtSZZ6j5e90QroSyPVUVL8Q1Xq
	 aLHoSE1w6mlsld7x3wwEJawcUmioJHLpFGnnMmPwlHAugZUilOn6VVtmwlSfPSl/ot
	 0kccq+Fac6hv7cFr0Nx5YF3NjNuCbbz0a5ss7MSk9hpxY7fx+GPz3CEL5UQpeieLxT
	 dVD8y/+9f81bWqk4N1Znq9yoQXvuTwdfUGHUL9mlwLj334biY1Dzk2e/Q58qGxG49w
	 9JFLEsc4uXd26etQ0lvps2/e1EE4ZDA0ZBnv9R9kfv7oXCl/tVvSLFbZMAQ1ZxQ0N0
	 qirMGiexFZ0TAgJy+C3mCGudwoa7QeOd2p1HERYxrkljB479PBoNGjR8n38+R5reZF
	 g7k+hTVkUneVW1Ypjmue5+Z2DLdQc38uXsxvUe0ie9pOth7xvJCIZAV8zTn/NyMY5L
	 8JOAM+vaRPt92AB2TJvP0NM0egL2q/o1Mbyx6hlSd3uOgv39S1HaJrOBq5ZJVWQkNF
	 Wumv/JJUneU4OF2n3DSELXHl3SR3UHV1GnwLTt9oQvQThjIhAZNnSOXe24+Lei+BnZ
	 ut03zucJit9ZGTh0xD5Bm+hGrkwXAnSrX5bNwJKI/m8VBjdZyvwykQHTKxrpoAalR5
	 EF13mwwRrnYe1gP9chyURhMY=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell][PATCH] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Fri, 15 May 2020 17:44:04 +0300
Message-Id: <20200515144404.10633-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Adrian Bunk <bunk@kernel.org>

(From OE-Core rev: 5b71a3f3d1bca6b52f53b97971131a6771618420)

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
similarity index 91%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
index 9076d94601..a5827b9ef0 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
@@ -5,8 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
-SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
+SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
 
 inherit bin_package allarch
 
-- 
2.17.1


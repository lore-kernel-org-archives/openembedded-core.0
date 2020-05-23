Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.4661.1590268855444114131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 14:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Cc2AUYtv;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=a6sh=7f=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Tx9H5bbKz4s
	for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 23:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590268851;
	bh=tKrbQ9GvePdj95A0Q6TaY0SgAEKnu7OIlzbhCSA8sK8=;
	h=From:To:Subject:Date:From;
	b=Cc2AUYtvFkk7DC6AqHaO6c3HKYI/1fWqVLurA3ib10IeO7AO/0tVEUQzGbUH3yD5R
	 rLuCFBKACPsYfNUsyKXtvZ/IPnhLn4nKD7gu8L9UdrMQcGOB392MRTg599QEdaDxys
	 Xqpy42T4Yb1kkjJ36fxl7Bpl+wiRpAW/ide7kcGgWi7RL5cjNBFIT0GoxO9m2Zjwqc
	 QynpUzvZc5fjYI59Xmeqsuj4LGQeIbXDVJLbdg2VX27IvJSrFssOT0wrMBa4v3L+pj
	 E/ApNENjWGtyRbWBH4lSi6Dv/yO/ALEOg4PMJVP7XjDMy1AVXL01AtlHkuWzGE5rxa
	 VYcTI0+vr0KwA5ByDTdZwQAlRLbjgSxV06tHukf4DOzc614AhLpouH5Sx3WMlljyoK
	 RRgLMlnW4NYrIk0n0qkWitSG+PH8XWxWakrwSELyOBU5PvOjPgQ/X9ETmvMU7BrFQq
	 3Touk2ra7x0fTo/MlTwMxqMZf473YMx0BimLWXgUqTGkU91pe90rEvGCX//42q1+qM
	 oqS1+RmBwSyJVi1P3mP7w9j39lixTgE9pktF44tk4QyCp7tYaOJfmKD3wvlOOubCV5
	 E76SWkhdQuc4B9ivLzIzcZtuxb7arEk7Ir4K2fCD20CPukrp9UOBTRR1bXxsstL2GU
	 AlMkdiwB2t5itiIcFFcWU/6I=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell][PATCH v2] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Sun, 24 May 2020 00:20:48 +0300
Message-Id: <20200523212048.23036-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Adrian Bunk <bunk@kernel.org>

(From OE-Core rev: 5b71a3f3d1bca6b52f53b97971131a6771618420)

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
This is regulatory data containing the legal wifi frequencies
for most countries.
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


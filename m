Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.14661.1589553884716986005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 07:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=bnOdHDdb;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vty/=65=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Nrlt4gjhz2k
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 16:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589553882;
	bh=YGldr/nhrtWxfL0Zv/Duq0M8bxuRXEcFvN0DDUi0EHw=;
	h=From:To:Subject:Date:From;
	b=bnOdHDdb/UKuikC70N3VOS7fCfW/7hm5hfJ9A2E4D02akiZqn9kjqNUMd/AMTUdph
	 UvX2aELIIIjLQERHWF4V667b82fXZX7U0I0Hhd4ToepSDj0mln/ua4oI7TbNA9eW0A
	 hEG93z2MXrrhu9sj169EHUv3ICIPUiFR+WWzKbFQRPIUedp22OTIjjNhRLoex9Lyud
	 TBUjL5yx/1mL9XYb+w1UVkbOqb3T7qTRUaRFk5diS8vAMVVgYewYR5UuAKbmosiTBH
	 LlEQW2xkth8SkhTkT7gxlTOzBZzCUtbTKJ7Ts6pPWGc5xqhyIh9fxIt8gAidFxXqoV
	 3V8elHsugKSaMA4qZbbAudZNE89NVcMD78HkJ1j+9fRWqTQDu2OiDoN59eesikUSy7
	 vZ6r48rcHymxP7luXlcCTBreQ//Jt0IG+e3Q8rKrcgzaiN+eSFbf2Xk1gerM78htNo
	 oVn6XlYan7J8J8OAwC4wW6tkJeBURcJvtZMvl35VxhMPRwy3DVFwirfWSLdskpKYsg
	 9hg3N2WP/FAEcCi2tJIcaR5CxMqLaKXQ39rQoFtnMVzzDWXKNTqNNpgy6fdByZcnD/
	 r4omlRIuP2ccvHpd5jmWW3q1/k81/2LakybmZ7dLNzEQ6I7tyMd+uSBxRC2wnkd0I7
	 hQp5fAnD10AV1HzBN0/1yUA0=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Fri, 15 May 2020 17:44:41 +0300
Message-Id: <20200515144441.10851-1-bunk@stusta.de>
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


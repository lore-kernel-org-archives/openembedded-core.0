Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.7162.1589294388860577431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=VXJ5SOmM;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0nb0fBwz4y
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589294387;
	bh=FQXrmMsQc9yGo9L/W+dzHUUGjpTqrbfDjwta7u8iRO4=;
	h=From:To:Subject:Date:From;
	b=VXJ5SOmMVQ2VcVg0csZRONCfASTh1Wp1iAGrNc65qQKyLyfx/XwplA9pmNGvwE40t
	 58oDaLy3Z2c2Y5KQlS7vLA8CyFWp3qEJgOZDc1T8Lkxv25mXAc82t+chAX3uTTQGvq
	 gA7p3jNBhBDwumWa+Rx9q98kbh/GpmkFGf3RA3d0zMfZO+x7sdVLyzN7prB4S1HkDs
	 FgMiEn1VYBYsU1pru19JrRonSH6x6ZTfcby/LzQS2MSruk9DayPumqDhxh4bnCDfR1
	 +enUdyI6mk6lFbhtOtam0U8m13C0ld+bqj3lCCDeWI5ZcrDv9rU14PBSMrT3uNF5p2
	 vr4zM35ertghNcSh0cvfRf7LwB0WyAPMsmDZix8O4Km1rutVtnATwrMC03hZ/YyTUR
	 bRf2QVhDGyhxRAIEPnQnVefBdqJsARwoXImF81yvifAB0wpzaKfSIZAWMnxE+oL6/U
	 mij7O5Urs2ppcFSCZfHvPEvSskTzWF5tLHhfI+R4jcnOIMGWI6eLq9iGRNswns8aPn
	 U17de5uUQfTOsxYqP0hrtWsOslcc5koSh1HqB85C0+Ri1kqrdBeHuOIKtvcWVoxo/5
	 eZCDiZgzxMg+O/8Qdc05UlK5Ljvk7JEmZKN1X2W9/IU0vSxXaxpvfa2HajZvF6iojO
	 t9Xkl2IO+A693v6+IbOpywfM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Tue, 12 May 2020 17:39:45 +0300
Message-Id: <20200512143945.4483-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Adrian Bunk <bunk@kernel.org>

Signed-off-by: Adrian Bunk <bunk@kernel.org>
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


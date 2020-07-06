Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.2060.1594067740109291778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 13:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=PhRgty/5;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id CC4BA601D7;
	Mon,  6 Jul 2020 22:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1594067737;
	bh=Griun2mO9IFNRF0RDobJ7kG231akBHfUvt57TI3Ti2o=;
	h=From:To:Cc:Subject:Date:From;
	b=PhRgty/5PeR+PlnmJV5NrLHxUn/sswpnWWAy9DdeZ0qO6aTLxAQAqKKeLYFDribkJ
	 +8atjdol3mg/7pMiKnCn1N/sj08v56disC7ZI5jAis5GwtVZZV8QNgv6VUcYCVxEf8
	 DtAYyeXd8CWbUeoZ4goBXaI2uYVPatGbES89GWTQf1hYGgynnm5reDK//OQkWDd4cH
	 JdaQVc6mywVRwGON6KYnQ81D5vBZgS3CXFg/BD7EOwOpPc9uwVvDGj7jolOx2JeK07
	 sdjCQjZKjrG6nqZ+IOq0LM3J8wqVomycANZkQ95aL5/sLHxzbIGbTGMFK8MsNxSaMr
	 +rqfdP/Mvya1Q==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: marek.vasut@gmail.com,
	Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] u-boot: upgrade 2020.04 -> 2020.07
Date: Mon,  6 Jul 2020 22:35:35 +0200
Message-Id: <1594067735-18874-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See https://lists.denx.de/pipermail/u-boot/2020-July/418797.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                               | 2 +-
 .../u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb}         | 0
 meta/recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index f479053..9199bbf 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "1079ec0a77c3fda510f07860b2549c47f3a46c21"
+SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2020.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.07.bb
-- 
2.7.4


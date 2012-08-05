Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70y-0004kh-6h
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:28 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SpcAWWRTWgSGmjR1u2nUmoxa5tDwgHfIWywcU5j9LIQ=;
	b=BQN2Z+Wd74V4sz4R4h+dOSZ/bZSV1K2+g1CEGd69v1I8GYMafYa62F/DqweOxS/Ww9
	5EZ1e6N9vFIU4wxHvliuAjZLm1JCAWXrnQJfV08H7GK5B/IUt0C1F8NMhsdFyMFcAQWz
	EK/ky0P+cjlZOHBomfGqQf5RseKkCFQyGbqPl5N9W3dX65QQrY4opLbH7ZhpcqCm7NgV
	pbbNaW/usXyICFU1cs4nswC+idsgXLzzvAJN/rcppraB/xO6pJIJJf64tQ9ES10eU+qo
	WJaOr/YitC3MBLS6/Cx7lMnczqHf/RikkcJ3QspNDVERuMq/Z9NNsXodvG/Q3O52Mrno
	Vhsg==
Received: by 10.180.86.226 with SMTP id s2mr12397070wiz.9.1344196186804;
	Sun, 05 Aug 2012 12:49:46 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:46 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:35 +0200
Message-Id: <1344196136-7643-8-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkbIaWeaGV9vVyzIAsu2NwYkRrI3UKwIC71KE5J65l5Dq4Sr3/PEK51VcNZlDrfuKlpmXCb
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 07/28] useradd-example: use ${datadir} instead of /usr/share for packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 20:01:28 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |   36 ++++++++++----------
 1 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index b10c1d0..53d2340 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Example recipe for using inherit useradd"
 DESCRIPTION = "This recipe serves as an example for using features from useradd.bbclass"
 SECTION = "examples"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -43,32 +43,32 @@ GROUPADD_PARAM_${PN} = "-g 880 group1; -g 890 group2"
 GROUPADD_PARAM_${PN}-user3 = "-g 900 group3"
 
 do_install () {
-	install -d -m 755 ${D}/usr/share/user1
-	install -d -m 755 ${D}/usr/share/user2
-	install -d -m 755 ${D}/usr/share/user3
+	install -d -m 755 ${D}${datadir}/user1
+	install -d -m 755 ${D}${datadir}/user2
+	install -d -m 755 ${D}${datadir}/user3
 
-	install -p -m 644 file1 ${D}/usr/share/user1/
-	install -p -m 644 file2 ${D}/usr/share/user1/
+	install -p -m 644 file1 ${D}${datadir}/user1/
+	install -p -m 644 file2 ${D}${datadir}/user1/
 
-	install -p -m 644 file2 ${D}/usr/share/user2/
-	install -p -m 644 file3 ${D}/usr/share/user2/
+	install -p -m 644 file2 ${D}${datadir}/user2/
+	install -p -m 644 file3 ${D}${datadir}/user2/
 
-	install -p -m 644 file3 ${D}/usr/share/user3/
-	install -p -m 644 file4 ${D}/usr/share/user3/
+	install -p -m 644 file3 ${D}${datadir}/user3/
+	install -p -m 644 file4 ${D}${datadir}/user3/
 
 	# The new users and groups are created before the do_install
 	# step, so you are now free to make use of them:
-	chown -R user1 ${D}/usr/share/user1
-	chown -R user2 ${D}/usr/share/user2
-	chown -R user3 ${D}/usr/share/user3
+	chown -R user1 ${D}${datadir}/user1
+	chown -R user2 ${D}${datadir}/user2
+	chown -R user3 ${D}${datadir}/user3
 
-	chgrp -R group1 ${D}/usr/share/user1
-	chgrp -R group2 ${D}/usr/share/user2
-	chgrp -R group3 ${D}/usr/share/user3
+	chgrp -R group1 ${D}${datadir}/user1
+	chgrp -R group2 ${D}${datadir}/user2
+	chgrp -R group3 ${D}${datadir}/user3
 }
 
-FILES_${PN} = "/usr/share/user1/* /usr/share/user2/*"
-FILES_${PN}-user3 = "/usr/share/user3/*"
+FILES_${PN} = "${datadir}/user1/* ${datadir}/user2/*"
+FILES_${PN}-user3 = "${datadir}/user3/*"
 
 # Prevents do_package failures with:
 # debugsources.list: No such file or directory:
-- 
1.7.7.6




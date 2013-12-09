Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 54D3A6DF99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 17:10:39 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so1693160eek.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 09:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qog0bUmKa5C6a00ZI9l6kp/2CKxMVixf5qoeD7qqXig=;
	b=B8kPri/eIT7eE+0qg45oFvuSMO+Nhd40+SZccBZdbt7/nMequnNCIp+ZeNfh6ME94Z
	qUJCWslUlQd1hWzNbbMv8AZqgFC2z1DIjKQxXKsOrY8fUqQ3+qFlus3WWPvjF0iurqQh
	F2NXTc4FIiVI310obD/A7Hy0P4DWcvxpMtHUlqtgKJgUUovnTKLGwu/f9m1uhV1gmme4
	v4vOux8WUGjeREh0n+EptTH3oi3WJ6kWrknoBcIPL+SK1oqnZF8YY3RXquYt9QfBcB9Z
	j/+w7piqNlIOHFxJARECeLu55yWHciQEHzuf18kTlVzVZ1grxpdRu7TsMKT8PpVIDfeg
	kIkA==
X-Received: by 10.15.83.8 with SMTP id b8mr13675574eez.6.1386609038442;
	Mon, 09 Dec 2013 09:10:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm30987207eel.2.2013.12.09.09.10.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 09:10:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 18:10:54 +0100
Message-Id: <1386609055-8901-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH 1/2] makedevs: Respect LDFLAGS
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
X-List-Received-Date: Mon, 09 Dec 2013 17:10:40 -0000

* fixes ERROR: QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
index 6e197b6..17b9fce 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
@@ -13,7 +13,7 @@ do_configure() {
 }
 
 do_compile() {
-	${CC} ${CFLAGS} -o ${S}/makedevs ${S}/makedevs.c
+	${CC} ${CFLAGS} ${LDFLAGS} -o ${S}/makedevs ${S}/makedevs.c
 }
 
 do_install() {
-- 
1.8.4.3



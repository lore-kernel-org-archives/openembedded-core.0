Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjb1g-0002AW-HN
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 20:34:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1821272bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FVncm/fCqI+foVIqNkuAXz9OUgv6J8prz9QYaJUPPoM=;
	b=NXbQhlVBWur5G1EhandbE7Xm065L2gdOJ4JSrG9qtpCEyY9ZNurs6rWs+V8bYkbHQp
	QohYzAqZdSzs2nEorMK5S00htb56RSNLVop6kvL4zbWkYa7Xx2SBBXEaNYSz0VAgH4C0
	ovf4jTAzciQN8s33blfnbOrd14eb7yUum/WPJ+tg2FKscgffp4HdQ/5q3b6jPUT0g2Oq
	qEgs5XscXMHHo1JMsl3Y+llr6VOmoHTA/Wnsk5KeGHHk/b9tGo0V9mej/+EX3pAuMg1V
	oPNt7Lw2OIazHeBNof8iaf+JAoNUdwjUnr9t6e8sp+MXH6vVLZN7FFMKgBPsMLgi8rUe
	KyxQ==
Received: by 10.204.154.202 with SMTP id p10mr3245014bkw.29.1355512791909;
	Fri, 14 Dec 2012 11:19:51 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id z5sm5492876bkv.11.2012.12.14.11.19.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 11:19:50 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjanU-0001dw-Sa; Fri, 14 Dec 2012 21:19:48 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 21:19:44 +0200
Message-Id: <1355512785-6255-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355512785-6255-1-git-send-email-cazfi74@gmail.com>
References: <1355512785-6255-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] help2man: update to upstream version 1.40.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 19:34:28 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{help2man-native_1.38.2.bb => help2man-native_1.40.13.bb}    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.38.2.bb => help2man-native_1.40.13.bb} (78%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.40.13.bb
similarity index 78%
rename from meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.40.13.bb
index bea7fe9..9413f52 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.40.13.bb
@@ -3,11 +3,11 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "autoconf-native automake-native"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "426671c6fe79e5ef2233303367eab5a6"
-SRC_URI[sha256sum] = "952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1"
+SRC_URI[md5sum] = "ecbc98f1f146e404e85d7bef520b34d8"
+SRC_URI[sha256sum] = "15d3b6ebbac90f6d2a21480ba5e33c03b480a342ce498a84b1804f03d75358ba"
 
 inherit autotools native
 
-- 
1.7.10.4




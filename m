Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjT8Q-0002Fb-KG
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 12:08:57 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1516315bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 02:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=i7TVc43nHYwasjxKa8EohO0t/RHjRivp4/HivmNMARA=;
	b=Mv7aRQNohCxnwLtaAsqHmuvVid0TLNAat0KtvITJhq+6wvD2w9brF6gg+YMil/FbDA
	C1w4HNuLlGq3xssJC/W7Gs8FVv8XcvrQWckWuq8jZFKtmJqJE9AX13BlnL52re1cHFeN
	uYH8ZCYrfrnBcJGnflrt21CvUSR0JCWXJg7bSPuI7+QL3Wra8JibZ9meJhTBSXzbDYae
	zFslJbxf1SUnEhtoSh8cYXvO2QlBUxBEpocBSNzbGktq7bZ5bsSeTClJkqxo5wZTq7fn
	ivQ62Qzz31XGzWITtC/WX/hIkE5CaNOkE/6LIXg6c+at/ZHNpxny9nTEHACaMWWfKAt7
	rrOw==
Received: by 10.204.148.195 with SMTP id q3mr2495966bkv.122.1355482458406;
	Fri, 14 Dec 2012 02:54:18 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id z5sm3930809bkv.11.2012.12.14.02.54.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 02:54:17 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjSuF-0006bJ-1X; Fri, 14 Dec 2012 12:54:15 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 12:54:13 +0200
Message-Id: <1355482453-24777-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] gdb: update to upstream version 7.5.1
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
X-List-Received-Date: Fri, 14 Dec 2012 11:08:57 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc                           |    4 ++--
 .../gdb/{gdb-cross-canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} |    0
 meta/recipes-devtools/gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb} |    0
 meta/recipes-devtools/gdb/{gdb_7.5.bb => gdb_7.5.1.bb}             |    0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.5.bb => gdb_7.5.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index ea4098c..9eb6b60 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -22,8 +22,8 @@ inherit autotools
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "c9f5ed81008194f8f667f131234f3ef0"
-SRC_URI[sha256sum] = "8dcf38dd04f7f031b51d0672050d6b14626302ddc24d74e486b4666335de2df3"
+SRC_URI[md5sum] = "b1519bf899890d21d4774845a6e602fe"
+SRC_URI[sha256sum] = "f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.5.bb b/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.5.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.5.bb b/meta/recipes-devtools/gdb/gdb_7.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.5.bb
rename to meta/recipes-devtools/gdb/gdb_7.5.1.bb
-- 
1.7.10.4




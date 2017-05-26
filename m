Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id DBAA47829E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:25:55 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v4QDPurk001397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 15:25:56 +0200
Received: from dev.sbt.siemens.com ([163.242.57.214])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v4QDPt5c029465;
	Fri, 26 May 2017 15:25:55 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 8404C40AFD;
	Fri, 26 May 2017 15:25:55 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:25:30 +0200
Message-Id: <1495805130-29803-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] freetype: 2.7.1 -> 2.8
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
X-List-Received-Date: Fri, 26 May 2017 13:25:56 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-graphics/freetype/{freetype_2.7.1.bb => freetype_2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.7.1.bb => freetype_2.8.bb} (93%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.7.1.bb b/meta/recipes-graphics/freetype/freetype_2.8.bb
similarity index 93%
rename from meta/recipes-graphics/freetype/freetype_2.7.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.8.bb
index 544f835..8e88e84 100644
--- a/meta/recipes-graphics/freetype/freetype_2.7.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.8.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "b3230110e0cab777e0df7631837ac36e"
-SRC_URI[sha256sum] = "3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88"
+SRC_URI[md5sum] = "2413ac3eaf508ada019c63959ea81a92"
+SRC_URI[sha256sum] = "a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
2.1.4



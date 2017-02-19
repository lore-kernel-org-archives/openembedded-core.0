Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB1C86612D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 14:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JEErYg025854; Sun, 19 Feb 2017 14:14:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cB_coJXnzCMh; Sun, 19 Feb 2017 14:14:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JEEnXd025844
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Feb 2017 14:14:52 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cfSGG-00076Y-My; Sun, 19 Feb 2017 06:14:48 -0800
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2017 06:14:44 -0800
Message-Id: <1487513684-27271-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wget: Upgrade 1.19 -> 1.19.1
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
X-List-Received-Date: Sun, 19 Feb 2017 14:14:56 -0000

This fixes musl build issues and avoids autobuilder failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/wget/{wget_1.19.bb => wget_1.19.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.19.bb => wget_1.19.1.bb} (53%)

diff --git a/meta/recipes-extended/wget/wget_1.19.bb b/meta/recipes-extended/wget/wget_1.19.1.bb
similarity index 53%
rename from meta/recipes-extended/wget/wget_1.19.bb
rename to meta/recipes-extended/wget/wget_1.19.1.bb
index 3e022d5..62313b2 100644
--- a/meta/recipes-extended/wget/wget_1.19.bb
+++ b/meta/recipes-extended/wget/wget_1.19.1.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "f9e928e293e4d7de73ff6f19e0c4b423"
-SRC_URI[sha256sum] = "dd9523039845f69e8e945e9f2d5a38af6b1e29efa6ff53830507310235ddade8"
+SRC_URI[md5sum] = "87cea36b7161fd43e3fd51a4e8b89689"
+SRC_URI[sha256sum] = "9e4f12da38cc6167d0752d934abe27c7b1599a9af294e73829be7ac7b5b4da40"
 
 require wget.inc
-- 
2.7.4



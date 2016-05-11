Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72B877017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D83031812A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id p+u8dL9GgugY
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:20 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 72ABA1812D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5D27115E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5C4BE14B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5A8221022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRJjs028710
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRJmx028709
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:16 +0200
Message-Id: <1e998c59ed99fc467f822e423971deefcf487562.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 16/16] font-util: Remove ${datadir}/fonts from SYSROOT_DIRS_BLACKLIST
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
X-List-Received-Date: Wed, 11 May 2016 17:27:21 -0000

---
 meta/recipes-graphics/xorg-font/font-util_1.3.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
index 2285124..34646ff 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
@@ -19,7 +19,4 @@ BBCLASSEXTEND = "native"
 SRC_URI[md5sum] = "23756dab809f9ec5011bb27fb2c3c7d6"
 SRC_URI[sha256sum] = "aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921"
 
-SYSROOT_PREPROCESS_FUNCS += "fontutil_sysroot_preprocess"
-fontutil_sysroot_preprocess () {
-	sysroot_stage_dir ${D}${datadir}/fonts/ ${SYSROOT_DESTDIR}${datadir}/fonts/
-}
+SYSROOT_DIRS_BLACKLIST_remove = "${datadir}/fonts"
-- 
2.1.0



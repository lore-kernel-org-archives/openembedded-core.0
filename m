Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1C3793BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 270931849C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eh3AQBViDYoo
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2B00218454
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FB311E092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 047E01E091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id EC8791FB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w8OJ3HqC032092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w8OJ3HJq032091
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2018 21:03:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 21:03:11 +0200
Message-Id: <20180924190313.32027-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] acl: Make it compatible with externalsrc
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
X-List-Received-Date: Mon, 24 Sep 2018 19:03:21 -0000

Make the subdir fetch path for configure.ac relative. This avoids the
following error after having done `devtool modify acl`:

ERROR: acl-2.2.52-r0 do_unpack: Unpack failure for URL:
'file://configure.ac;subdir=.../builds/qemux86-64/workspace/sources/acl'.
subdir argument isn't a subdirectory of unpack root
.../builds/qemux86-64/tmp/work/core2-64-poky-linux/acl/2.2.52-r0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 8f3dc45cf7..8b89de9b42 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
-           file://configure.ac;subdir=${S} \
+           file://configure.ac;subdir=${BP} \
            file://run-ptest \
            file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
            file://test-fix-insufficient-quoting-of.patch \
-- 
2.12.0



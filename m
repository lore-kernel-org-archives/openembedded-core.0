Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A00B79202
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 55B2E1832D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id P7sJpLPCv08F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BFE08182C9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE7011E07F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A33C71E060
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9766C279B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39UaID011338
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:30:36 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39UaSF011337
	for openembedded-core@lists.openembedded.org;
	Sat, 3 Nov 2018 10:30:36 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:30:26 +0100
Message-Id: <20181103093029.11289-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181103093029.11289-1-pkj@axis.com>
References: <20181103093029.11289-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/5] apr: Trim license info extracted from apr_lib.h
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
X-List-Received-Date: Sat, 03 Nov 2018 09:30:37 -0000

Two unrelated lines were extracted from apr_lib.h for the license
information.

License-Update: Only extract the relevant part from apr_lib.h
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/apr/apr_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.6.3.bb b/meta/recipes-support/apr/apr_1.6.3.bb
index e044c4a9a5..7bfb69855a 100644
--- a/meta/recipes-support/apr/apr_1.6.3.bb
+++ b/meta/recipes-support/apr/apr_1.6.3.bb
@@ -5,7 +5,7 @@ DEPENDS = "util-linux"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
-                    file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
+                    file://include/apr_lib.h;endline=15;md5=823b3d1a7225df8f7b68a69c3c2b4c71"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.12.0



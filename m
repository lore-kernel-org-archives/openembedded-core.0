Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B89979FE8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EA8A61813C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id b0gIc2h7nKFX
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CCD17182DA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC90A1E060
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B06F81E088
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A4D262878
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39UaAA011342
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:30:36 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39UaM9011341
	for openembedded-core@lists.openembedded.org;
	Sat, 3 Nov 2018 10:30:36 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:30:27 +0100
Message-Id: <20181103093029.11289-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181103093029.11289-1-pkj@axis.com>
References: <20181103093029.11289-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/5] apr-util: Trim license info extracted from apu_version.h
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
X-List-Received-Date: Sat, 03 Nov 2018 09:30:38 -0000

Two unrelated lines were extracted from apu_version.h for the license
information.

License-Update: Only extract the relevant part from apu_version.h
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 12d71cbb68..0c90f8d252 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -7,7 +7,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=158aa0b1efe0c12f23d4b007ddb9a5db \
-                    file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
+                    file://include/apu_version.h;endline=15;md5=823b3d1a7225df8f7b68a69c3c2b4c71"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-- 
2.12.0



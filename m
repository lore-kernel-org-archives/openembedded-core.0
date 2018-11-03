Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C429F79FEC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 976BD182C9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UQzr7L5U_PfV
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DC7D1182DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7AF01A07B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCDEE1A075
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B16DB2925
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39Ua7Q011346
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:30:36 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39Ua5O011345
	for openembedded-core@lists.openembedded.org;
	Sat, 3 Nov 2018 10:30:36 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:30:28 +0100
Message-Id: <20181103093029.11289-4-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181103093029.11289-1-pkj@axis.com>
References: <20181103093029.11289-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/5] libgpg-error: Trim license info extracted from init.c & gpg-error.h.in
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
X-List-Received-Date: Sat, 03 Nov 2018 09:30:39 -0000

License-Update: Only extract relevant parts from init.c & gpg-error.h.in
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 4f3e3d86cc..a6ca982c0e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -5,8 +5,8 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=19;md5=e9be7dd9dc7686d91b5421a091c212cc \
-                    file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=524d4e810c4dcdc38e4fa28e70a13bf8 \
+                    file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7"
 
 
 SECTION = "libs"
-- 
2.12.0



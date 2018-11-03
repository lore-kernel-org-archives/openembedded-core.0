Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E612379FD6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B15781813C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id LLobyXyGvWSz
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E6317182EC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D46871E088
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C93231E07F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id BD9CF279B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39UauC011350
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:30:36 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39UaQl011349
	for openembedded-core@lists.openembedded.org;
	Sat, 3 Nov 2018 10:30:36 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:30:29 +0100
Message-Id: <20181103093029.11289-5-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181103093029.11289-1-pkj@axis.com>
References: <20181103093029.11289-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 5/5] pixman: Trim license info extracted from pixman-matrix.c
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
X-List-Received-Date: Sat, 03 Nov 2018 09:30:40 -0000

Four unrelated lines were extracted from pixman-matrix.c for the
license information.

License-Update: Only extract the relevant part from pixman-matrix.c
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
index c4ca621a8a..c290fa4614 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 LICENSE = "MIT & MIT-style & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
-                    file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
+                    file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
 DEPENDS += "zlib libpng"
-- 
2.12.0



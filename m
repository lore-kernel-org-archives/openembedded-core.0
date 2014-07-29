Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6491F65ED3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 11:27:29 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 29 Jul 2014 13:27:25 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 153F4288F33;
	Tue, 29 Jul 2014 13:27:26 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 13:27:22 +0200
Message-ID: <1406633242-28359-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] i2c-tools: Uprev to 3.1.1
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
X-List-Received-Date: Tue, 29 Jul 2014 11:27:31 -0000
Content-Type: text/plain

1. Updated the SRC_URI to http://dl.lm-sensors.org/i2c-tools/
2. Corrected the License to GPLv2+ as the "COPYING" file include these
   statements:
   "This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version."

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../i2c-tools/{i2c-tools-3.1.0 => i2c-tools-3.1.1}/Module.mk      | 0
 .../i2c-tools/{i2c-tools_3.1.0.bb => i2c-tools_3.1.1.bb}          | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools-3.1.0 => i2c-tools-3.1.1}/Module.mk (100%)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.0.bb => i2c-tools_3.1.1.bb} (65%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools-3.1.0/Module.mk b/meta/recipes-devtools/i2c-tools/i2c-tools-3.1.1/Module.mk
similarity index 100%
rename from meta/recipes-devtools/i2c-tools/i2c-tools-3.1.0/Module.mk
rename to meta/recipes-devtools/i2c-tools/i2c-tools-3.1.1/Module.mk
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
similarity index 65%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
index b8be9ed..3980cf4 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Set of i2c tools for linux"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} += "perl"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/i2c-tools/i2c-tools-3.1.0.tar.bz2/f15019e559e378c6e9d5d6299a00df21/i2c-tools-${PV}.tar.bz2 \
+SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${PN}-${PV}.tar.bz2 \
            file://Module.mk \
 "
-SRC_URI[md5sum] = "f15019e559e378c6e9d5d6299a00df21"
-SRC_URI[sha256sum] = "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b26a706094ca4c142a"
+SRC_URI[md5sum] = "0fdbff53ebd0b8d9249256d6c56480b1"
+SRC_URI[sha256sum] = "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700"
 
 inherit autotools-brokensep
 
-- 
1.9.1



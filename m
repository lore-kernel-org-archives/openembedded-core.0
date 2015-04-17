Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 22E8973D5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 03:23:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90812571"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2015 11:19:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3H3Lori004892
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 11:21:50 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 17 Apr 2015 11:23:05 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2015 11:21:38 +0800
Message-ID: <1429240898-42968-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH] libgcrypt: modified the license of dumpsexp.
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
X-List-Received-Date: Fri, 17 Apr 2015 03:23:09 -0000
Content-Type: text/plain

Because dumpsexp.c is GPLv3. So pick up the dumpsexp and modified license to GPLv3.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index eea67aa..683be78 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -4,7 +4,11 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
 
 # helper program gcryptrnd and getrandom are under GPL, rest LGPL
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
+LICENSE_dumpsexp-dev = "GPLv3+"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
 
@@ -35,7 +39,10 @@ do_install_append() {
 	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 }
 
-FILES_${PN}-dev += "${bindir}/dumpsexp ${bindir}/hmac256"
+PACKAGES =+ "dumpsexp-dev"
+
+FILES_${PN}-dev += "${bindir}/hmac256"
+FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.4.2



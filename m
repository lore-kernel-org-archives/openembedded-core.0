Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 054397D65D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 12:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44d8N93Vyqz8p
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 14:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554725338;
	bh=MJodrBYrQe+fMXqoSH7eAD0oRG3Bwqih6o/SSLkoen0=;
	h=From:To:Subject:Date:From;
	b=bVsPt96FwAoJHE9GQ7OdwS9ajxlSE2MekPrSG7dRi+tWXcYM1vtR3LvtkkK5Ei+LM
	mQiHCSPMk2Bqg8uFQeFaCgoHu+2ih4SKSwwa/49i2mKuOwe/EsczrI2nJJW3z6jJw2
	CNMNRLq13hj4ZWeZ3ubA0xJvaOV4IP7aN95Qqql8Fy+QQ8Ofaqz5sAE3NpsHXJ0sw6
	aVVZf2iSKz7MTwTZCdWpZXYKDcmNFeOTheOfkwz6PSSHa4DdTL3ZFaLIFIbvWEdXgj
	90U5C8U7PKP4aAilrA517wNTw/IWhogpmyTpzEKCx2Sed1Vr/CXg8VA4aPX3QCwjCU
	UcndARlqeCkfcRw8Am0WlTOsPO0s2kmLlGoM6lTr91LlkRP3fT6nMpMsNbpYozbJf/
	DVpqI6EOw02NrSK1rzkV07QuorjasgQw5vz8XyMhRoHTIxlrnma/GrvOn+xSPK3t6c
	Jg9+vFR3+9BqBFT7vXhWpaKpHml3lv/eopIQBt3Rq2OxdX73IJCO7zZQG1NGqisGtA
	1Za1ohvaQiDd6g52yoiOFR8DTObDvCRc4QZQzbv4/UBXQbxfS9PWQlRifOQjZ0b755
	NN6u4r4N1zECPXHdPwJ1cuH9zSNV0+qu5lHlXw8tNVNbpcDJDplXxH8EtNrp5sKRXY
	15HjqLnipnrau7VSSHIGSCIE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 15:08:55 +0300
Message-Id: <20190408120856.18831-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnutls: upgrade 3.6.5 -> 3.6.7
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
X-List-Received-Date: Mon, 08 Apr 2019 12:08:58 -0000

This is a new upstream release from the same stable branch
bringing new features and bugfixes (including CVE fixes).

COPYING changed http -> https.

configure no longer has a --without-libunistring-prefix option.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb}            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} (88%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.5.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
similarity index 88%
rename from meta/recipes-support/gnutls/gnutls_3.6.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.7.bb
index dfc35079da..e05dc2b57d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
@@ -9,7 +9,7 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
-                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
                     file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
-SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
+SRC_URI[md5sum] = "c4ac669c500df939d4fbfea722367929"
+SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
@@ -44,7 +44,6 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.17.1



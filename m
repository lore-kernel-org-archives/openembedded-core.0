Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0433160290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 12:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44d8NB1XDJz96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 14:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554725338;
	bh=/8zs0kYN1TSvXsbnEtY/Rj4RCI2ghY2MiKg0mTzCU18=;
	h=From:To:Subject:Date:From;
	b=NjefmCA0UEhKRgBYwacjrAQIcSNHzQs/yB/FJAfTJ5wDWCSr8j7RglPs1O3FANIDh
	wdNn+WKw23vjsKW80uBunshHmj5qCLzI8EHKM+jzzxCslbtTiLetkysmzcfBwTbJ6s
	Y6l0GhZXTFf4AvkS4pswIOTHcyiMdMrYuHKrkMm60GDRVfSkPMcxgA2+T56l7ZwHpC
	OmRvSDyQIz50tQAUFSSuMMKe9aeFsrwrKHucFKqWTaMB9bfIfFvrZY8Sjf56IdOCFf
	iZAamjAlogvVa832BuOu+WTCSD9l8+Rf7ufjCSZpt14yrbHlJTk+Yp2hCXwx/pGoNB
	UBZDFKO3CcHmnMtiOaBme9o8nT0U2Zf+Psamr8gwP94jyP+lJcR8+36nPz7Lqp+vRn
	EqL9YvOsgd526Nd/3cffuD2xiO0xEGHBWyTI81hlaOawb/aImbb8Wu5Cnh+haovv63
	CbLXF0bQMzibjQADrLhPiZ9M0bk1oJ9ip8drYFLnkBunPzZrJZ5vdMRhhENWDB0+gy
	/3ZuUVDTsBqJW0x9zfAmZcV0rIB2Pucys/npm15pnzL5rJf5BOM1MGJLoHWoTTFkf1
	XJqshBEKKwMZh+Oe7dUl7dD1gzT91PWsKBQfpGH6KYcqsLsaGJywbObLTPhZlO29FS
	IawzTMgi0R27jxnl/RjaZjsI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 15:08:56 +0300
Message-Id: <20190408120856.18831-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bind: upgrade 9.11.5 -> 9.11.5-P4
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

Bugfix-only compared to 9.11.5, mostly CVE fixes.

COPYRIGHT checksum changed due to 2018 -> 2019.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
rename to meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 67672792b1..1355841e6b 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -22,8 +22,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
 "
 
-SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
-SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
+SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
+SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.17.1



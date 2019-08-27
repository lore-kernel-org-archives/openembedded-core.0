Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E9FCA7CEF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HdL9640yz3J
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566885122;
	bh=qlLh/DDg0sqPA66ad39KgLrUn9cNQ7sg4oUey78IBOw=;
	h=From:To:Subject:Date:From;
	b=QfkNVFY53wFEaHfw2GgeIISOEnA6nmXvjqV328EAKiAZFVYm1mZDSLTCdK8ONscv0
	s6JwcRR1txxOd3F9A7d4BNTc4D971ZQdOqtNSiXr/D4Nm9aYEtUhunJh+ajrXYV74z
	RGC9H2V+teib9SHlnirIa2GFEjCL0MYxVo6mlmFVocyvOLhVj/NKL3+AfAFRwk1Hhg
	nkRg5gKHK7O1+R2vhSsvy+U61wqwvDAv45qHwGWlPH4SMMg2Ws2Z3LxsZaZn+OXMY+
	B1YKOQGPiLtDOV8Xs2czXu2LnQKdMQyo8xyjwL/jDSunCRZxTkCBt7oYIOlw87JHtH
	sAX+zNz3FlE1M/C9y9GWscOowIvN9PI5eKlGXKIAHIdFe3Xe+aKag0T6P16nYEaaBR
	xkPemNCxrLQR7x/TpjrMxL8Njdst8e1LLcCne7GHawW+7bzDiFawnBPmTZBHz2Hwta
	lOF8xSWTP6mFzK2EgBgNjFrYgUHTz97qWaRdrOWorP5Vp1R72rFMUQWxQNf86WUyn8
	RFAxGDTJNVCjOmoOaUvyghhCO92u9qNGF0+wOPeiPMTD4ZdH6l9uF/vRO68JRSUred
	8sZ0P0F8fr2QD6L0z7/UeLIjS+MKH6wu4Rp7PZvt1hvwehYASRJ/RhMFjor9NEPen/
	W2FuFYhIEtZZuXYdnydHrDus=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 08:51:56 +0300
Message-Id: <20190827055200.3690-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] help2man: Upgrade 1.47.10 -> 1.47.11
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
X-List-Received-Date: Tue, 27 Aug 2019 05:52:02 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...{help2man-native_1.47.10.bb => help2man-native_1.47.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.10.bb => help2man-native_1.47.11.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.10.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.11.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.10.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.11.bb
index 5feaeea139..a60e851897 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.10.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.11.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "0d70833650a552e0af742882ba84f2ee"
-SRC_URI[sha256sum] = "f371cbfd63f879065422b58fa6b81e21870cd791ef6e11d4528608204aa4dcfb"
+SRC_URI[md5sum] = "dd322adcaede5bd5eaed075ff8971bc1"
+SRC_URI[sha256sum] = "5985b257f86304c8791842c0c807a37541d0d6807ee973000cf8a3fe6ad47b88"
 
 inherit autotools native
 
-- 
2.17.1



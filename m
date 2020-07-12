Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web12.3221.1594526918015086734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=iqsOlouu;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id 35F731940ABA
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 00:08:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 12 Jul 2020 00:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TqJhKobRGQPY11Xvz
	Zkcp+u+LT3SkcCeJwMgI6TM390=; b=iqsOlouut+nMe2c0p9VGNZdy4n44jBlqw
	J0kXoZYeC7i4ICcU4vBG9Ww0h/xJOzEpnCeCuJTc4PXov8RHZuugz4CSt9gdNvlp
	PJ0j4fGCuhEM+L4zNzlYRIIhGOKpCGrZSrjgvqaztvh5jgDF+tehgDpquvjp4Xka
	Fen7k2PfeY+dbId51fvQTetnRVKWZdryswGdIm293FKxoTMbjO+8xX32uw17OCLI
	gbDlFjnuhjbQx6JwHSCXQ6FlJoLlJ0WF4GghMJBoOPG0T6un5/3XN5cpKRl+GDKG
	QYH4J2yQXWbANOcLZSkgjqjPN2B5NQ7RiVKGFoVFAT3+rhkZn0Y9g==
X-ME-Sender: <xms:xIwKX2i80bFCMfSe8eofc9AF94hk85-eEOxIF6wtM5IlR7ance7zzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvdeggdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhi
    qeenucggtffrrghtthgvrhhnpeffueeugeegvddtudeludehledvkefftddtgeejheehvd
    efudeiffekgfeiteettdenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhg
    necukfhppeduleeirddvgeegrdduledurdelkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:xIwKX3DEaE353IT23lzE2wujSOMO7paSLpjU3z33-DojIpchLrMKuQ>
    <xmx:xIwKX-GbuEQfs14i3x52FS0hWUsiaDiY4pX20QcIuqae-wyxS_7pVA>
    <xmx:xIwKX_Tw9TQ6XgIgMPJ2f0-GNc4joU2fIzPK-_JK0rLZhYFrQBwtUA>
    <xmx:xYwKX_g23KkH_iyQCoAtFpa17FjQHBrd4orTiAs3jLQHaG-tdoguJQ>
Received: from localhost.localdomain (unknown [196.244.191.98])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1CA94328005A
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 00:08:35 -0400 (EDT)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-lib: upgrade 1.2.3.1 -> 1.2.3.2
Date: Sun, 12 Jul 2020 07:08:24 +0300
Message-Id: <20200712040824.54528-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.3.1_v1.2.3.2

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-lib_1.2.3.1.bb => alsa-lib_1.2.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.3.1.bb => alsa-lib_1.2.3.2.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb
index 1eb56f4053..1ed1a7b9a3 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1244585515fbebce7d0e53656c1fb614f99accb8413115ce3efb9a9309c4c892"
+SRC_URI[sha256sum] = "e81fc5b7afcaee8c9fd7f64a1e3043e88d62e9ad2c4cff55f578df6b0a9abe15"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


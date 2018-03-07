Return-Path: <earwigz32@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id D85FE789E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 06:42:45 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w22-v6so810728pll.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 22:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xVyD6DC2Ku+zwthHdn+50LuiBXWUL+kWQAPbGf8XLV4=;
	b=l3qYaSqBItAQ3vHp+gEYyCaH4Pwf+3gapkW0DcV0xiJircbMLx0y6zSS4gqoc0qc+u
	ID6JLDjDYCWZ4CuHGCj72M65lnkXjOYCY07ONfEH/Lari6rk65nQnOWGsROZuh/0PaQi
	gt24tniKV3HWwU0gzxkM2lA88Psdo+QSOIv5g1He2czLpkXVHAuTf2w8q9gSC7qxCUWz
	ERGRVVKH3quGQYLtKYSn91ThKOERNWN8QrUH336pzHIQ4CTO/fVkqhFkbtA6fP2D6n1r
	AWcRix407ANCSyBFB7johogXeepeqfrCU839omO0yh0DiscP55blgQHhRvu4Zc2kGnUD
	frqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVyD6DC2Ku+zwthHdn+50LuiBXWUL+kWQAPbGf8XLV4=;
	b=ebSDu6Gr0EZnHwtDSZZINb1bo46ynF25pNxw7zPW7avrSTsLD26fQT9QtVNO0S7mM9
	l/7m9V6UNiK+MO/GNDPINRGBgPoEQuXqb67BlTEiZ9fuZNkymp7b2FesUd/oGgugaDPC
	8RVhJhkZuaVylaututaaVSdM7+V4QU8SI1goQaBUR6wJz+v4WLNBnMKQzVLBdulg1azm
	j1JKkYOdZcQLpmJiG6FVs6CbCfiKwAvBxwWbfiAVW+SiHTTiBelgx4fS+gO4QPCqbdKy
	Tg2gVApxv/i6izvRSLdItqJLCkzRks0hmOukM0cRQ7H7zAQEIlX3HO2LX41CiGB2rV2c
	9nfw==
X-Gm-Message-State: APf1xPDK9tACYpuH/+YsaWUxQoDRpUo+z1QK/3R7/OiKEu+X/gOPJxVV
	Rh+jLGyP/PCJsj1oaPgBvHXYMQ==
X-Google-Smtp-Source: AG47ELuoJ/8u5/j2dD5NaahNuJjVe8oLcA9TX9b5DiIGZl1l7aFblho0C8g3YyZU5rc0d36uBBDGKw==
X-Received: by 2002:a17:902:ab89:: with SMTP id
	f9-v6mr19036955plr.369.1520404966845; 
	Tue, 06 Mar 2018 22:42:46 -0800 (PST)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id
	q76sm34129919pfj.149.2018.03.06.22.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 22:42:45 -0800 (PST)
From: youngseokyoon <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 15:40:33 +0900
Message-Id: <1520404833-3908-1-git-send-email-earwigz32@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpng: Upgrade 1.6.32 -> 1.6.34
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
X-List-Received-Date: Wed, 07 Mar 2018 06:42:46 -0000

License-Update: License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseokyoon <earwigz32@gmail.com>
---
 .../libpng/{libpng_1.6.32.bb => libpng_1.6.34.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.32.bb => libpng_1.6.34.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.32.bb b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.32.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.34.bb
index d93e72c..88ea586 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=53f2df0e62ce82307cd1389a9f41e4cf \
-                    file://png.h;endline=144;md5=591cf1f8d84a757af46e43c2b9b5ddd9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2db717a05a20e36f2fa673265bd31568 \
+                    file://png.h;endline=144;md5=3ac9fd250a8786ae581e34254bf79429"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "e01be057a9369183c959b793a685ad15"
-SRC_URI[sha256sum] = "c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b"
+SRC_URI[md5sum] = "c05b6ca7190a5e387b78657dbe5536b2"
+SRC_URI[sha256sum] = "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.7.4



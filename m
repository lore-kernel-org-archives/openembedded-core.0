Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA26F7825B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:15 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v14so14509627pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vkre5/9wKHqMsIh/32oWXbD7bK/BrkMhrIQVtltOI2I=;
	b=pJwgRoq57zr4IdImdHZa5TE7W437jOUgPV+K8rzYVe3HXe14tDD/Ow4oPG/rZCluBP
	xKVh+UfeXd7BplpyKPtks1RcE/zInXFa5Lo55HqxViaADmdiTqsDoyrjYBKp4Jjrbcrn
	2415l1I6vsY6iZV56e5zbmSakdKOkGkjdjFEEumnbgMmkLqeglQ9zwrsdl3VKvd66Qq6
	Z4hs9kNM/6VKWhzx99qtnxnJhBwEgMDUQqW6Ps8hKSraun/xrbEseZI2P6iceBouTgxx
	9ulJFVie6olXH0UMks/Ib3vlS3qb5huSHR0/IumjcPWd1upXAMjt1AEPWyBFeCnzFRmD
	yGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vkre5/9wKHqMsIh/32oWXbD7bK/BrkMhrIQVtltOI2I=;
	b=Y43mvjcjUHYw+z2nltKmmOM9VaiI6LwXa6b6YoHyiklhw1sVQFMDbLF2jZMRzNH7JQ
	/llRWj0fwQusz3FykrWNp2SS6zctwywdw59mGW7/V1OWusBQWD2F6R6ibOJNsD9yXXDg
	rsLOpbsvGqMpcgJsRb3r6F2bSwV1mdhTICIloe8g8xsDpVOM3pX6XVJJtSnyWkPI4j03
	1gAMQ/Yc0qOZnb+phoRkQsFXvwIdDrozB7BC7gR80wNQ696cO+oWub8YXHUJWao8jNAH
	JsTss4yLuVL1yj3BLyt+06vjqaG3UogzSYB3JLfE2zvR7cgpMaAX06kxB+O1v4VJBzRB
	n0/w==
X-Gm-Message-State: AODbwcAOH2bS88+MfEHyCeJA/+bBeuSDtYNNItFaSrCcYjeUDYfnL7Bi
	fehExIxEqHQ5hQsq
X-Received: by 10.99.250.69 with SMTP id g5mr57234042pgk.11.1497279556375;
	Mon, 12 Jun 2017 07:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:01 -0700
Message-Id: <76963ed7b98db24575fe3d7fc129ef9cb1ef5636.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] mpg123: Upgrade to 1.25.0
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:15 -0000

No need to skip textrel QA for x86 as it has
been fixed in 1.25.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mpg123/{mpg123_1.24.0.bb => mpg123_1.25.0.bb}              | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.24.0.bb => mpg123_1.25.0.bb} (87%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb
similarity index 87%
rename from meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb
index 587327b9ef..f86098ce20 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.24.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.0.bb
@@ -11,9 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "75d62ac0cb713a7bac5af4ded4af2bb4"
-SRC_URI[sha256sum] = "55fb169a7711938f5df0497d1ffe28419fbef50011dc01d00b216379e6a2256c"
+SRC_URI[md5sum] = "2ffbe29c99130215b0ee7d1b11c0ea4b"
+SRC_URI[sha256sum] = "552e3e1db045e00f474252917007795ac295863fc8b13891859b3382d2f24e48"
 
 inherit autotools pkgconfig
 
@@ -42,11 +41,6 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
-
-# The x86 assembler optimisations contains text relocations and there are no
-# upstream plans to fix them: http://sourceforge.net/p/mpg123/bugs/168/
-INSANE_SKIP_${PN}_append_x86 = " textrel"
-
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
 #| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
-- 
2.13.1



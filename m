Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4F62F6AD81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:33:25 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so1473949pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GjmIdScAfYDZDnwfu7lMzX41qAVa7J7JWdyBDjLXWo8=;
	b=GostUmW8IOAKgVrhZj28dUcITZJ/qkKMeqWLIhiuoUbypJZ9gmniAqW+3mDq2eAAZD
	fp+cj4nBf6GIcuRmQFcTrbiDT2jydT3mzpN/wqmnrEEIQ3Gqom48SltRbuur5p0c0q8p
	/10lF3F7muzHdYgBAWgljwS9Xak5dybIYk6QHltwaUZ0SZNLN529UyvYE1iE1mhI0gkO
	7akIzTE9v5m/vaOG9nmiqi+6kq9+SphaJ/Py6dtr8QeaYD/hSderzPk47J/03cXwK7yM
	sQ1PUkyh0JEgiwU94QY2ji9rM9kEjcPtdGt3kwIOhUvEU4P5cviWxDKSaartoQOvvFG2
	Ts5Q==
X-Received: by 10.66.241.99 with SMTP id wh3mr14545693pac.141.1375522405849;
	Sat, 03 Aug 2013 02:33:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	nj9sm15240464pbc.13.2013.08.03.02.33.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 02:33:25 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2013 19:28:04 +1000
Message-Id: <1375522084-13199-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] mesa: update to 9.1.6
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
X-List-Received-Date: Sat, 03 Aug 2013 09:33:26 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch       | 0
 .../0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch   | 0
 meta/recipes-graphics/mesa/{mesa_9.1.5.bb => mesa_9.1.6.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-9.1.5 => mesa-9.1.6}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.5 => mesa-9.1.6}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.1.5.bb => mesa_9.1.6.bb} (79%)

diff --git a/meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
diff --git a/meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.5.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
similarity index 79%
rename from meta/recipes-graphics/mesa/mesa_9.1.5.bb
rename to meta/recipes-graphics/mesa/mesa_9.1.6.bb
index 49fa5dd..d47822f 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
-SRC_URI[md5sum] = "4ed2af5943141a85a21869053a2fc2eb"
-SRC_URI[sha256sum] = "89ea0d1afd90a87dab253777bfe414820c4aa3890add1487ca2b49f6b3e194fd"
+SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
+SRC_URI[sha256sum] = "e632dff0acafad0a59dc208d16dedb37f7bd58f94c5d58c4b51912e41d005e3d"
 
 S = "${WORKDIR}/Mesa-${PV}"
-- 
1.8.3.4



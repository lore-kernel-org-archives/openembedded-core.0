Return-Path: <earwigz32@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBB2971A32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 02:29:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x7so8839491pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=dlDyXGqdpqi6LY1qXc+K4xq4FFvPidr2ycS6Tgg17cU=;
	b=LrH3UDeozNgRfxEoevyJAxZuYCgr7WgxqrTRKoCNMJtAXZ0a7gzdCoCB4sfWZPaInq
	zeVWSMm9rDGft7q0kUmR/ffTzPH4Q5Idiu2cRG/9iOpShBtGGh8axACUcMlu0FQ7bPOL
	KObcGP7d1cTkB4O+5dXlSdL9nNkOTcIRbvxKddbfg+ydqXS23yYfyBm7LDmbUgvAb/Of
	2LLVkdXdhhrpN3qdXC5dCw6a/+bdumy124BZTys50urxvxko0IQTQrMTidplV9rO49PZ
	2sCP/HNrW4Kx9K4jHr1lCsnuAKL/u5nsj6H6yIBdZNRz7RZBkkdxLH48oOp3CvJVWQ/k
	e4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dlDyXGqdpqi6LY1qXc+K4xq4FFvPidr2ycS6Tgg17cU=;
	b=fHG0lJz1KOY9ZXHU2fc1zM6ML1rjH7O2ZBrTBsjEruBLV7afpptbbXjLXxshOFVIYl
	jUrInN2uS3vwIFPLSksE8Ti4CgdP9yC1Cn0nUUS+Z7Iab65nyPiW2r7v252yBbiA96+S
	VtkgH19TT1guEvNSt1KwuBiSHEzemwPOh5eSoRcT5P3cddRhEBXT2y8Tgb1dQH4Rt36T
	9aOgajS7DgPw0vw6b5CvuSSbhTkq54fEo2GBaCHCnDz8RFvCIc+yNorB5CsaFNjGv93S
	mf9x4rap7LXVyiA2LkRoK5+C+DsSt3UGxCkUg3x/GFr6EbNuPp06inuyR0AVZnQVzbH6
	mtwA==
X-Gm-Message-State: AMCzsaWiSJSRCAn9vdkRbx298JmsxiqIEBEQHpaSxIzK12zPAUSVtc2V
	iNFr4P3YI+VXObf1UKwB/ybQuw==
X-Google-Smtp-Source: ABhQp+Skct9iDB7krSd3t+S6kWVeCVfyLHLAe+QSNyIL+B/psaZZlDhIl3sS4PXmddK6RbSkTZHUhA==
X-Received: by 10.98.58.157 with SMTP id v29mr3364526pfj.294.1508466569597;
	Thu, 19 Oct 2017 19:29:29 -0700 (PDT)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id j11sm59900pfh.18.2017.10.19.19.29.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Oct 2017 19:29:28 -0700 (PDT)
From: youngseokyoon <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 11:27:46 +0900
Message-Id: <1508466466-3369-1-git-send-email-earwigz32@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpng: Upgrade 1.6.31 -> 1.6.32
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
X-List-Received-Date: Fri, 20 Oct 2017 02:29:28 -0000

From: youngseok <earwigz32@gmail.com>

License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseok <earwigz32@gmail.com>
---
 .../libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.31.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.32.bb
index c96ea14..d93e72c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f21e4e1f795810b5ea491b333bc6ea1 \
-                    file://png.h;endline=144;md5=af300c419a45c53a8d2daa0b7d167a66"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=53f2df0e62ce82307cd1389a9f41e4cf \
+                    file://png.h;endline=144;md5=591cf1f8d84a757af46e43c2b9b5ddd9"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "1b34eab440263e32cfa39d19413fad54"
-SRC_URI[sha256sum] = "232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41"
+SRC_URI[md5sum] = "e01be057a9369183c959b793a685ad15"
+SRC_URI[sha256sum] = "c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.7.4



Return-Path: <earwigz32@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3D8E7896E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 06:46:11 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id m22-v6so812508pls.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 22:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Tn3anAPy3+irKVeCqYPuqZNgLvvjnvuKVwXBeP/VMz8=;
	b=vQlfA0gCuR94/QyiwmP+rGZtwPYeQLdB774mwobG+qjsBLzvr9ZXrzE9qalWvfH94E
	/3uEIGFhw0nXyJhlwoo+8R8aLzWXpvSWQ2w4zNV8CTq1xV3g/LsVKaUtshkj64aqRKAx
	HeCO/u9kqRj48+QX682/+UaeqGXynR7m/lT1ay27zqbLYAsBCOHTTNWe1orFxok6BpLO
	O9cw4MGKVfzJYNmdN4Fq/Pt3SwE3siUAKuZTBPr1MEaRcW6PeccUnmJl3JBZMND7ViN6
	uJSOmzNewE6w5/Inpl6QB9EczNgMfljgJ6BhANSoew6vY3wZXD9HkRzu0xV1tkXr0+eZ
	IxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tn3anAPy3+irKVeCqYPuqZNgLvvjnvuKVwXBeP/VMz8=;
	b=P0fBfDADVr4fG+MfVA1iRlCvqspxEHVexAt98oTCEaAAN2YajG437sdC5B8vNHCCEf
	NbGHKX8XA27uDtOTAxGVrZTrUdY9img5y9JCgjjRfoCxJEKXSz1R2GuAdtTcoW6bSU5v
	6pyVTQQWcb1RsJRm4UgmFPl/y3iFJztdd2o0wBHJgRt4tDzhpvTea6CZSEHukKbQin9g
	6E/kqTk4031yIjHX7tTyoB+L/p7aoAULON2ZemgaT9fAJCUyF86r3a4EFbwGgobxnkhS
	pm+eqp3cjr+rtLR7zYdrNQ5DbahkqqPWITzK7/TzdzvzUgklxh/gM1rc9qdgD+iCvCXB
	a6Ig==
X-Gm-Message-State: APf1xPC8xZbgC2pfT6pVfpfAxbSmNM5F2YpaokTpBLqfgGhUKOG15MKr
	eKQoGdz1Qf0u/aWznVlGBiFqwg==
X-Google-Smtp-Source: AG47ELtQlclAC4nVWTxyu7Sx8s+Q1dvXbplu2KpXWQN68jEPd2QPyHm7Q1xmVr1yNlUhXq5mksdfZA==
X-Received: by 2002:a17:902:6e0f:: with SMTP id
	u15-v6mr18951090plk.78.1520405172951; 
	Tue, 06 Mar 2018 22:46:12 -0800 (PST)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id
	b5sm36177105pfc.12.2018.03.06.22.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 22:46:12 -0800 (PST)
From: youngseok <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 15:43:58 +0900
Message-Id: <1520405038-6168-1-git-send-email-earwigz32@gmail.com>
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
X-List-Received-Date: Wed, 07 Mar 2018 06:46:12 -0000

License-Update: License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseok <earwigz32@gmail.com>
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



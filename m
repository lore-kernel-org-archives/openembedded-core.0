Return-Path: <earwigz32@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67FE060670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 06:12:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p87so9575740pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 23:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=fofNvw4WdQLkGFmTLVSXSRAtonXrzZt4PL0Ng8CkJtY=;
	b=ATaC74uCrJT2hRhLxwWc0A70/Tm7UfhI2EsiJeVdf8w9NnKeihnlTXU6p7YUDjFHTZ
	FMP6idrqQ5Vpds+LqzO4KqlQMWRwo3sNzm4+pt3mVBQyQmBYgSa9DCaeUh7hYNiNK1LJ
	5TWIUk9R5L3PI5XUif7L3WSG9xGlaUGby71y+7KlebfIebcyHx8bR2i/EtjdFGnwCELI
	N+Cbcom8zAKKAMPatwC0PtIUxiP+GWRpZOb//QdIp5NhoGXjYHJLBI6KJqnaBsTy8CUq
	vXIOkCpM8t5JHCz+zDbb5ICoeZXhpXYvM7zR8RBRm90Jjf2sCxvtmrzbD1brGrhGp1TU
	Bz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fofNvw4WdQLkGFmTLVSXSRAtonXrzZt4PL0Ng8CkJtY=;
	b=JrmaPeoS0zSXs0YwEhjo5WqxBHUzCL8LY7RkGuVT4ZobSVL1m7UKKJeztzPmLmgPhO
	ZFsBOb+YubC8J2F4eeGD8KlC+OjGerg2ouBCJE+ytnPR0EFiNvDxUXhuGbCIze5gnAoh
	Gm+x87EdUuGLYgZLXbDIJWX1xDF6KwIrKWIwOmxNpQYM+c+4QJA1VPCBWrqGNNiREzCy
	qoi/tLJd1LnBLivnVMx9zBXhhztXbIfIJLai+BapN8SisR+DkIwJMWbVdbaV8IrUH1ou
	bwc3dD8lOdIbRfb20j6wJRG70kxdc9qk5eCQv9Q4G2/H6e34bNlVeZza9IlaYne5S5Az
	ARpw==
X-Gm-Message-State: AMCzsaUuh7jyIrLZMWvAeh9PiFGCorV9FfM2dsyqqCOC23s0vPQvrSNS
	0Xj1pwLYNuI8KKElXv8oBuProA==
X-Google-Smtp-Source: ABhQp+SanDibmWQ1tbl++z7p4LzqZmezOW4oKjaptAohWgPs40lDDQxmxxKHR4De8DBTQn9gqbL47Q==
X-Received: by 10.101.92.135 with SMTP id a7mr3512642pgt.263.1508479963132;
	Thu, 19 Oct 2017 23:12:43 -0700 (PDT)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id q8sm536650pfk.100.2017.10.19.23.12.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 23:12:42 -0700 (PDT)
From: youngseokyoon <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 15:10:47 +0900
Message-Id: <1508479847-13159-1-git-send-email-earwigz32@gmail.com>
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
X-List-Received-Date: Fri, 20 Oct 2017 06:12:42 -0000

From: youngseok <earwigz32@gmail.com>

License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseokyoon <earwigz32@gmail.com>
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



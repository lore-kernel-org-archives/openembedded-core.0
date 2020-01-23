Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9BAB7F937
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:27:16 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a6so1008068pjh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ijbYAOqf/NpZyisUKMDX1ofRd1tgdpb/0K708IFV1AM=;
	b=aQsnx/GzbKodlH4a+fLLFFxWIVHbLPzr/kMTbFL/PA4Ny1Gh0MLygGEYw6h77TSXsM
	LC/Ln9Dfq3qKRt4DaEiupuM5MPs8uHkoVVraXIm4uY32/NQ2hk0xFl7P3DjNXwi/ysQS
	yEuFdH3og8bPChMD1TWOoUlwf0zYuULY8eZWahnamvU+tdOLGukgEaiToBv5gA2ojxvy
	bvv3E21+QWousO7y9ebcQMTq+J9xRNaUd4I+rjmfd7xC9QfK0cUxyag2tT0dnXrl0Gfs
	c47eavGzVN0Q2iC1oZbp+ERK+byNGt5vED6oaBce4yaa+WiiM53Kvv2tzLWeTpmBWlV/
	75Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ijbYAOqf/NpZyisUKMDX1ofRd1tgdpb/0K708IFV1AM=;
	b=RzVB3Dq2/qjeXmVz2PC5K5iHU9BMvAJTYoKHVMePuRCuTYlIbRgSMBQ09z1c3Ft4rI
	z+rcKPh+jcqbZdGhNE+k/pScEz3Hrr8vXQcyBeAqKaG+rx6WFU/er1zLRDzi3NO2p0Se
	PTt90AsRKAjpKB6s2n8S/2Kfo1XyoZSxyg1gXY6gpZJVAgGwT+CJasnqEd0F5aMrKBQ9
	e6+YT35dboXnKtABnZbOPxGpFVhXD8xJVfiJhSDy+qZmffaJoFT2gmakehaL7KdIyOdr
	cMvVbLTJAXUSveSP9x+VE/olBUOol/YKsE6ZGEfdUg3cg+odk9tcigSjSTiz3i45LdbC
	AHDQ==
X-Gm-Message-State: APjAAAUAA8Czv2T6eG1EfrKaJwZyKu+w2oOFc/kzIqcp4wL1gF6mh6dK
	WgQSmNyLQabluhn/r+ewJ+upuzyc
X-Google-Smtp-Source: APXvYqymDTg+wN15FJU47AlZR+UyeGd1GAHevFsYsAX1lHEXPSL4raL0Cmx5qZjar5n/FotVn98fuQ==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id
	o14mr3849896pjq.11.1579775237769; 
	Thu, 23 Jan 2020 02:27:17 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	d14sm2155702pfq.117.2020.01.23.02.27.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2020 02:27:17 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:27:11 +0000
Message-Id: <1579775232-23446-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4 1/2] u-boot-tools: Add capability of building from out-of-tree
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
X-List-Received-Date: Thu, 23 Jan 2020 10:27:17 -0000

This patch also helps to build with EXTERNALSRC.
---
 meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
index bede984..414ee33 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
@@ -25,14 +25,14 @@ SED_CONFIG_EFI_armeb = ''
 SED_CONFIG_EFI_aarch64 = ''
 
 do_compile () {
-	oe_runmake sandbox_defconfig
+	oe_runmake -C ${S} sandbox_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
 	# generating it requires bin2header tool, which for target build
 	# is built with target tools and thus cannot be executed on host.
-	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
+	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} ${B}/.config
 
-	oe_runmake cross_tools NO_SDL=1
+	oe_runmake -C ${S} cross_tools NO_SDL=1 O=${B}
 }
 
 do_install () {
-- 
2.7.4



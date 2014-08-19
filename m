Return-Path: <abhijitpotnis@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 56DE6617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 07:04:51 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so9025333pdj.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 00:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v5weXtY+otFQdSM77UmMzy+IGPWJ/voz8MLn7UcpUUw=;
	b=OQ6axU7P/793m0NGqbS2zffKS6fRlC1bzfav5eLBMKEw267RpI/AN0XJJqnqZNMRgS
	pzeAJ9X1vru6IeZp2VktF5xm47guZd0/Gl4Qq030f2BKycCOrHrNW8Jtf7YXG21rfoFb
	3z8wruBWX/hmb3jVLgQ+GLkoYKuo7ZzirUOcwqrMqt5cUCgtPnHJ3/yuYyeTVGZ0wqkR
	+FML5KIk5ja1uiVCeT9z+G/PGz5x9NclXsqpaBH4+VfMOla3+VDcXWP9MHvCjztk0QfW
	bF0oK96BGYS9HVNSdvaYnr3akFbhRtsArmwbuv+DG/tlLC1eFU3vtVUmeuZaWGZxdfJI
	MEGg==
X-Received: by 10.68.252.229 with SMTP id zv5mr42273541pbc.16.1408431890255;
	Tue, 19 Aug 2014 00:04:50 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	ki8sm27912958pdb.89.2014.08.19.00.04.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Aug 2014 00:04:49 -0700 (PDT)
From: Abhijit Potnis <abhijitpotnis@gmail.com>
X-Google-Original-From: Abhijit Potnis <abhijit_potnis@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 12:34:39 +0530
Message-Id: <1408431879-12912-1-git-send-email-abhijit_potnis@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>
Subject: [PATCH] libxkbcommon: Add missing dependency on xkeyboard-config
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
X-List-Received-Date: Tue, 19 Aug 2014 07:04:59 -0000

From: Mikhail Durnev <mikhail_durnev@mentor.com>

libxkbcommon depends on xkeyboard-config

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Abhijit Potnis <abhijit_potnis@mentor.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
index 2ad5448..6ab827b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
 LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'xkeyboard-config', '', d)}"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-- 
1.9.1



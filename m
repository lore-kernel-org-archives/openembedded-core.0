Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id D9784600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:13:05 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so4782015ead.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U6glyI3M0kSxyHp1Os0hsOOOQZ1HZSczX8HAmGrP3wU=;
	b=Dw/xO/QJrHIJJjRmuRq+t8ONisYVjP7VtkAFSWQbRvcXLrO5cFunWmoCqGLAN/KNK+
	jpKUIOrbPc3YA4p4ySAetIkjxe0iqNEYfCsjEruif7s56C9DV5cwzYtWa3M71kcH1oi9
	2YX/8xMiU+32k1BKFLZ0bVqIr/t5/6k9OtEnPDRk0EdbD38Q2O7tFjrCBLF5JBs3/oKa
	3EZhbjs49YT2L4z2Dc7dYd0aDTl+1UttC7XNKxuRx7vuhiHM8tufpQXB6nBvBDMlc1s6
	KqJoCAFxO0zRI+d/0VVNyd7g8OXlhICryrs0yhcX4I3UcsBnkWbm+y7qoJmyksXnFX9p
	Mkng==
X-Received: by 10.14.9.72 with SMTP id 48mr14054680ees.42.1376478785797;
	Wed, 14 Aug 2013 04:13:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm74347823eeg.17.2013.08.14.04.13.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:13:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:13:51 +0200
Message-Id: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/4] at-spi2-core: add intltool-native dependency
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
X-List-Received-Date: Wed, 14 Aug 2013 11:13:06 -0000

* configure fails without it
  at-spi2-core/2.8.0-r0/temp/run.do_configure.372: intltoolize: not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
index 34cdcbb..8403d65 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "93b57d5d56d15d1222ddf2386e2f869f"
 SRC_URI[sha256sum] = "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f7403c96a10a481c458"
 
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
 inherit autotools gtk-doc
 
-- 
1.8.3.2



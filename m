Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id AEF066007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 12:48:15 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so4783299eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YRYYfKMprSJGPhx03BJfnZMd/O2ewrpczZbkD9xJDx8=;
	b=0eszsCQVN8FGzPUykVveucVuCrIZYflsezQmpvvyG9T8Ctecs/F9Fy48I75LYOr982
	7wSksIwhIqEM1x/gDNSNWyvudwYWDXVvaenk/QgZ7iPBLY/DE34gaVTp+fUfGlOe7qiI
	/9t18OJc3R5bCHoX3EEFUmyQBEpmNcgD6Fpfx1M9VmZMAqdLCNFdVX0gsv8HxOrdoDxu
	3ZF73tMN3IGvzTPx6jpvbKI2j2xd7UeZa7mEGe9pDysJKRQP+N5DYGYhlp/1wFZt2YVy
	zMJLUsyt3MD7cHo6hSQKSnGzspwhOqrNJAjjNbSbN5UQ8yLaP5OPQfoxKqsbiDJ9tTCh
	jvtw==
X-Received: by 10.14.69.206 with SMTP id n54mr294537eed.118.1376484495034;
	Wed, 14 Aug 2013 05:48:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm74886700eez.0.2013.08.14.05.48.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 05:48:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 14:49:04 +0200
Message-Id: <1376484544-16814-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] qemu, default-providers: Add mesa as default virtual/egl
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
X-List-Received-Date: Wed, 14 Aug 2013 12:48:16 -0000

* it's safer to select it consistently with virtual/libgl* providers

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 meta/conf/machine/include/qemu.inc             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 4b66522..67cc5f5 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 6245487..545f8d1 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,4 +1,5 @@
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-- 
1.8.3.2



Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xbn-0005dU-Ig
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:34:11 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=O0+BtzRVGesCRBZrOUXvyG/BOM+p6oMlKhEU+QM1ido=;
	b=nJfsC8DsxM8cpIA1m6g/7TUG+T8pf26+2TRiV1SM0dCCOVWOuXEloeFuHjLBAHlEX4
	c/ccWBBCm8ZRQF74m2Eduzgg2UMWrv+xQBAcyUye4m/dmTUc9hqmR/GXxVsmIlU/bkC1
	p5Yfg7H/eVyf7vCxXGNjzl/8xf5ya54DeXFdQ=
Received: by 10.204.143.129 with SMTP id v1mr2327842bku.85.1317367725065;
	Fri, 30 Sep 2011 00:28:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm3938091bkt.4.2011.09.30.00.28.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:21 +0200
Message-Id: <3068953f93107d66a7ad5e21cc41bd29f945b335.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/13] rgb: import from meta-oe layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 07:34:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb b/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
new file mode 100644
index 0000000..59dca2a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DEPENDS += " xproto util-macros"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "35c6cccbf25a872bdd62bfcb1a73d951"
+SRC_URI[sha256sum] = "80887da011ad086fff88bfd16c6d9d5ac7da45ef1bc9d0c192a6f370423370f1"
+
+FILES_${PN} += "${datadir}/X11"
-- 
1.7.6.1




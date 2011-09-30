Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xap-0005dU-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:12 +0200
Received: by bke11 with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BoQV1JVFN73usdfUuS6MC9ehO/dMYAUB/XdA4kW0kWA=;
	b=ewtS0o7h02L0FibrEb6CgEE1h1yAG/4KfateDJZ3it8MVV08tW2qfU+8d36a97lCYt
	HYqxrqO7i0oZhMsuPBtr9lPiax8EOoI7rfVdYtP/JIGfDovh+AGyZrMgvx1N9yk8R60m
	C7Na3P1ZX4YGPap9VonTiKbDRI4Yzf7hgLt0U=
Received: by 10.204.132.155 with SMTP id b27mr3349854bkt.81.1317367660577;
	Fri, 30 Sep 2011 00:27:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm3928543bkn.7.2011.09.30.00.27.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:27:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:13 +0200
Message-Id: <c341f97c3102144d6ae36e6669c69905ac9de240.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/13] xserver-xf86-dri-lite: remove COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:12 -0000

* ie om-gta02 has mesa-dri module too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
index 093e049..2e35917 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -10,6 +10,3 @@ EXTRA_OECONF += "\
                  --with-pic \
                  --with-int10=x86emu \
 "
-
-# Due to mesa-dri
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.6.1




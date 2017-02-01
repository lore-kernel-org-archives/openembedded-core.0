Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9717321C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 13:57:10 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id k15so265663116qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=nC26cceFfjzonX2R7KiiZ2iPE2RTQhMn2XY9EDv29wo=;
	b=P3a3FgQ6MTJ2kLBKpfFc6IYm+q+MzxgMs0LotJ1wcXhWN5+YnbQ/ioqczOE3ZLiT6D
	+7xeZaaS4ARLrcH9SswTKyIrUnc74KnMy/vKeMzJrtr5mDzeCyEw4Fwu0hos+ipDeg3J
	fQTPvWzrPA4wIktmxP8OnEWGxoLDsBdZT/k/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nC26cceFfjzonX2R7KiiZ2iPE2RTQhMn2XY9EDv29wo=;
	b=rA0VHDUc16uA+Lj8gxbgoUFzGQamucilZF1Wf+e/JT8rwpOuZQ/B9I6tWKRchz+6mz
	NNaIYkeLw2556Ul44EVys/g+LiildREayO4w00WbW/BuarJ6eysLwx4wPTXBLzBfXKjM
	FGd/RNHmniQZUiga9VflVhDxd7iTWf1qpqArZplMOgpUdJ5drtcl7+pU8LADUAAvpK76
	WWIrn/3T/sF5rAJFo1jqTO2fe/JrZtkssn1Nj1maZFE+10hLZT2l334wcV9NRoS/srDE
	GNCLwBvFuTLxKWBuw1L47k5j3cVoWBlsv9QLTxBDkJ5s9iA2vUD0Hr5BIYdPkx6YzeEI
	X1bQ==
X-Gm-Message-State: AIkVDXJuoaU7lbqqOaVlSkpJ+EfPBcqJmhsUF3PIvshtiOMg1Js0oUEb9VjM1n0Y18AHhnp/
X-Received: by 10.200.35.135 with SMTP id q7mr2739528qtq.206.1485957430942;
	Wed, 01 Feb 2017 05:57:10 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	l53sm18651885qtl.41.2017.02.01.05.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Feb 2017 05:57:10 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 14:56:53 +0100
Message-Id: <20170201135653.17152-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] mesa: update to 13.0.4
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
X-List-Received-Date: Wed, 01 Feb 2017 13:57:12 -0000

Bug fixes release.

This is really needed for Qualcomm based h/w since freedreno
driver had a regression in 13.0.x branch which is fixed in 13.0.4.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/{mesa-gl_13.0.2.bb => mesa-gl_13.0.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_13.0.2.bb => mesa_13.0.4.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.2.bb => mesa-gl_13.0.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.2.bb => mesa_13.0.4.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_13.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_13.0.2.bb b/meta/recipes-graphics/mesa/mesa_13.0.4.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_13.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_13.0.4.bb
index bef1fa5c38..1416c9f8b8 100644
--- a/meta/recipes-graphics/mesa/mesa_13.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_13.0.4.bb
@@ -6,8 +6,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
 
-SRC_URI[md5sum] = "9442c2dee914cde3d1f090371ab04113"
-SRC_URI[sha256sum] = "a6ed622645f4ed61da418bf65adde5bcc4bb79023c36ba7d6b45b389da4416d5"
+SRC_URI[md5sum] = "d088a921e935218833a8071cb672a574"
+SRC_URI[sha256sum] = "a95d7ce8f7bd5f88585e4be3144a341236d8c0fc91f6feaec59bb8ba3120e726"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.11.0



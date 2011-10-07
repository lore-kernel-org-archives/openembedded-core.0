Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE3t-0006WZ-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:18:19 +0200
Received: by yxj17 with SMTP id 17so3910134yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8dbFsS1gOHrej+DHZHcwO/kjbFCFFaLO1tvsQNA94P8=;
	b=IShqhwLZQaaNb4YX72b6YDtXsLNPq1ySvjR7euCfKL20U9GpLIX9uF+5RK3Ugfm7jD
	GKWHpsSFKc4nPYkeiOat2SywydCDxa+QzXOn5rZNsSVc/bOEw2RRVJ/l7dOB0p1WPrEJ
	p34KFmfMVkxtF5eeI+K4++a3Ogrz/9yAHSAIQ=
Received: by 10.223.62.15 with SMTP id v15mr11915623fah.22.1318007228516;
	Fri, 07 Oct 2011 10:07:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm13626007fac.6.2011.10.07.10.07.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:07 +0200
Message-Id: <7e463e706e1d0564aaae0bec43b5ddc2d0ad2316.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 12/31] xserver-xorg: replace hardcoded --enable-glx-tls with glx-use-tls.inc, which doesn't enable it for uClibc
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
X-List-Received-Date: Fri, 07 Oct 2011 17:18:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index dfad8f3..726fbaa 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -3,6 +3,8 @@ require xserver-xorg-common.inc
 PROTO_DEPS += "xf86driproto dri2proto"
 LIB_DEPS += "virtual/libgl"
 
+require ../mesa/glx-use-tls.inc
+
 EXTRA_OECONF += "--disable-static \
                  --disable-acfb \
                  --disable-ccfb \
@@ -16,7 +18,6 @@ EXTRA_OECONF += "--disable-static \
                  --disable-xnest \
                  --disable-xvfb \
                  --enable-composite \
-                 --enable-glx-tls \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-pic \
-- 
1.7.7




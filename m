Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1STAxs-0007nQ-QW
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 13:58:24 +0200
Received: by werg55 with SMTP id g55so1010474wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZxxI+gV5LfxAaVlEKX1+yEVoAnipTF/Q/Cq59b5Kx/w=;
	b=vx3GdiSrd4QmHzsUNw7lHRP48ok1XNuvslaAXbnH8kbb1yjXzs0fmzPEjRbD2S/0M9
	jDGhsQmkgE3Kg+twSkvPwiLgQffwgLcbHmfKbk+0TFjDlocaWH9oijW64sxgKVtZuUoJ
	wlQDQ35umzbx8ocIEFr1qGG0ltIwke8SyCas5uqmtuAO5TKknD6zGpOQyhEQ6kku2PFO
	M/fJShM1z7mDZlUwtidhSApKqvgMI1TykIiGayfCzrU+0CgvKd2F34lANe3yC5RYeLc0
	9zEb0LH8IWhF0tEtMnI0Km7mAvOv5824d2R9oUdLDlEnM4oI1DyyWoBH+B5whGnOhCCs
	rYEg==
Received: by 10.180.75.241 with SMTP id f17mr3762885wiw.11.1336823308295;
	Sat, 12 May 2012 04:48:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f19sm28928324wiw.11.2012.05.12.04.48.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 May 2012 04:48:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 May 2012 13:48:19 +0200
Message-Id: <1336823299-13967-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] xserver-xorg-lite: disable xmlto like full xserver-xorg does
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
X-List-Received-Date: Sat, 12 May 2012 11:58:25 -0000

* xmlto-native is unusable (see YOCTO #2416)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 .../xorg-xserver/xserver-xorg-lite_1.11.2.bb       |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 57615f5..02db5bf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -4,4 +4,5 @@ EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
                  --disable-dga \
+                 --without-xmlto \
 "
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
index ec29b21..b7daf89 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
@@ -1,4 +1,6 @@
 require xserver-xorg-lite.inc
 require xserver-xorg-${PV}.inc
 
+PR = "r1"
+
 FILESEXTRAPATHS_append := "${THISDIR}/xserver-xorg:${THISDIR}/xserver-xorg-${PV}:"
-- 
1.7.8.6




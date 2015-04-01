Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 231C7736C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 16:42:51 +0000 (UTC)
Received: by ignm3 with SMTP id m3so34692054ign.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4/PjnVy1ZFKcv8AfYF4Pvs0ahlscIN3P3g6cIfio2dk=;
	b=djWiQb07mh4wjL2CkfPtz6v0L6t9Yq+V/pTK8I96hR49JKuQgJ7hfHstcSnXh2zgTr
	pS52/fuAsZmt3NpNfhhbk46q5d4UO6qaI6601VW77GpcTvvT9U7+nGFVLGFjeYDn8Ub1
	N2eqzY32cTqJF4Pntnho7wFxykYifoih4esh0kEKC2A+KtIp1db9gGdI36GSrDVKHYyR
	caioME8KjQRhXvGb7q7szHUKksWj6fXTnADpia8rqRnlN74QC2l+cjZFAyKgfEsz7nI+
	KvCbATpCmMAmVN2pBvJAO4AqJgi8wS/h+AyDiAOMvg8wh8khkokrsqJtPjsrcQNMZ18H
	Yn7g==
X-Received: by 10.50.49.43 with SMTP id r11mr13733898ign.18.1427906572820;
	Wed, 01 Apr 2015 09:42:52 -0700 (PDT)
Received: from nebula.sys.comcast.net (a-96-119-40-215.sys.comcast.net.
	[96.119.40.215])
	by mx.google.com with ESMTPSA id 192sm1466170ioo.38.2015.04.01.09.42.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 09:42:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Apr 2015 09:42:18 -0700
Message-Id: <1427906538-14295-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [daisy][PATCH] mesa: Update SRC_URI to match updates to mesa upstream
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
X-List-Received-Date: Wed, 01 Apr 2015 16:42:55 -0000

This avoid fetch warnings like
Failed to fetch URL
ftp://ftp.freedesktop.org/pub/mesa/9.2.5/MesaLib-9.2.5.tar.bz2,
attempting MIRRORS if available

Change-Id: I39fb98c679452e2a7354a6fd9edf9526179e9446
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_9.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
index 737ed1a..dca7ba0 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/older-versions/9.x/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0006-fix-out-of-tree-egl.patch \
            "
-- 
1.9.1



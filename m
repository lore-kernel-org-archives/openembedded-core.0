Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 82BD3731A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:19:30 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so112894806wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 07:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=j0KlwlnMYWsg8oJUzTCIk1dE4S7NTiLcMp8QSmX1UK4=;
	b=YK9pvVx7su+y1OYXZAL1g4Op/5knC3Ni2XU4U34Tuj/5Eann5n4qYDODs6Hp4zDt/H
	G88UY6+DgJwXchqBwSqQHfjG1VEOlvXRxreYjO3ki5pGS6a6NWVS3YHZKcJ46tre938J
	MGJ64xmUFTE/+itxmPGvwwUcgA15WACu9oXQuaj97XAwxDwGO0TR6BV4IEjgrtETHKnj
	xY4JMSiE45mAwGWApjlb/xAc0LN6JOrlSfkGfKaRSM3at9r3BhBsvxeZcB8ieKdIBOWF
	ndlaRT9pKzU5XqKwUdce2aeblDIiEASxED8r7ukp4KBrg2cNbv8BVK0rCzbKjJpYZuEn
	r0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j0KlwlnMYWsg8oJUzTCIk1dE4S7NTiLcMp8QSmX1UK4=;
	b=E4OmZn7mjh+UdAViPNwyBCVRgsyOX/lHTg8jn5ZxEOGv5tSuNq2CzFqASrK4l2P/Zp
	bQe+YshGOfdSM99zcgugE6q63AjSqcOG1fOUEmfe+/B3xvMFfP+g7nhCaVuIW9iPQCzT
	dLp94XvmEDTi65AtAFmYBfhrrCp/wefjOVhna8Zv57a/g7/FvzL+iAM9avl7mC/9swSs
	/sifbAHci8RqxE4/6T/mOy4kqYHROUtd6bxb6zzEcZx9t9K5rKhJRXSogMM2jfcmzP5c
	qkfg+9IHghwuqIzwj0BtMEIvvyEK8EhMna5xk27dfYKE3uEqNw28uaXNZkEjnh9AXi3w
	/Isw==
X-Gm-Message-State: AG10YOQWBlJZIX4/DgGfme0PhuUP/oK9oOewUozWZUKsfc8XZ/fzNb+RILjZz1jtKRkxqpnG
X-Received: by 10.28.226.212 with SMTP id z203mr20087864wmg.78.1455635970881; 
	Tue, 16 Feb 2016 07:19:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g126sm20988371wmf.16.2016.02.16.07.19.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 07:19:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 15:19:27 +0000
Message-Id: <1455635967-20476-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] glew: don't put our CFLAGS into the pkgconfig file
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
X-List-Received-Date: Tue, 16 Feb 2016 15:19:31 -0000

The pkgconfig file doesn't need to know what CFLAGS we're using to build with.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
index 70a99ae..fea071d 100644
--- a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
+++ b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
@@ -41,6 +41,6 @@ Index: glew-1.11.0/glew.pc.in
 -Libs: -L${libdir} -l@libname@
 -Requires: @requireslib@
 +Version: @VERSION@
-+Cflags: -I${includedir} @CFLAGS@
++Cflags: -I${includedir}
 +Libs: -L${libdir} -lGLEW
 +Requires: glu
-- 
2.7.0



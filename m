Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id C2DCB7693A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:47:58 +0000 (UTC)
Received: by qkcs67 with SMTP id s67so39774875qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=NOWeor1mZiUh/N45PCDtJIBsET30K1dO9srR/QSY/BI=;
	b=A4OkjosEoyR09ELhrg52GuIXH4vsf3GTzk8zhT7V7rRvD0zFusnH48KHtU6MGA/tqG
	x3dB3icdT3zRGq6whh9wEJTODOQGitAf/iM9CSq2y0YWGuBop7vM+1VBK1FyTOu5yfTN
	msIlEo5El3E/bsEmuWLOMsICPjeebxpbwnIp1G0YoOjDSFeQZZuRBzlJVdKVh4K+VsOQ
	icTZ6Icavuoh4c3Bob9Un0ppmucjf/cY/qVj/xXhKMBCQ8pi9NTkGbEWxUv1cUJZKHPW
	2BXTvNidKxgwvWTEo4/TI7ACoQSiVKLpE/Tw0jRkunJvmcoNjB6/vD8E+H1/lSSdizDH
	WuCg==
X-Received: by 10.55.20.207 with SMTP id 76mr13101432qku.67.1439236079025;
	Mon, 10 Aug 2015 12:47:59 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	g6sm10432042qgd.10.2015.08.10.12.47.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 12:47:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 10 Aug 2015 16:47:53 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 16:47:46 -0300
Message-Id: <1439236066-20015-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
References: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] mesa-demos: Fix dependency for 'vg' support
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
X-List-Received-Date: Mon, 10 Aug 2015 19:48:01 -0000

The 'vg' support should depends on virtual/libopenvg. There is no
provider for libvg in OE-Core so this option seems untested being safe
to change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index d58388a..e451642 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
 PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
-PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
+PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libopenvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
 PACKAGECONFIG[glew] = "--enable-glew,--disable-glew,glew"
-- 
2.5.0



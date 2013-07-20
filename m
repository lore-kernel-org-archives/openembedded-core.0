Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 925796AF66
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:17 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so2982152eae.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CSNLCmukeXYI2rb4WAy+hwN9m7jGt7T+4I9+NYuYbAc=;
	b=sgVDQy4Z0MIvKY0eNdotVI0KPleSBF18Evduci4mNOn/0B+WIEG+xH/4/miTFBAHSG
	boI2ltKu0pPjC4oUryFbzRpp28oK3iZ+5lotNnO83wnM6FbW4YaLIxMT3IfejC0P8eby
	EleBZ0yCxRbeC5K/BIWYv9LmM7uq0PssuISgpJ4iDLY3etHSaxPWD2REEnxlGWLm4kSP
	3GlG0ylzaePXcRzObebus8UrSTpq8/UUWOxi1IpsONaMXK0LLfuaSvXZKrdcBl4WrPmo
	3ogKsHSoiBMVjaMSEXrTVAhx37gWKw5IvLliEHmQMBGztuPf+OcR0GQH02Ar2tXMVafd
	kbzw==
X-Received: by 10.15.61.67 with SMTP id h43mr20390674eex.102.1374332238023;
	Sat, 20 Jul 2013 07:57:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm35859750eev.8.2013.07.20.07.57.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:25 +0200
Message-Id: <24abf6bd3da93f4d5ce21ea97f137a2c60bb0c64.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] mesa: add Upstream-Status
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:17 -0000

---
 .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch        | 3 +++
 .../mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
index 7e82b6a..30a3d98 100644
--- a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
+++ b/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -7,6 +7,9 @@ If we go through ./configure without enabling X11 anywhere, then set the
 fallback types for EGL NativeDisplay and friends, rather than assuming
 X11/Xlib.
 
+Upstream-Status: Backport (slightly different solution was applied in master
+https://bugs.freedesktop.org/show_bug.cgi?id=64959)
+
 Signed-off-by: Daniel Stone <daniel@fooishbar.org>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
index d6ddd9a..8a83f4b 100644
--- a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
+++ b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -7,6 +7,9 @@ If we go through ./configure without enabling X11 anywhere, then set the
 fallback types for EGL NativeDisplay and friends, rather than assuming
 X11/Xlib.
 
+Upstream-Status: Backport (slightly different solution was applied in master
+https://bugs.freedesktop.org/show_bug.cgi?id=64959)
+
 Signed-off-by: Daniel Stone <daniel@fooishbar.org>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
-- 
1.8.3.2



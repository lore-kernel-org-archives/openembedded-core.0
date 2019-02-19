Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0787C9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:26 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l5so21863830wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0dsPp79AoMBAzDlXRkuc6QwQyl2XMrYEJOQg0CoCxvQ=;
	b=C69WtQPAXxCjPVZ1vxYqBY2wzwt3Vpo3QSHC+JFAB257XXSL6g0XFnRwKFlkgwGyvP
	AFnHRvOKRNDfqql4rVQYLkRukxMd0tISN4mz+9PySRhT3PDGWjOWQ57BTaEJGx74Xojm
	TMXE2Kz8T1CFJz+Xm7zAsWhxmk0WeskI7XXxQ0z2mA3xGZJpNorc9QptxzIvPN9/MnwL
	GqS0cRUpZIR2avq4EuAIQt8OVgFqFPpf3ePDEEmoucbwDTXweV6ZGe2wcpuEad0CQAPt
	hp+WM3Iwja3biHhElo9ogxVJtmZ3l4zOUkZHARj5UCLkFKyGCpp8stJ4sXz39uRGAeic
	kNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0dsPp79AoMBAzDlXRkuc6QwQyl2XMrYEJOQg0CoCxvQ=;
	b=TYERre57UFt1pdfjnvuONzSi3urYdibT7q9+T0NAILHg4EDaIfP3snWm3mq0nAQZ44
	MDIAmfBqNshvCyEhMpx8lfGt1wkJHllhLq9+WfIhFlhWfV7DiUCVLYkcNg+soaL2fC3q
	eHyinMMFaqhpNhkyeRga6ny2IZ8+nyuocu9kQUiap3IN/D3KZk5FdEQIxEkh8+xVOQLP
	0uN9MJdy3YM5l4OeOc6SyPG7Ss1GpUGSD0/1p14w8ZraYVGpo/AGNYWpFreX6j8ALceL
	HtSUDzk1NYjH/9lEGdHAaeEk28SJbBhGLhzv/g1PILYu01NSpaefIpq1jtfL4C9GvQHq
	B4FQ==
X-Gm-Message-State: AHQUAuYxXWbsIMAEJeFZO8bt4tibzEdqufFiOMhwOrvQcjUfd4gW2rOm
	ykG92DBD37Oo+hMTqY4eNjZBZ3KA
X-Google-Smtp-Source: AHgI3IZ0coVAOHRHsqHugdpA55jBeDKVCbf8avuGBqa/4w1FzyEnPVTqvaQN8+RkUqUB1bp1A9uHug==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr22410854wro.321.1550598446776;
	Tue, 19 Feb 2019 09:47:26 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:58 +0100
Message-Id: <20190219174712.60694-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/20] meson: upgrade 0.49.0 -> 0.49.2
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc                      | 4 ++--
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch  | 7 ++-----
 .../0002-Support-building-allarch-recipes-again.patch      | 7 ++-----
 .../meson/{meson_0.49.0.bb => meson_0.49.2.bb}             | 0
 ...nativesdk-meson_0.49.0.bb => nativesdk-meson_0.49.2.bb} | 0
 5 files changed, 6 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.49.0.bb => meson_0.49.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.49.0.bb => nativesdk-meson_0.49.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index c39b1a3d5e2..d5d71c67b61 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,8 +15,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-windows-split-WINDRES-env-variable.patch \
            file://0002-environment.py-detect-windows-also-if-the-system-str.patch \
            "
-SRC_URI[sha256sum] = "fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551"
-SRC_URI[md5sum] = "3c35b91e8040901034809576d54007c6"
+SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
+SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 785c0f027bf..fbc3f5ad827 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,7 +1,7 @@
-From d058d0f1d8833d99e8a3d3b9bcc383db23b52671 Mon Sep 17 00:00:00 2001
+From 2db829d865bb6464ac15dbb4a58c9a675e296866 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH 1/2] Make CPU family warnings fatal
+Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
@@ -34,6 +34,3 @@ index 2ccd31e..5fcf9df 100644
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index e7ba40701f6..81548cdfb85 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,7 +1,7 @@
-From ffab5c5046da29fc20b074d21f6de46520cee58c Mon Sep 17 00:00:00 2001
+From f8419d5f279f1fb9b5e7eead4f1579bce7cb0e4e Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
-Subject: [PATCH 2/2] Support building allarch recipes again
+Subject: [PATCH] Support building allarch recipes again
 
 This registers "allarch" as a known CPU family.
 
@@ -24,6 +24,3 @@ index 5fcf9df..b4fc0dc 100644
      'aarch64',
      'arc',
      'arm',
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson_0.49.0.bb b/meta/recipes-devtools/meson/meson_0.49.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.49.0.bb
rename to meta/recipes-devtools/meson/meson_0.49.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
-- 
2.17.1



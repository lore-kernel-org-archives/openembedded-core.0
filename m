Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7A27FE96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q10so3332029wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T0YLzbTyPeHRHvpJZ4CofRWylCGco2jbyJfGXi504HM=;
	b=HskuZTI0eCTVWV5LqtI6KSBa95EE3Xn6Kn2NjYXHRCg3IPx0JT4ZRYZ0iJUYJEPFXo
	BbooAQN4SacmI96dakvHShBv1bvru65NzWdW9y6zoujbEjbKNWy7SDLxRAME0iVGE3b0
	gdSKOBhOjtJLazrTsDeBqXW870NH/rwoR4zG4mAAOb5DyQlgsu6h+m59ZsrlsaaNrBPB
	3KBzF2mP+RJf0xa/BpM9wxBQNRUwKFBrq9N6ZLjAEvs3I17cwbXnjGhCdZ6cF3UvXzSu
	/rykz0NgOzifazvuP+KFce9iMeSI2XHhO+2bESN48YfBGf6d+6Qw7VGgsWASrDY8GsXX
	IESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T0YLzbTyPeHRHvpJZ4CofRWylCGco2jbyJfGXi504HM=;
	b=qGmDH2oE7KejIUuSy3Btbv6HydqtCxuU1/6JqRquK1B/Es3sQLeiJ8BKhGsYmHXSKC
	Oukvspe+kZbDU5dSLHm460WnkMyW4JvmfIdnQTL/gtyr2xwFPzINx7YLmQP0669ncKVn
	mR6Wu0ZzIboJvCPWql67N/LdvcNnIz0EzuzAiGuatFtzn6MYwyKCNKTsM+MlYC2DCWf2
	s+lk84CPIOY9U2QGKKsiLRXyhbZ4PeymsJINYCklDvRlKQRnPbGi/r9nBF9sJZHibOPi
	tKrJyZaVihyq5Ta57ln0PmW+9ll1PryGIkQKOrSYhgeZYpas43D6/Abzm58UtG9fEOx0
	Vdew==
X-Gm-Message-State: APjAAAX5CKfVzmFyzunlZ94pXV/7rGSRDVw1+45CwJNHVBzpzIZW4FGA
	MdsTLpI55DTmrOXmEMMEqtdoi78JTug=
X-Google-Smtp-Source: APXvYqyVEzsRtwns/kvRR5fjgfgaGCw63i3DwAkAxnlVoZdAIgwmnj0r+XpC/RMbkuapcwcafSSjvQ==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr4735158wrw.25.1578490101715;
	Wed, 08 Jan 2020 05:28:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:46 +0100
Message-Id: <20200108132759.95603-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/28] virglrenderer: update to 0.8.1
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:21 -0000

Switch over to meson build system, add a patch
to avoid target python3 dependency.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...uild-use-python3-directly-for-python.patch | 27 +++++++++++++++++++
 ...nderer_0.8.0.bb => virglrenderer_0.8.1.bb} |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.8.0.bb => virglrenderer_0.8.1.bb} (82%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
new file mode 100644
index 00000000000..0fd1d511d6b
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -0,0 +1,27 @@
+From 63788c63ed39a3ce9994f4315d8997e1a9300d4d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 6 Jan 2020 12:44:42 +0100
+Subject: [PATCH] meson.build: use 'python3' directly for python
+
+This avoids a dependency on target python (due to meson probing
+its configuration).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 682d7c8..19d2eae 100644
+--- a/meson.build
++++ b/meson.build
+@@ -60,7 +60,7 @@ foreach w : warnings
+    endif
+ endforeach
+ 
+-prog_python = import('python').find_installation('python3')
++prog_python = 'python3'
+ 
+ libdrm_dep = dependency('libdrm', version : '>=2.4.50')
+ thread_dep = dependency('threads')
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
similarity index 82%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
index 4420d84ae5a..133618844a9 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
@@ -9,14 +9,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm mesa libepoxy"
-SRCREV = "48cc96c9aebb9d0164830a157efc8916f08f00c0"
+SRCREV = "66c57963aaf09a1c41056bd2a001da1d51957a14"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
+           file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig features_check
+inherit meson pkgconfig features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1



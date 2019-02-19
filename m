Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE727C8CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:23 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id e74so2367646wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9QIWOxJQ2ZjwuptQL8AXpa88vpF8jlk5mJj1VIS0Nj8=;
	b=c6DvLGGZN50YSVhNGkTKVOVX6TgvH7s39c44+gYyzenYTo7jX6O3KuAreNw4inAw2C
	/DnBSo3KWcxJgvRfQ6/pkFDHMt46AwxGtJ60UdaLTPi7iMdKbg4y1VA6Td18lD09eudt
	RvQ0tPTLp8uSIpFIRZjmEWrAEwxoZTiTOZcWv/yTfdMqF/rwKIn5VefmbdgyZ3pjcVw5
	+dBXzmS6D51ZmFzq5vgplCp8E+LPHVP65L6/p7Ks8aKt5qNVg4PRNL2Fxsmabi3T9fyz
	uBLhfAcFB7kmaxMQP44cR2GWekSaixbgIWm4s6O9vQbVHmPh7PqeK/HVDjsQLo9m+UK4
	Rk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9QIWOxJQ2ZjwuptQL8AXpa88vpF8jlk5mJj1VIS0Nj8=;
	b=c1Mp1BQX89QzdraY6yYIgcOQ1wvHfgYOWIAKx87kYPPRI7tJrsMRKlxsP/q1Seh65Y
	suVUB2dflSgyKYrcyVxCNC9A2FchTesK6M8co+Sk5yvnUExVpDiOsY+Dxrzol+6GWFXd
	oZ1lB+RUvFg/TkI6B6suvaQlpVnhg/wzYDMD9YEkXVjOQ7vAgtRmB6P64N+rTgGoRItC
	zkwA1zqExPEXkKQBwOrfPPgcohFU5nYCfinIZbBAPIh2JKC9Mre7XMVXGBL5PetA4yrr
	ZR6GUrplJ1c7RVBtb/HWj6+CX7Qcbpyw3ShFPin0gG4YRCBR397Be5NTVirVAxnDHqjD
	UAfA==
X-Gm-Message-State: AHQUAuYaE9AHk/+T+nSgGfxYHwRlnpGyKiA6wqJrg8BPr1ZS1sjeDRzR
	i2zY7mCXMrLkkOwSeKuj7p3AQdhX
X-Google-Smtp-Source: AHgI3IaJ8oUDsozTH+cCKJNQqSQlmUNDaqAsq6iRxzE1M5M2WgjtsVctZTj+TieW1WPTxshUJ7+bfw==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr3077670wmh.53.1550584703840; 
	Tue, 19 Feb 2019 05:58:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:09 +0100
Message-Id: <20190219135815.18177-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219135815.18177-1-alex.kanavin@gmail.com>
References: <20190219135815.18177-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] meson: add a couple of patches to help with mingw builds
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
X-List-Received-Date: Tue, 19 Feb 2019 13:58:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  2 ++
 ...s-windows-split-WINDRES-env-variable.patch | 26 +++++++++++++++++++
 ...etect-windows-also-if-the-system-str.patch | 25 ++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index d37afc3b0dc..c39b1a3d5e2 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -12,6 +12,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://cross-libdir.patch \
+           file://0001-modules-windows-split-WINDRES-env-variable.patch \
+           file://0002-environment.py-detect-windows-also-if-the-system-str.patch \
            "
 SRC_URI[sha256sum] = "fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551"
 SRC_URI[md5sum] = "3c35b91e8040901034809576d54007c6"
diff --git a/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch b/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
new file mode 100644
index 00000000000..c334e6dd66b
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
@@ -0,0 +1,26 @@
+From 5293d0f5067b2aeefe9ce3c175c972de367589bc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 13 Feb 2019 17:43:54 +0100
+Subject: [PATCH] modules/windows: split WINDRES env variable
+
+As it may contain not just the binary, but also the arguments to it.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/windows.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/modules/windows.py b/mesonbuild/modules/windows.py
+index d185d89..dbaeb9b 100644
+--- a/mesonbuild/modules/windows.py
++++ b/mesonbuild/modules/windows.py
+@@ -56,7 +56,7 @@ class WindowsModule(ExtensionModule):
+             if 'WINDRES' in os.environ:
+                 # Pick-up env var WINDRES if set. This is often used for
+                 # specifying an arch-specific windres.
+-                rescomp = ExternalProgram('windres', command=os.environ.get('WINDRES'), silent=True)
++                rescomp = ExternalProgram('windres', command=os.environ.get('WINDRES').split(), silent=True)
+ 
+         if not rescomp or not rescomp.found():
+             # Take windres from the config file after the environment, which is
diff --git a/meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch
new file mode 100644
index 00000000000..1be5d663291
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch
@@ -0,0 +1,25 @@
+From 7bf4c2c02eb7fe1bf24b23e3ba2d7df36495e0aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 13 Feb 2019 17:45:09 +0100
+Subject: [PATCH] environment.py: detect windows also if the system string
+ contains 'mingw'
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/environment.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index b4fc0dc..845077e 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -1247,7 +1247,7 @@ class MachineInfo:
+         """
+         Machine is windows?
+         """
+-        return self.system == 'windows'
++        return self.system == 'windows' or 'mingw' in self.system
+ 
+     def is_cygwin(self):
+         """
-- 
2.17.1



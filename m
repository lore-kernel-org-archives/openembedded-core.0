Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id B4E9E606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 10:17:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id a16so11833444lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Xwq5OKuwtNw+6cWhj1ttSKB+OoaPjzEjTcDKkRmO6gY=;
	b=HnfBKknx2gKQQ37WXe0nGtIXjmeoP/0qj6pXzuqPit0pyAmEyhXT2nji0a9ZHUp80X
	iVzyKLRDQkBuO4lPYsjyec67hFfhcl8joC1oYptYRDcGSVAZdLPkF7D8fCdqvRPTlXad
	205NDMk76uWhOw15dKznYZmecT2wWygN4SqAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xwq5OKuwtNw+6cWhj1ttSKB+OoaPjzEjTcDKkRmO6gY=;
	b=HhrY7Ckz5yzoWd19R657sgNIk9eSuhLsmgc6g4kHxuaDDmtWq0do404i77IWfDzxoI
	pCfvpR3mQXjjp6fm55BOIW5UIXTXjh7QuRbe87SSXsOUAoevWKrJfqiLPA/6eKiKHOrW
	C49l3B5gjHvi9gidUIBzEmQgJwe2Ksh3j6kzuCCg5RYqQScIkd+roCDHUHZYCKwUq/MI
	FZPMc/T1/X6rkL6QpDKdPcSrhXsSvrgveNjnFT7EmfYllEGhL1nUQdMk2gjjV6Ebznt6
	L74mv8rwDfRW/ijO5XhwHKySn1jHEc4nqm5Tc+G3QWqjDzkReSsrxy9xVVwRXxMw18oO
	xAEg==
X-Gm-Message-State: AA+aEWYY0T5uHSbzZsEb07zjcqHI650Qi3lcUitkRCZv3pbJ4P47Tb8M
	VhJXYGmHJgLMwIpMqQkS+EPtqGdea1U=
X-Google-Smtp-Source: AFSGD/XvXSeQ385XnOTXmeC99G59Qsd6a0r7XCtI5KhX2iQtLeFaviVu6t/78fMYkhC37NBuFLL1mA==
X-Received: by 2002:a19:2b54:: with SMTP id r81mr10035093lfr.34.1545128237485; 
	Tue, 18 Dec 2018 02:17:17 -0800 (PST)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id
	b17-v6sm2936830ljj.93.2018.12.18.02.17.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 02:17:16 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:16:58 +0200
Message-Id: <20181218101659.6531-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] eglinfo: upgrade SRCREV to 223817ee3798
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
X-List-Received-Date: Tue, 18 Dec 2018 10:17:18 -0000

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

SRCREV upgraded to 223817ee3798 ("Add Wayland support")
Additional patches rebased to this version

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 meta/recipes-graphics/eglinfo/eglinfo.inc     |  2 +-
 ...INCDIR-to-searchpath-for-egl-headers.patch |  9 +++----
 ...01-Check-for-libegl-using-pkg-config.patch | 27 +++++++++++--------
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index 07ad07220b..6dcb0c5a19 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master \
            file://0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch \
            file://0001-Check-for-libegl-using-pkg-config.patch \
            "
-SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
+SRCREV = "223817ee37988042db7873cfb5b2e899dfe35c10"
 
 CVE_PRODUCT = "eglinfo"
 
diff --git a/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch b/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
index ca9f55c189..61327eb36b 100644
--- a/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
+++ b/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
@@ -1,4 +1,4 @@
-From 94b1e6daf7d70550b0e32fbb269fcf6887948d3f Mon Sep 17 00:00:00 2001
+From 99a5784d33ad5e0e6fa00338d2732cbccad7661c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 16:08:22 -0800
 Subject: [PATCH] Add STAGING_INCDIR to searchpath for egl headers
@@ -14,10 +14,10 @@ Upstream-Status: Submitted
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/wscript b/wscript
-index fcbb55b..cece8bf 100644
+index 195e247..0f6ec53 100644
 --- a/wscript
 +++ b/wscript
-@@ -163,9 +163,10 @@ def configure_raspberrypi_device(conf, platform):
+@@ -177,9 +177,10 @@ def configure_raspberrypi_device(conf, platform):
  	conf.check_cxx(mandatory = 1, lib = ['GLESv2', 'EGL', 'bcm_host'], uselib_store = 'EGL')
  	import os
  	sysroot = conf.options.sysroot + conf.options.prefix
@@ -30,5 +30,4 @@ index fcbb55b..cece8bf 100644
  	conf.env['WITH_APIS'] = []
  	if check_gles2(conf):
 -- 
-2.7.0
-
+2.19.1
diff --git a/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch b/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
index 0289ac228c..572c8014ca 100644
--- a/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
+++ b/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
@@ -1,22 +1,25 @@
-From 58d51d941d3f4dfa38be18282d3e285d76d9020d Mon Sep 17 00:00:00 2001
+From 17f5d2f574236f8c3459f9efadef2f0f6220a4dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Aug 2018 15:46:53 -0700
 Subject: [PATCH] Check for libegl using pkg-config
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Roman: patch has been rebased to 223817ee3798 ("Add Wayland support")
+ trivial merge conflicts resolved]
+Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
 ---
- wscript | 1 +
- 1 file changed, 1 insertion(+)
+ wscript | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
-Index: git/wscript
-===================================================================
---- git.orig/wscript
-+++ git/wscript
-@@ -160,14 +160,9 @@ def configure_raspberrypi_device(conf, p
- 		conf.env['PLATFORM_USELIBS'] += ["X11"]
- 	elif platform == "fb":
- 		conf.env['PLATFORM_SOURCE'] = ['src/platform_fb_raspberrypi.cpp']
+diff --git a/wscript b/wscript
+index 0f6ec53..401f62e 100644
+--- a/wscript
++++ b/wscript
+@@ -174,14 +174,9 @@ def configure_raspberrypi_device(conf, platform):
+ 	else:
+ 		conf.fatal('Unsupported Raspberry Pi platform "%s"' % platform)
+ 		return
 -	conf.check_cxx(mandatory = 1, lib = ['GLESv2', 'EGL', 'bcm_host'], uselib_store = 'EGL')
 +	conf.check_cfg(package='egl', args='--libs --cflags')
  	import os
@@ -29,3 +32,5 @@ Index: git/wscript
  	conf.env['WITH_APIS'] = []
  	if check_gles2(conf):
  		conf.env['WITH_APIS'] += ['GLES1', 'GLES2']
+-- 
+2.19.1
-- 
2.17.1



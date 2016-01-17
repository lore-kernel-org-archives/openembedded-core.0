Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 40390770FB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:38:01 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id n128so142178665pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nNzsjkfUG8pmoItOTYUp+neXIroh+nL7vDKipeZDt90=;
	b=cuZ72VVMhFPgPaC4fzqByQd2wNhAO9PVusDBzI+toqZagj+giywCnQwO5hjCauOGY3
	3ceXTTBurdiLxzYwJdgS+GSfpUY2orOSxc8bgcatnLb99ri7WB7DiwgtqJNFjdiffifa
	dtNL8TeGuJDx23yaaIMbmu0HssS+OpJMYFIAcEcsafxWmQRZPfCWw8UV53dnLzZLsl9d
	OAOLtZHWULkK+bF1SEwjpM3FzKvRaF8BsQJux7Wp4qUmQD2QiD7kUeI/sxfrNIAa32tC
	yU4R0E/GF/rv18wyaiQBt36ACPZzKo/MZr3FHdsBtvvuYX5WDIMYC1iWUxrVe5FHT/nI
	/ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nNzsjkfUG8pmoItOTYUp+neXIroh+nL7vDKipeZDt90=;
	b=Uyxvq6ZSkhJRxPcEn5LY16DbS7EzmLfVICp7g61v9hoO8g3FWdAX2M9wsTzNsFrB5F
	D6kmprqqTV3pnPjx7i4Adlt7RZMAL/uiy40yNgCtfToQnnYXK2pZqutgyBvzzVf0GrGI
	s/pwmEeHDAezBT3s2FBfQDRVqE2DPKo38oubzhJ/0EgAGcVMxNi/IIat+6PBQM/RnEXM
	1cuaz9HNdhkcluGE20Q/lf92DPnTBunChavHSUdbg5gvcK8dXowLXz1fa0XtQ+7VQNCu
	tu3VlVtn58VY13ScqqU9tU4bxDvpwtuNMXR33GLRLomR/zlvEyOZDrKgS1W24H2SWa6F
	eG6g==
X-Gm-Message-State: ALoCoQlutKHVgSmae/I7nSWY4t8aAM5omoxcyDBBdOep8Q6BdYPuOfIJnjsQIvG0+ePnjneklQd3IgpNF/opQcRHPYwwJBghaw==
X-Received: by 10.98.68.132 with SMTP id m4mr28505718pfi.79.1453030682305;
	Sun, 17 Jan 2016 03:38:02 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:42 -0800
Message-Id: <49764a572cc9b2f0ba47b82be636df41f10e05ce.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 69/73] eglinfo: Fix build on raspberrypi
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
X-List-Received-Date: Sun, 17 Jan 2016 11:38:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/eglinfo/eglinfo.inc          |  4 ++-
 ...GING_INCDIR-to-searchpath-for-egl-headers.patch | 34 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch

diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index fb89175..d0c0c27 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
 
 DEPENDS = "virtual/egl"
 
-SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
+SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master \
+           file://0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch \
+          "
 SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch b/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
new file mode 100644
index 0000000..ca9f55c
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
@@ -0,0 +1,34 @@
+From 94b1e6daf7d70550b0e32fbb269fcf6887948d3f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 16:08:22 -0800
+Subject: [PATCH] Add STAGING_INCDIR to searchpath for egl headers
+
+bcm_host.h is in standard includedir in sysroot
+add that to header search paths.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ wscript | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index fcbb55b..cece8bf 100644
+--- a/wscript
++++ b/wscript
+@@ -163,9 +163,10 @@ def configure_raspberrypi_device(conf, platform):
+ 	conf.check_cxx(mandatory = 1, lib = ['GLESv2', 'EGL', 'bcm_host'], uselib_store = 'EGL')
+ 	import os
+ 	sysroot = conf.options.sysroot + conf.options.prefix
++        std_include_path = os.path.join(sysroot, 'include')
+ 	vcos_pthread_path = os.path.join(sysroot, 'include/interface/vcos/pthreads')
+ 	vcms_host_path = os.path.join(sysroot, 'include/interface/vmcs_host/linux')
+-	if not conf.check_cxx(mandatory = 0, header_name = ['vcos_platform_types.h', 'EGL/egl.h', 'bcm_host.h'], includes = [vcos_pthread_path, vcms_host_path], uselib_store = 'EGL'):
++	if not conf.check_cxx(mandatory = 0, header_name = ['vcos_platform_types.h', 'EGL/egl.h', 'bcm_host.h'], includes = [vcos_pthread_path, vcms_host_path, std_include_path], uselib_store = 'EGL'):
+ 		conf.fatal('Check if --prefix and --sysroot are set correctly.')
+ 	conf.env['WITH_APIS'] = []
+ 	if check_gles2(conf):
+-- 
+2.7.0
+
-- 
2.7.0



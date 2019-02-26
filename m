Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9CBE7CCA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 00:52:24 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m1so724479wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/z+4+GxZcXzM6XEchufZrcOq56JIFzLKGz9zcr8x3gE=;
	b=DaaIYtswZJs2KfbbArXV84o65YWYqsxiM+YhxLBXoPGfMvMZ3HoxIQh+lwk8RObzt4
	nOPsLhg9FLznT/T5O5g+gtFn2Ky5E88m4rER9LFxWAK9jWY2KLy99VAjHwkQmDVPm73K
	sLtdwNnP37DF1yPTHR3XigMYZIhC5B0JJtOsCPeVnLk5SwL/CC2DiKa8YJXNSQaAouCI
	oLTYyB3u5PF/SshYHSp4yxGosNkk7TMDe3FvxIyqMi12Ej4gVb3rTmmWBm3ECiIsLeyK
	v8zUef1PIP7D5PGthEKEHn2TmP1wffDdKaGnU37ELDvMCx7vqheosV/3OctyhuJs6cui
	Grpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/z+4+GxZcXzM6XEchufZrcOq56JIFzLKGz9zcr8x3gE=;
	b=bGu9Ct8AB3m1CJJOU6C/O9O3E34KSIEDTywoMX+o3EXjfUFXa1VUhmU8NuVUGFHpwX
	m+HNC8iOX3gmU7H+fDK2Nv/2y1ho9daR39mj6fVOR0+FnqLPBYs0pXutYgwOEsag9cqP
	RGA5y1mJlDR11cqCY8CP+HTighwu13HRDPnIl0v8J3OtEG4GiTESq2eITHpdKQQjwsXF
	KohAvrCmLOlXjmmEhA/oiiSRItAWP1hiOcJclBDjMWqozKQXO3ixIYs5VRandwP2Awsd
	dSk2DB1jAZ8bac22i/aV3JxPhMKJ4h8xU+OKBIb0Q2X8vKx3p/sL59k4mPLUPdvm2lvv
	JRwA==
X-Gm-Message-State: AHQUAuYTWgj0cmipj0LmwmnRIGVk8vR4JytA5Nrh8e33izFZXJrUbdR9
	DAwpvP6dEw60qLO+5OmFfdmU1U5MKYM=
X-Google-Smtp-Source: AHgI3IYVCg9/D10ne6MBCECqihDp3YM8e4cUiqCmyxAzyShjbji6TejEch9iWrUS2N5pc5Ha2IG63Q==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr843726wmg.39.1551142344928; 
	Mon, 25 Feb 2019 16:52:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e6sm11799163wrt.14.2019.02.25.16.52.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 16:52:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 00:52:21 +0000
Message-Id: <20190226005221.27806-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][thud] mesa: ship /etc/drirc in mesa-megadriver
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
X-List-Received-Date: Tue, 26 Feb 2019 00:52:25 -0000

Many years not shipping the stub drirc seemed like a good idea,
but now it has content and is essential for some applications to run.

Following patches in master, ship this file in mesa-megadriver.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0cc0a82de49..f47f1aa20d8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -141,8 +141,6 @@ do_install_append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
-    rm -f ${D}${sysconfdir}/drirc
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -209,8 +207,8 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
-FILES_${PN} += "${sysconfdir}/drirc"
-FILES_mesa-megadriver = "${libdir}/dri/*"
+FILES_${PN} = ""
+FILES_mesa-megadriver = "${libdir}/dri/* ${sysconfdir}"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
-- 
2.11.0



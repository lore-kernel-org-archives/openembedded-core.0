Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6AB7719C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 10:46:01 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p63so64375396wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 02:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GuHLNbw2dH48H6k3l19kvzo+OWGrGqAaW7fyDf9JDIg=;
	b=XqQECn2aG9lM6R16RVa7KvusBjB4NAkmuGnh3XXjdUfpoC2Uyvm9qYCJfxm7yjUDZG
	elpwhWnHmHU1WgFBwM3h97UNezx5KJA3COpnomjSeuqsHD4/Fu/cAmMuvStvMHHek6Xr
	iTH7TVtb85f43CqUJHuRQPIQLO7rWUJmbRpqKk1jI2Qu37T8ADLWR7GOBVmOe3Y71HXu
	xyzgnSApAOWcajw+HgoT8CZX7k2Yi2pyRQpTYV6gyov5AwadIkPhAFYzhA+0AodTKIHk
	f2sLrbH2+vfJK2ei84ENha3rszGXy9UPkLgNqI3MjOV4RhWoaPFGiZQOzSUB7JiyR/bG
	TGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GuHLNbw2dH48H6k3l19kvzo+OWGrGqAaW7fyDf9JDIg=;
	b=XBs2kKZvVWAFcpNynOUy2xubA3R61ArEmPPIK/drzph16qtec8BCmocvpF3Lkm9T+G
	9ZnZIbgV4+EK52nHN5RtrimVgwp0zbTll9FPCDujr/kmPXxjukbOZq1XACbjR2Uz3hAN
	8HHBJTGKgDWBLvq1AJpuYzh/z7OMZDVPBqnKr+cMjkMm+vOdjdnUJaM7zRmoSFc8C8kg
	1jV800TVuT+0xxJes8G7CfjmyI5WzI3ZxRjLC/1oI8Py6sW3Gf5z/LmUWSIGhGPaiqMB
	SMTYQXviY+WX4gfnz67RqX9fJmiHkmEl3A6r24o7U1j0yaGhYzwY3LH4QMc2fu+pJCx6
	DeBw==
X-Gm-Message-State: AG10YOSMYYkJGguYH+ewjzKyi2jjFae95gvkahqkvgC3nmZza3AZsCUKFrGM4PNIj5bjAxMF
X-Received: by 10.28.127.5 with SMTP id a5mr11569548wmd.32.1454323562096;
	Mon, 01 Feb 2016 02:46:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 73sm10862322wmm.7.2016.02.01.02.46.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 02:46:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 10:45:59 +0000
Message-Id: <1454323559-21333-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] directfb: use Yocto source mirrors for SRC_URI
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
X-List-Received-Date: Mon, 01 Feb 2016 10:46:02 -0000

directfb.org has been offline for several months now, and the "official"
DirectFB repositories on GitHub haven't been touched since October and don't
contain the 1.7.x branch or tags.

So that everyone (specifically people who don't have the Yocto Project source
mirrors configured) can download DirectFB, point the SRC_URI at the Yocto
Project source mirror directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb | 2 +-
 meta/recipes-graphics/directfb/directfb.inc               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 9c3e8bf..7907c5c 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 
 SRC_URI = " \
-           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
+           http://downloads.yoctoproject.org/mirror/sources/DirectFB-examples-${PV}.tar.gz \
            file://configure.in-Fix-string-argument-syntax.patch \
           "
 
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index be39b83..f6b7cbe 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 HOMEPAGE = "http://directfb.org"
 DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
 
-SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
            file://fusion.patch \
            file://bashism.patch \
-- 
2.6.4



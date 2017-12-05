Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 254027870E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:18:58 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id x49so438538wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 06:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Lt3rpkVxIGb+ymVva+T044tnKL08RLeRWLuNgoEUh+k=;
	b=udYzHtAscNDNgTxILfb3HCSXQnEAlvggs9+UXtoq7yy1bbpH5odCV1HJT5yLfVk2x7
	igM6KmG2IQp3Pt9ONzy4lgOAxowQukNuXordOtOAob4lpkENI3q0IbQ0CoMVQ3R14fE7
	q3ECG2UYrcaHoFpeW8ZZpVuLnzGVlpXRPJVGeSr+VsVGXUV/MADjfacLGdLjrLP2MbDT
	DBbrdf2rp9NH/XXYgIpjPCwB199bI0LKYPtg6Lp0Bijk+oFvLhTaLcXDdWG8Joxwvphu
	JHGpokIGXl9Lg8PvnGrdnWlQQGkNtwAjPHqCicNFr8laFoIYr4bdINW+w5NXL8U44Ecc
	BkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Lt3rpkVxIGb+ymVva+T044tnKL08RLeRWLuNgoEUh+k=;
	b=JyofZOrXE83kqoAxlDf4/Z7zzR3nauTTmriRbLfRVR4BWcXKddcUuWNVWeGHbKo5DN
	/6AIcgH6yXjY3oMMsrfowOZFNiKUCxt04EdRwJuSZWwFZ7CWM4m9Z7xnbCFozZuqfaYg
	imf6EOdaRE8Mx4HGqLEZzmctDa07fliwVI4IOASzeFHsFP5vloloQgJO98LsFT2R51tv
	JueHfbXwk7K52il48HyoEtffCv+xfPcxHypRnX619k9PbVXI/u5lMxi2oSSrE0cgEKqI
	PPD4M9LJsiTuf/TFvCD0VhXtaGC/HYFrFApbp9fDXkp9BeXcJ0+vw4ol8JJr+f05oyeI
	6D/g==
X-Gm-Message-State: AKGB3mLYFaP2LfIgMdHBpsPqxYe7scOUq1XO0i5oQigmikOToBCxY70c
	delhf9nBsX60Z7JsMzKd2THXRaBj
X-Google-Smtp-Source: AGs4zMY6t+1yRnrdwdUWNNUk9lLE5ugIuQwGaCjiXqI0DXJxYtntxt/sxKjZ9MwkU+iF4wUNd35JAg==
X-Received: by 10.223.180.69 with SMTP id v5mr2662028wrd.193.1512483539528;
	Tue, 05 Dec 2017 06:18:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 34sm301178wra.39.2017.12.05.06.18.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 06:18:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:18:47 +0000
Message-Id: <20171205141848.24825-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171205141848.24825-1-ross.burton@intel.com>
References: <20171205141848.24825-1-ross.burton@intel.com>
Subject: [PATCH 3/4] xserver-xorg: remove redundant Wayland patch
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
X-List-Received-Date: Tue, 05 Dec 2017 14:18:59 -0000

The installation path and wayland-scanner location problems in Wayland were
resolved in "wayland: Fix installation patch issue" (oe-core 14c0d99) which made
the WAYLAND_PROTOCOLS_SYSROOT_DIR workaround redundant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...c-Fix-wayland-scanner-and-protocols-locat.patch | 38 ----------------------
 .../xorg-xserver/xserver-xorg_1.19.5.bb            |  1 -
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
deleted file mode 100644
index eafd07a5f19..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 963428f914c42270d3312d4f0c0840565521534e Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 16 Nov 2016 00:41:51 +0200
-Subject: [PATCH 2/2] configure.ac: Fix wayland-scanner and protocols locations
-
-We want to use the wayland-scanner in path (native sysroot)
-instead of using pkg-config which gives us target paths.
-
-The protocols paths on the other hand need to be prefixed with the
-(allarch) sysroot because, again, pkg-config gives us target paths.
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 58f1567..383a7df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2525,11 +2525,9 @@ if test "x$XWAYLAND" = xyes; then
- 		AC_MSG_ERROR([Xwayland requires CLOCK_MONOTONIC support.])
- 	fi
- 
--	WAYLAND_PREFIX=`$PKG_CONFIG --variable=prefix wayland-client`
--	AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner],,
--		     [${WAYLAND_PREFIX}/bin$PATH_SEPARATOR$PATH])
-+	AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
- 
--	AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
-+	AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
- fi
- 
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
index c9530315179..398eb817dbb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
@@ -2,7 +2,6 @@ require xserver-xorg.inc
 
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
-            file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             "
-- 
2.11.0



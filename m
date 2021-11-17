Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AD2C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.8733.1637163343907320762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n9WSsGmc;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so5128913wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YvB19hOqd7bOiH3E6VmWUqOlbfkOzlZbGCNCM2x7caQ=;
        b=n9WSsGmcorjTNgMua30B8/yRYhrBhiD6HWunHqhDc7O/VkIfOHpA85ivqw0A78XiKo
         u6D6LfMdG8/LaN/7cS0QsgmI4wH0DQsWgcpDN2IcoY53z46MPaT+htB+rRsbRWA/tx8M
         HNj8xw/HfdcwfP3XWU4+Aspw7ahi2Hifx2oJqnIR7c5IkKZ+zpp6+od/jwpl4thO8yVx
         piW/03yLjCzSXQz0XPAt1lpLHc6dQSaXNZiSUSDrKvptWbNv3JsRW46jMPd3tzOTK4bl
         Kx9yUjX9Pk9wG01/7ts2nbwyG5Vi9SiMJGr1tNUS023LnDQKnK5cSrvCnFvl42t2DsHB
         pr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YvB19hOqd7bOiH3E6VmWUqOlbfkOzlZbGCNCM2x7caQ=;
        b=wuQVAhFnQ9bLwlA1xrrk6KlYFSRfFwpk9446Tht7MWENXUrFxopJByx+n3UIldZGVl
         2LChzpPgiR+LRa0X9sw0pBlqausVUcWIsHpZiyIdteq7bAJGcSfK6pulxdmowz2SoZYT
         N7D6r2AmL9jjeMVtOYS7yqpPqiXfd3LBO/xpfy4gjifwUjzJ00pemLkNJehz5t8Xn/n/
         pc9LKBayGP2KjWZjA4/g21ltXSmMbiVb1B9VlgvbbB8+Vvx5tMsFiOveH2OJmfMKPnAq
         BdMiPS6SZRcOLxCiynD9IfuC3WXbMDD9ZCaOeCNfQ086FpltpJfkfuDzutxyIIPnPI6n
         pV2A==
X-Gm-Message-State: AOAM533CX2MADfImhkBHO4IKB4bZA25RvKVb/wlNMRhOws+eHOChzRK7
	3Zar9ZKh6LV/rNdCiBvldq+eRw72KtE=
X-Google-Smtp-Source: 
 ABdhPJxLkE8zd+qX6f2npSb0Wee/7o6HDmX4Im9PIw9JnUVa33Fl/I8iAqSHQznTpeaPzSfQkup/mA==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr577727wmf.177.1637163342482;
        Wed, 17 Nov 2021 07:35:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH 23/36] libsamplerate0: update 0.1.9 -> 0.2.2
Date: Wed, 17 Nov 2021 16:35:12 +0100
Message-Id: <20211117153525.257146-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158418

Upstream moved to github.

Drop both patches: alsa configuration merged upstream,
shared version info fixed upstream.

License-Update: urls changed to github.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-configure.ac-improve-alsa-handling.patch | 62 -------------------
 .../libsamplerate0/shared_version_info.patch  | 13 ----
 ...rate0_0.1.9.bb => libsamplerate0_0.2.2.bb} | 14 ++---
 3 files changed, 5 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.9.bb => libsamplerate0_0.2.2.bb} (60%)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
deleted file mode 100644
index d19b514e6b..0000000000
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 957ebce3837588f71016e37ffaf9aad0a9d41cec Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Sep 2016 12:02:06 +0300
-Subject: [PATCH] configure.ac: improve alsa handling
-
-Three improvements:
-
-1) "--enable-alsa" or "--disable-alsa" caused a warning about an
-unsupported configure option, because AC_ARG_ENABLE was not used.
-
-2) If alsa was disabled, the "Have ALSA" item in the summary would print
-an empty string instead of "no".
-
-3) If "--enable-alsa" was passed to configure, but the headers were not
-found, configure would still succeed (with alsa disabled). It's better
-to fail and abort configure if a feature that was explicitly requested
-can't be enabled.
-
-Upstream-Status: Submitted [sent to src@mega-nerd.com]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 474c6ab..bad597e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,6 +101,9 @@ AC_ARG_ENABLE(cpu-clip,
- 		AC_HELP_STRING([--disable-cpu-clip], [disable tricky cpu specific clipper]),
- 		ac_arg_cpu_clip="N", ac_arg_cpu_clip="Y")
- 
-+AC_ARG_ENABLE(alsa,
-+                AC_HELP_STRING([--disable-alsa], [disable ALSA support in the varispeed-play example program]))
-+
- #====================================================================================
- # Check types and their sizes.
- 
-@@ -194,6 +197,10 @@ if test x$enable_alsa != xno ; then
- 	if test x$ac_cv_header_alsa_asoundlib_h = xyes ; then
- 		ALSA_LIBS="-lasound"
- 		enable_alsa=yes
-+        elif test x$enable_alsa = xyes ; then
-+                AC_MSG_ERROR(["ALSA headers not found"])
-+        else
-+                enable_alsa=no
- 		fi
- 	fi
- 
-@@ -340,7 +347,7 @@ AC_MSG_RESULT([
-     Have FFTW : ................... ${ac_cv_fftw3}])
- 
- AC_MSG_RESULT([    Have libsndfile : ............. ${ac_cv_sndfile}])
--AC_MSG_RESULT([    Have ALSA : ................... ${ac_cv_header_alsa_asoundlib_h}
-+AC_MSG_RESULT([    Have ALSA : ................... ${enable_alsa}
- ])
- 
- AC_MSG_RESULT([  Installation directories :
--- 
-2.9.3
-
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
deleted file mode 100644
index b42d564b4b..0000000000
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: libsamplerate-0.1.8/configure.ac
-===================================================================
---- libsamplerate-0.1.8.orig/configure.ac
-+++ libsamplerate-0.1.8/configure.ac
-@@ -53,7 +53,7 @@ AC_PROG_LN_S
- #  6. If any interfaces have been removed since the last public release, then set age
- #     to 0.
- 
--SHARED_VERSION_INFO="1:8:1"
-+SHARED_VERSION_INFO="1:9:1"
- 
- 
- 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
similarity index 60%
rename from meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
rename to meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index 8345d6880f..ed2b6437dd 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -1,24 +1,20 @@
 SUMMARY = "Audio Sample Rate Conversion library"
 DESCRIPTION = "Also known as Secret Rabbit Code - a library for performing sample rate conversion of audio data."
-HOMEPAGE = "http://www.mega-nerd.com/SRC/"
+HOMEPAGE = "https://libsndfile.github.io/libsamplerate/"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
-                    file://src/samplerate.c;beginline=1;endline=7;md5=5b6982a8c2811c7312c13cccbf55f55e"
+                    file://src/samplerate.c;beginline=1;endline=7;md5=7a4238289dc36bfb70968ccaa5bd0d4f"
 DEPENDS = "libsndfile1"
-PR = "r1"
 
-SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
-           file://0001-configure.ac-improve-alsa-handling.patch \
-           file://shared_version_info.patch \
+SRC_URI = "https://github.com/libsndfile/libsamplerate/releases/download/${PV}/libsamplerate-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
-SRC_URI[sha256sum] = "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
+SRC_URI[sha256sum] = "3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893"
 
 CVE_PRODUCT = "libsamplerate"
 
-UPSTREAM_CHECK_URI = "http://www.mega-nerd.com/SRC/download.html"
+UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsamplerate/releases"
 
 S = "${WORKDIR}/libsamplerate-${PV}"
 
-- 
2.20.1



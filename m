Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.46209.1609166190884361242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CtICYq+T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id q22so6362074pfk.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vVHC+DOXt4F+MGj7cfFnGXrn/7ozZhYM8RMpfPOXyjY=;
        b=CtICYq+T8uh9UEJeASwI0W5P3qknPYaMhuGB45H1IcMnzBSPADjHBTV5R/1/pz8oeQ
         diZCvWDFBTv2JZANHzxabH58X5yTCC8B94t8k7HH9cIk2kAm9L3Vr35+GU2F8LSzW6jk
         luzS6tYIoOOH7/OLIeKPErrpyYf2qXnVyM8Hmw7b4/X1MWn4HzlYBpz0D1IMb1VY+SQy
         H8x2qbZ02K8BAx5LzpR2MyKrPlxCGjSzloBNGh5ytFN1MMd9ITw2hD3IsI97L32g2bch
         VxK6pGwNDXcxpf1iSaNFGEvWzIDXagGMCDCyaMDlBi9xDgp20RDaiAX7pzxBMCN08KvG
         sJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vVHC+DOXt4F+MGj7cfFnGXrn/7ozZhYM8RMpfPOXyjY=;
        b=a+fTMNfBCPkpOQjZ5hY2ymWJ5eWg450ODHHahF/8uyz8nlE2KinmHEYJ46m9SE0Yss
         opvZeymh7cS5Ri9K2g1oRAqmhCPUmMXXfIUFS1LNVLkFLvJe4bXkUVLwrY5NZ4KHFvC7
         eygIB7jJWb9lK1Xsy/PkZiU4Js9ma3iBB/mpRNizc3wbMIOhKoXaUDZ8AxsJ7lb8mJnU
         MbkRHnamMeO+oByslziQ/Nmcs4YyJrwUDF6hlyXWMIcqGLCmkydmV1QPLfs+0hf4uobN
         QNa8/6aOhZcbrvU+Eq8ZEGoTx/gUqUa09dLvGPzfPUMH4ywKHZIUsrIHmw2QzyjpXH2X
         VkqQ==
X-Gm-Message-State: AOAM531IgDCNEMtrfyqiW4HGIMIpbIgjf9QiquDWzhwAISvL9h48il3o
	UuTuedK2C2YdmxVLKDmeLMcircth6HggfFSmj3U=
X-Google-Smtp-Source: ABdhPJxcfS2L9DSZWh2l6bwSHLh/XT7cXR49ZPwPWl7MWK/pcWrqguFRULzQQqa0atUX6ytL6zJqOw==
X-Received: by 2002:a63:6344:: with SMTP id x65mr18413875pgb.172.1609166190103;
        Mon, 28 Dec 2020 06:36:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] selftest/reproducible: add packages to exclusion list for dunfell
Date: Mon, 28 Dec 2020 04:35:48 -1000
Message-Id: <1746f781d541d0b0aa3280ae121068a029294351.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

Signed-off-be: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 181c08b4c8..5ebf7875d9 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -27,6 +27,7 @@ import datetime
 exclude_packages = [
 	'acpica-src',
 	'babeltrace2-ptest',
+	'bind',
 	'bootchart2-doc',
 	'cups',
 	'cwautomacros',
@@ -41,15 +42,18 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'groff',
+	'grub-efi',
 	'gst-devtools',
 	'gstreamer1.0-python',
 	'gtk-doc',
+	'hwlatdetect',
 	'igt-gpu-tools',
         'kernel-devsrc',
 	'libaprutil',
 	'libcap-ng',
 	'libhandy-1-src',
 	'libid3tag',
+	'libjson',
 	'libproxy',
 	'libsecret-dev',
 	'libsecret-src',
@@ -60,18 +64,24 @@ exclude_packages = [
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
+	'piglit',
+	'pybootchartgui',
 	'python3-cython',
 	'qemu',
 	'quilt-ptest',
+	"rpm",
 	'rsync',
 	'ruby',
 	'spirv-tools-dev',
+	'stress-ng',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart',
+	'systemtap',
 	'valgrind-ptest',
 	'vim',
 	'watchdog',
+	'webkitgtk',
 	'xmlto',
 	'xorg-minimal-fonts'
 	]
-- 
2.17.1


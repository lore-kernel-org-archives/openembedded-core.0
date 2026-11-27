Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1538.1795801787256475938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SeU45Erp;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so7863430f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801785; x=1796406585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q1RaDKJF6+eEp9RVqSjio30v17xkdbdGt2WNLp7ogRk=;
        b=SeU45Erpyk9nx4BHtiy/dC20DSl+nzLEeszNAEUlXnSQ81V18GZ5JrytFo8N5Vd8zi
         tdPhC9fJZLqCNQIkNpuRSfrOM3ijfKpDkU74X4P7TfENmw7MjSgwn08s2tDURoXOFu8Q
         ZZCyx2cE5HHYHsC+0qrFR9WKgPFy4hBtQHX0dr2N0FL9h8tsjlLwBMdwNos31wrLdsQb
         c1fpiibzn14B2r4sXaklBU4o9lopTW/bzvEHfW8wHW/kA1AFiHSGBz3Skhehmjf1kJ7m
         bMBLH2ZbmbDodinJenf/VqVcUDS1j+5qjcykGx5c2JIidsGqOgfrP9/jvSQdkvAVkt62
         sesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801785; x=1796406585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q1RaDKJF6+eEp9RVqSjio30v17xkdbdGt2WNLp7ogRk=;
        b=wS1zGtVO182ZJ6oEvhMIjZsd4h5YAa8VFBjmC3D9cn04zKff4OMHB4/mTTcfm/rBzS
         8kJWnkNppCoqLadp2xFqBVdFUCJeFxMO7u+CjTwR0GwiAaYIT9GnMJU00s1jEbSEu1Et
         GFajpYhPkQGHw0I08HJLWMUqMHRDA0x4uCP7gHhPWSglBZur28tFG5JIA4/pBoYTe1ns
         qMjFMDDqEoIfavCGZ7FEswiyWgvSyoK2t5kFBr8ohkGhzLPeEi3SEAS1ElFgLL8EwQsg
         ibRkDkLwy+CSTKi21lbJqXaNox/CYUk0XIrT4A/vE5QusZJEEn+FOKq3j3VMI3Pwpz4f
         U88A==
X-Gm-Message-State: APuU4Z+B3FAPtVMshijvcFZmQqhR2LuhOp9DNfzhPeGKP2Rsw7Wl8xyI
	dI0ypTqa5Zq2G7w7VdR04Orl8SnYh7SEsro6zeFZiWYWdCQzIn/C7YeLEfHFIZDy0Cp38GrGBXi
	AQPdlTJM=
X-Gm-Gg: AZFdTZfZ1lxA5vuJT/ZtLM4xY2/FZcbxw1AWjUjVhz8Hl6MiRrPQfl29lts0QXAserp
	BoIWfF2BvuaLq5hdeXcIJ8u86DJht916gWL+hxKQPbyYZATQzil1y1REUpdGqgGEQ4sJKt6TIuJ
	mcqc5P3kidup10UkRiJ105OcXfWIYoux6pGZqo26tyEfX2bbQ5I0BO69m9xmtphYOTU3rHJdaYU
	OSHZFVU7sC0B+36nPI66lLKmQ+4ZFKtgMdW1ANno614ix1ykXxe8k5oCY4YGaASjJ6RYK+ta/18
	nuumtNIDfDlf4/erLXbAl8i+vpN0tErKOIibVQrCNRv1h6Vn8/LYW3OOOsbpeLhgJO/fA90yBIL
	LrInJ8HKZInTPsEQnvkO2URoVNnuWvyFcuwzBgeZs/8sZ4qdKxdcmm1ZOl2o4Y8S0UkKkCukAEl
	vt7+c+uY2jDK3oSx50L4k9XNVnsR3jtNtZE0oEeFKpdYKkA+N49UYF8TB5ESEPWVG0mZpOODBOY
	WkKiCf5jhr9XpbmHSyIQPhaK4Wbdkn2p5J97ebWrv57YOa/mIgcLZjyN7dq/Y273qOadOedRhhl
	jEitijtLYFPu7ZJHeFtJDAIm9MS+Los4ioY7oTFAp+W5cVXoMF5FaVdlb2pwUQUGIT9pGH4Zav4
	S9ncS5KNlxbRdu0b8G3ATJOOoRSgj
X-Received: by 2002:a05:6000:1889:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-4abab5ea3b3mr61142331f8f.8.1795801785482;
        Fri, 27 Nov 2026 09:49:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/37] libsndfile1: patch CVE-2025-52194
Date: Fri, 27 Nov 2026 18:49:03 +0100
Message-ID: <026fe7e080fb4c254c9812758df46d4fca04dc0a.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251426
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch references by [1] references in CVE report.

[1] https://github.com/libsndfile/libsndfile/issues/1082#issuecomment-6442050313

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc20c00e9261011c175d4bb92c99f02b5773b419)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsndfile1/CVE-2025-52194.patch          | 27 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
new file mode 100644
index 00000000000..ec5da0b731e
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
@@ -0,0 +1,27 @@
+From 7ff854d1e0bd9a751a9ff52ed980c62afced91fe Mon Sep 17 00:00:00 2001
+From: Saddam <saddamr3e@gmail.com>
+Date: Tue, 21 Jul 2026 20:49:11 +0530
+Subject: [PATCH] ircam: use psf_lrintf when reading samplerate
+
+The IRCAM header sample rate is a float read straight from the file. (int) samplerate is undefined when the value is out of int range or non-finite; psf_lrintf matches mat4/mat5 which convert a file sample rate the same way.
+
+CVE: CVE-2025-52194
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/7ff854d1e0bd9a751a9ff52ed980c62afced91fe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ircam.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ircam.c b/src/ircam.c
+index 3d73ba44..d0780d8a 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -161,7 +161,7 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 
+ 	psf_log_printf (psf, "marker: 0x%X\n", marker) ;
+ 
+-	psf->sf.samplerate = (int) samplerate ;
++	psf->sf.samplerate = psf_lrintf (samplerate) ;
+ 
+ 	psf_log_printf (psf,	"  Sample Rate : %d\n"
+ 							"  Channels    : %d\n"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index b22f5b1e503..37f852d5c38 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2025-56226-02.patch \
            file://CVE-2026-37555.patch \
            file://CVE-2024-50613.patch \
+           file://CVE-2025-52194.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

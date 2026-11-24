Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30985.1795560751106570487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gcmwALMx;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2351429f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560749; x=1796165549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hg8zAs+sJ9efEATajGMf3Squ0pHNOSlXohTqJxrhRs=;
        b=gcmwALMx2y39ctwt07is5YKfxVuGxGy08jKqDDySzocn89I75zKluQJIUIzxrgMj/z
         DM56MDxqCetPvf4NspHoCM7m4PFwVnmW6Q630qMDw8jdr/qGBZMw5XYiWOzXdogG+SGj
         YmQrwqTpCmFh+8B/s8TZIjUGplAmGHST+Gi2ChKodo7iX54jyEz5XU3Uf2QtgzjQiYE9
         bEbk2UmcSCkRib3tXR9Or0VCtEzLJ11X9xp1+FnYWZakhQTfO26x2lbCxRZQrfU04H3V
         CG+i8TT7AzpCQh95qOO8QtSI66H96CV3QEWIa4+h/zIHHwi/Ynv4nK2Njv8w3bc7RqgO
         V6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560749; x=1796165549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2hg8zAs+sJ9efEATajGMf3Squ0pHNOSlXohTqJxrhRs=;
        b=o/39esQEshUoj0h/9bU2Ju0E1fM5ZMqFDX5LrD2ESu9gBO1ls+tNXvHU/SGJ/Zdvtw
         /89ld67Slv8yGBOFsrW6KgRYB5ZROeEVWwGx8TKTPUetMyvdej40jjb7wzP+b7Mk69b0
         hwQuf8fweIFbRFNVVX8ctUrzT+ha7qW9VFpi9gTWbih2c5MTwwfdS+pAJGGX6p+TH7lK
         pLBvGyVuG347qKEBTSGt8VQvcHi0bGAzdJmgb7CZkT6pUhoMR7sORM4I119AZbZCKwey
         zCRCrJgBDoly/3+d+72XSbid6KoYB0VyX5SFdkcYmHYNzi8f/qay5UYBM8BbjLxksol/
         snsg==
X-Gm-Message-State: APuU4Z+2dicL8Qag557vgxwGQTacFM3XX2jjxvb0YyJCh217aB2acABM
	Ho7kGA1y1NM0bf6huK+N9nMjBMw5FDDn7NiincOdFRNYis6fksY76/EbX+PW7183FGLUdMocLVh
	/QOEJldg=
X-Gm-Gg: AZFdTZdSJzKNvykvJAtvYiO6EiIS80ixBnzLegJ30D3BwAdgGy3jXjuDd6MeE92QRzn
	ffUpD+1j36AGNNPp89g9PQVuqhvcNi0Mk9cKKQ+UkxFOIz4J0KmwjL844irtOteJyccu4I3nFS3
	R9KwonpNC3nKGfUUGppm7hZED3zIPGL0GstZ1gONYiCtXe+QqdMpHnkCaTHUYC6HaWSvLufjiC+
	3yOYMkSeKzmkDC1TY5tYahdBirA67IRNNLeLNU0kJI2ZKXOMV6uLaiq60ezfvmy/MAlCmHzVLtY
	tdGej05MucbL07dIlFkfQLLi/zl9OmNJO47TJiVY312/ea3jSUlHNIPstMW0MaSGi1ZxsbfGE6G
	2/reClv+PHQYBRHd3IuZVneFB4/Iyyv4BK59nSdY2dM9YOlSJLjgFUGzHD8waqSaTcruPIuzZn9
	KEaC0GcWC8vtXdw49ZGkH6bA2XwoIqvx2zYbujtkkRq8FUNBHgGP2SAlrAzs+wJxx2cqxdY9gd/
	7NYg5X+l1KBvwIRmFGjR14NHvTSe4O9O9G+b3+dBJXVebpbBYozysWAeBYrNlPoN7iRAHtExoXX
	nrxcwlkWgC9iV2blJnAohqW/jj5uhiokn/KbUzIQF0d0ugffx4SWn8BL3L8wsM1Fcp7fmX+ffTe
	zv6qsvn9+SvkOXI9YCulEnMrk2fLg
X-Received: by 2002:a5d:5849:0:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4abaf7401bbmr34638587f8f.11.1795560749357;
        Tue, 24 Nov 2026 14:52:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 17/21] libsndfile1: patch CVE-2025-52194
Date: Tue, 24 Nov 2026 23:51:24 +0100
Message-ID: <0f8101e27663fdbcc9ba2ba70a9ecb787f1fe18c.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251097
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
index fb466190ab4..2c3e28dc1c8 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2025-56226-02.patch \
            file://CVE-2026-37555.patch \
            file://CVE-2024-50613.patch \
+           file://CVE-2025-52194.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

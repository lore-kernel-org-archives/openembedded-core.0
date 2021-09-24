Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.8932.1632492961414235874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FI1DW1Cl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id n18so9947005pgm.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ot8vGHEvkgLPlhHR9TOdAe9BTHow+urWdw118X2F5/k=;
        b=FI1DW1Cl4y0lVV3HH1JSjjYu2xA+fwt3e8LsJqIWTjeIG+itT4I5VOI2GLTWTexjHQ
         CgBCm+Th46wqRoJ5WozJt66FU54+WPE9LYhNfgM65IwdkuN9WxBe+CUStgTlHiBU8DGx
         u+3YPL4mB0QtnACiI/bPT8DyGzVOlJpRtCPC8iKtlRofbaE+srH8euU3qydcZe1+U5nl
         mDH+RorgyiIuh2JtJTUSw41BST/OWFPsqsedmXJcq/uMvW/FegWLq4ekMPMci5g+t2j6
         QmaQAZmzM6ASXmU5/ofOtiTgD15aKjPx73VOrKz1WcYEZkNPdCJFi/XFnigoMVhGmT58
         vBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ot8vGHEvkgLPlhHR9TOdAe9BTHow+urWdw118X2F5/k=;
        b=KC9LOQ8yKn3Vi5Ch/CM8hFv7GLhkiyxfvSvIwK0tvb8qSF41qWA3n8fy6VMNfhkMqz
         GsS/RCyY1XC04SqoY10JTDB68xVYRdAlwsivNbrIeDC7MDr19vYM3JbPKaD0fjiM0JaD
         TTPGoP+rvTJ46B210Bw0y/PS3Evk04FQ82Rpe3SnHyGdr/qkOeJjRtZEinPyAHPYgM4m
         oSdICbAp4E5eBBHaHQXhTR61WTSV6vbgWyf/IgkwKjPnbXuuWBe9XLL+FHGKzHZXoapX
         wwduJa89kTVQnenUy3w02Cnbu3BIyjt1uNrlesiCVye5cq+ybwk/mW/BoFaQIuXUOtnV
         NBjQ==
X-Gm-Message-State: AOAM530qVWR+7IvQrJwGgJUiPAQjATtngRf6+8Vvlh3exP6SnG2yJ/5p
	bmCDlErvpKNlSCnZKw7rlPVpSaQn5z+iSTeapsk=
X-Google-Smtp-Source: ABdhPJwOLFjrm5Cf6aAlvBegva1jK0y5LohJPriIQwrteYakOwWNAan0Au2lijVusQLCqfZMQKqDjg==
X-Received: by 2002:a63:701c:: with SMTP id l28mr3928229pgc.294.1632492960315;
        Fri, 24 Sep 2021 07:16:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:15:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/25] libsndfile: Security fix for CVE-2021-3246
Date: Fri, 24 Sep 2021 04:15:07 -1000
Message-Id: <e137dcc3002666e56b79dfbd0e2f3bf09f1833d3.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/libsndfile/libsndfile
MR: 112098
Type: Security Fix
Disposition: Backport from https://github.com/libsndfile/libsndfile/pull/713
ChangeID: 10d137de063b7a1e543ee96fbcf948945a452869
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2021-3246_1.patch         | 36 +++++++++++++++
 .../libsndfile1/CVE-2021-3246_2.patch         | 44 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  2 +
 3 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch
new file mode 100644
index 0000000000..6354f856cb
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch
@@ -0,0 +1,36 @@
+From a9815b3f228df00086e0a40bcc43162fc19896a1 Mon Sep 17 00:00:00 2001
+From: bobsayshilol <bobsayshilol@live.co.uk>
+Date: Wed, 17 Feb 2021 23:21:48 +0000
+Subject: [PATCH 1/2] wavlike: Fix incorrect size check
+
+The SF_CART_INFO_16K struct has an additional 4 byte field to hold
+the size of 'tag_text' which the file header doesn't, so don't
+include it as part of the check when looking for the max length.
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26026
+
+Upstream-Status: Backport
+CVE: CVE-2021-3246 patch 1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/wavlike.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+Index: libsndfile-1.0.28/src/wavlike.c
+===================================================================
+--- libsndfile-1.0.28.orig/src/wavlike.c
++++ libsndfile-1.0.28/src/wavlike.c
+@@ -803,7 +803,11 @@ wavlike_read_cart_chunk (SF_PRIVATE *psf
+ 		return 0 ;
+ 		} ;
+ 
+-	if (chunksize >= sizeof (SF_CART_INFO_16K))
++	/*
++	**	SF_CART_INFO_16K has an extra field 'tag_text_size' that isn't part
++	**	of the chunk, so don't include it in the size check.
++	*/
++	if (chunksize >= sizeof (SF_CART_INFO_16K) - 4)
+ 	{	psf_log_printf (psf, "cart : %u too big to be handled\n", chunksize) ;
+ 		psf_binheader_readf (psf, "j", chunksize) ;
+ 		return 0 ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch
new file mode 100644
index 0000000000..d6b03d7d4d
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch
@@ -0,0 +1,44 @@
+From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
+From: bobsayshilol <bobsayshilol@live.co.uk>
+Date: Thu, 18 Feb 2021 21:52:09 +0000
+Subject: [PATCH 2/2] ms_adpcm: Fix and extend size checks
+
+'blockalign' is the size of a block, and each block contains 7 samples
+per channel as part of the preamble, so check against 'samplesperblock'
+rather than 'blockalign'. Also add an additional check that the block
+is big enough to hold the samples it claims to hold.
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
+
+Upstream-Status: Backport
+CVE: CVE-2021-3246 patch 2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/ms_adpcm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
+index 5e8f1a31..a21cb994 100644
+--- a/src/ms_adpcm.c
++++ b/src/ms_adpcm.c
+@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
+ 	if (psf->file.mode == SFM_WRITE)
+ 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
+ 
+-	if (blockalign < 7 * psf->sf.channels)
+-	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
++	/* There's 7 samples per channel in the preamble of each block */
++	if (samplesperblock < 7 * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
++		return SFE_INTERNAL ;
++		} ;
++
++	if (2 * blockalign < samplesperblock * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 044881a859..2525af8fe0 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-12562.patch \
            file://CVE-2018-19758.patch \
            file://CVE-2019-3832.patch \
+           file://CVE-2021-3246_1.patch \
+           file://CVE-2021-3246_2.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.25.1


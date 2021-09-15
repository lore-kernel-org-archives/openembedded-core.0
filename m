Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.834.1631664299688000832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 17:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d8247Vzw;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so878854pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgRNA/sfzE/nncI4siGQ7KnqCR1zEJM8NeXtF+9PhNc=;
        b=d8247VzwmCODF7/Za1Gh8KiLe5XZo8rD8E1EJh47ouZozskxNN7xxTT/jYD7PL4rAZ
         lMQR+Dy9svGwDUSvMyyRHgShSBxPm06uXWdxKnt7YXotIR39GiT0KcsyZ8FNdx1fIz1s
         kK2d2+CAqk2f9doGzH/n7gLAo+te0fZVPqFDTtuUT+X2LYjFKCxHsFX4HU6KGiJT4io1
         FWQUtqNDAGByT5m8ZcFk2HYc9oe9sBzBr9fn5F6BpEO+0N2gULiGX7P1t3ESHDx9klt3
         9YnfNQyngfwsb03NBCs+wcYpcB03MAMwmm19K/PHyQyweb/72ptedMm3BNBxgvYOsT+6
         jXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgRNA/sfzE/nncI4siGQ7KnqCR1zEJM8NeXtF+9PhNc=;
        b=G+FzIU/JfsM5s4pQbXgBp2ZRnbsMwE7tmwc+YD9rR7SuSvfqIJMfc+NVj0DCZV7I9M
         aBrBg83TrbsGJ5ITDI7t6RKRbphtH4nWqgjI3jkLOxSroLQ0dme3v69m0hgK3bln20L3
         pfJc0CyE7hGRI+n2C1z1tJZrelqbsED9ls/+XxxOQQIMQsi0eYPT6pJd7cNTwHTpgBGi
         nUDob1Q0srJO+BXnMkGbuPvUMVgO8ykXTb/4gC7PP0yBtjwqE70aAUW3HJ28S7G3GbQD
         OyVas4/ITQQF8w1dw4GjMdnZ2PWiPr4VotQFfTaOvrsubImwhptQJfhI6SERppRHXkO7
         vPWg==
X-Gm-Message-State: AOAM530IFt8oG1bytlZl4d2MnI4a7KWOhShEiiRfid00ZdSQE1gBV44d
	7aoMNYMx9WpDij387oCeEvZu1FRGb3U=
X-Google-Smtp-Source: ABdhPJwFRFCJLi5TJWK5JRQR2wGxiE/lDn8eMOVGQCZ/SRLiJaRgpN+y4duWtEVjrpTfaBEwqxzNjQ==
X-Received: by 2002:a17:902:d2c8:b0:13a:54b2:81c9 with SMTP id n8-20020a170902d2c800b0013a54b281c9mr16982699plc.21.1631664298843;
        Tue, 14 Sep 2021 17:04:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id x64sm11429452pfd.194.2021.09.14.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 17:04:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] libsndfile: Security fix for CVE-2021-3246
Date: Tue, 14 Sep 2021 17:04:57 -0700
Message-Id: <20210915000457.371631-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
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


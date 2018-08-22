Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 54A687935E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:34 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id z185-v6so2050189oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=Rapz4+RvRMCVq1OUtytaXCg4Wwa1rrCzOMIO0KH/lwsYuvfzenkqmFmmdMZP3MV4V3
	FNgc3BrndK/EoxVHCTnVbramXc/dkq5GTL0AMXRlvTEISeHoqU2BQu2EWDDnuLLXqnfL
	pa6MRyqkHoEPTKsX+xYFf6Xr4ZzCJXP/hB1SX+o6Yj3oqjwuAw03pKR/K/GTSfNm/uc2
	PXegPrj8J67H4TewOXQSesBy790k4ZsFC4qZwVis5K0MJjyPk6PCIdcBMWnNRTFxs/r3
	h6SQXuF4GSmc8wVrbRZYFn0gaCGYDUju/+TMPFrALB8hugxy3Bc/AJTpcYeQUbQv9ZVG
	iJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=TKjKQU4ftkbp0jzc8R24dJbBrJRyOFU32s1lPDVP3UivuIaIJ+XwMq/IG9lyUR95xs
	kmSIxEQfs+06hgG2AN4PR8yPx8tpPrrjbbrFo+BU5WOxgcM935xP8u3SUzE2K+ybN3cD
	yPQDUlfu/6ZVELhtphT8OaFuSkjwnKTge0EXnCZwnV1nA5B0Vh2TjYsCW3fqdS/H9yuX
	KU6BqvtJA9+bpInBB6vF1I8MLU3T73yV+faxhQaVJESR7iwIyX2qQ79/lVbt1Fxewo/1
	ITnhlO4VvFBU0H/Y+PFiSUk2X9Fsfw93PlJQGcctxj5ewLfZ8zlck+Ucj7xX9Ev4V2lS
	ocuw==
X-Gm-Message-State: APzg51ABis4knEn9/Zt8otgoQfiYxrVfqedDyF19vLAwzspNAUJwUTqH
	r5iIbxRdZhHDuS50CPYj1Cjdw1JS1gA=
X-Google-Smtp-Source: ANB0VdauFebMJQu6G/DZj6kNF0fm4L66XHdVNr9wgO+KtGxMuE21nsBsJYLY6C3cn3KXedhkrnzCAQ==
X-Received: by 2002:aca:ad4f:: with SMTP id
	w76-v6mr3623774oie.233.1534936775360; 
	Wed, 22 Aug 2018 04:19:35 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:34 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:08 +0530
Message-Id: <1534936692-11736-30-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 30/34] flac: CVE-2017-6888
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:35 -0000

stream_decoder.c: Fix a memory leak

Leak reported by Secunia Research.

Affects flac = 1.3.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../flac/files/CVE-2017-6888.patch                 | 31 ++++++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2017-6888.patch

diff --git a/meta/recipes-multimedia/flac/files/CVE-2017-6888.patch b/meta/recipes-multimedia/flac/files/CVE-2017-6888.patch
new file mode 100644
index 0000000..389ab96
--- /dev/null
+++ b/meta/recipes-multimedia/flac/files/CVE-2017-6888.patch
@@ -0,0 +1,31 @@
+From 4f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Sat, 8 Apr 2017 18:34:49 +1000
+Subject: [PATCH] stream_decoder.c: Fix a memory leak
+
+Leak reported by Secunia Research.
+CVE: CVE-2017-6888
+Upstream-Status: Backport [https://git.xiph.org/?p=flac.git;a=commitdiff;h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/libFLAC/stream_decoder.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
+index 14d5fe7f..a5527511 100644
+--- a/src/libFLAC/stream_decoder.c
++++ b/src/libFLAC/stream_decoder.c
+@@ -1753,6 +1753,9 @@ FLAC__bool read_metadata_vorbiscomment_(FLAC__StreamDecoder *decoder, FLAC__Stre
+ 					}
+ 					memset (obj->comments[i].entry, 0, obj->comments[i].length) ;
+ 					if (!FLAC__bitreader_read_byte_block_aligned_no_crc(decoder->private_->input, obj->comments[i].entry, obj->comments[i].length)) {
++						/* Current i-th entry is bad, so we delete it. */
++						free (obj->comments[i].entry) ;
++						obj->comments[i].entry = NULL ;
+ 						obj->num_comments = i;
+ 						goto skip;
+ 					}
+-- 
+2.13.3
+
diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
index 8315ab5..028a429 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
+SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2017-6888.patch"
 
 SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
 SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
-- 
2.7.4



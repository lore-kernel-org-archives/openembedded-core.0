Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4777931B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:37:12 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id q204-v6so3127101oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=vT3YC8EJ/dvp0fIgCZhJUVhaihBd+Di4DWuKNxcL0y6oKxL98kKe32gG68X1cmAdXi
	8Fs4YL/9vPzs3iwXlJCcflXvDbYDIX4DWrysobPfNPXP52xW8z5fQRHysizI5mzawiNM
	Ed8Qtq3u/LkIMveU2KMkDqBAE7fkxPMM5WLjN9QgMVd+Asw/argapYf+fr4X2IXTVbQy
	ibI/8Y7HcxyaaMquSvba+9bu3vUyiPjyp7CNhT25nDBrCJ2GsWdApc8xS4t3gV6F2aXC
	uixFORZ6t7ldI7Lw4Vj965GwPSYm4ydDuDcAsiJWT/Oma0cm3AdAVP4atowvMV0oGCc8
	OqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=qTOnNKm1Pt+z4mTz9gEwe0my/5Jf2YBv8JRzZgIdylR82rCahicEAJrIG0zjO6fN5I
	dzyDoqbpaUQkXXmY4wD72bnsOjUfI3UUkQrn2Nign4D71WJvpfr2LwFGBXJIYqgcLxVd
	yKlVPkv16CT5w6nDfe+Iq43G6rPghJojpXi8tzXnPCbxlqv0Ck6VbnNINmrTaGPydtdE
	0scxgqGle9JCRSvd0KcQBk/IW5QkJDkER6VLA0nL/JcIhHwz5MYpQS66iADmyMvOGKoF
	pvKvxCrBMuNBaHLXpQBb+77jBNSwoIVRfXXERaQYGS35TiGqHYQ/FwbeqnrlwG3ygVFD
	PDWA==
X-Gm-Message-State: APzg51Bh+UbS+L5aS6G9VgZIE2/GtJeGrkloL9VFPi9se6Kv1QEwhtSx
	o8HCxMYu8U8TNawxAy30Dkg1eX+zB2E=
X-Google-Smtp-Source: ANB0VdZO3qs63wBsMlddAmmY1Ku+0Eg7YM2eb6S/1s9aY7Gz07RwOuFaP9nHCdSsfzcuS6xGcmm/EA==
X-Received: by 2002:aca:dbc2:: with SMTP id
	s185-v6mr4108479oig.251.1534945033440; 
	Wed, 22 Aug 2018 06:37:13 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:37:13 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:36 +0530
Message-Id: <1534944940-21566-30-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 30/34] flac: CVE-2017-6888
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
X-List-Received-Date: Wed, 22 Aug 2018 13:37:12 -0000

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



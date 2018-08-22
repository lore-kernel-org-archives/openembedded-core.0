Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 63D3B79158
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:52 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id r69-v6so1912974oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=r50dIqMffY/nRpnmhrRYKZ1NiSB/hbc3BCvIDjMxq4DNrkI1S9NdpWZuZfXV09LKHh
	3+G3TE0uKnSLgvt8XQQ73+K5z+Hv4sFPjWq8R6B/zpHhLkt/uMh0rmLjt88CEwLFAi+M
	RYmt66Cd2tpIVe9bagVBbkNOi0+8Ez14LpbyE50bOCTMYX6CNnk0k+ucYXa0/XczOjIx
	eYvLAu//MbQdt2UagUBJWoj1MWNN91NNZf+XbOXKlmxdR0v3SBsd8HnTT55Y/izeBWPM
	Q5771rqC+dmN21hVzkMT4lnX3fGN35GiIqFsPdc1hbvR5XL7hQSiDayO16rq4jJLH6a4
	1H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rUa5tFmOvfvmiZhH+oTcvjU8jTDanU2SFHqcli+M22k=;
	b=TPnIqg2gB5wKyKtsy3NrOJLj4iZyfVpaics2hS1Fji4Km76dnfHu+9Y1sYaAPWOFv6
	buMiBQq13wOGxqa3OzQrUGL0t7xomFk0bcS9mzuwpRjw30xrMQ9tGzye9Pk7TZKt3yBu
	elHIZhpvJ8ziiTAKH64I8ML7wpF8714QRVAxcFUWKtQO7KC8ksf53rRYLSps3nXe11zV
	u3XJbJy1bdwfab0iDEBtCWiMabJSfmS9P0hZZ01D4BlMH1vnuRFJleDyDG+rXAhORxAj
	XUnKZbYi/43ZuUpmkmnxRz+QORHExCFqh9tE8ysB8h4eZLlqnA4Y2wrYKoEUsznH1KfE
	hppg==
X-Gm-Message-State: APzg51AwtCqM+iMS3HRgsBM2dHYRZNCPZTQngQjJ7yW73HeYYhuglHlF
	2M+2THNgQczKSYvLvvtANSOc7Vxe7Io=
X-Google-Smtp-Source: ANB0VdYKoognHQD5gXML6dDmrQY28K1LgQvLALdbB/Qwfu/sthxHeyUK9fzydj7iA//nwgVkODZe6g==
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr3289096oie.1.1534936673272;
	Wed, 22 Aug 2018 04:17:53 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:52 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:51 +0530
Message-Id: <1534936615-11658-15-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 15/19] flac: CVE-2017-6888
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:52 -0000

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



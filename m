Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 85FF07741D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:16:21 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id fy10so49699596pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DLebm0HmNbAgCFhj1pVzGWXCCyaFRTTM/a0ftDpdwy4=;
	b=ncNtrLmlq4b1XZOZy/PAOCCeuL31zYqKpwQgwg/CQC9f+gK9M3x0s7ORH70w4TZ+4O
	Ix2oNys45EHQ1KTujbzWW0olH/dJf+a3zPd4gcqm/XRJag3mAB5iXCgpnvIV5hn1vkOm
	ETvD+OcynZpbZ+duDN5RQmLQyHfZht7f4siDlV7Xmcq9k+r19TUgOJbngFPnOuzUm4c3
	C09N7DexXF6Al+zP+z4Gc3amANxYgEOj9HB8/E6BsZ2SLk9tKiAOIn7P8SUPJ2zzW0pq
	p0+mRzGaUChqGFnhyzB+TTRB15fSlyDLiasUKVZdcHgF91dSX5b+DnB1/IlU36OkENGV
	LsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DLebm0HmNbAgCFhj1pVzGWXCCyaFRTTM/a0ftDpdwy4=;
	b=aFxhwKceZQ9UVCJSpqQCsLhZY0/klrqmJuob0Xp9+nGeNYhsNeB6W7F535/zqi2IAD
	dpsDPYgRLiWuSIiae3eS2A/MWCH83Hpvdj7f0yIaD7oAx8SXoBAIenVMZSzqYWeigy+k
	I1GEiun4GP2i7jAq6Iu2nheVd6Ns4U5rcS/KmWC2dwEUJE4nWCg52DLlZDaZP6qYHFg1
	60ZN39JkxCgNQ0+M2HOV/XQHixYVo0npF8TcfImP9GeG87C5yjnV5cG0THUImHTjCnCx
	FFnOou14Bw8bL61cNhRZkXCwRWCUdEsux5acV3B6Nc+Ae0ZY0a3x+1LOE+uRLSmWpi2j
	YSlQ==
X-Gm-Message-State: AD7BkJIb7yNXQmWAx0B3OXyjRm7GkC6YAEzMW6KTifn6K999VG5eZcsKlVtuLepSTW7xMg==
X-Received: by 10.66.193.202 with SMTP id hq10mr1239667pac.6.1456485382283;
	Fri, 26 Feb 2016 03:16:22 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id p9sm3908952pfj.67.2016.02.26.03.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 03:16:21 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 22:16:30 +1100
Message-Id: <1456485390-1390-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] ffmpeg: add bzlib and lzma PACKAGECONFIGs
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
X-List-Received-Date: Fri, 26 Feb 2016 11:16:23 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index e7b20fa..53156ed 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -30,14 +30,16 @@ DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils.contains(
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "avdevice avfilter bzlib gpl lzma theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
+PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
 PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
+PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
-- 
2.7.1



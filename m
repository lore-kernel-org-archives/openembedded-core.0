Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2B12E77421
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:14:12 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id w128so5169395pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t5RvojV7ZfAsfo0ALZR5Ql3+Vav2JDzqar6MTuZnljg=;
	b=yGDt2s/YSLZCkLIDpILqcdOFm6wMMxeVboZFAjItZYHOqgQtJxO8+Jn9gar6MOPMvM
	t2VgesUaCf2bCOu1CzaWGp25S5lv4cyB6yRnBAbIWSygpMIPjE5Sly0MVve/qYuiazq6
	jLCZwxu2RkwVJ7aHNWBN2Eb4pUKKwMjskYe+01/yewGxp78+qBFa1GH1w2Yq18YhsZS0
	9Q0hYlkA6R5koD4fguR+dMpZLeieA7ow6N+VomhJQlxPTpyhorxXyU/vPZM0kQGNFS48
	BgsN2WiNxgqwtPThEzlev5Uto/s8WgAQu4UtACGpbHbx9nxZyWcHLcLC7MYVoNAmoAwt
	d52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t5RvojV7ZfAsfo0ALZR5Ql3+Vav2JDzqar6MTuZnljg=;
	b=fhxFjTsDsvoLJxEPy4i7UnpcpoW3mNbN0ap+hi9sQ1wwG5xeCWasGzbRJACgpZdfqF
	pXb5WSELlEWeKo7G7lvv3a8cDTnRaMarfBlRWEUsPw6Oo/2vM05I1jyMXr0qv2gcLkeC
	5fP7NO7o+OrKUXhM+k4cR0nyQu6Ze9P036lx+egpsJkdBMjA+D0qTBWkPIsZzNJdbzmn
	sb/0CLD3h8Y30nI/huhsv05+hsGn/uo9YcqAweE6Kww63mROy3lAY0vSU8MRpUEsnijh
	vdSLNm7bJ3Jc2pzQxXyHQhTM9ixNWnXU7g8FjDKS9CK3556cG67iZO9YGp0+3Ydb6NYP
	M9YQ==
X-Gm-Message-State: AD7BkJIpgTsWEXsHo7CsvTCx1lOJ8kOpFGVlzX/BfmFFZ72IA+9Bmd5VzerfGfnpvhk6UA==
X-Received: by 10.98.66.157 with SMTP id h29mr2368359pfd.91.1456496053763;
	Fri, 26 Feb 2016 06:14:13 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	fc8sm19847544pab.21.2016.02.26.06.14.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 06:14:12 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Sat, 27 Feb 2016 01:14:16 +1100
Message-Id: <1456496056-31812-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: add bzlib, lzma and xv PACKAGECONFIGs
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
X-List-Received-Date: Fri, 26 Feb 2016 14:14:13 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 3f0cbf8..036d4f1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -29,14 +29,16 @@ DEPENDS = "alsa-lib zlib libogg yasm-native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
+PACKAGECONFIG ??= "avdevice avfilter bzlib gpl lzma theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xv', '', d)}"
+PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
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
@@ -46,6 +48,7 @@ PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
-- 
2.7.1



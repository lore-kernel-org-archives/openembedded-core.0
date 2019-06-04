Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D59FC745BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 07:01:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2019 00:01:43 -0700
X-ExtLoop1: 1
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.144.138])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2019 00:01:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 15:01:37 +0800
Message-Id: <20190604070137.31732-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] ffmpeg: add PACKAGECONFIG for mfx
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
X-List-Received-Date: Tue, 04 Jun 2019 07:01:43 -0000
Content-Transfer-Encoding: 8bit

Add option to build ffmpeg with support for Intel MediaSDK codecs. More
details on supported codecs available here:

https://trac.ffmpeg.org/wiki/Hardware/QuickSync

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
index 994a792ded..147388d9b7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
@@ -63,6 +63,7 @@ PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
 PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
+PACKAGECONFIG[mfx] = "--enable-libmfx,--disable-libmfx,intel-mediasdk"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
-- 
2.20.1



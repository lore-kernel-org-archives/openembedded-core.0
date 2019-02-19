Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 859BE7C9E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id f14so23040954wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7GNzKP15+VM9P5Il8c5Q/s3S6kVJANnw65OkdoV7beA=;
	b=ut0uJm1bs1stPRQ9N4KTOOTwyxXfGGy9Ff/yWqdOWvef/c5jnsWB/ShQnEC2yyIAtj
	PVSbPHjSVjWnL5c3Bflem6I/1oZuaPQ4bDwsUguamoMUdEftuEazGl6GBtBpdZBtln3C
	oMBr9Wg5SuAPThpP1n1VjFv8BUCnM9CGded6sl2/DOVIPItBSYBo0N/PSg9JYZZ7m3Bo
	lJGyQnz/wwcpYG645oF7IZkfGCC2FrpXAshKahcN3ST7cOaMERt1PEj1MgzgxSx7y6z4
	PW4u5fdOsCkx/ke069VG238QqakBYEgHn78Bd2Gl6w1BGti33ay5mIAH31cZX5eC27Wo
	Fzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7GNzKP15+VM9P5Il8c5Q/s3S6kVJANnw65OkdoV7beA=;
	b=eZIBfvwVkbuoy5y3ZsNwcAV3R4XhhPHyF3bThq27pmSkYipEschbdykREPCjF6GTW6
	6MiKUPmeNAHwFHKtlZ35N3Cmar77vgO7jsts6RVap7qqCw2PsZnTIRxU97M9NiK/4QPH
	KQkuKQYeEaa3HM3ir/jA2Gklt66mT+Yq47Y/Lqpi/ZUaxVu2YS9fL8Zt8Cdld+bp9/N2
	k7QOdZk+zI5pqbO6f/iVQa1Bp3sAESuO+hbfdw+2Ft3vsoDXjhsYHh3B8UXbnLh+vh9w
	mWkN4jIf86Rwzgjh4aKrz8Qs4aOeQvLgWRci4fjGmfH1erw7easxhFWoU5L/5EHf9EJ1
	B9yw==
X-Gm-Message-State: AHQUAubNhabsEz0peBvn3+WqgiI/1Nd5jDsjqPxxnEcnwzVzE59gBEFK
	CQ+GE27L/EScQ4XbWa8BG29Di7ST
X-Google-Smtp-Source: AHgI3IZLhG/Z4hY/V/PbASrzkOoB6qGvWgyiyiHlFGNviLZTTRBn1brOFS3Fw+FfPgsthBLkQWoQ6Q==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr21067242wrw.160.1550598460003; 
	Tue, 19 Feb 2019 09:47:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:11 +0100
Message-Id: <20190219174712.60694-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/20] ffmpeg: update to 4.1.1
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:39 -0000

Drop backported patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...cess_template-remove-FF_REG_sp-from-.patch | 31 ----------------
 .../ffmpeg/ffmpeg/CVE-2018-15822.patch        | 37 -------------------
 .../{ffmpeg_4.0.2.bb => ffmpeg_4.1.1.bb}      |  6 +--
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.0.2.bb => ffmpeg_4.1.1.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch
deleted file mode 100644
index 83fb4b81afd..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c1cbeb87db4bfc6e281e4254a6c7fdd3854fc9b9 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Thu, 20 Dec 2018 22:40:06 +0100
-Subject: [PATCH] postproc/postprocess_template: remove FF_REG_sp from clobber
- list
-
-Future gcc may no longer support this
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c1cbeb87db4bfc6e281e4254a6c7fdd3854fc9b9]
-Tested-by: James Almer <jamrial@gmail.com>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
----
- libpostproc/postprocess_template.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libpostproc/postprocess_template.c b/libpostproc/postprocess_template.c
-index 485eb5cfc0..b0adfd168c 100644
---- a/libpostproc/postprocess_template.c
-+++ b/libpostproc/postprocess_template.c
-@@ -1317,7 +1317,7 @@ DERING_CORE((%0, %1, 8)       ,(%%FF_REGd, %1, 4),%%mm2,%%mm4,%%mm0,%%mm3,%%mm5,
-         "1:                        \n\t"
-         : : "r" (src), "r" ((x86_reg)stride), "m" (c->pQPb), "m"(c->pQPb2), "q"(tmp)
-           NAMED_CONSTRAINTS_ADD(deringThreshold,b00,b02,b08)
--        : "%"FF_REG_a, "%"FF_REG_d, "%"FF_REG_sp
-+        : "%"FF_REG_a, "%"FF_REG_d
-     );
- #else // HAVE_7REGS && (TEMPLATE_PP_MMXEXT || TEMPLATE_PP_3DNOW)
-     int y;
--- 
-2.20.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch
deleted file mode 100644
index 7d5868a72ad..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6b67d7f05918f7a1ee8fc6ff21355d7e8736aa10 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 28 Jul 2018 15:03:50 +0200
-Subject: [PATCH] avformat/flvenc: Check audio packet size
-
-Fixes: Assertion failure
-Fixes: assert_flvenc.c:941_1.swf
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/6b67d7f05918f7a1ee8fc6ff21355d7e8736aa10]
-CVE: CVE-2018-15822
-
-Found-by: #CHEN HONGXU# <HCHEN017@e.ntu.edu.sg>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- libavformat/flvenc.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libavformat/flvenc.c b/libavformat/flvenc.c
-index 1c552a3e6b..e4863f1fc7 100644
---- a/libavformat/flvenc.c
-+++ b/libavformat/flvenc.c
-@@ -883,6 +883,11 @@ static int flv_write_packet(AVFormatContext *s, AVPacket *pkt)
-     int flags = -1, flags_size, ret;
-     int64_t cur_offset = avio_tell(pb);
- 
-+    if (par->codec_type == AVMEDIA_TYPE_AUDIO && !pkt->size) {
-+        av_log(s, AV_LOG_WARNING, "Empty audio Packet\n");
-+        return AVERROR(EINVAL);
-+    }
-+
-     if (par->codec_id == AV_CODEC_ID_VP6F || par->codec_id == AV_CODEC_ID_VP6A ||
-         par->codec_id == AV_CODEC_ID_VP6  || par->codec_id == AV_CODEC_ID_AAC)
-         flags_size = 2;
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
index 0c227b7fc9c..0506e11c4ba 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
@@ -25,11 +25,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
-           file://CVE-2018-15822.patch \
-           file://0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch \
            "
-SRC_URI[md5sum] = "ae0bfdf809306a212b4f0e6eb8d1c75e"
-SRC_URI[sha256sum] = "a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97"
+SRC_URI[md5sum] = "720fc84617a2c38aeae79aff3689a567"
+SRC_URI[sha256sum] = "373749824dfd334d84e55dff406729edfd1606575ee44dd485d97d45ea4d2d86"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1



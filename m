Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1467.1795801789120821175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=KESx9GEE;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491971ac844so7375802f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801787; x=1796406587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=KESx9GEEcW7xYYy3lZoneCvt+xj/Sp4s/EnBe+GkAD6jo253g4uNBrySQEkcPEy62e
         q1qKID0sV8qzWHrTdRmKCDEsvc5nlIACMex3J+fSfFbNwYbT18QnISa1fTqKcIDwvzO4
         /oI4dbS2wWMn3FFHVfM/HrD69gAt8Q5Y+wBMnS+8M/KIv8UWNgV8dBH9WOZdzU+Npx0Z
         kUgrf9ZhWVrtHWo+7FA/YrFqI4FCjr57fmzTHyYvs1AYjTr8hXv7xVyxemOrDf3XikeQ
         ht7YpL+J7KC9ldxBqoyeAvpq2bFQZAtikTm1PwM8YJjCeU9nFS9g2tnx6zGIysqDwwbk
         Upqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801787; x=1796406587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=pfOefa+fVBzkQRoeTCT9aHEyrL2LFoDAlt4oFhrbrd/Goz2Suv2tL8GJ6dKEQuu3Le
         RQTf1t6Rfo8UnNvrTsjtVCmBVfm57tijUgLJ+btWctI5q69RAytXe+CBXRlzvUmxDKaK
         3jyofs4Yc6UbDh8xKbyiWcWVORoNMLrAOiZX+1wVwdrkay31wb36/5wr+QMcMFB3A5FN
         XX8EXeK6UXKIVqEQrR4jwEyy3QAPCFniVfpK4H1Q2gHm7NI1ywVb9iAYyJO9HHRcrI1X
         KtAXEQZyZWlGwFW9oluECwdKEe1R8c+S7SygoT3352oseEfqw/bd+j2pOvCoPWGDk20Y
         bIwA==
X-Gm-Message-State: APuU4Z80rHOwMwtmMB+iw5lWBqKakOilpN5ZY/+4ouzMGEpbwfwfR+Nz
	8Tp/2ypSCIQd7tnE7oLkjubSwqSuKvkxp7kv5R/oPq/kS7lxDzc/js0DsJpjSGfMftRJ+AoTiLa
	R5SjDh10=
X-Gm-Gg: AZFdTZf0cFagz9UCY27UWkseEM8rDVLTkVpEHtd3nsoPVHmSOiW/VPK5tyD7+sP4HnH
	srHuH+o5TbFCOMKEwcwyi4b7pRaJlPAqEjo8eLs2iFUAJ5cpZBIX/kz2DaQY3kJ5k0lKw47LJOJ
	4CpQfgx65Mz6AwkdO9oDjkd2em4Mo5h4h+JEJhClD13Huc5AxUERGUVUZ7S9WqlNlmOjLtbp8Nw
	F4v63rG3WlPobUMOO7YbdeuNXxW9xQ/CLRY26DyMgxe6ToHrj8cCUrk4UfjvJWBSz2pDAFChpbD
	HZ0A4WJ3JyT63SuxLW61oBNemJY+QvEKmqjOEsEFOS5LA21SZbXInIn5ABl1Xj5zEVd+ZrH7DqQ
	djoBrtSZSiOYiN49GgCAXSMKAIKhZfg39wUhekj8jWUaEoEuH2r+2SNSvG5+DgRRGoeY/6Tk7lq
	Li29sejOlmjY8QM+0kVgrCIiVoxLjCsFBjHj+AfkpDkWAdkgxlJ8T4eqX1+SqnCf6DKdylbnQCH
	frPzYoSb4OZ+xH0tKnnG4ssfI7dQGJIM0AX4wRECdgy/csjSGQWErnHm5vg3qANFkUhTws0TjSj
	BTlKrqbwXteluOlVygkijenLkAkKoGc2LUb3oNcNyZVh3GO/nIu3RDeS0yfqvuOQpaPSm6UP/uM
	aDoOGZtBcCGTaggVoslKkzISJNc9M
X-Received: by 2002:a5d:6f0d:0:b0:4af:cd40:6fcb with SMTP id ffacd0b85a97d-4afcd40712emr39321711f8f.57.1795801787260;
        Fri, 27 Nov 2026 09:49:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/37] speex: patch CVE-2026-116741
Date: Fri, 27 Nov 2026 18:49:06 +0100
Message-ID: <73aab73feca1b280c61045774fa590e9e77079e8.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251429
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from CVE report.

[1] https://gitlab.xiph.org/xiph/speex/-/merge_requests/32

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit acdf6b0bfcf0a2c3b858ccf2f1b385afd5b13574)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../speex/speex/CVE-2026-116741.patch         | 29 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2.1.bb  |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch b/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
new file mode 100644
index 00000000000..4d71f7fa82c
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
@@ -0,0 +1,29 @@
+From 09b569d1b437e5edccf3406a38714ad795e46d38 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Thu, 22 Oct 2026 09:00:44 -0400
+Subject: [PATCH] bits: fix OOB write in read_whole_bytes for non-owned buffers
+
+Fixes https://github.com/xiph/speex/issues/42
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication Institute of Technology, github.com/Haind03.
+
+CVE: CVE-2026-116741
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/speex/-/commit/09b569d1b437e5edccf3406a38714ad795e46d38]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libspeex/bits.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libspeex/bits.c b/libspeex/bits.c
+index 4f457af..c5546e8 100644
+--- a/libspeex/bits.c
++++ b/libspeex/bits.c
+@@ -174,7 +174,7 @@ EXPORT void speex_bits_read_whole_bytes(SpeexBits *bits, const char *chars, int
+          }
+       } else {
+          speex_warning("Do not own input buffer: truncating oversize input");
+-         nchars=bits->buf_size;
++         nchars=bits->buf_size-(bits->nbBits>>LOG2_BITS_PER_CHAR)-1;
+       }
+    }
+ 
diff --git a/meta/recipes-multimedia/speex/speex_1.2.1.bb b/meta/recipes-multimedia/speex/speex_1.2.1.bb
index c40198fa8f3..2a174db0aa4 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
                     "
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = " \
+    http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
+    file://CVE-2026-116741.patch \
+"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea"

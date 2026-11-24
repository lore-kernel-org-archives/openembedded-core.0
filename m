Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31024.1795560752084796728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Xpg7B1BR;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so2633160f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560750; x=1796165550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=Xpg7B1BRBmMrDq7A+G//nYCbvUJzH381SRFpclNOUNbJwYQQ1GuVmgtKNUOdptKJWY
         HCSxFkym5cCASd026cWl5Jd5Kf2NV3XUzR4hxcOzPCi60NZSDyVoZTWjj3sCHlgpRNqE
         4DifnJfN8suUI9sgL8EbKVJ5kLBpHKt1WbeoARGPTDnH9nIxmZTuUI3hDV0iA76kLBgL
         Y+HpsbXO4qFgfsQBhWfH2YcUSWpNj5IqL6JG/BalrxQGg75i6wS9ujFMer4iFsXb9w8f
         cuaetJmuuAeOaWvEIsAuJB3zqOXKbCNoxtVD4gx4ymIbQqvmcKomtdRFehmndg5APKHe
         qlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560750; x=1796165550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=R57k6COr5Xj3bmrh132yaxU+A2yIr17b1fnjUJuuaG9krOesntL5lEg0bC6YtviO/X
         EjLo2Y9iiQgpR2anKEbE96ihIQX7ze6Te1a7cXNPcjRYb8vWp8QLIDl/l/kzQOFkVZ+z
         83cjVLmA/UxrAS5aKbIN0BvrLBNAIpg5AaVwoTf1YgRObBv2Q6SOn9HS5qFQ6pznPvgR
         ed3X9z6kiIRKpLVtHD8vOn4P9FPhMXKEIEEJEvsUliIIUBDFUFrOXjP10j9wt2WQKdZx
         pYFn2LlbfOmc3BQniWB2g/hvDglOEZMEKR4A1pCmAg2Tj+YMSvz+NFNYEbiaeMZDUwbf
         IEYQ==
X-Gm-Message-State: APuU4Z89VbhjI5lLuglg+vMmP6hv3IOUHxUmNFgm3BmQhU8CuqWyu1sV
	1cfnfEjTN0BtLR3Sjn6TdRzM3+2pWRjwQWNLF8MBn9oLrowEaTSKuiIFfCbr8bkl78iOzEUyk7v
	NllC2Gxs=
X-Gm-Gg: AZFdTZctI+g/Q1+qEDr3joJJ5GqSdvApwCg6oeuX5DMf6e/qCS+PZx2EoGTf/3d4I6w
	BpP0DhtR1QZqzJLopBPyAgDUuh+1MwyrsjBsnfzqQwO/ZX3PUqtJJo4loxpuYKKTwouuBXF0jkv
	caHaU16oUeWxo5e537ti7Z1NisV35EbI/Sx8G9/2xRxCTK7gZSh6vPg39DYpQEoEv+bANU61Vza
	Xu2Cn6CQ+eAfb06iufRF09b8Wmuw70WGuHmNYTo8BUgr6Df3laVnX4n1arHxSfIj9JfPIMVpkZV
	8cPnQiMHXQM/IHa74xb+1I9gJitLLuXc5CVm268WCH3r02bmeQtMwDneLIFeCiayLH+JU2SQM8H
	M9eMGveGepr+LSFXtdxeR/EEgC28CTKoBEnLFXfA77eV6WqUmM3zHhKxaZ/hAghMIATbz0+ofA6
	jqOMrrIYMGLgAmaMqQaOuZm9ZLnd9YW2XI2FxNjmXLsKu/PlQPGuE5DS7ZyDEhpsrG0XCCClm4d
	xlWydMpwHpSYKnvLPtqLdetykybbcH1rE7k+oqyPahye54P/r/HNWXHFTK5p7uE4DgsEoYGYcRw
	Var0ir/lf8okRv14X9wkQn3NXfwPZl8kyUWIUVTp5wQSL7sLZjFiYefR4ZwKniJT7oo1EAi1P8E
	3uplg8f8gQQ3nmQFo2Uh5qckeN7ai
X-Received: by 2002:a5d:64ef:0:b0:4b3:e605:15d6 with SMTP id ffacd0b85a97d-4b3e60516a7mr14173957f8f.55.1795560750348;
        Tue, 24 Nov 2026 14:52:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:30 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 19/21] speex: patch CVE-2026-116741
Date: Tue, 24 Nov 2026 23:51:26 +0100
Message-ID: <a817f1211d62079766819ce70c989b30c3fa8faa.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251099
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

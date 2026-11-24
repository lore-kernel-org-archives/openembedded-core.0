Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31041.1795560775322591217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BdqGdn3j;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4898437f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560773; x=1796165573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=BdqGdn3jzE7HLWF7HL8EVVSCLEmYAKDMMMnyEOkeQJqzk2iEm+loHQLqzo4UBdb6q6
         9qSQHA8iyTM+ix4WvXL2S7Uf79uKpme+TeEC6WC6gJ0d3Ey407JRViKxmd69mJ3wfTn8
         /E+w8nnKHn4UCwkOvis3JYLwghi1coDwsmjdWF8iHGOfhG26mzcaQPBs0p/sTBk6qZgH
         UkmvJy0/3u350FZ6D4eFy0mtbqQws/Pr4Wyp1oGU+oJYSoFR3shrkFppOYIH738CFr4b
         8Jbq1gKrwvBU/tWHlo5sJrFej9MXAoisFTNcLdtWFcdecSZ5iIPrOpSom0CzCcLKC1Cx
         DzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560773; x=1796165573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7uL/iAtsNgC5IZY9uWFp+3spG799kJlY5szTzxZDn9g=;
        b=Y+qjvEmQhj+ShHGlUW9d74JTDtYSuCcWiJxRt2INX8a9PkOfIRQTCjhmTS6AWw/wXU
         Dh3iGCbIwQBhj6YErVysLcJF/BXRRtJltSqxrTMhRplzZ8o2oqsLSJ5Yf3Hd/+hHur3v
         556ap7xmzBZmzXyXC+q7u94pxp7U3x6MHP0c0bd+wMg9X+vSz5XQUfYqLtKGnEFFcmCT
         6E4wMtpTAB/lbGiO99RwwYucr+P+IAENV1nNccj43QOYi/JLq3sB2YCN8seYIffjSuJs
         pSChU1sPwCjtM/Gjn8FQSi5nAJqa3PbuB2mMjpOx4+JsssT4Yrexi2IrROck/oImkPB1
         6eVA==
X-Gm-Message-State: APuU4Z8Wf0sTGK1vJzFQxLQ78O+AO7QesdhR0gDJuWlzfdHZp/iaTmW1
	EXxycTTBzLQHwSrMsLR8pmodTGUZQXu/A5sicwQX2bSCHFpRzernk5cxvdPt4MvOU8rq/uRaF08
	lIUQUhgE=
X-Gm-Gg: AZFdTZekN6KoMW2lFRnimfotTDsvYzqCdzgou+6zXGqLiaaFfh3RYI3gAy7N11F0WkH
	61OK7FXWpP2PBy9rpiSwyHti4teiXbwn+BKSnunXnQWmJX49Hj0R6jFFJ36AyDvC3rT6A3H8/8l
	gYMH5KC5NuqRPOrbz/CnEb+VDoINf1SXKFfNrtDq77ZMWjgzdked7N3jbUYMPNlEtAS6dqMwPc8
	cbZcyZYXzvwmwz1QVrRp6yXOuDleL2srZgjkfysRYUlwf7oJWUkcdU40mUxSLCvJWAAsIgIYYIb
	jcnnti2M7c/Qiuz9iKoi1cXSCtbPD5PiLOHF0tnwWhoL23S25C48blQNd8ouNl5lVbBQj98y1Br
	Vhx0ZUkyQlifXDZEn4lV/EmhR0pihKOhbkDoeJwBeRecT+U21jmnHHNQTmAlBmxEPWd3Og836ZD
	D+LAqPKvZyRU3h4vn+DjryBiOxPHbhh1SbirROHPBAyPsrB8xf8vSN1ZiJEU7mr4wN9D/pWWnY4
	7zEXBYvWKT4zpcpHMNJfsEIeBHBW9FmzXk12Czb9YqkEnIOVX6q1Dk1YdfnixPll7F0dhJu6yPV
	NBKKFM9E76GQdbJry1VbKLPM7Vnrd8sWopEWz4DcgcXEVoMW/qyOe9lFt3GyTFY9/cHyqyB3CAW
	NsKf+SZwPASOE3YDtoI/n6t2eF906
X-Received: by 2002:a05:600c:45d4:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb88817d91mr346551885e9.23.1795560773530;
        Tue, 24 Nov 2026 14:52:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/21] speex: patch CVE-2026-116741
Date: Tue, 24 Nov 2026 23:52:36 +0100
Message-ID: <5ba43f49922f56e37067b8bd9850b93926fdbde5.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251121
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

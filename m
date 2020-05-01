Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5209.1588370192175280074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=HyH6G9VS;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DR0Z1B3Dz4y
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588370190;
	bh=XEf3wqXQgr3WFMAeoBoAQJVy0xSTgdwhzge/HJKfzAk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HyH6G9VSxpuNgcbXy/O/5d9MwfM2jqZde7kmH3x+/ByaTbPFi0uY4p52L6DFHJKll
	 WlEHZvy0picuf+zxSiWarDUR4ST+kRJy7wEYJ/lYBEsyDjSn8oMLSgH/FzgZZqWIPL
	 +g5IUJVuv1eey6V2u9OEXAerQ9p2YgATyDLzbXsqzBdC0U/GMgyhZfFgRUFRVS3dmL
	 DUC0ieGm6JN+IGABpQ1M2WQK4G6RjQDXdbnEIjMLRWr0SB8CvjVPbO7ofO68eWEpCQ
	 uL5qUjq8tCVch1wkBHVDgY/+lbC7oeHTUQNA3N7tzH/g3rVQ32k4fxNrxrnVlhvE2u
	 fhmUNF0m74EcKjV7zZChZgNlCPHF65YwvdD2HYZ1VBpxgEW8hycskiWtGHBWuT7+5e
	 PDlFUvVws7guBIKLNt6BYnr8Mq9fPiy/s4zU7dFtwthqFJ/EGE5FGgP09Tl/qsxjjN
	 KUJeGxxGG4ggRTdLVfjuycOEEKJf7q62obqjQ7FbSDYgXV7d3nDaklkdaOsJTI5Gt4
	 gMzeeXHvPllb5pZ67vTtjayUKZWsAV67YGAIxANNrQD6zRkVzOmKehuYhLSSIUbiEO
	 OE+DXn2E1ZZfBK5NsiZ2XpyJoeTXWt0My+3Kimfo9mFx6zKNWmacEvA/yZObYNn+hJ
	 YdKAb2a70/FyMuheaOEJOjI8=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] gnutls: upgrade 3.6.11.1 -> 3.6.12
Date: Sat,  2 May 2020 00:56:27 +0300
Message-Id: <20200501215628.9472-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501215628.9472-1-bunk@stusta.de>
References: <20200501215628.9472-1-bunk@stusta.de>

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: 8652c95ceb505dd7386166842486c833ea5a7ee7)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnutls/{gnutls_3.6.11.1.bb => gnutls_3.6.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.11.1.bb => gnutls_3.6.12.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb b/meta/recipes-support/gnutls/gnutls_3.6.12.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.12.bb
index 5b05364c25..f1eeebc807 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.12.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "3670ee0b0d95b3dee185eff2dc910ee7"
-SRC_URI[sha256sum] = "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8"
+SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
+SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1


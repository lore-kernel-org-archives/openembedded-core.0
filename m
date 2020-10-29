Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.9540.1603981694999927105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X7ASwT/c;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id v5so63394wmh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSR8H9kG/J9taCfBfr+Knn9g9XCb99d/N7SiYvVEzQA=;
        b=X7ASwT/cUWLeVHVTuTmTN89F89wHjVo1Y8jVkw2ioIq+LsQeHpsWfaHXY4SOLgqKCG
         D2NfNyEECx8YJzWx6V9zze0/49NyOrqE/f+50TX2IFyGJObIV0pQp0Q0nFJlanUqNBov
         qVyAigrkh41SieboIdagBbFuZG5mkL6pYcPjjCtLd0qm6xy1gjY9UmHPemvKUAFDVTiH
         18LhZwJnHhdrf4Ka5dwimMo7hF+GRQOE+PqAkhhJQCSPpEYF5w9F44VBeWtDy45I2yfb
         AL6EbUP8LaDWPvkbtFftS9Dqsjm9KKc3Ht2LMF4UUjP3aTix8WNF59msqrh7bQMhdVUT
         X/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSR8H9kG/J9taCfBfr+Knn9g9XCb99d/N7SiYvVEzQA=;
        b=pIfcyrk9KssuS+wdsagE0wX1eB3Jys2dN4krV1y9clPvSQzSDXTg93qmQHGTxf1rpc
         rkT4CIhWPLUZLlYb8QF8dpnquCQWTu0wna7VXCdOohgjZMhx0n743INc5ha/Sqekif8L
         s5ZQu8pD5jxi7NJMT0Ja2rxexOv3q1qVPGWO1sF1gDd2r9IX84cFhnDh+veG83MZGVgz
         a2Pxz/Twarx1XOtJKBnLdoMr0NoRsHIH0HCHRsfFaTS5hqW1z94+KBc8uz9OGs9maRMA
         DOYHvKo74qrT53JGWuVXqjesIR9M5o8J8a5Rg6yAmBYY3bTlRB9DL8rE4B6o0Csi7kVq
         JRXg==
X-Gm-Message-State: AOAM531KI+f3k1OxKmh8swRYfo078Ku9bXpXnhW6FMCQeIT9tlN3rokc
	lgqKAjFjQOJhsAMt7s0TbKR4XzhF4w6tDg==
X-Google-Smtp-Source: ABdhPJwJtsYOQyJ9lhN08jRmxxwnYM6V515wWhHQfkPStZiy0kR9hP9dc2NmMCr06EcddHzCX7d9VA==
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr67246wmk.91.1603981693304;
        Thu, 29 Oct 2020 07:28:13 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:12 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 04/22] gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
Date: Thu, 29 Oct 2020 14:27:48 +0000
Message-Id: <20201029142806.1830504-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- gl_winsys have a new meson option to set egl

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.18.0.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index 7fe5a480d4..a04af186f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -68,6 +68,7 @@ OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '',
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.29.1


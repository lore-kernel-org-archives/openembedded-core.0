Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0011710BA440
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67452.1774600276678287928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bVxmakdr;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso15787735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600275; x=1775205075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=bVxmakdrnEp3qagKyN/PIdk3v4eNnqYiSMK8b1F3mRpo7kRgNMKeF0B1jUqVAItkkR
         +G6JOWKCnSYPGhzWyGLjAPo40Ok7Pfd2BH9VatBPN9nedrezC6bcxgc5AxaE+2AEAdYh
         SPfexlb2jB+KZCLEhOElixPIzF9BiVDT5bi+t0dbQa2E/O8aFrO/KGRw8wlX+Spqav7F
         ZQ6d/xyv70MgReOhpL7ujpJajJ4Rz/UStN2mqU2XHv7w417NcyaZEk0HGD3nEqv2SVQh
         oVgaDKHkJZVnTrvS+L5ATUoCCN83ocvKIAjWlIC8QiwEDxHu7HBeUmikuIvXX3EYkpIz
         qxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600275; x=1775205075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=kQgQOsyNRnGIPPcwD0ek26ql0aFPIY98NzSsgnjgIN/644MQd/Xsrn1Er5RTkIs5eT
         y0KgobxnQEH/GNhn10pQPPw1yxyCfW025+pgoKaVkW2Kg9aonBnCdgbIdoft52pNLgWM
         vd1YbeyUt+brYI5H+i9pGCrp56yjBWv9EKPihf4uri4qH6LMpWGPYTGIBkb91xpyO707
         hkk09tfNT2wkPM0zT0T59MF3k2qy88EAU+uptK4GmGojkD/n8vub6ZNmg4F8iy579xco
         rMmZRBMZD21JDtzLhYW3Z2RBFOElz5i6ALh7Tb5c7iJOfRTEmPOJmiPY6aQfOkK5S3gW
         zuAg==
X-Gm-Message-State: AOJu0YxZETPaiwLaBdkBCtf0vQ+QKOm1AujFUwIqun0zILMi8m3tIZnp
	1yQNrNMWPgOU5bwnj/7x8OvmKpxvP7fPx1AudDX+TbdlwI6XRVkqPprOzpsH6g==
X-Gm-Gg: ATEYQzwMmWEKui73i5DDKDCTJhbnrQ7WaT9pLveYDxCFuCLObtxFltPEJHDcZx/0rBj
	vSYoVA3Bd3xTtJ35rRP4UzCUJzlyFESTp1wIdfPLrNUJ82OQskwUXiRUoqH55KlF53de2Uq/uu2
	S3dyT0fi1UZ6wDhL/RICvWST8CJxYjec4HDu4O/z47/tSXQzF9VqCVp6dEqjZ7p+/r4gJYu4kkY
	1TiMv5Fm43kXKHi4YFCnhgKI+F/UNE6WIrhx63uoRV7KyDZ9UtKvRXwW0BtVZJsGSRIKAY2vBtE
	Vr6C5rYl7qlHtiKNes1J4sWnYoJPzTTI3Eu+aFpEI9RH4b+OLN00d3Tc3MYZF55EKEXiHWsB0GC
	+j/xPxRk+bLo6gC48bR6iz037sqK7QH4NGHZ8tESeAPERDi3zYV52bhoqlx2UTUy0NDEuOcomtq
	evvqram0PqjaDLWg==
X-Received: by 2002:a05:600c:8485:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48727d73642mr24953975e9.8.1774600274711;
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 12/12] hwlatdetect: Use PYTHON_DIR
Date: Fri, 27 Mar 2026 09:30:55 +0100
Message-ID: <20260327083055.12571-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234067

Instead of custom constructing the python directory,
use PYTHON_DIR for consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..d37909cd87 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 require rt-tests.inc
 inherit python3-dir
 
-EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
+EXTRA_OEMAKE += "PYLIB=${libdir}/${PYTHON_DIR}/dist-packages"
 
 do_compile() {
 	oe_runmake hwlatdetect
@@ -18,9 +18,9 @@ do_install() {
         oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
 	           MANDIR=${mandir} INCLUDEDIR=${includedir}
 
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py
 }
 
-FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
+FILES:${PN} += "${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
 RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
-- 
2.53.0



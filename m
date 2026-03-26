Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE69F10A3D8F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:04:33 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49687.1774537467236641001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VMR81PDY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso1399471a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537465; x=1775142265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d50s9Bj2bajMattRWYh2Eym/5p5ZANL/eV1077ZeuYA=;
        b=VMR81PDYqgE2LQuZyqILq5eV/uEGNf/1+EqAQR77fOl8GiAEfuqswFqbX5YC+pFaj/
         wg33Ko1FWLD2VB8k4SCgqP0fBqDIhMuQfJkBydyMKAbbFIu/KCJX6x8PFtZxfQgPte0m
         HcCPXeIGreJxamovElyf+ZqQBFEDxEEmC6f7L7s1hfqu+fvmE21Gx2mbbZ0grmTRYAyL
         0i6czwvrC7778VzmoQxaQbq1TrRzm+RlBnhXR/OaOr6sLZTedEshcYds9CpNEHncZ+4Q
         +jZ+zkcj4KzwUHoEo5npz05oRezjotCBqMeHuz+/b+OJw36YMmGR+1RvDDx7Y00hq2Cs
         6hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537465; x=1775142265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d50s9Bj2bajMattRWYh2Eym/5p5ZANL/eV1077ZeuYA=;
        b=G41tPXtsw5LeNuEdxk4qYMP9fJDDQNvJwyysyfNsElqGAGxrfnb+3ZoPt4PWGdPUm3
         JcyFjW1CCwj5vX9rw2dajPSc88QHQPnfG9JfX0ObIJx/5ud5XoJbXfQOTbe1bkRwpJIN
         3VzKxo7So2tkx4BoJtTQGNCtmJW4SGAO8oiI5UUESNIA3JS9BJCeE+1GbC3GxSlYF5Yn
         R2URQLp3tZ4lfi/T31QzMnfFjAkkJGRC3QgrdLyRqcbMP24DfowhYqQ7pTLRMZdRQTTp
         rrf0i/akf/NNzDBh4CpX/+UkqxkKGReeIPIE6Hbf3mpjxonpFYz307uY+QGdFIG3FRBz
         2gCA==
X-Gm-Message-State: AOJu0YwVaT+8YjUlG98UGORkBywsXWn5ACqXnCdw6z/LYwPdsAac9eIO
	wIZELxHSSp/SsxxTGNchx+77zE6twh91HY25uftpWCQh/ZeD4bNgn3Gd/Ha36w==
X-Gm-Gg: ATEYQzzDVVPWoklmF+cZ2woCq9uYCpfCi/snDznq/ySvY0IONdKpIdKJONNYmEFZ+EJ
	bAfkiRs4NrmNzcN+/l6hDm0wHrOt9DYLbZ4OfPLs78leUlvggHcuBCggvQOi8ht0qHTzd/jSPd0
	1OIpNqYW7jl48wY4hQwlR8BJDt2+Y35tytNPrygbIPZsk8d5F9dc7zp2gyzVrdTRxUPVdzluXYQ
	RkhIWVofzXISHh3r0IXZO6WYb08amMzaGkp3F5CrqOogfuDGDHbvluBKTx1UZzcKKQs/jJswHMw
	wBSRRsUjNgVXPBYlDQCZwKbRvGpn2+W7uuncgrr92TupLqBZ6xfNsZ1x/5Nlg7xFVTohRFu3WF0
	SU5eQZBmVwMuu412IXs7KWVrBSJtpkjrnXHa+p5JmMMM+NjpqiW9rVltkaRL5zskQUgbObCZBM1
	6aEpDDVlt3SeOU6Q==
X-Received: by 2002:a17:907:1999:b0:b96:d904:9616 with SMTP id a640c23a62f3a-b9a54273631mr550208166b.40.1774537375628;
        Thu, 26 Mar 2026 08:02:55 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm9022321f8f.3.2026.03.26.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:02:54 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 3/4] libcap-ng-python: Rename site-packages path if needed
Date: Thu, 26 Mar 2026 15:35:53 +0100
Message-ID: <20260326150225.2083962-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326150225.2083962-1-zboszor@gmail.com>
References: <20260326150225.2083962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234020

libcap-ng-python installs into the ABI-less ${libdir}/pythonX.Y
directory, even if Python free-threading is enabled.

Move it to the correct location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f13c2eba17..4e01c320fd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -12,6 +12,9 @@ EXTRA_OECONF += "--with-python3"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
 }
 
 FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0



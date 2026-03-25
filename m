Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9CA103A9B5
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19966.1774438309735774961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sR0ngOpC;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48541edecf9so20896935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438308; x=1775043108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aZUAWc44cGdTolUVQmRlUqTVwwnNCxGKAHhu/j/BsU=;
        b=sR0ngOpCHHbfg7JEY4/3IkaK2kdKJL4ZVPRC+vv2tbTgfAlRmSSicGXUaNyU4bWEHG
         Q4DCuW0wJNOCVHX7ZsheCLyk3w5PKvH+Vw40ofUjPoohQAtlsSRXzWrmrerI71WSeROQ
         tIsB45nWuB67jYTFeaadfDziQef12xkFHoAFYxLFvFiMllziahT/oU2qJIUfycgVp/bd
         AcFm2ikOjbltWW84aJDTneKEjJ1FfjTpZmJJ6UCV96sbjoP99520jas9nJyLUJsqPaMk
         3gNkVLaehpIdWNzFpKjO+Nq15XHDNGeo9tRLWLLaNGMXcxjskxJFrIMGN0nkTBvNioJn
         Wf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438308; x=1775043108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9aZUAWc44cGdTolUVQmRlUqTVwwnNCxGKAHhu/j/BsU=;
        b=Zlh6BR/s/BCNpSx5comNJ5pAe5AKG1kfYO09LnB3AD8q0K+JvVuDTUCaGA3snLQ2tr
         km20J1sXy1DyMdp1scLbdAdxgztz7ljQL80GAlGQchjBvOBF3A6//Cpsm8YqWHjOz3Mm
         IlYxBk5WJyGnyBP264htpUHltZPe7Fi2aLT79Mbacb0DymihIMkyH9S2CdfcvyYbf+is
         /ta9r/KVqO6rceAu3y0IeCflMU6qk3xpX3x0bxi2TDqDXJdJhvlnC8+hmxWLGTEWwtKJ
         G+7ijWnU0K2rHugeOVdU6BvMS8H0EsxaBNR6rzsW3Rw4up+hvyXZtWpAw6lyWu7ggsEk
         bZgQ==
X-Gm-Message-State: AOJu0Yx5nbGaFCiCo1Tgs2HZ054Koxs01DUeCpWOBzkFRyrNy1Ae/9oR
	NNT9sH14MqP7CDeU4zxU9PtPeKfdDY3el7r7Nn1awHXGgMeC4arKRsRJ95IEBA==
X-Gm-Gg: ATEYQzxJ94coLqwyiGofxTdwvwOQBvsMxXbAePhc6WPQwL4QI42Nwgu6sKD4mZg61TI
	vdyS0pLqlAxGgL/C4oT3b22n/cN6lKQYgdOC0I+/jegOhP6zgrb3Sgcl7GJnCVe89se81NnC9Fw
	8Vo60UOISq3AVvbnch0FZJ54pgpiaKUs9woNn37ClTgfa4MMS4PNvNWRt21WpDPs682oz87cqjA
	KiBSowvaThSjHKrsmX8dEGbNtedOye/6LdXVDsjunVm+d/vFKiTByHFgggxueChxoKYBL5/FTZH
	EZbGnmZWtZn8Fr0Z0f3DA8qFhMDpA7ApTFYb442I7ap07qWdgTBS41HPeY5pm5A7VQo10Y552qM
	QJGmj83Xfy3XbEOdlDuWS6vqoRfS8jVXB36GoglpN9HXO0iN7x59jQEkHCTbFVVnJIG2PCq++C8
	Ti7Qv/FAX//7XDfQ==
X-Received: by 2002:a05:600c:1548:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48715ff7432mr49751895e9.15.1774438307210;
        Wed, 25 Mar 2026 04:31:47 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:46 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 11/14] hwlatdetect: Use PYTHON_DIR to support python freethreading
Date: Wed, 25 Mar 2026 12:24:21 +0100
Message-ID: <20260325113112.1163632-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233885

python${PYTHON_BASEVERSION} is not enough now, PYTHON_DIR is
needed for consistency.

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



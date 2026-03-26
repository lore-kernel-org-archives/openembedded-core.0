Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A3C109C05A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:02:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50521.1774537373086604870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V/MuuDOD;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso9786845e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537371; x=1775142171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQNodSn3OfLagBsb2vofHdFo/Kp5RRqFRni3HPcj5Gs=;
        b=V/MuuDODuSokPsB14QghOVZXp60T3HpY7kgH4XLuiYw7UPSOPJIQNRCgxioLqGY0Zd
         is56+W86G9Ac11kQFr4rQvYihvyvoEooXDXyRciVYGXgnwMd8Xk8IVMZxV15QKZ4/+Gv
         /V7WssDAT3rCJ8mOmtJzTZxr/rfjnlMUNco4sm+6lHfp2QUAq+DVkSHkIbTluW89Azi8
         vP3ulsMEKguQWBuVPjSCtaaMAFIA08w7Kqu/S1HPoTwyDo17fYWIsPNgNUQ5QxJ1TkeW
         NLKO2l0AdkK3os0XGNsAAItMvWRetkqkciR+xy9DgD9BNuMgtd0aqXPh8djGQHoNGLE4
         PLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537371; x=1775142171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQNodSn3OfLagBsb2vofHdFo/Kp5RRqFRni3HPcj5Gs=;
        b=sE5Q3HRRfNrt9A8ALXChjTZ7XMRjQFHRY+bESrThan+rO7jP8nuW3zGuQ6KiXXDazc
         pMi5H+GYBaK1VFWLoR0kNZHCoF7y//oJvZphJ4d34ZtvfkZE4x5XeqMurGRQXttKwNvZ
         BKAtm4xdpZdujWNbzXFqnA2R+k+tZb5JFUypJaqIyWtOlD3qvrkHKY17Dklp7DXu0l7a
         iDQPy9cRBlvrmb8XKR9hkzU30tk7IEkxThMmxxmyZ1Yj6fkBb4bUiITBi9vrWuuxQFj9
         FWSM60XjNvwnO1b6ZcLdGSpcVHgumAyErW4Url87HNjYEmmwuSynM9yFUdnlUvOcmICq
         knqA==
X-Gm-Message-State: AOJu0YySBw2PFomZTaesAvPh20Yd2hm2lrCeWoiRo7qlWz2lpo2CyTr0
	eJ+MPvh7bwxIy6LShUu5bYynZCYQxau0L5ai4g9r/rZP/hQfu05On1EQVUDG2g==
X-Gm-Gg: ATEYQzyN4JoPPbXO9pw1auC/1ImOxKtzTSjXn9QOh32w0nGcdUtnJpPTKEEFe7in0N7
	kzcIDWcQiWGLQi36axR1Uy/HGB06kfPC373KtWVWjW4RH5+8f6gOCOOKICgXOCkrHnwvEt7xexT
	9GLNnfkWAYZX425IC+ONxR7o7B98SQ//FydvCVctx5K4Rihy14ttBPJwzTn0+deXx7sR1cjQ6xp
	Z/KiH1TUejc+TSXAT0G+3LxoT+8auub4IlHhtWFZ2y6101H52HlKxcte0/lt+LS8sXgVDeu+BKl
	eUOPnnHH4hKx94kmHjHeQoBRvneSJ/H2V/XfBJpU5HX0Wn4SOgOHu5fu0dDeKUX8k3y+RGrBkB2
	mufEvz7i8q0aAbmq4geUfMoS/dqSebFE09/rlE8Lg91ELkInWY3yhafwrQWmZahHmEe7MnakIqF
	gEFYgEuMEG9eND5s28z++ydMUY
X-Received: by 2002:a05:600c:c490:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48715fc7437mr118758395e9.1.1774537370894;
        Thu, 26 Mar 2026 08:02:50 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm9022321f8f.3.2026.03.26.08.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:02:41 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 1/4] xcb-proto: Support Python free-threading
Date: Thu, 26 Mar 2026 15:35:51 +0100
Message-ID: <20260326150225.2083962-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326150225.2083962-1-zboszor@gmail.com>
References: <20260326150225.2083962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234017

libxcb won't find xcb-proto when Python free-threading is enabled.

This is caused by two problems:
* xcb-proto installs its python module into the ABI-less
  site-packages directory
* the pythondir= setting in xcb-proto.pc also points to the
  ABI-less site-packages directory

Move the installed site-packages directory to the correct
location if needed, and fix xcb-proto.pc.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
index 2a78a87e77..e6707fdbf8 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
@@ -19,6 +19,15 @@ SRC_URI[sha256sum] = "2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd225
 
 inherit autotools pkgconfig python3native
 
+do_install:append () {
+    # Patch pythondir site-packages
+    sed -i 's:}/.*/site-packages:}/${PYTHON_DIR}/site-packages:' ${D}${libdir}/pkgconfig/xcb-proto.pc
+
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
+}
+
 PACKAGES += "python-xcbgen"
 
 FILES:${PN} = ""
-- 
2.53.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4BAC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 05:37:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.786.1753767438218705610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 22:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJFpJdc+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748f5a4a423so3552002b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753767437; x=1754372237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofYFeGBgq01+lyWN1ssc0lNGler8XdkADiNHTroqqSw=;
        b=AJFpJdc+13/6UepHg5PISPPVX37OuShSc2DlYLjVPHPIqRP3+9O2w41Agy2e0GaOGh
         9Gh9c/RZ4hBTmG8NUfiZRVC/mjYNHxDPrf84cZZttw2EbUHBnwfCmgVdpWQG5m2MiEGJ
         yCe3ovSyojsJ9V909k+342/2eI/LfHVOVN9owDCBg9PSKxXg9h3t1Av5KJU97GvejfhF
         99ud60344uKf6bONdUTYxOXH54ytHasLgpw2lKvjVtZrUpypKktnL9EXMHe1FCTEzXqi
         866Z4k43zH78pG8KGY6lz3n8dPqyWSbRDism81yPujgNRg2ehcvh8ZLiiA/zV/apX21h
         5kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767437; x=1754372237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofYFeGBgq01+lyWN1ssc0lNGler8XdkADiNHTroqqSw=;
        b=ZNnWlSJfmkxALYsanOE2NA4aKmAH+mtMgdok2pUtlboDA9+Uz2DviZtZF2ML6GHbrv
         7Wm57KeqgAZ/KY7xyOpezTAB9sTwPhD6l/cjJlkWhG3sns3vCGOdtHdKa0N/TL+Nbxpx
         FWy8y1wrxcGaOOIGXzymeV1NaazqWuwyMKfuszAOF8JCXTi9oympekszikMyCW8cOy/M
         u06cXIouA+B+7G2LiihxMtpzmK0WsveDESOIatrqQQkPlTzrzhkQIlUXO2EevQ/44LHq
         X55gTg/h6G9RtgJiMfOTiyZw5jHpV3VP7UCBCwqlDZ9uRT4N8IHUcPhp99/hR0JdZ3El
         Os0Q==
X-Gm-Message-State: AOJu0Yy34AZgcMAU2KbIYPEpC7Ki3SwIjQ+xqGXsluhBzJgSiSIDnCxh
	4hArrJAsawLk5RpW3Uphk3uVoACe9eo6cgh00QQPqa21IhnzwKYhGaSJ/DTTd0HGZ6M=
X-Gm-Gg: ASbGncsBhicyiBqG1yajxJgxhz4W/IbgfvQs0qGT68/C2M0g678OWqpyxj+w3tF0rOe
	JRWuYtcLw+HJpuH9ECayKSw+LUyvx6TINaqC/SNjS7ixW3aQ8aNyVoOTldczyOL8VWo31F3c2v3
	mHh95i56CYdrB7qq061zuJITwPPTGq3d34AiI89OU1M0FfahvMV1oHqTecglXLqgOtMYNkB1xzp
	D6K3m3VhK+n0GUdfMC8fJY4tnfSo6cwUmoBa4Oy1bzIUwWFoX1U825+yTqe3MqgA54Rfk0A1EfP
	nYMDz62yoVB6ltWTvQUPfZcw+u/f2Zolno8T0fDjm5PtXQS6jE/0RWNWRPDKbovOmnl3oiHPlmv
	Y/WmtVqRCYQpHww==
X-Google-Smtp-Source: AGHT+IGVSBR+wv78ZR2qRg9+jQ+Nob2i2dFHlYc3RhuXJfNgULjNANgrz0O2oE//5W4kXoGzcp0+TQ==
X-Received: by 2002:a05:6a00:3c8e:b0:740:afda:a742 with SMTP id d2e1a72fcca58-763312e3376mr20221554b3a.0.1753767436981;
        Mon, 28 Jul 2025 22:37:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640ba9fc5bsm6938637b3a.130.2025.07.28.22.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nfs-utils: Fix build with glibc 2.42
Date: Mon, 28 Jul 2025 22:37:13 -0700
Message-ID: <20250729053714.1760140-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221028

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0002-Fix-build-with-glibc-2.42.patch      | 57 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.8.3.bb              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-glibc-2.42.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-glibc-2.42.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 00000000000..0b225118738
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,57 @@
+From d74ef9afacf9dc4a067a2f984f52ad136fb46c31 Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Fri, 27 Jun 2025 04:54:08 -0500
+Subject: [PATCH] Fix build with glibc-2.42
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+exportfs.c: In function ârelease_lockfileâ:
+exportfs.c:83:17: error: ignoring return value of âlockfâ declared with attribute âwarn_unused_resultâ [-Werror=unused-result]
+   83 |                 lockf(_lockfd, F_ULOCK, 0);
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
+exportfs.c: In function âgrab_lockfileâ:
+exportfs.c:77:17: error: ignoring return value of âlockfâ declared with attribute âwarn_unused_resultâ [-Werror=unused-result]
+   77 |                 lockf(_lockfd, F_LOCK, 0);
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+lockf is now marked with attribute warn_unused_result:
+
+https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f3c82fc1b41261f582f5f9fa12f74af9bcbc88f9
+
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=9f974046c37b7c28705d5558328759fff708b1cb]
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/exportfs/exportfs.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index b03a047..748c38e 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -74,13 +74,19 @@ grab_lockfile(void)
+ {
+ 	_lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
+ 	if (_lockfd != -1)
+-		lockf(_lockfd, F_LOCK, 0);
++		if (lockf(_lockfd, F_LOCK, 0) != 0) {
++			xlog_warn("%s: lockf() failed: errno %d (%s)",
++			__func__, errno, strerror(errno));
++		}
+ }
+ static void
+ release_lockfile(void)
+ {
+ 	if (_lockfd != -1) {
+-		lockf(_lockfd, F_ULOCK, 0);
++		if (lockf(_lockfd, F_ULOCK, 0) != 0) {
++			xlog_warn("%s: lockf() failed: errno %d (%s)",
++			__func__, errno, strerror(errno));
++		}
+ 		close(_lockfd);
+ 		_lockfd = -1;
+ 	}
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
index 9668ac0e861..a2afe2cd150 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfsserver \
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0002-Fix-build-with-glibc-2.42.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
            "


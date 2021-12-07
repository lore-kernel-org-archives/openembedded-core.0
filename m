Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B52CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.66829.1638882431016114602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e0peipRB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id c4so29309497wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=e0peipRBAbX+5GHp+qytChuv290/cUxq6bNlCRotLVLL8rdl4bbTMzOvJGG5aqc6DA
         UDEHq4Fx5oLzyuhmRyXnprp/C1wfbzkIDgt5FG3uButAUOAvBo8ZcC6O2+p/q0CRRZed
         Ed5UhAz1MxB7Gcvj1nTYFNNeFsre6pjfdB3GJBbWwt8foPaiTXW+ToHZU/3WshOfvQBZ
         c9wR3kWY4bieGf9YynpchA1aSDe7NllwNuIs7StsqQWmWDmwwbGeBEP1H+Wqnv/z/6Gy
         gNeOAnsy6mfXC7b4hCKFs16FyeQ3nCR8boeXkF1rlVc+kVdBZ9Q3XwN5WQdSILR8gmmK
         o6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=FCV9BjE73t15HQrGqqQ+Qoni/YDSPHDf72FpHG4H9AWXACf0Mh8iJsyn+WyQnDo+MO
         91FXUkbvTGsm/2dFBNafZYIL0C/H8kCMrLciPYUBMgwBS3JwtIJuiaDEGXrX0Z8rDNbH
         8y9aOrBmvo+g6+2ao3u6Hph6OsjtOQ/Pga5LtuVM2vbiGpiF7hWKC7BkhOG80lV+smrP
         PqhbgwXNXU2VAKaUPySXmPgFy1jIBZXnZmb03jla/zebxgUAiZ868/eU5eyysViAx1Ph
         Zb+iPcx9JbZVtshvooWn/dQ5NnJykgWBzm0BG0rwckl+78gzcewsct1FuUc0wUHrYmHC
         c29g==
X-Gm-Message-State: AOAM530yFnUQqrP6FfCtSkcqm+Y0VuHjgMwYoUFkB45b/uDhC3v4W9Es
	Rb+ZBvOzS+VFqhMlytqqBa5pvYiP+xeiCw==
X-Google-Smtp-Source: 
 ABdhPJzeUqgjA3ei0hY2xBPjtVH2VmvwIS+VUKm3KB+KP0+SyElAXAUDGN64VgqcLjiL2+yK86ceuQ==
X-Received: by 2002:a5d:6547:: with SMTP id z7mr49767653wrv.597.1638882429465;
        Tue, 07 Dec 2021 05:07:09 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/16] python3: drop unneeded multiprocessing module patch
Date: Tue,  7 Dec 2021 14:06:49 +0100
Message-Id: <20211207130703.3196805-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159288

I ran the reproducing sequence on qemux86, and it went fine:

root@qemux86:~# python3
Python 3.10.0 (default, Oct  4 2021, 17:55:55) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
>>>

Additionally AB testing revealed no issues, and the description isn't entirely
clear about where and how the problem occurs, so I can't submit it upsream
without having that understanding and how to demonstrate the problem.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ssing-libraries-to-Extension-for-mul.patch | 70 -------------------
 .../recipes-devtools/python/python3_3.10.0.bb |  1 -
 2 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch

diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
deleted file mode 100644
index 374433c68e..0000000000
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From bad7e6a625436402a01d03021fb9ccd58bc9930f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 9 Jan 2020 17:44:05 +0100
-Subject: [PATCH] setup.py: pass missing libraries to Extension for
- multiprocessing module
-
-In the following commit:
-...
-commit e711cafab13efc9c1fe6c5cd75826401445eb585
-Author: Benjamin Peterson <benjamin@python.org>
-Date:   Wed Jun 11 16:44:04 2008 +0000
-
-    Merged revisions 64104,64117 via svnmerge from
-    svn+ssh://pythondev@svn.python.org/python/trunk
-...
-(see diff in setup.py)
-It assigned libraries for multiprocessing module according
-the host_platform, but not pass it to Extension.
-
-In glibc, the following commit caused two definition of
-sem_getvalue are different.
-https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
-(see diff in nptl/sem_getvalue.c for detail)
-`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
-and `__old_sem_getvalue' is to compat the old version
-sem_getvalue@GLIBC_2.0.
-
-To build python for embedded Linux systems:
-http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
-If not explicitly link to library pthread (-lpthread), it will
-load glibc's sem_getvalue randomly at runtime.
-
-Such as build python on linux x86_64 host and run the python
-on linux x86_32 target. If not link library pthread, it caused
-multiprocessing bounded semaphore could not work correctly.
-...
->>> import multiprocessing
->>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
->>> pool_sema.acquire()
-True
->>> pool_sema.release()
-Traceback (most recent call last):
-  File "<stdin>", line 1, in <module>
-ValueError: semaphore or lock released too many times
-...
-
-And the semaphore issue also caused multiprocessing.Queue().put() hung.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index d92face..f42bcbb 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1836,7 +1836,7 @@ class PyBuildExt(build_ext):
-             if (sysconfig.get_config_var('HAVE_SEM_OPEN') and not
-                 sysconfig.get_config_var('POSIX_SEMAPHORES_NOT_ENABLED')):
-                 multiprocessing_srcs.append('_multiprocessing/semaphore.c')
--        self.add(Extension('_multiprocessing', multiprocessing_srcs,
-+        self.add(Extension('_multiprocessing', multiprocessing_srcs, libraries=['pthread'],
-                            include_dirs=["Modules/_multiprocessing"]))
- 
-         if (not MS_WINDOWS and
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index e3300b6495..24e6c04fe9 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -25,7 +25,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
-           file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
-- 
2.20.1



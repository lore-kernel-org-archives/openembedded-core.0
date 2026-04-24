Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F40FF8851
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31995.1777064229446914251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uo8JuzGl;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso113588835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064228; x=1777669028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sk+KyOSUpry0foy4yc4J13HLhPnVzfT1QPR38uM++A=;
        b=uo8JuzGlSS4I+2KTNgOaNsCzIWX+pjxJLfgQCjRC4KfCHvgMViL/QvYu1KecEB4EtC
         RBvU/6ch/IgHqh71eOphYNFwmxVSOcAY0I90/fXW5bS0aXiF+axZ+r6Ss2pE0BXvsDva
         abTnO0HFwTU487r6dW6YtGYVkqM4YAGEsM1Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064228; x=1777669028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/sk+KyOSUpry0foy4yc4J13HLhPnVzfT1QPR38uM++A=;
        b=Ue/JZ4nzV3D9MIl9iGxLpEmjdi6Dvq30YtomuSs1QUDqcNLkJ76cqAdrP8T0GgvMWv
         GHIAu7aK13G+Fzd2UBuBv664kSTQ5Rl2k9ioZQvTRFaQipOT0cXQmbaXdQ4Cy+sOB3U5
         d7djxZiTBf2s7AQQTksU1brsxudbqO2lIrZZJOPTwy+7zKgj88ogzKSVavOd2tlMFklS
         SrfO3E6G4y2eOMDKMIolRPkO1cdXafZNk943lH5WZmBENuBchLrMZ2UEoBmPirZNhqFm
         PhLBeuv2MSWStt7Xus1Y3W9PWi0hECjUsOoaHG2M3qw7P8E27nymcqxateb4aIww7GgW
         30kw==
X-Gm-Message-State: AOJu0YwxihkvC9dh6hEAACfsv73xJTcYXGbdwarI1UxkZTeaFt9DgRO4
	y4p8927BwN6QC5x/Q4BgDd4/QjJIkQP2lIBqxVeg0pLUKwy4JF59zomj89vWlZdWIJnRXTewzY/
	olFyeN88E+w==
X-Gm-Gg: AeBDieuZyCWtberjiBWpt1MhcTG7YM7+DLGXyVNWqyALDAWDTzFW9AuxJvTLYop5Q3z
	aJoDZzs1GfRznVmWPlZ6CYQe+PDXkCvTehTdpmSUNbDug/XnsA9B6L6fM8wuo4Et41hP73P28dR
	6ECneQ4txW8mnarOpjN4U2dhR9ZY8CaGVyKA4WjxF+lpofTSOtwuLigXQl6HE0YCt59RsKGlSS3
	WPvJD/Xg/G6mwRQN/zKTU47cFUBqy1FbN7Xvz+sR6hZ1XCh5oJ36+FkVvRRgc9vwkYV+WHSuqcr
	gpL/tSnr1Vh+vxbqIRz+M0JmmI/cfxMeSIMXreoSZwXxqE2CI+pFhGrPeECAAAcK3qOzF3BwdGr
	JXPsDpKi+tsLpZxiRCG87AXglXIEhWFd8j5Rk0dBXAsj3eWL4ddptelRr3WKDAiVxl+xThR9FmO
	G6N8/efl/DvTh8wq5a7cf1qgJcbFW0i7l7YrHhdJHVzSitfKVyUHMiDDhyT1bJtvwNjmL546dOg
	XCNvLqGcWdJNh3OKCXLnO1pF89y1WhAaa7nvw==
X-Received: by 2002:a05:600c:8183:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488fb765b1dmr397942135e9.15.1777064227550;
        Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 53/66] binutils: backport patch to fix build with glibc-2.43 on host
Date: Fri, 24 Apr 2026 22:55:52 +0200
Message-ID: <6421f085fbb75df1cd122f1c327352b9434f8307.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235926

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
../../../gprofng/libcollector/linetrace.c: In function ‘__collector_ext_line_install’:
../../../gprofng/libcollector/linetrace.c:219:45: error: expected identifier before ‘_Generic’
  219 |   if (java_follow_env != NULL && CALL_UTIL (strstr)(java_follow_env, COLLECTOR_JVMTI_OPTION))
      |                                             ^~~~~~
../../../gprofng/libcollector/linetrace.c:219:34: note: in expansion of macro ‘CALL_UTIL’
  219 |   if (java_follow_env != NULL && CALL_UTIL (strstr)(java_follow_env, COLLECTOR_JVMTI_OPTION))
      |                                  ^~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e27502af72e..096ccf42c2a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://0019-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch \
      file://0020-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch \
      file://0021-gprofng-fix-build-with-std-gnu23.patch \
+     file://0022-gprofng-protect-against-standard-library-macros.patch \
      file://0018-CVE-2025-0840.patch \
      file://CVE-2025-1176.patch \
      file://CVE-2025-1178.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 00000000000..0fa0a939918
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,31 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream-Status: Backport [2.46 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().


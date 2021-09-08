Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.15613.1631124103018261541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rkdpc6fG;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so2222878wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aYFX46JbvHIgwm6VA4++Aa1FWEfQHA8RMy8nCAjvW80=;
        b=Rkdpc6fGnbD+Ic0m6cR9tmF9YVcDi8vkCReVkESy4Q/iThu4CZgqJ0Yo4T53sQARQK
         IA3Ax2amUj6cyO0Xok6IIINIME7QwYJP8SbzvJj/BBJJrFj6VWbogEjtNOVqjT4fpjI8
         b7bW/TgH0W6h4d0gRGdkpynVmKORuncziMxPkTW/Y+veh/DU7Hr90Z/oyoxSXZ5bLEqJ
         tFdOv6fB9u+gQzVDAGTgqaYUHPeTm8m8Gmj6CMBgm5S/zxJGJbrJPBf6M68AjXmo2ma/
         jVwLqRWkYDrGlgs0srck/6ZnPJ/OgFkx/b1sFKYmrJioJSYaN2qVEbW+lDknz9tfQqmH
         lJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aYFX46JbvHIgwm6VA4++Aa1FWEfQHA8RMy8nCAjvW80=;
        b=55q0nR8WoICZ5336r/+q5K5FWA/amYRUlNXMSZyrUZI2G27Gt3ccawXqyorbdTwZrQ
         DD5IhM0MzH7m9y7l/idG7wjdxAISaZfxgfb2V8od6lv7s41RNznV8qs40huURegYto6M
         SjpytJo7TzjhkqCH/MpxCxcPK/sEa5medIsuz+g/Fkfvob+grw7ahVzKGf7jgYHRI611
         +x97AdT9a9F7UZ2QgQW9BFcDv2iAkMPgiiKYePh9Ok+FEv7SQayNJHS7fh55poC4OOgf
         4Kd50W3cLEDs0JMGXPrIsxMoNBbsMAF7GQIp6Ef4E/4UwhnE8TSAUjsi6T8g8r/q/TZH
         2tKg==
X-Gm-Message-State: AOAM530Jfb0CXaOz8rG7S9cA8NGWfbG3WT89s2iQH4xiKMlTRLFcTFM0
	lsO7HnCuLLbxsL9KFCtRGTzy8JjDRC0=
X-Google-Smtp-Source: ABdhPJwHqoJE+Bxl7w6r4nDuvXzBukAisPWESLljPjLGgJwCfcxE3QgsEGceUoQlog/34A4c1IZCOw==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr4821433wmh.137.1631124101639;
        Wed, 08 Sep 2021 11:01:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/26] inetutils: update 2.1 -> 2.2
Date: Wed,  8 Sep 2021 20:01:18 +0200
Message-Id: <20210908180125.103473-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tils-only-check-pam_appl.h-when-pam-enabled.patch | 12 ++++++------
 .../inetutils/{inetutils_2.1.bb => inetutils_2.2.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.1.bb => inetutils_2.2.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
index 7d5c087c9d..2343c03cb4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
@@ -1,4 +1,4 @@
-From 684e45b34a33186bb17bcee0b01814c549a60bf6 Mon Sep 17 00:00:00 2001
+From cc66e842e037fba9f06761f942abe5c4856492b8 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 6 Mar 2019 09:36:11 -0500
 Subject: [PATCH] inetutils: Import version 1.9.4
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 86136fb..b220319 100644
+index 5e16c3a..18510a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,6 +183,19 @@ AC_SUBST(LIBUTIL)
+@@ -182,6 +182,19 @@ AC_SUBST(LIBUTIL)
  
  # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
  if test "$with_pam" = yes ; then
@@ -38,12 +38,12 @@ index 86136fb..b220319 100644
    AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
    AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
    if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
-@@ -620,7 +633,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h errno.h fcntl.h features.h \
+@@ -617,7 +630,7 @@ AC_HEADER_DIRENT
+ AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h fcntl.h features.h \
  		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
  		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
 -		  security/pam_appl.h shadow.h \
 +		  shadow.h \
- 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
+ 		  stropts.h sys/tty.h \
  		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
  		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.1.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 0cf73cdb24..3bab137eb4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "01b9a4bc73a47e63f6e8a07b76122d9ad2a2e46ebf14870e9c91d660b5647a22"
+SRC_URI[sha256sum] = "d547f69172df73afef691a0f7886280fd781acea28def4ff4b4b212086a89d80"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
-- 
2.31.1


Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.181967.1598214096585346626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P9IqVmkX;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id j25so107110ejk.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i4uH6M2WW5Xm5I25oFjZETQOiW8rMewwI3RM9cEMm/A=;
        b=P9IqVmkXoxHHUWItIgRi+0/0s+Rqpv+F9gSRjkdBh2v+SFXh1nJiw9LIiBVzdaKVTC
         3rEgSbMeYHap7+IncpoKvF7VdSBmocO3cp9DAzI/3pArVvt4L164jl3DGN1jkNNXR5fl
         8xyndI6YkwltdzvtflOh/ABMygWLh0rgs51nkF6/QG2PCv7IPESk3z4ERbewtH29Pk7J
         sFGC1rmFOlRM6cpgWwBSl8/2ZGMIFCMS8wOKV3s+Bg3r2pwb13PnPJGEsAkDK7NumsDB
         qDqYOjN9h/5ro39WGNxTq4FrGFkO8ZBmJQ8QYt7mUSoDbRW9LaLyegytZKeO6Zd89Mq7
         aYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4uH6M2WW5Xm5I25oFjZETQOiW8rMewwI3RM9cEMm/A=;
        b=FjbnILZ8cMD+poX0jn6mI2TU4r+3TcHAqa3ev2E2erK6x7JqTFmHo3VHVOOxjjTRuV
         1rGjUJjwKPLuWSVXsX7Fv99NX67z5VucHrPFrjuOgG5Q7DDIJ0TuGMLCy3IpRJVDExNt
         Ht9k2tmUlIWeURkuL9f84TpcMGTeiKBEB7ihHsACwSHzhP09OUDPM6a6AdzpYvpZj8S6
         AHMqsh5aq0uURF1QL1M8IgxJHavNxk8B5KSlOE8lTJuXZR37AHlIGMIea4TlLwLerRgL
         34Mw4WPP2p+KljhkCtZ8OW/fhd+nzIDrLctk/ogb1tz2QFW5aZNBQCB831Cz1qyDkLIN
         idBQ==
X-Gm-Message-State: AOAM532CFCCF6ZR1KaFYxHptlThld2uRbkrYhs6wguQYK/cX9ueHWasm
	tjDZQwk0B2IDgBYG03GFzOzuTLBkn40=
X-Google-Smtp-Source: ABdhPJy0E2YPjvf+FW0O5Iord0BeCTPN5J+zknudbU6jSqL//s4qLYnbu20aOzIGu0xDyPmRco4+oQ==
X-Received: by 2002:a17:906:f1d4:: with SMTP id gx20mr2697884ejb.132.1598214094847;
        Sun, 23 Aug 2020 13:21:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/37] gpgme: update 1.13.1 -> 1.14.0
Date: Sun, 23 Aug 2020 22:20:26 +0200
Message-Id: <20200823202031.24686-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gpgme/0008-do-not-auto-check-var-PYTHON.patch    | 12 +++++-------
 .../gpgme/{gpgme_1.13.1.bb => gpgme_1.14.0.bb}       |  3 +--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.13.1.bb => gpgme_1.14.0.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
index 3afbfc8638..dfea1bf78a 100644
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
@@ -1,4 +1,4 @@
-From fc3d9cc218e60582fd158d21a1cd537a3dc1b007 Mon Sep 17 00:00:00 2001
+From 5bbf7a048b6d81d23186340e839f9f65b5b514b6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 16:19:54 +0800
 Subject: [PATCH] do not auto check var-PYTHON
@@ -12,25 +12,23 @@ only check specific python 2.7 and 3.7
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cb2f073..7d74a6d 100644
+index 5ef00c0..bbcff93 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -423,8 +423,8 @@ if test "$found_py" = "1"; then
+@@ -425,8 +425,8 @@ if test "$found_py" = "1"; then
  	if test "$found_py" = "1" -o "$found_py3" = "1"; then
  	  # Reset everything, so that we can look for another Python.
            m4_foreach([mym4pythonver],
--                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[all]],
+-                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[all]],
 -           [unset PYTHON
 +                     [[2.7],[3.7]],
 +           [
  	    unset PYTHON_VERSION
  	    unset PYTHON_CPPFLAGS
  	    unset PYTHON_LDFLAGS
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_1.13.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.14.0.bb
index b51534351d..9fa8212808 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
@@ -22,8 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[md5sum] = "198f0a908ec3cd8f0ce9a4f3a4489645"
-SRC_URI[sha256sum] = "c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46"
+SRC_URI[sha256sum] = "cef1f710a6b0d28f5b44242713ad373702d1466dcbe512eb4e754d7f35cd4307"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.28.0


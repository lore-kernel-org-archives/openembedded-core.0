Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.19195.1608974892847855633
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S6oc1cEY;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ce23so8296136ejb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8DI40xANhE/PcJ5FEPKLkq7CEi98HZ35oMXnZN2Sfg=;
        b=S6oc1cEYfcxMTq15K5hh6jeWGn8NgmmmLyUJ1HoNwE6L0xa92BX3lMY8ippPHUvKf/
         u1YEswj+Izq30wMy6fAUx1UpIbiKh4nJY82ECG3Oj5hD+LDzitxCvxokr3TrDgsZJdyG
         MGqupm6WWOLCfuT6RElfVeGuYdCiHDh9aWEITcvOoVkHEsFoCdUID7611xizhN8T67ib
         iNWf2b3DeM2qxrMMfq75GwdDwST07V6aP85kK0+epQA5gb309syGSbUdOY+mNPUbKrUW
         37Ihx/sx1BycrcrffBldrZhSgdN2Rf0m8QrgeG7ymgC46NrPbdRqcxuW9cqY1xl89I36
         A+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8DI40xANhE/PcJ5FEPKLkq7CEi98HZ35oMXnZN2Sfg=;
        b=pBswClihnjUIYL3UelLpqSJ+k2l7P2Hs3UE26qN5DHWQMll5Kw+gDp3eJ8NZOTfM7L
         QGceCBEcIjScX3vm2wbCmeF6QdVgcwcSLGglrjHYZi9XP1gO5UTgmGaKI2WWqhcwosRz
         7VoiuZUbjSR33MWXXgmrON6iYlidsmNK6+Z716LJ6e2VhZ9oCfxJGgGdaT4V5QWIWG+4
         fPHwuSo07eue+e9RG4pyKML43ef2caIHUB0rhjnfPAXHodYhWB2AnA0p5vq7pXpUSBbn
         2u2ufghCKrm2YYAddcRnYPkKwbCyTC9otPRujD9lbJjFxqfxlDd5Fwd0abxD4FFqfFne
         P2UA==
X-Gm-Message-State: AOAM532Xp2ScgptYqiWOZISz+ROJCNIiOSVTNea0ZRzOl2uEiPACQkYN
	8w3RTSt4AGAFLX0FjkNFl2V6Z7YQEzc=
X-Google-Smtp-Source: ABdhPJyLE3g4UsYt72xy8JGVQsohr0kzOEUIF2p/Cx9LR8LxwO9Uy0Ju0O5lXS5SWJQ7aHlafYVf8w==
X-Received: by 2002:a17:906:1194:: with SMTP id n20mr33740516eja.269.1608974891524;
        Sat, 26 Dec 2020 01:28:11 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:11 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/48] rpm: update 4.16.0 -> 4.16.1.2
Date: Sat, 26 Dec 2020 10:27:21 +0100
Message-Id: <20201226092732.52323-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lib-rpm-as-the-installation-path-for.patch | 10 ++++----
 .../0001-rpmdb.c-add-a-missing-include.patch  | 25 -------------------
 .../rpm/{rpm_4.16.0.bb => rpm_4.16.1.2.bb}    |  3 +--
 3 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
 rename meta/recipes-devtools/rpm/{rpm_4.16.0.bb => rpm_4.16.1.2.bb} (98%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 30975faeaf..38d755205c 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 4fd37bc9d8d0777aa038777dd81a76b64f536efd Mon Sep 17 00:00:00 2001
+From 9bbe3f8564705aafcdcc5f2f033f9241a97f47c6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 186e4aeec..5df252085 100644
+index 6c78568e4..76b1d40e4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -944,7 +944,7 @@ else
+@@ -966,7 +966,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -40,7 +40,7 @@ index 35c8cf9df..9d8b2825c 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index b46c6b7da..02d5c7a0a 100644
+index cd40a16be..e6941e09f 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index b46c6b7da..02d5c7a0a 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 10:0:1
+ rpm_version_info = 10:2:1
diff --git a/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch b/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
deleted file mode 100644
index c7ae158f8d..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9de15c7e1f4ca23a10edb9a3b657f06b2b13e841 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 20 Oct 2020 22:16:39 +0200
-Subject: [PATCH] rpmdb.c: add a missing include
-
-This addressed build failures on non-glibc systems.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lib/rpmdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/rpmdb.c b/lib/rpmdb.c
-index 4c101569f..73187630b 100644
---- a/lib/rpmdb.c
-+++ b/lib/rpmdb.c
-@@ -8,6 +8,7 @@
- #include <utime.h>
- #include <errno.h>
- #include <dirent.h>
-+#include <fcntl.h>
- 
- #ifndef	DYING	/* XXX already in "system.h" */
- #include <fnmatch.h>
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.0.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
similarity index 98%
rename from meta/recipes-devtools/rpm/rpm_4.16.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
index 4125f3f9d0..9195d66dd1 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
@@ -39,12 +39,11 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
-           file://0001-rpmdb.c-add-a-missing-include.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
            "
 
 PE = "1"
-SRCREV = "cd7f9303ef1070f027493cad7d00bc66935af2a0"
+SRCREV = "278883a704ea36c97974d0f2d65d41abe78b0e2a"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2


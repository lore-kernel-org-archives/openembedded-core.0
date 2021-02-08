Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.33594.1612781984916987070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pv/mewQO;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t5so17478268eds.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhNr5NUrj8d4mUp4yZ550DFoRkfu5XK11AvklQFl5Zc=;
        b=Pv/mewQOh43LR6Yg0yN1/LrEozS2nBXjFzBz9juV2zVpjARFS4r1sCNgJV1VDDyYOM
         V1piBoZKr+Xg12V5W8YCRakx4Pmh7UMZas+Zhj8YlXVFpUfzzeMlZe2zqN1XOPweRRZ3
         eVVKpDFocoJ9Gjzeje1HfjLXEdDYBxinaqGmRyd1ledPzVnLVHN9Eisz+FK09p44UPOk
         wjgMKdqMRhoOFi8NXFzu4uyRh7tAFWoG69kll7IMfg9IIh4AoDbFS4aBbUFCP/jrjamK
         6LrqbPpXyJz7Hz+R9reLaYCQDBd+3+HbltIxB+O74lUaQZVPG8Lu0Su6IEVR0PS4UjjH
         JM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhNr5NUrj8d4mUp4yZ550DFoRkfu5XK11AvklQFl5Zc=;
        b=ceApQq7rTV+IJsbgsHfkzKmjkOpHDeaPNEGA+TGyujW6L2aFgyfaJCbBWmno+oZaTI
         PFgllBrDuU6VO9iSG5+xo2sptGHzGrg0yzl+s0+Lm9pob6GsdJU0aQKhLiP5cJY+c4lf
         79HzLeUavE7pud12nQt52JmRBoEju/9UhvXJSKnjbkgp81qLB35BsUIAtX2LijaHef8n
         0QeYo40vl1LayAHe12R9gUbnJm7JTkcJUy2E/qcK1RmqVAqPYjtQGZP3Ie2i1Vj941I+
         a7YqluejsIyfoBTneiYy/zCPsl9GVrgoSqR1AzgQShBk78o9booFEymamsrbgwe86mO8
         Xlpg==
X-Gm-Message-State: AOAM532U6lnH/ihTusgR/nOouNRKzVaANtafGGKGa2pwJbUaKIC336FO
	usbGuhJLhv/sHhra3NyUhbZk49DJyajIDw==
X-Google-Smtp-Source: ABdhPJyjFB089VcXpTy7G5y5V9Uf6Ii3nuMB0L+PyiDLnrDSzCLb2SpFPe6HyS5/7TpdSM4otwZcvA==
X-Received: by 2002:aa7:c647:: with SMTP id z7mr16525581edr.177.1612781983385;
        Mon, 08 Feb 2021 02:59:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/12] dpkg: update 1.20.5 -> 1.20.7.1
Date: Mon,  8 Feb 2021 11:59:27 +0100
Message-Id: <20210208105932.347925-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ild.c-ignore-return-of-1-from-tar-cf.patch | 10 ++++----
 ...kg-fsys-usrunmess.pl-correct-shebang.patch | 23 +++++++++++++++++++
 .../dpkg/{dpkg_1.20.5.bb => dpkg_1.20.7.1.bb} |  5 ++--
 3 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.20.5.bb => dpkg_1.20.7.1.bb} (87%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index ffe520c513..2dc68e2064 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 15b081cc8bead80c493ab83369ecb3345a24a3dc Mon Sep 17 00:00:00 2001
+From d6f5fed6bc56e1f3b885a796a43aa2868ace57bc Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,10 +29,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 8436839cd..6b44a36f7 100644
+index d13a21c1e..059f2be6d 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -434,6 +434,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -480,6 +480,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -40,7 +40,7 @@ index 8436839cd..6b44a36f7 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -486,7 +487,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -532,7 +533,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
@@ -50,4 +50,4 @@ index 8436839cd..6b44a36f7 100644
 +    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
  }
  
- static time_t
+ static intmax_t
diff --git a/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch b/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch
new file mode 100644
index 0000000000..292b72ab5d
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch
@@ -0,0 +1,23 @@
+From 0decc62904571582147f2273fa1b521e00485dda Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 3 Feb 2021 20:47:58 +0100
+Subject: [PATCH] scripts/dpkg-fsys-usrunmess.pl: correct shebang
+
+Otherwise automake will write the full native perl path into it.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ scripts/dpkg-fsys-usrunmess.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/dpkg-fsys-usrunmess.pl b/scripts/dpkg-fsys-usrunmess.pl
+index 9220df3c0..9ce368955 100755
+--- a/scripts/dpkg-fsys-usrunmess.pl
++++ b/scripts/dpkg-fsys-usrunmess.pl
+@@ -1,4 +1,4 @@
+-#!/usr/bin/perl
++#!/usr/bin/env perl
+ #
+ # dpkg-fsys-usrunmess - Undoes the merged-/usr-via-aliased-dirs mess
+ #
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
similarity index 87%
rename from meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
index d97b69c0b9..55ac84f724 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=sid \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -14,10 +14,11 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch \
            "
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "823a67d67538b1b403a32d1fef40e6e228265566"
+SRCREV = "667bf0aeb92e0e7bb225ee273569c5e2389083bd"
 
 S = "${WORKDIR}/git"
-- 
2.29.2


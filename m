Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.4112.1588240713023435481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=km4JMWte;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id j2so6105620wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TSKMUCv973MKGBsUxKMRendDsohU2PXDXQAgpK8JF8=;
        b=km4JMWteCNf5mPoYn/RsmnQE4dFNnx6ot3D81y+NhlMd8FkCQ0sLwOdGrYO663iUwH
         Ah2fmrmFik2YGS305dvU061iJud/a+Rw449dGCx9FNy3QDr2uPLaAWBgQfoUp67XPPw2
         BkJ4iWCPH6LMRMugghA6sfWaRW+I0TfhDyymBmQdXOgLi5sN//K7iE50DMdIOrTOUruB
         r9ORqlyY/q/fpTKSliut/odhQrxOZ0GNA3CAZtQ/ULanRZ6os0nfXxvyrhzOyEl23vz2
         izKsAe3Hw/yIQvPrpxGVPRY+GxF6V5W6io/QnnuOnu4IFM23Otg+txQsvESYQLGKXKJU
         DnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TSKMUCv973MKGBsUxKMRendDsohU2PXDXQAgpK8JF8=;
        b=NGTBV7Ajm5vpP8TnW+xxB3eh1sQl/ADPupnsGV7QVBWwj+J3+hO9a3lGoNkW2HoVcL
         M4qDK2bhrQ30na152U9nvk/imlfj+06LnDS6DmME281+GhXhyS6d39TU1dI1UgrzyCkd
         foI2lbY9qUM9mGvqdKYQZaYKvdom89qQCqfTFOKXnD3NG4Dvy/zTXL7bDCLCKFooes/1
         MCZ7JH4VMv2EfcI+SS9R/ep1L6tXoWogab5gX7d3pERYcrOF3ZsMmhHpLwXbeUYN41UF
         NIsoB3C1Pw4pCXFBrIM+5Ithh60dUc21907nMNYCWrVv8WJ+/yfwpneFtJ+B1PPshPmn
         B57Q==
X-Gm-Message-State: AGi0PubuGDZX5soxGXwSoKBrdzOo/t7f0tib0wFx/ZXAkUWA7bXA1ROe
	SXdsTA813csH9J2L/rtSEtuvrEmT
X-Google-Smtp-Source: APiQypK89nP/JXZ8Lm9sBBokjB/eMXygRfkoSyS74UTbSHt/KeK6l/DDHGZPE2ZvbeJ8fJAfawpfGg==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr3062201wrx.386.1588240711155;
        Thu, 30 Apr 2020 02:58:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/17] logrotate: update to 3.16.0
Date: Thu, 30 Apr 2020 11:58:01 +0200
Message-Id: <20200430095815.2824-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ual.patch => 0001-Update-the-manual.patch} | 15 +++++------
 .../logrotate/act-as-mv-when-rotate.patch     | 25 +++++++++----------
 .../disable-check-different-filesystems.patch | 14 +++++------
 ...ogrotate_3.15.1.bb => logrotate_3.16.0.bb} |  6 ++---
 4 files changed, 29 insertions(+), 31 deletions(-)
 rename meta/recipes-extended/logrotate/logrotate/{update-the-manual.patch => 0001-Update-the-manual.patch} (70%)
 rename meta/recipes-extended/logrotate/{logrotate_3.15.1.bb => logrotate_3.16.0.bb} (95%)

diff --git a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
similarity index 70%
rename from meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
rename to meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
index 725567e0c9..50a3852078 100644
--- a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
+++ b/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
@@ -1,4 +1,4 @@
-From bf22e8805df69344f6f20cea390e829a22fa741b Mon Sep 17 00:00:00 2001
+From 3e2cfa88b6538bb0fee3d9a6e99622055d05ac4a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:14:37 -0800
 Subject: [PATCH] Update the manual
@@ -8,23 +8,24 @@ Update the manual for rotating on different filesystems.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  logrotate.8.in | 10 ++++------
  1 file changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/logrotate.8.in b/logrotate.8.in
-index 951e406..581bf48 100644
+index 98fea91..70b4c44 100644
 --- a/logrotate.8.in
 +++ b/logrotate.8.in
-@@ -445,12 +445,10 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
+@@ -202,12 +202,10 @@ at all (use with caution, may waste performance and disk space). Default is 0.
  
  .TP
  \fBolddir \fIdirectory\fR
--Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR must be
+-Logs are moved into \fIdirectory\fR for rotation.  The \fIdirectory\fR must be
 -on the same physical device as the log file being rotated, unless \fBcopy\fR,
--\fBcopytruncate\fR or \fBrenamecopy\fR option is used. The \fIdirectory\fR
+-\fBcopytruncate\fR or \fBrenamecopy\fR option is used.  The \fIdirectory\fR
 -is assumed to be relative to the directory holding the log file
--unless an absolute path name is specified. When this option is used all
+-unless an absolute path name is specified.  When this option is used all
 -old versions of the log end up in \fIdirectory\fR.  This option may be
 +Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
 +is assumed to be relative to the directory holding the log file unless
@@ -34,5 +35,5 @@ index 951e406..581bf48 100644
  
  .TP
 -- 
-1.8.3.1
+2.24.0
 
diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index 79805b5148..acef5ccbe9 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,4 +1,4 @@
-From c637948ebab5aff5641700c5cf613321ca0a6e6b Mon Sep 17 00:00:00 2001
+From ef1ea905831c5bcd63e04149571c10d75ff8f028 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:08:07 -0800
 Subject: [PATCH] Act as the "mv" command when rotate log
@@ -9,15 +9,16 @@ read and write.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  logrotate.c | 71 ++++++++++++++++++++++++++++++++++++++++++++---------
  1 file changed, 59 insertions(+), 12 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 54dac90..bf3ec23 100644
+index 25902bc..afa1a90 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -1360,6 +1360,53 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1434,6 +1434,53 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -71,7 +72,7 @@ index 54dac90..bf3ec23 100644
  /* find the rotated file with the highest index */
  static int findLastRotated(const struct logNames *rotNames,
                             const char *fileext, const char *compext)
-@@ -1800,15 +1847,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
+@@ -1911,15 +1958,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
              }
  
              message(MESS_DEBUG,
@@ -90,7 +91,7 @@ index 54dac90..bf3ec23 100644
                              oldName, newName, strerror(errno));
                      hasErrors = 1;
                  }
-@@ -1891,21 +1938,21 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
+@@ -2002,10 +2049,10 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
                      return 1;
                  }
  
@@ -104,7 +105,8 @@ index 54dac90..bf3ec23 100644
                              log->files[logNum], tmpFilename,
                              strerror(errno));
                      hasErrors = 1;
-                 }
+@@ -2014,11 +2061,11 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
+                 free(tmpFilename);
              }
              else {
 -                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
@@ -118,7 +120,7 @@ index 54dac90..bf3ec23 100644
                              log->files[logNum], rotNames->finalName,
                              strerror(errno));
                      hasErrors = 1;
-@@ -2297,7 +2344,7 @@ static int rotateLogSet(struct logInfo *log, int force)
+@@ -2424,7 +2471,7 @@ static int rotateLogSet(struct logInfo *log, int force)
      return hasErrors;
  }
  
@@ -127,7 +129,7 @@ index 54dac90..bf3ec23 100644
  {
      struct logState *p;
      FILE *f;
-@@ -2460,7 +2507,7 @@ static int writeState(const char *stateFilename)
+@@ -2629,7 +2676,7 @@ static int writeState(const char *stateFilename)
          fclose(f);
  
      if (error == 0) {
@@ -135,8 +137,8 @@ index 54dac90..bf3ec23 100644
 +        if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
              unlink(tmpFilename);
              error = 1;
-             message(MESS_ERROR, "error renaming temp state file %s\n",
-@@ -2805,7 +2852,7 @@ int main(int argc, const char **argv)
+             message(MESS_ERROR, "error renaming temp state file %s to %s\n",
+@@ -2987,7 +3034,7 @@ int main(int argc, const char **argv)
          rc |= rotateLogSet(log, force);
  
      if (!debug)
@@ -145,6 +147,3 @@ index 54dac90..bf3ec23 100644
  
      return (rc != 0);
  }
--- 
-2.18.1
-
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 96ff098a3f..9ba531f815 100644
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -1,4 +1,4 @@
-From e47796c8e8270a3d14f0b06af8a9e916c2225514 Mon Sep 17 00:00:00 2001
+From a3fdf3dbdd6ecc0f2550a765dcb9bb274bce8ea8 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 8 Jan 2019 06:27:06 +0000
 Subject: [PATCH] Disable the check for different filesystems
@@ -9,18 +9,19 @@ disable the check for different filesystems.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  config.c | 9 ---------
  1 file changed, 9 deletions(-)
 
 diff --git a/config.c b/config.c
-index 633b843..99a4a3b 100644
+index f027c7e..026136c 100644
 --- a/config.c
 +++ b/config.c
-@@ -1765,15 +1765,6 @@ duperror:
-                                     goto error;
-                                 }
+@@ -1873,15 +1873,6 @@ duperror:
                              }
+ 
+                             free(ld);
 -
 -                            if (sb.st_dev != sb2.st_dev
 -                                    && !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
@@ -33,6 +34,3 @@ index 633b843..99a4a3b 100644
                          }
                      }
  
--- 
-2.18.1
-
diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb b/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
similarity index 95%
rename from meta/recipes-extended/logrotate/logrotate_3.15.1.bb
rename to meta/recipes-extended/logrotate/logrotate_3.16.0.bb
index 7c7d51b39e..2b6ee0a19a 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
@@ -21,12 +21,12 @@ UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
             file://act-as-mv-when-rotate.patch \
-            file://update-the-manual.patch \
+            file://0001-Update-the-manual.patch \
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "afe109afea749c306ff489203fde6beb"
-SRC_URI[sha256sum] = "491fec9e89f1372f02a0ab66579aa2e9d63cac5178dfa672c204c88e693a908b"
+SRC_URI[md5sum] = "faf729e0e24bfaafaa677bc6deb46ed8"
+SRC_URI[sha256sum] = "442f6fdf61c349eeae5f76799878b88fe45a11c8863a38b618bac6988f4a7ce5"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.26.1


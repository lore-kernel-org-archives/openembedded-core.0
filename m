Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.4449.1596317033216151462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s5eiquWK;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id c15so15021689edj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NtU9wZVwcY9rmrx0lh/gkGh2fgxOcKKyu8Axx/2osAc=;
        b=s5eiquWKofqkrTpxpClK7hOqLqhu8aUO/QUACKDVh4RwHxdTGw8rYevDQg2ZNSDmgw
         oZWSHvhpvxQ2wtv2azBqofekfby5tsqfK2wqVZGk7DBvPnCjUnB7H3jAgYrEQ5JmBZWT
         ZMvUkU1qQVrwL/Tks4C30GuxpN6E/vpWLRmWdmqDi0jrnor+n18wkhNOxO1PAymbYNTw
         YrjmIE1C5a/wUPmZjNcSsP8w2q8xNFU6eA7JwhWcZBxgPQ/0mDErNh2s34HX+x+qdKcD
         WZSsJ9MvHDd6LN3ToAUTTWb8gMf/0inVINlYy9a8TB1Fz6qYGvlcFBkMJmRCDYWN2h0+
         zyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtU9wZVwcY9rmrx0lh/gkGh2fgxOcKKyu8Axx/2osAc=;
        b=NKvCEYtNApc1GswQEeuh9z+qT+dCQPUNkYG7UjWuLYpYXRn9oGz8dqSJGv4DBZUG5C
         nZqwpWoi0Tfe4EMgpTTVN7SFKpe3uafTbQTz2IHVUA0NLjD/HyX6BafLjL0R4otbg5UH
         yiNM9CCbhXhvS/izFZ/0hhZOzQT/W6V7RFTEW5qMFLUPXrQVuR/z5UspMOHh3dJAPKfR
         YsxbpmPEHobQbcrhYWpFqXD82ugHQWx8BVaoctCyRMVqY9OUqTVp3Rikpd/zxltnsq4X
         SQ8XjzUAneC2C7n9Dbd687xg4iJE35sbCpvK40n70ivR1WpgpJEh9CvRuACaIDkIss3T
         CNxg==
X-Gm-Message-State: AOAM5312ykLmLnCl8Dmf9YLXLsxmr/rO1ZY05D149flWZnrGOkZMXF6H
	MtDVhfwlYvCrxx7K4mUEdIjq63Y/cPY=
X-Google-Smtp-Source: ABdhPJw7aurvKk1FVbzzP39RZABY3JsSLWb4ktYwH6q4w67CXdjytpCxL95oaweHE1iXby/W6B0gVw==
X-Received: by 2002:a50:fb14:: with SMTP id d20mr9213877edq.191.1596317031576;
        Sat, 01 Aug 2020 14:23:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/13] logrotate: update 3.16.0 -> 3.17.0
Date: Sat,  1 Aug 2020 23:23:32 +0200
Message-Id: <20200801212335.14922-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../logrotate/act-as-mv-when-rotate.patch     | 22 +++++++++----------
 .../disable-check-different-filesystems.patch |  8 +++----
 ...ogrotate_3.16.0.bb => logrotate_3.17.0.bb} |  3 +--
 3 files changed, 16 insertions(+), 17 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.16.0.bb => logrotate_3.17.0.bb} (96%)

diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index acef5ccbe9..671fce4ac8 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,4 +1,4 @@
-From ef1ea905831c5bcd63e04149571c10d75ff8f028 Mon Sep 17 00:00:00 2001
+From 17d57a2a923a4af53c8910a9999aebeab3f5d83a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:08:07 -0800
 Subject: [PATCH] Act as the "mv" command when rotate log
@@ -15,10 +15,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 59 insertions(+), 12 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index 25902bc..afa1a90 100644
+index 45b3eb6..231371a 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -1434,6 +1434,53 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1463,6 +1463,53 @@ static int findNeedRotating(const struct logInfo *log, unsigned logNum, int forc
      return 0;
  }
  
@@ -72,7 +72,7 @@ index 25902bc..afa1a90 100644
  /* find the rotated file with the highest index */
  static int findLastRotated(const struct logNames *rotNames,
                             const char *fileext, const char *compext)
-@@ -1911,15 +1958,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
+@@ -1958,15 +2005,15 @@ static int prerotateSingleLog(const struct logInfo *log, unsigned logNum,
              }
  
              message(MESS_DEBUG,
@@ -91,7 +91,7 @@ index 25902bc..afa1a90 100644
                              oldName, newName, strerror(errno));
                      hasErrors = 1;
                  }
-@@ -2002,10 +2049,10 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
+@@ -2051,10 +2098,10 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
                      return 1;
                  }
  
@@ -105,7 +105,7 @@ index 25902bc..afa1a90 100644
                              log->files[logNum], tmpFilename,
                              strerror(errno));
                      hasErrors = 1;
-@@ -2014,11 +2061,11 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
+@@ -2063,11 +2110,11 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
                  free(tmpFilename);
              }
              else {
@@ -120,7 +120,7 @@ index 25902bc..afa1a90 100644
                              log->files[logNum], rotNames->finalName,
                              strerror(errno));
                      hasErrors = 1;
-@@ -2424,7 +2471,7 @@ static int rotateLogSet(struct logInfo *log, int force)
+@@ -2480,7 +2527,7 @@ static int rotateLogSet(const struct logInfo *log, int force)
      return hasErrors;
  }
  
@@ -129,16 +129,16 @@ index 25902bc..afa1a90 100644
  {
      struct logState *p;
      FILE *f;
-@@ -2629,7 +2676,7 @@ static int writeState(const char *stateFilename)
+@@ -2659,7 +2706,7 @@ static int writeState(const char *stateFilename)
          fclose(f);
  
      if (error == 0) {
 -        if (rename(tmpFilename, stateFilename)) {
 +        if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
+             message(MESS_ERROR, "error renaming temp state file %s to %s: %s\n",
+                     tmpFilename, stateFilename, strerror(errno));
              unlink(tmpFilename);
-             error = 1;
-             message(MESS_ERROR, "error renaming temp state file %s to %s\n",
-@@ -2987,7 +3034,7 @@ int main(int argc, const char **argv)
+@@ -3073,7 +3120,7 @@ int main(int argc, const char **argv)
          rc |= rotateLogSet(log, force);
  
      if (!debug)
diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
index 9ba531f815..d7f9a02cc8 100644
--- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
+++ b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
@@ -1,4 +1,4 @@
-From a3fdf3dbdd6ecc0f2550a765dcb9bb274bce8ea8 Mon Sep 17 00:00:00 2001
+From 16c1833ade4c036b30b8761d2c4a5bd85cc65c44 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 8 Jan 2019 06:27:06 +0000
 Subject: [PATCH] Disable the check for different filesystems
@@ -15,10 +15,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 9 deletions(-)
 
 diff --git a/config.c b/config.c
-index f027c7e..026136c 100644
+index d2488f1..1de3745 100644
 --- a/config.c
 +++ b/config.c
-@@ -1873,15 +1873,6 @@ duperror:
+@@ -1902,15 +1902,6 @@ duperror:
                              }
  
                              free(ld);
@@ -28,7 +28,7 @@ index f027c7e..026136c 100644
 -                                message(MESS_ERROR,
 -                                        "%s:%d olddir %s and log file %s "
 -                                        "are on different devices\n", configFile,
--                                        lineNum, newlog->oldDir, newlog->files[i]);
+-                                        lineNum, newlog->oldDir, newlog->files[j]);
 -                                goto error;
 -                            }
                          }
diff --git a/meta/recipes-extended/logrotate/logrotate_3.16.0.bb b/meta/recipes-extended/logrotate/logrotate_3.17.0.bb
similarity index 96%
rename from meta/recipes-extended/logrotate/logrotate_3.16.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.17.0.bb
index 1c9df5a3ca..08001f38e5 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.16.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.17.0.bb
@@ -18,8 +18,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "faf729e0e24bfaafaa677bc6deb46ed8"
-SRC_URI[sha256sum] = "442f6fdf61c349eeae5f76799878b88fe45a11c8863a38b618bac6988f4a7ce5"
+SRC_URI[sha256sum] = "58cc2178ff57faa3c0490181cce041345aeca6cff18dba1c5cd1398bf1c19294"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.27.0


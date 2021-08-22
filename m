Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9608.1629636682282647418
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AjCGV6l7;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u16so21799240wrn.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9U2rs8321GACfIv71rB+TM0pBYft/cHr8pNumod8UA=;
        b=AjCGV6l7ZRuOD0e+rnAjnJ7W0lzp7SMPTwalFkwYAvOZwNlQJRVEmrEXX+fr4Y6Q58
         AoBFMhfZhykPeqh3QIQnGGL+tuP5lWZlf5CRSC3MG1WHOiD9fmt/3VKaZu53Y3WhKl3v
         NVbTDLxHNaPLUODohE3jb8UNxhFmggt/iBfTXv4cy7QYULR5llKumvNr5ywFI307TAuA
         tfkUwSAoiVNI3InX8bdU3uDBS4lqfC5H3Ir+QpXsLT8Xy6BWkEZOBQ1ljTrAXnhOtFFM
         ODpUSJQJ38uCYdaWdZGDFj3MgcjNiySsxPHFJCmvooOghQClpiUUn0yjOx9R/4Cq+lsA
         A9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9U2rs8321GACfIv71rB+TM0pBYft/cHr8pNumod8UA=;
        b=Q6jVr/udnr8BcBDVx5yuekPtqIxM7hOkOVCKg6tqPs0JXoFH78pcD/ZDfS/SM5Umei
         u2IyQB3+/Lj4OGTKLZbQ27yfRu+vJwjCJ0MiAREhYuJbINqME4fvEN/ZYNQTIY0RQk8C
         WHpvEF2zxqaVJhcxSKDgJupmnyYIpBNwPRDUlXB45PL1XHWVw/1QQw2jAk0EpSW2uSr9
         fzEDcR3oB3iXXNJJQNjg8Mqc7JBDud9zYGt6iZneBULzGJ/0dSLM6DjuA7GpANzBh/q+
         O7+cweX6/ACgXd1IzA5d3/pa/0viOAoN4wgFQx4akB5aDGuAAtgcKF78rrJxzsioFRoB
         qSZg==
X-Gm-Message-State: AOAM532re/Cg2PNuYBdQ7KtgaF0OqMPmLSQLmxqtUhGNPqdXt5Gv2yJ7
	FrHDsiM02BYbV1PC/O7VcQfrP8knK5h9QQ==
X-Google-Smtp-Source: ABdhPJyBZjEUzP5ZuY0mFs67KYQNBtqF5GhNoxCtjzJU6XYwxJLSGMvS9V+ij31ojN7VXQ5IihaIpA==
X-Received: by 2002:adf:f747:: with SMTP id z7mr8715559wrp.194.1629636680963;
        Sun, 22 Aug 2021 05:51:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/55] libjitterentropy: update 3.0.2 -> 3.1.0
Date: Sun, 22 Aug 2021 14:50:23 +0200
Message-Id: <20210822125103.310416-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting, files renamed.
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...kefile-restore-build-reproducibility.patch | 27 +++++++++++++++++++
 ...opy_3.0.2.bb => libjitterentropy_3.1.0.bb} | 12 +++++----
 2 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.0.2.bb => libjitterentropy_3.1.0.bb} (71%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
new file mode 100644
index 0000000000..3290ff7b18
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
@@ -0,0 +1,27 @@
+From 905333229103510e9dee2fec29b261ccedb031d0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Aug 2021 19:37:04 +0000
+Subject: [PATCH] Makefile: restore build reproducibility
+
+wildcards result in an unpredictable order, and thus different binary outputs
+in otherwise identical builds.
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/jitterentropy-library/pull/67]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 42932d8..dfb96a8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -36,7 +36,7 @@ LIBMINOR=$(shell cat $(SRCDIR)/jitterentropy-base.c | grep define | grep MINVERS
+ LIBPATCH=$(shell cat $(SRCDIR)/jitterentropy-base.c | grep define | grep PATCHLEVEL | awk '{print $$3}')
+ LIBVERSION := $(LIBMAJOR).$(LIBMINOR).$(LIBPATCH)
+ 
+-C_SRCS := $(wildcard $(SRCDIR)/*.c) 
++C_SRCS := $(sort $(wildcard $(SRCDIR)/*.c))
+ C_OBJS := ${C_SRCS:.c=.o}
+ OBJS := $(C_OBJS)
+ 
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
similarity index 71%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
index 8e39974ef3..de51ed8fc6 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
@@ -5,12 +5,14 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c69090e97c8fd6372d03099c0a5bc382 \
-                    file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
-                    file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
+                    file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
+                    file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
-SRCREV = "a0c51e21c2d4322681a320a22de5e2ef13c08196"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
+           file://0001-Makefile-restore-build-reproducibility.patch \
+           "
+SRCREV = "409828cfccf4b3b07edc40a7840a821ce074e2c3"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.31.1


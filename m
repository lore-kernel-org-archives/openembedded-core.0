Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D20C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4710.1642588896856235879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G5IbDjty;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4942545wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9k6o4GnqPJu3rJdEUpOZQRJGw4dqecqDEQHFf3kjJXc=;
        b=G5IbDjty1ug0HPlqmy/+RGfUiiggGzSolfuE0JI0Vv03fQ37opVKce0joeuv9iUYxO
         4E+mbg/sSPdmPHYLD/MrMBIe/IoZe5coIpep0+kmiVwJ/OTVRtymmmPs3/ysI4mRFjfB
         e0+mvr6miBNAvu/gECePJO1qFFBOsFCvm4LgEdSk98bU/YBRXUbuzMW+We3weBVgnNCA
         VrHFjtTwBAlPq9u93xqi+Qm5VDVtbJzUqnXWn6GZpjmgOxYU13Q7w4SiJkbueno0ABVN
         mBnnAijBpPS9wryCbgor6OYkuMuHZ8spBO7jcp9xw05MlwU0nj16J64a9ksKtWFGbDJ/
         ykHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9k6o4GnqPJu3rJdEUpOZQRJGw4dqecqDEQHFf3kjJXc=;
        b=6h17btfKvfzRE3SKiCj1NvcE7wD8n33hAH9uWGuCD3bsrxHk+HYIyZnz/cjUyKFO5m
         45xuK5Jnz+BYew+uv8W0mejmHoIGIqpciScebdoO6LSLdJtGzySOGjo1gbMkC/kACQxx
         XyEesZkaF4SqbzTesngCvrizcdR10WzprHs7qa0NV6frLgQMhRDPqDPuhj1UCcnLgj17
         qU33JEGTtVV0GdXoMQ3lRq4qI5otYBCqdcPpfPvJWPMS26NVD/bJstTEx9cj3mFKWXVw
         0XK3NFHNIdGa7zYZauxotQcyLwr79JAGSPHDh8eF4yk60+AyVhbXndtOafXIUD/1rcFS
         w44A==
X-Gm-Message-State: AOAM5302XSh0YFUk5RIw7jOVRsY0+CQ6Q1gJcslY3GnJzb5jdNhBKjvz
	GrtBxgn5A36kRITTjCincTobiqKE8z4=
X-Google-Smtp-Source: 
 ABdhPJxVYhRedlTexmKuZ9Dpf2uHqSMRMiGV6fRt3tp/92qdgkga0thnzPNV8nTIGIiljC6JY2ylGA==
X-Received: by 2002:a1c:1d45:: with SMTP id d66mr2943307wmd.24.1642588895420;
        Wed, 19 Jan 2022 02:41:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/39] socat: upgrade 1.7.4.2 -> 1.7.4.3
Date: Wed, 19 Jan 2022 11:40:52 +0100
Message-Id: <20220119104117.2120127-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160705

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch | 35 +++++++++++++++++++
 .../{socat_1.7.4.2.bb => socat_1.7.4.3.bb}    |  5 +--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.2.bb => socat_1.7.4.3.bb} (90%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch b/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
new file mode 100644
index 0000000000..fbfb0816dd
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
@@ -0,0 +1,35 @@
+From d67d6b4f981db9612d808bd723176a1d2996d53a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 17 Jan 2022 13:21:32 +0100
+Subject: [PATCH] configure.ac: check getprotobynumber_r with AC_TRY_LINK
+
+AC_TRY_COMPILE won't error out if the function is altogether absent
+(e.g. on linux musl C library), the test needs to link all the way.
+
+Upstream-Status: Submitted [via email to socat@dest-unreach.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4acc9e..973a7f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
+ # getprotobynumber_r() is not standardized
+ AC_MSG_CHECKING(for getprotobynumber_r() variant)
+ AC_CACHE_VAL(sc_cv_getprotobynumber_r,
+-[AC_TRY_COMPILE([#include <stddef.h>
++[AC_TRY_LINK([#include <stddef.h>
+ #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
+ [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
+- [AC_TRY_COMPILE([#include <stddef.h>
++ [AC_TRY_LINK([#include <stddef.h>
+  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
+  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
+-  [AC_TRY_COMPILE([#include <stddef.h>
++  [AC_TRY_LINK([#include <stddef.h>
+   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
+   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
+ 
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.2.bb b/meta/recipes-connectivity/socat/socat_1.7.4.3.bb
similarity index 90%
rename from meta/recipes-connectivity/socat/socat_1.7.4.2.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.3.bb
index 0edde6a2e4..a4a0a8933e 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.3.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-"
+           file://0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch \
+           "
 
-SRC_URI[sha256sum] = "6690a9f9990457b505097a272bbf2cbf4cc35576176f76646e3524b0e91c1763"
+SRC_URI[sha256sum] = "d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007"
 
 inherit autotools
 
-- 
2.20.1



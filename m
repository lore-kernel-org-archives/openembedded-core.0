Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.11676.1607008150084352231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LIQ+9Xrl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id p21so2217251pjv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CZkSedyFlhzPsg8S6+0bubpZaO1Dt/nx0jy5BCoJ8Rc=;
        b=LIQ+9XrlKNs3B5uIHpM3XgH/wo+5QEvALOO1Z0k6KYgzV/k06fpWVihMTX1H2zp2vN
         GUts11BdrXyHc99Evinw4IEROoD7YFp5VU2S/7Q0I59kEeu85iOL2HV6WQW5OJSPRAIO
         AYLW5His+JzKdvT3MQPWe7dkRxS+ZrKRHLeGMeQ1B5hyN6+BB8aHK99sy+r70rZk/qk1
         kJ0U1Jy0Vz5RWqV4CDkw4THVeWa+wducRwvmqRUYQ9MZldWe8jssO6AorhVYAX6chY03
         4V1HhJ2J7inl5in5mBguMJVicWyLK8z61fvQLMt9973lDrbXNOYwE9V02k46RbS4Aygf
         FTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CZkSedyFlhzPsg8S6+0bubpZaO1Dt/nx0jy5BCoJ8Rc=;
        b=IK1tFc96QSfljKvE06UMVRwjtFNljj8SZn78WY5Z68nAxMcjAyKU6ESuibVCebKPW5
         +M+3TqOt3SwiDeefcQMTeFsee0vO4z2fWv+2lHAp5oIhBkw5qWUttAyu4MkLfFITjPQ6
         LLXTT9gVKj/ULo7AjIE3lzthsbtg3y4vEOWas6VYXr67WkhdBMW2DXjmDB+huo17FZwo
         8uuOK/DE+okc8pxaeR7tAgTWCVFBxx+d7S3iYG72+Xo+MGPMHnu9uuDjyHzKdVl7X92W
         8o+j1FrXo7sewiMNMBsb3Gw74aXkBLHz1+mWkHZ5tKFWeizPfelvZJB+ok70f2MBuLmt
         pXcA==
X-Gm-Message-State: AOAM533D8holn5xu/pNsWbtUuzR9Faq8BBs0U83A/8cRFwyaUbpV8Ar1
	QY+xxZcsFVybBvt28UMssTbBDeIB4cSsC/VQ
X-Google-Smtp-Source: ABdhPJzWZok4rM78t5+FE+ZBBUqCmaELBU0/l6YB8nbFaP1JoPwH2w0vkuwmu38/yKjaRaaum+kZDg==
X-Received: by 2002:a17:90a:788e:: with SMTP id x14mr3488793pjk.139.1607008149144;
        Thu, 03 Dec 2020 07:09:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/28] bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
Date: Thu,  3 Dec 2020 05:08:02 -1000
Message-Id: <7eb41047fceff8e1e3614c5503436a98fd609367.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Jacob Kroon <jacob.kroon@gmail.com>

Since BitBake commit 0d5cdd0c0d65f2f81c3af0f3767fee86c4142c3a
TERM is no longer preserved in the environment by BitBake, so there
should be no need to whitelist it by default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72c4222b095a49d5ba8252abbae5025196519cd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdade79abe..9e6b68b6b6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -875,7 +875,7 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
-    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
+    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
-- 
2.17.1


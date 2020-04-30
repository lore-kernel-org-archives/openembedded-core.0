Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.4100.1588240713718426972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VpntIzlQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id c12so965782wrp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M+WeQREGMY4bhPQE1oegGZ38Cl9vCi3jfiVbI5DLIdI=;
        b=VpntIzlQVdvzsPzLfIU0P3cEE/XbtOW2GLM3MYk10dsDbiN1cH//VnFLuWdLE/H9KI
         37W+0cqBtvAaGOAr8eyw56GEsMKVDY5hES1CbR+VzmH9Yfxat1sC1HBNHWpcRz1jeb3X
         k5I3DyOOu1Vdp5Qi7lUlaxtKSTyYqT4UUXaJI7jzwelFkvBpF6gUVk6WtmU4ALpUVgqz
         8qMQ70j2+DiG9+stG2Nmp6nIR7q7q8mG7k+bO9KQkMuqVUgpPpXFpkWZD0DN5UC9dJNI
         p7JtAnkFZ2ymhcG+tL9MwIwSJaFFJPR/i6SgJQRA8FkskvjQGZz9KCO2LrndE3JgdJfq
         dprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+WeQREGMY4bhPQE1oegGZ38Cl9vCi3jfiVbI5DLIdI=;
        b=ugcuKNAyQiOukgDtH1/WrvPA0PQqQB/b254J6Uv6kruNKDb7lfTco96OJYZf9xegV0
         l2Mn53yYwR8icc73ogsS6Du6gTJm/eeQ5+sy9oMqy5Ldci84Jxt8d7xIFrjQzjUXbsu2
         77OIVrGfQz+HI6xJ8M/RXFTw3PPvC2XPCxPe/eYMFTWH8mEiPuAD36KITV0LHel7gFBp
         3KQUevBk5dl8cArNUDajsTP46Ly1bd2Jd6qsNBqC9nGbQgBLExwugUnl+C4mFtRzZO44
         C3vXS0DMrKYk9PE0iyQ6uc5OOMzaVDaK8EnjOdRSiOFBU6a18rzQbKNEUQsl9ZsHvDry
         3dmQ==
X-Gm-Message-State: AGi0PuZbEk1DxQCK8mN6FtdNSOqfmxb1m12Zt+0FpyPgyLhJlaUqVrjP
	+1G0XUsZz+Yt3bG4FMR68mUUvRi7
X-Google-Smtp-Source: APiQypIdXHLTZa5dzNS2Y7B/+gy+7t0KrdBX2fmGWBZOcxzoUxGznafqTO/IP33VIugmfRhRxLVnCA==
X-Received: by 2002:a05:6000:1044:: with SMTP id c4mr3169484wrx.57.1588240712035;
        Thu, 30 Apr 2020 02:58:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/17] rt-tests: further exclusion of development versions
Date: Thu, 30 Apr 2020 11:58:02 +0200
Message-Id: <20200430095815.2824-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 3ac39d90c3..6e3afafce4 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -3,8 +3,8 @@ SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-# 1.2 to 1.5 seem to be development versions
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-6])(\d+(\.\d+)+))"
+# 1.2 and up seem to be development versions
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-8])(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.1


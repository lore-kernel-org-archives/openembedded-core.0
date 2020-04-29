Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4547.1588176716863132937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YcRvdULS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id 18so1282125pfx.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T8LeKPiMrkr9M1rHA7WvJ702Jg7RnigwJY1zigD4rrw=;
        b=YcRvdULSQnc0aR8GRGJdKwYGjGv8XWYwhTV+dxrCIrL03xC8eSYJdIE9vHJD9H/Po/
         hedhgSL0bdI0UIoRQiFIN6w9U0Zdhbi9jAFKimBqFnD4M4NLV4tRxaiggCOaXjlF/xJU
         SAymrKLMnkA/g3NrsCAHZnA3KS8KvFpyO1J0tnJeZgZfPUg4m7666FIlYGTt9FlYXN6O
         HZu30mZu7WlGbgx62sPRlEBlxqt2ZSG8EQx73c2dPo4yb0SQTsHnnjBZxt5rYisIHn2O
         1/v00jloOEHI8LblS6uNTdCmB7SeqlYaQQGs7EghIYgDtcx3t/Sn/e5xui5bOr9/O6yI
         5QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T8LeKPiMrkr9M1rHA7WvJ702Jg7RnigwJY1zigD4rrw=;
        b=U8saDTL0tOo5WmrGz+TDHvFcTwD14KgYBunrCsiV9KajxWM2pZxP8/FCLjC8w75GW8
         r2uryAXQPpkh2mwfC9D3sRZTvAghrFZWUhracYKafLyY/BYMh3hK6AY4cd86AtFhI/qv
         wEGoKmGYLfid0PooslCxc51sM8stgzFQiZ7wZYc0Dn3brFBxAgrtVP3pUpxKcYk25vvJ
         bFg1FxAFcso03TRbOgtZ96pslrFZragzHLHOpVQBjm7hdS1Wb48F3FCtCqj/+3Lgf7Fz
         /x6U2J2DQW/ZvX1KWCFzmZvtn2X6R4IcuQFNX3t0ds2P06BVpTnrY6ur+v+2s78nr84G
         xYyA==
X-Gm-Message-State: AGi0PuYBLXPtHhPhS6GxqXkMJ3YXENONkMnD/s9SVL+iGCqBd4CKz/r7
	h3TOOgVz9GFFAnpVMvWI0opUOo12/aiXzQ==
X-Google-Smtp-Source: APiQypI8vaH/q4RoO4asijYTjqC0aTpEQeDCXlXhrH3KWw9WDbG5EkhBeOeFsd3GeUFklevgM/VpGQ==
X-Received: by 2002:a63:fb14:: with SMTP id o20mr33584833pgh.144.1588176715982;
        Wed, 29 Apr 2020 09:11:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] python3-manifest.json: add pathlib to core
Date: Wed, 29 Apr 2020 06:10:57 -1000
Message-Id: <b67148a0bb8ecaccf5a6dd7116128d85c2e4983e.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

The pathlib module is for Object-oriented filesystem paths

It also provides a lot of handy utilities for checking on
paths. This seems to justify adding it to the core package
along side os, sys, and the other *path libraries.

[YOCTO #13670]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 251271cb84..3bcc9b8662 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -285,6 +285,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/os.py",
+	    "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -358,6 +359,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
+	    "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
-- 
2.17.1


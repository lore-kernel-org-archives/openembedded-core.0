Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.430.1588286190820332698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ALhbYe6r;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id i16so2944844ils.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T8LeKPiMrkr9M1rHA7WvJ702Jg7RnigwJY1zigD4rrw=;
        b=ALhbYe6raZUDwQzfGpGjtjSfVHTbN+heWr+DqJVZYNOj6ij5JvSVaZWGPHxmKR8IrC
         KLiugRH1cwhpyWKcvkoX+CyefK9Uh1C5uatj6IrPlQnnMOYoMxPvsj2Q8dqQegyoRHg/
         wysuWPjoeG5m41XAA7chxpQRzfeg0APIFRc/HPRhJQrILXSYRZA+CyEt2sH8ghfI+GHl
         cWE6AHUNGIDrwKVbDMHt4Q8LHlt1B6nNJKVRAWwwzsW9Ah/YsSEgC1qOlMSl2Edr9nfq
         fWTXEBy0AyLo3kBstYPSGm8l+h+Pkn+gFLC8Dfo6LEWXYvHw7ylyyXwWaGNKHypuZlv+
         C40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T8LeKPiMrkr9M1rHA7WvJ702Jg7RnigwJY1zigD4rrw=;
        b=TpH8K28Q00+i9p/5y8oX5Fq9AWsA7NIJQxHdllAoFHUIlFepNHlHNdShe/EcoVfXrL
         6ZEjEH6vEymkscrqvdpz6jtQoO/3ViGFgtLiZXffEswVYPwHBRaKkZf7Ib4MEsqp7fcm
         q6qmPRciNiWYLKtagS3Wl5tm20dqBM9nCmCnXeBBolmHKcDNoMUrFM+FkXNH4SE9c3S5
         CjQ2JMbfcZTLoDwQnockK0j9df6/GnPBsxIRefUqJzRAnJkZOE12zNTFL6a8ZJi8ZxUA
         Evmz1MaedUzmefUU0USx8y+7liIcdrIJazLOo13kmY2Zz9xhFNLOyCDMfBHfrCxHGpt4
         ST1g==
X-Gm-Message-State: AGi0PuYS1GNzDGprE5t3kgyWIWYkvHlSPhE7cImF/WnuiFAvH0dBCd2J
	SRXS0aQuC47JOuCFpWzJAXVcdQoPq6wshg==
X-Google-Smtp-Source: APiQypKbCQuOznnjc9+HQiTJZkKZIc+QdgVjQLgXkYUHI6xokYwLOgWI4YjE8/V39ZCeVowys8vg9Q==
X-Received: by 2002:a63:f30a:: with SMTP id l10mr1215518pgh.372.1588285874533;
        Thu, 30 Apr 2020 15:31:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 11/14] python3-manifest.json: add pathlib to core
Date: Thu, 30 Apr 2020 12:30:16 -1000
Message-Id: <81bec2f08229723b550a0cc33d1c77f82432814d.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

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


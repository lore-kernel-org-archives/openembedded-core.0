Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web12.8364.1590074604265762235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 08:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=usLtziAV;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id c20so7464819ilk.6
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=U6yOHNWEGbhqdt1V747XyF7bi5FUFR69AvDx4CYfr80=;
        b=usLtziAVdL8AJXc8kA2L7CNjpwl8zFq4hp2S6raVN6BUB5M8hCeWEgrujHj2NLs2U+
         1/lLNXKUY6BZz5JtydWWdr3WcWQ+9RIZ8I1V48aGFLiaxEy/un25RD/FjKahUU77Hc/K
         ka0g3EZDeMfPvTSTQQ7VKkgKKhkrRC/FWDHcqktdotugoYUifIWEbuzvbIcqoyHru9s8
         Jll0v2aZPv5SOXFpWVj5ipcAspLU5PRebGRoBfYwo3tsv4oL9zteZ8oh5dGn7cZ9XeVf
         z32DRf7Nx7E59MaW+Jru9l9p106eEOHNznuUQOBFtf/04L/oMUSWgyNJzmKsINQyW2Ps
         ldZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U6yOHNWEGbhqdt1V747XyF7bi5FUFR69AvDx4CYfr80=;
        b=I8frfzo+DOErGdzIeNy7VCHjq976olhbatZ6mcodXD+F4eZ+uNIPi//v9EnyXqYUPJ
         2ipB3k0STAbKW0vPIci+FQsnu6GHbho+XORR18WGXWePb8WLMHL+6CVnr/oIVY25JiB/
         i/3O9/vVDs00ayz+N1hgmHKhnACNsFy/gdFodb/1QGtrs7JX8xzFZkcNkalXX6ZfpolL
         tauEdgmbUpPBPeN4wst8DgyCoAQkxG2sWHKx1C/Vg71g027Jij//aIFSqApjK0rb7gmF
         RyPrY3Y0a1IGCKWG2NiBzfMERpujQcA+Xw3UQNVZGhTzpJxOj9QG6wirRdEVSKMphDEr
         jEGA==
X-Gm-Message-State: AOAM530MJt9C1vbCbBdhfgaAdx0M6WJQI/XGamA1MD4sIi85XQYxX+4l
	zQHlA/I7eab9mmqZkWB7d7WZClEQhNo=
X-Google-Smtp-Source: ABdhPJwryY7LcYD/s0qkcawsgpTl6pm+RDTDQdn1vS+RVy8Y/Qd/+87uguz/y1C2oEL+pzzfiqRa6g==
X-Received: by 2002:a92:d087:: with SMTP id h7mr9606749ilh.227.1590074603382;
        Thu, 21 May 2020 08:23:23 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id v25sm1506645ioh.11.2020.05.21.08.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:23:22 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3-magic: upgrade 0.4.15 -> 0.4.18
Date: Thu, 21 May 2020 10:23:20 -0500
Message-Id: <20200521152320.25175-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../{python3-magic_0.4.15.bb => python3-magic_0.4.18.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.15.bb => python3-magic_0.4.18.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.15.bb b/meta/recipes-devtools/python/python3-magic_0.4.18.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-magic_0.4.15.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.18.bb
index 698016ba4c..be423adacd 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.15.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.18.bb
@@ -11,8 +11,8 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "e384c95a47218f66c6501cd6dd45ff59"
-SRC_URI[sha256sum] = "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"
+SRC_URI[md5sum] = "5edc6caa39cc62641850f6b1b6f284ba"
+SRC_URI[sha256sum] = "b757db2a5289ea3f1ced9e60f072965243ea43a2221430048fd8cacab17be0ce"
 
 RDEPENDS_${PN} += "file"
 
-- 
2.17.1


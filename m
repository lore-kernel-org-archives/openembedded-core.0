Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.14935.1602253166257520791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XCccox52;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id y14so7259440pgf.12
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bPyyT57zFi7mto7WYLN/HpIubFlRGFN8s/7HmvsC9E0=;
        b=XCccox52D3e6nG8Qay84SZguiXYC6P+/hCPALSd2n7Grs5TEHRrBQEZFVYo6H7y607
         vYP5rIPdZPQNaP/Xge9sV5r1VO/038SO5Y+FYIZatT3niEOWQ5SgadVWataPJsEdujy9
         vvOZfEtaFYo4RkA8i2et42DoZk4DsG4nHTB3buL6Car+Ama67di2HDgNHp/R9lHFovrF
         ufSrhuxobktiy0AgCxfDHJ6UjCFj/XcNrfcciJesCFLh6CwEYfSVLy7yvxZ82/qvMmP4
         rvv9JcK2voiOu8mTZ/K623anjzKeGWyH+r4pDv7W0aUBSOy0Bgiz+tDphMdgrUvG3lM5
         4JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bPyyT57zFi7mto7WYLN/HpIubFlRGFN8s/7HmvsC9E0=;
        b=ReQz75tQML5pFiKx6ZRDy0gi3MkmsXXF1UQUa92SNVGAm+S2TIrr9Zu3lFmhrkeyAl
         a8RprwbRdvbeqET5Ndtl+Zpn9ZIMgoZmMj+y3k7Oca+Yi9O66sSAmAhTWuRic+md9xn9
         nIi+afjVZyl2NPxoNXqOukm0Jt+Tzd2Nfgt19iJsA/zRjpRlEC888+oYSThGroAFcaAt
         jeXqAzGwVJB+31CZLhQ0F3rt3tarAEfRI1gl7iQqFrFKwg935TAkGOwtQwwBDnEsgq8c
         pNAhZBMTqPB3hpKx5gBtum1cyXcVaBAfHgbuK40SnQxnRUf7ej1yGKr/xlrdls3MIV/i
         uwTw==
X-Gm-Message-State: AOAM531FHepk2dbKEyWr6QabF+Zo1/GsWguc+lKEhFDdTZAZBlBChD2f
	YUxrdKAjxmWh2zop710n2u0cliOlZUtJ/U8b
X-Google-Smtp-Source: ABdhPJy3c+CASZkDvrbEK3iy53QFFrUsS+vKEXxMaVRe/ZytBCaiW+v9F6c4L2Cg+tVD6N7V19/zvQ==
X-Received: by 2002:a62:503:0:b029:13e:d13d:a0f9 with SMTP id 3-20020a6205030000b029013ed13da0f9mr12463341pff.21.1602253165389;
        Fri, 09 Oct 2020 07:19:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] classes/sanity: Bump minimum python version to 3.5
Date: Fri,  9 Oct 2020 04:18:43 -1000
Message-Id: <346f0efdecdab81504d181092204e89e85835d4f.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Bumps the minimum python version to 3.5 to match bitbake and the test
matrix

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df13c0f2348898023fb7ee1b229e9b5ccc893609)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5ddde9cc9c..1486cce357 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -769,8 +769,8 @@ def check_sanity_everybuild(status, d):
 
     # Check the Python version, we now have a minimum of Python 3.4
     import sys
-    if sys.hexversion < 0x03040000:
-        status.addresult('The system requires at least Python 3.4 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x030500F0:
+        status.addresult('The system requires at least Python 3.5 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     from distutils.version import LooseVersion
-- 
2.17.1


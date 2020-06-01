Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.37930.1591020721532344520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=067NUCTA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id t7so2707120pgt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BHhHeFO9Z1hWty2MStuJaItf+t8tSvltPPw2PD05BsU=;
        b=067NUCTAFjvwjprmz+GlUt+94FHIaaOGpLZYJ1P+BZykoLUspXqQWlUMflq6W+ZMet
         O4mvjZqVt3W0Kc/znFNmEAkicm6grMQdYr6P5uxXdHe/eBI27b7D3ZVLce4VzQfjPpf6
         87vsdXatFD2J/6s0Vb5VdYd2cmUOMQqqQlDenE5h5vrLVv3YkgGp23T0yB4h6bkQELlW
         xa7w8rA/sMHAgX/sH7eue1HgoxsqDjFUdsV4Y2jr0tWeU+uFQOkee68F5j57ysvvWLEW
         a6Z3B7qKrNGhS7XWY+wdJcx/CkXI0PrXUhhgrTMv3pwLiJ0NxkcyNxA3I9OJhXvC5mAs
         eVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BHhHeFO9Z1hWty2MStuJaItf+t8tSvltPPw2PD05BsU=;
        b=YjGhkxVbJyoYiMy9+XBsJBmAXmBL0q7GhmXzqLReEJ9rlMbCI6ty9pWqLKFZElbVOD
         jevLSWRCwFX+DrRWRiin31DX8nN85eJXxuTL9W+sbhnXVEhSaJlnIcsWpRY/bbU2eWSO
         6dJK1VgljFydjOWYt+FrzevVbDEOUDdWzS1Zsda4j9zr+jl/WtcusgCdsMf0PkdCzzF6
         QNutGMm+hux6ceM930taGN/zGVErGgLfOyQyEceC0rWWHptCDoQQGT3k7cnJ+w8Gx00h
         PDoLqCm/GpcMh4iKAWpBZW3sPhtX1v6DhEdO55pxKFVteXec2TCoopl4zopJHWCjeMjK
         i+zQ==
X-Gm-Message-State: AOAM530VxX2gxB8IsHUqDDND4wJpMtJ8SP2Z2ACaa3+OCu3Va9hly1wh
	eg2woQNRqiY8YKyZzmji02BRVhjWPMY=
X-Google-Smtp-Source: ABdhPJwV8CJsAvbbTyaRs31Yy2ElmKzMXIdlSY02J3u5/DYwdtbDWTEqSYe2+rBOXMlukOt508A02A==
X-Received: by 2002:a63:3ec4:: with SMTP id l187mr19406822pga.358.1591020720620;
        Mon, 01 Jun 2020 07:12:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] resulttool/report: Remove leftover debugging
Date: Mon,  1 Jun 2020 04:11:14 -1000
Message-Id: <10d1d2ffa0906561d65886caee44652242139913.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I've long since wondered why there was some odd output in result reports,
remove the leftover debug which was causing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66e96bf70753933714ff8edcc13a1f35a052656f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/report.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 7ceceac802..f0ca50ebe2 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -96,7 +96,6 @@ class ResultsTextReport(object):
         if 'ltpresult.sections' in result and suite not in result['ltpresult.sections']:
             try:
                 _, suite, suite1, test = k.split(".", 3)
-                print("split2: %s %s %s" % (suite, suite1, test))
                 if suite + "." + suite1 in result['ltpresult.sections']:
                     suite = suite + "." + suite1
             except ValueError:
-- 
2.17.1


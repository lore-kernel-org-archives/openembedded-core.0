Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5346.1605279162383058613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wnYtaNcI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id f18so7238996pgi.8
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8pU07i8DgfCuTurRVfScRN7UvtmE1TQ7w42op26GKTQ=;
        b=wnYtaNcIR/LlRdNXRXCv4wXvh6HVcfjVFzjPmts2epbXXGkXXuVigedp0jMXrcTQLF
         bEnQLwBg4o2J02NPHEUusZorg9yCk1kQ6Hcuqk6gY4/07B/XB5GktE/haMqUjEdAP8QV
         T9xbyMHSFt/BiulmhiX+U50YUAe46/S0MA1YjR0OugAIDyUZfsEsY7iJjKxhfg+Dvr7N
         VlLr3hyslx8MzgsXeqAbTx1GGynn8eDuQbsSX3b4JgOIJq9FH99+ewxhQ94P41TCvGJK
         96pV915gsNJEtk+SMJtPpTX9HCXfqPQX8PA747EGwnUaQTXHQjl7nANzPIFNEV6P9Qdf
         yiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8pU07i8DgfCuTurRVfScRN7UvtmE1TQ7w42op26GKTQ=;
        b=FjaROFNlKNjdn335BsmJ33oTtAYiyT/c1sQWfvAPoyAxABd3QmODkZj/Fy8IISV63P
         7+zfn4ZCthmG6gZnchyhbnjUdZ5cehWlex9xqRSFIClXAtC1ZPQLSUMbncsCXQVYfKNe
         7MPX6OiLyb+T5KkyC6fpUkpu3oOsOLxaiX2RCNxeMhaIc3Sa5Vt8/RBrVhHZCs//bG/j
         Kz4sPy4+OTVHSIry944S50k+jEVKh6bcWIVDngdOUxJTyrDhbFOZMsfPGbkX0jIUNzW/
         sysZcHvCEn/TiJFMNVramP0jJsUb1i9oxF56tifR/IVi5AhH3gAOI1nHI6JFQGkNMCsv
         Ueug==
X-Gm-Message-State: AOAM531GZWL+1WMZbkeEpRIOfdov5SAe1opXUIOfTpD/7anthMje2Jfq
	ejuUBaiqeXitPeC6TahsVJ+xnI2kng5fVMu6
X-Google-Smtp-Source: ABdhPJzGv4OLhd4ng7KSHR53aebAgDuqyzui7D7CAnYRWLGh4IjgCAoHa7mFIATV9hkIGnnfXflshA==
X-Received: by 2002:aa7:8a01:0:b029:18c:a1fa:8599 with SMTP id m1-20020aa78a010000b029018ca1fa8599mr2551654pfa.12.1605279161419;
        Fri, 13 Nov 2020 06:52:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/18] ptest-runner: Fix license as it contains 'or later' clause
Date: Fri, 13 Nov 2020 04:52:06 -1000
Message-Id: <c0d1eb1efad160b7832abd87a168ca547c296d94.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f0b5cdfcb104ac50222a47652e090ad8770e49f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
index 187f22df04..3a0dbf84fd 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
@@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
 runs them in sequence."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
-- 
2.17.1


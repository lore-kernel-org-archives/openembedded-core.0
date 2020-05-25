Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.40867.1590446270123760447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f8WraaqP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id z15so4160038pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sU7DSS7m7M1ioI/mJ0iSymxsOhRPmJXbpJt/eLsOYHM=;
        b=f8WraaqPqT8h7WMd+AwnEe2zmSBDarqfmGqUpq/cEZDjC89m2/Bp/8yIicscWUBReh
         Vq6Xyk6zX5bgvN+2f/MhO+LdYET9Aa2Y3DtP5G7EfTPs9BvFd57SeHqAV7PgENqF3J4m
         YWUAn0Pn09xqfYExF/MA37DdXvI2HBx1qrhysrw+WWp6PPqt7xR4y3jxoOPlrVXC1xPw
         SQJoV7cdyky77kKnx02yrxWqgm97dr1rwQgEYxoZqICG3VTa6gWp4F+aq6+ZYHzr4c4y
         sAxtoLSIlJRA4IySgT8B5i/qpJJa94FinJcWb8lSwokfdpRFyRcWa+VqviXrO98BRZVR
         LPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sU7DSS7m7M1ioI/mJ0iSymxsOhRPmJXbpJt/eLsOYHM=;
        b=lhjSKoJ454a+husIAgXRyZerfQVwRV1WnmvKS7gaUQgVzvidQ+C7vzN+4dTtnoVvpP
         xA4hT5YPhAIS3+LGVBX6T8wvFTVycRdpPWrxrJqOGNVq63RdQKULTHoCcj9rf9kUyoY0
         40Nx0rtGCHGCnqiHg2IiX+Y121GOGfPMPAu/+Ma+NqbgoiVy6HsiJ4DvSf+GNLHJr1LD
         OFUePd8LGpT9U5azHGzqdOGGY6vgXyWOiAzWMLyvsiIjzIji87qJ07AKs7rsFcr5+0XY
         rQbK3XpVR3hM7kALLj7P2Gr/lW2FTDCAVXLeND/iSmfL8eJGfqe51VoJsOcasRq7OXPt
         6YMw==
X-Gm-Message-State: AOAM532HL4fhSj4HkOOJ6yuSvy5xGISerVmFajf2Jo2ykdBd3T8POouh
	ng8PxudEIYuLbW3wU7kzsaauQ8bAwno=
X-Google-Smtp-Source: ABdhPJwSYwkZWHb3f8U4vP1uK0P6ZWDYvYBm6RA6ICJzM8E1RJ0SIL8RYjm1y27OGK4tVZDZ1wIc6g==
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr7088378plr.182.1590446269170;
        Mon, 25 May 2020 15:37:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] testresults.json: add duration of the tests as well
Date: Mon, 25 May 2020 12:36:58 -1000
Message-Id: <866c652c850d9e23300218fcbe0b9e4b3ade2ebf.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is printed by testimage, but isn't actually saved.
It's a useful metric for tracking execution times.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fc19639f47b959a141dae231395bbababa644e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/runner.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 1284295c34..00b7d0bb12 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -182,8 +182,10 @@ class OETestResult(_TestResult):
             (status, log) = self._getTestResultDetails(case)
 
             t = ""
+            duration = 0
             if case.id() in self.starttime and case.id() in self.endtime:
-                t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
+                duration = self.endtime[case.id()] - self.starttime[case.id()]
+                t = " (" + "{0:.2f}".format(duration) + "s)"
 
             if status not in logs:
                 logs[status] = []
@@ -191,6 +193,8 @@ class OETestResult(_TestResult):
             report = {'status': status}
             if log:
                 report['log'] = log
+            if duration:
+                report['duration'] = duration
             if dump_streams and case.id() in self.logged_output:
                 (stdout, stderr) = self.logged_output[case.id()]
                 report['stdout'] = stdout
-- 
2.17.1


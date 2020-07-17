Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.12780.1594996755552787113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s1TeTVQs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id u5so5477148pfn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=S95zPo9kIFQ4YDkinKJx6PVHw18DhwiBU7xuz1IToBE=;
        b=s1TeTVQshf9zoTLkj8jxK0dJjyxxYdU+VoEsTwDCqNUBSSLqqZMxnovU9mTOkW1BGS
         OASZOwaoWxnzfX9sPRF+M6VY4FIlB4jCoofqzORVGRIUmVjjIVgVuwq6EcrcKlyDKdTU
         YtZW6nL2oO2Os2y6ZUzvBLJVVnmlbcAsODbFQul5fw0ZNQuX5Fshs4SD5WBdq0f831s1
         ADM1Jf3BSstrPlaT3m69dbbDvlHChQcZLNORzrBOIx9HHYoBi2H+R3pT0NFH9Hx9AUUq
         LQRHrLUTg/J2X3EXSvpMhV8+vsLYnJ49lSa3GzfiueJaoz2UEpbJCc5Gxk/t8X6fX34F
         2Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=S95zPo9kIFQ4YDkinKJx6PVHw18DhwiBU7xuz1IToBE=;
        b=m4zww0QKTMIss92Z1PKtV4H0Wf+Ke7vwmZWcX469yna0a/11+EXPzo74VF+PB/IiX1
         317liKNukXxmyLQvv+usU+cWms7ZwwbAlTz2w2BeU4KAJRuj4GSqqnHO7z9tZ/xS1HNm
         D+5vW8AjUfVX32ClH+ma9HVWY+YKIeBdduk52AJZgPymSHFlU2x5AbOj0yWsXfb2Zs+V
         3qiN00uGx6CLQOWavX2BdqQlMfCQFIDCU4i1f3Mp0AIfPy8gedojhW5vcIPxF3UvD/Ut
         NcDsKQqeQweBUkNeH6M/qTRlOD5M6NbMvRriT86r+02ZaqlVEG7C3+kkKdElgZ7dnLz3
         wQFw==
X-Gm-Message-State: AOAM532LqBW9n2qs1Tw6alzw+9rvPYeUKFUVBhDGLF/5H6SYhPv/vOrV
	+sZwmowkjJAbwi214fdanCmW5pe6kD8=
X-Google-Smtp-Source: ABdhPJwIgWnfSjYfGW4sZQYGWAPciQr4RiAsScTBr2Czs/efxB6uojrXdE9r3A+f5s3w4pQSFh57cg==
X-Received: by 2002:a63:84c3:: with SMTP id k186mr8605702pgd.394.1594996754627;
        Fri, 17 Jul 2020 07:39:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/20] oeqa/utils/qemurunner: Fix missing pid file tracebacks
Date: Fri, 17 Jul 2020 04:37:25 -1000
Message-Id: <9e23163016b7a8fea0dbfe2111f9493017e5a7b2.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

One element of the error message guarded against None as a value
but I missed the other, fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbce6baec68d7658453b8c44159e1d1fef746151)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 41c6bb33d6..01cbf52b8b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -261,7 +261,7 @@ class QemuRunner:
                     qemu_pid = f.read().strip()
 
             self.logger.error("Status information, poll status: %s, pidfile exists: %s, pidfile contents %s, proc pid exists %s"
-                % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + qemu_pid)))
+                % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
 
             # Dump all processes to help us to figure out what is going on...
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
-- 
2.17.1


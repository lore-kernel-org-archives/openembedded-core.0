Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.6490.1601503970466214242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QXUvLrA2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id gm14so689002pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GH4oH2+3Srz+qjRLVkijVqDt9GsKCb+UD+6sX4I7+I8=;
        b=QXUvLrA2AR/U0mwakcGU3KEcq5L7UHP0uMC+mX35NnDuXdJ9tvRynyy0w3Kc/Ar7Ar
         qRK1/WERrklV0c8IknK7dog3TXdH/s502Dl9b5gXb8wVnIcR2i1rgImQtWwnKzDIDrN3
         sv5Xvhqq9KTb6Yy+4coDGv2pyDio44eiiNPTUBKdPqQj1JJpqUyBv8WvHx6qaJlN4w/F
         DPwqawb9oMBecCjXWVSjTCmmF0Us6lTXFbB2mm2szoVdj0ukB78t0Ze9h5+0zTA8WVqJ
         3CmkgZljOb65UU20On1N25a1coKOL4lLdZM06wSAFdlxwE13Tlh+RJHtO8Zyhxntgszy
         py/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GH4oH2+3Srz+qjRLVkijVqDt9GsKCb+UD+6sX4I7+I8=;
        b=PSS/Ao14N8wvTTB/Jvn10ezHZtcdBtV8bW/WuHLcU0sy7XnNUcEuyASpmu8s0LdIcK
         lMGjwCEzGtw1c03+OvwAr4s3fz3Hj2eb2AqOGxnKoRoRRkWkJZv2to339Gqs430G+3Eg
         ILZs3wJkKiR7vDZTuym+lfMIcrQeaqylcGU52IZMHwNUqygBHv19cOMFmXsCbQKK9Gpl
         9nwT3AiFFHuZGhwtr1suMIGKYcLww6kGEETZpZEoTreR55gq4zIXGXjR+O8dZ4cPcvQa
         IFMLmIEOQbs7HIK1XhSsnC0STzzYX+2safTR7TAKbb5u3lI805LgEK1lhbcy6fRnFYv0
         Hrtg==
X-Gm-Message-State: AOAM530FwskCPTMIHHpLBkkX1u5cOGqoeGnXSYKaR0PG0rwB+QVhKnJq
	TsNVCaRZzMTYRDfShpuoQYfLUsHTWikwQvFWxd8=
X-Google-Smtp-Source: ABdhPJzF+PCap7jxipo5giLpg79dK21E0l4Fpii/yaQ6F63eNRaIf5yhbfuLB6Ab+ZrwKi7UWRXpyA==
X-Received: by 2002:a17:90a:ab0b:: with SMTP id m11mr4464621pjq.197.1601503969365;
        Wed, 30 Sep 2020 15:12:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/41] packagegroups: remove strace and lttng-tools for rv32/musl
Date: Wed, 30 Sep 2020 12:11:21 -1000
Message-Id: <d5173d1fb27d9ed050aa278ed83b28a757248f0d.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

These tools are not yet ported to rv32/musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf963ef65d524256c2d00e0588cd3b8b7ef56ff4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../packagegroups/packagegroup-core-tools-debug.bb           | 5 ++++-
 .../packagegroups/packagegroup-core-tools-profile.bb         | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 81fbdf4608..283c1f1a35 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -13,9 +13,12 @@ PR = "r3"
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
+STRACE = "strace"
+STRACE_riscv32_libc-musl = ""
+
 RDEPENDS_${PN} = "\
     gdb \
     gdbserver \
-    strace \
     ${MTRACE} \
+    ${STRACE} \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index ac180b542a..9fd2569a04 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -41,6 +41,7 @@ LTTNGUST_arc = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_arc = ""
+LTTNGTOOLS_riscv32_libc-musl = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
-- 
2.17.1


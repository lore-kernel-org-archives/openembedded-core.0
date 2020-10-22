Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.757.1603382008437488907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QSyizv2j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 144so1396458pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ujoChN+C8QivH7kux9ss4CMMmY05lxw5fqtMk7rGvIw=;
        b=QSyizv2j6G2JjhyKlfrcN314E0QpMScQjwV3IEPKZjyJ839mbvIes/VZHcNHpQS3Vh
         0yupVTK4ma0xWBS6C3BCwVhMPTffzz6fhZQ56fCcdxDA5NclqztR0c2NqrgRx54pgYgA
         S2du22bQqQKWobaVMGHrFauB8pdclRXxou550o+ikN+n0B5vjR31dhwbhOR1PbHxjRGH
         mRQnWm9xs0EuhlD9WxHWkunwDmlJO1L5gHg54y+ooJ45QvyouPhqni+hsXPiS28f7SQc
         VJL5w+PBmiOauuepYp3Ca7ubIWXABnRSodAxgL2JxT3Fcl6bD7bGcEk2zPEe4z3uAcQR
         8L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ujoChN+C8QivH7kux9ss4CMMmY05lxw5fqtMk7rGvIw=;
        b=Z7gxOGJkprjk8sSS5wK3FKdIqt/QKs0+5ubJiGiSxmIBovskfiSV46slqNS8MXjOqb
         xajV7hJzNnPuDr5EWdj/F90d6t3sYcozIo8IklSsMBHf9dh5miC3rNbufJ2G480xZM1+
         VueH3LrDpzsaYjB+aldhBAv33qUilCtWYwWHQqN9hewMa6ZCDUgPuiRJPeghxRATGLES
         yMtNYG2uTGXF2RhkOphpfi1ESyhWR4TOt71KuF//9zhCtp0liaa3nI6mKFc+eP+OqNGC
         fEKoBjFFwnk3jWNt7IrN33de4jmjvNZxnBriKz6J/C4SzJy0wNMu6LE/m/3BImlcO1Qq
         39qg==
X-Gm-Message-State: AOAM533cC39TnBNjlENPqsIHbMgYlkEx5+3DMp+2LrGklm80B7WrfiNL
	402qcEsTXGp5ySFmhkPYio2wTEuU5QkM8Lfl
X-Google-Smtp-Source: ABdhPJySHdaW17xUxSfn5l8RpA4omGo7cs7DRMvXQbA2ipOt+CfVh2h6nbqkGiHwvQAFKDGpYidMsw==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr2890658pgh.344.1603382007537;
        Thu, 22 Oct 2020 08:53:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] packagegroup-core-tools-debug: Disable for rv32/glibc as well
Date: Thu, 22 Oct 2020 05:51:46 -1000
Message-Id: <83787094dfecc1696fe9c23a5daaebc5a010e12b.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

strace for rv32 is not yet ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bec777887e7eed9a12b08231a612aaf19b622614)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/packagegroups/packagegroup-core-tools-debug.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 283c1f1a35..542a02057c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -14,7 +14,7 @@ MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
 STRACE = "strace"
-STRACE_riscv32_libc-musl = ""
+STRACE_riscv32 = ""
 
 RDEPENDS_${PN} = "\
     gdb \
-- 
2.17.1


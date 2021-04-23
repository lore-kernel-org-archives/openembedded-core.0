Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.10194.1619186411803533787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jxJ6bQ3O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso1227928pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L+No3jxz2CczKmM0h0KdEmtXtvUhhKhvX64PGQBcSQ8=;
        b=jxJ6bQ3OFE2JsyhebNrfM2CW0XkczJQDg0pr4gZo3d5MXnMQTA/d0Eas+NNmILK3a9
         9YhPwsbdspD7JRAeHjGJ9ImoRDttCJ1xOfjqjDLd9Zh16JHvDH5zkVp8LaJu8vQMWB/V
         1MkJ/RWSVaTUriOk9+Wr0H6IZMf1ZfMgm5r0X5tx6FgNQH5L+amYn24cXI8+Fx+fkkXr
         Fk4TSlsyNb0MiGXFlSMPBeT+mVA30jliW2EN6kWfduXAZrCLhij0kzaUkIwCWCsHpfEt
         kTbUlOWyE4WhSF/8K7Qf63g34CllgWlrciZwT2lwD8Y4gYPFDGfn3lyLqFXw3PBpx291
         frrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+No3jxz2CczKmM0h0KdEmtXtvUhhKhvX64PGQBcSQ8=;
        b=bPFmaVRuTp287TijriA9zt7mrJctrmvCpGu15jJZSOyn8/SbuO2xbLK0dtR3/IaPs0
         cxhKGt+txo3t+8z33Z6GjgyY1cEIG3MX0E5djeFR1qQsUtLPxZ+f+QhCNY1Cxz3U2hHJ
         VHqyNuZ7cLH3R0UpqMcDtbQxQfe9LU6kWb+ONdToGmPvVFR0Nc/kxpvRtYjjDPjQSIev
         +VBEAUpADHkFhL4ZVRPbWI95mwycRiBBU6991aK0wLYNHu+NF08e4fU4Z7z9Cq1c+tsw
         AiRzmiQ2Lg12n0j4IVNs1IehRh1o6ZGrdFvafaM1vRdurPsbnLS4L4JnrCr7OhDRAawD
         155A==
X-Gm-Message-State: AOAM532E3VDXCLEjeSfLdtwThN+LLfGJV8rj2iAgsQVfowjzitNL+6S7
	9/v+c3b6lHoDyhG7JzqBbhBaFJof+gfxtXTCQMs=
X-Google-Smtp-Source: ABdhPJyx6ZpvFn3AUyMhBtbxiljOZQ5VRdoBkb3FGJlh7s719zHD74Jlk4JsHkWgYSQ7i2oE4B+5/g==
X-Received: by 2002:a17:90a:5295:: with SMTP id w21mr4570098pjh.94.1619186410772;
        Fri, 23 Apr 2021 07:00:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/19] insane: clean up some more warning messages
Date: Fri, 23 Apr 2021 03:58:48 -1000
Message-Id: <4acbb63105b241f537414d0ab6d09b269cf8202b.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2abe18682192e7b38b9af5a5043906f2f069648f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 09e8fbd8e4..eb19425652 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -174,7 +174,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
+                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -183,8 +183,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
 def package_qa_check_dev_elf(path, name, d, elf, messages):
@@ -194,8 +194,8 @@ def package_qa_check_dev_elf(path, name, d, elf, messages):
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package contains non-symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
@@ -208,7 +208,7 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+                 (name, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[mime] = "package_qa_check_mime"
 def package_qa_check_mime(path, name, d, elf, messages):
-- 
2.25.1


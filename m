Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6485.1601503967791156971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cvMVAMnI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k13so2364997pfg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rrbkNg0ohhEVrKqBgzRghq9X/03yg+VJQR2v88TwYGA=;
        b=cvMVAMnIrL3Jguolu+0ncYrTpPjTqHBkJp2WU6pKcnl+NaJqzWC0sFpacC38bBzOfg
         AQH4vxu9Nvl6vJvrJPppekfvbAvPjNIhzRvJNDwlVQS/jOizIMo808ZvrFRteru2EhZU
         8fTabePQTFwCQyz6WSx+9nh+Tv0kzJm2Q0EqxVAqJZMvv4Y+giYVr9aXziK0bfJFPmEx
         nGTt+4LY48aM+75zR9wpdTCLV5p6XS34cmT/uyOaGzUTxVVFPOngm+pKl7CwKSAp33Ip
         oYDq2iiIeIYo/PD08xPePePwhYouwQdtBl9gGUlcYUnuIGCZjj0rr7CKRQ859RNi+5/P
         yTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rrbkNg0ohhEVrKqBgzRghq9X/03yg+VJQR2v88TwYGA=;
        b=KNX7IkSNw9cN8xRTAKZdLmkoi7yfWDwHtaDQE/BQRUmm5ZbMbh1lX59n7aJIdW1R4C
         h2XGcL0v/8BzAtMpz/2tCixV05sniExT+UvLjk9UT1YP8B+ioSlFRQkxHK570HGy4D7I
         BvkTIYsmSZNz+ZjoGF4J+54Hb2EakjtUIZIIA2QMbutYu7d3xb2Ttb0TDcTHmjx+mJSK
         pBUWn6uAGpBigTha5KIrx3MkfQGfJgUZ8thn0dD1yUTGIeTt9BtFgTZ6mJWNwIs6fluZ
         YXPcbjnmkANTP+E/QzrU7iwbP91LZ3/UWhzJPviMPD3vKVPBHMTrotroYh7ZFP9ylyIU
         Mibg==
X-Gm-Message-State: AOAM531sE+9lZOhxlS8rAEchh1c+NwkmXHRn4xDEbmkgdMCijbbH/RYg
	DylG+g3e82O6FcLtSINfYYCMHJvlSJ+dcqqUXWs=
X-Google-Smtp-Source: ABdhPJy2M0y8TwrVFhCusFONTsUqn5Jwf5/70IfpAWoZniy2wHB5tW16TjwckQKcaIvbI0y1QWy6nQ==
X-Received: by 2002:a17:902:bf4b:b029:d1:e5e7:bddd with SMTP id u11-20020a170902bf4bb02900d1e5e7bdddmr4257322pls.61.1601503966427;
        Wed, 30 Sep 2020 15:12:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/41] testexport: rename create_tarball method
Date: Wed, 30 Sep 2020 12:11:20 -1000
Message-Id: <fa240a4d8ede066980cec70f479548d5df502ded.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

as otherwise when using it in combination with archiver.bbclass we would
have 2 methods of the same name but with different signatures
leading to various hard to understand exceptions

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce0c1cb2fc67881d2edcbe269ea934917ccfb48a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testexport.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 59cbaefbf9..1b0fb44a4a 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -137,7 +137,7 @@ def copy_needed_files(d, tc):
                 shutil.rmtree(os.path.join(subdir, dir))
 
     # Create tar file for common parts of testexport
-    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
+    testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
     package_extraction(d, tc.suites)
@@ -146,7 +146,7 @@ def copy_needed_files(d, tc):
         export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
-        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
+        testexport_create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
 
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED") == "1":
@@ -159,11 +159,11 @@ def copy_needed_files(d, tc):
         shutil.copy2(tarball_path, export_sdk_dir)
 
         # Create tar file for the sdk
-        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH"), export_sdk_dir)
+        testexport_create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH"), export_sdk_dir)
 
     bb.plain("Exported tests to: %s" % export_path)
 
-def create_tarball(d, tar_name, src_dir):
+def testexport_create_tarball(d, tar_name, src_dir):
 
     import tarfile
 
-- 
2.17.1


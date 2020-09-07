Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.1761.1599498174438373982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uUI2/1L0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id q4so788815pjh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0JkMOGRKBdI5bA6CQscu0HT+g62xfOljvlEHb8uaOLg=;
        b=uUI2/1L0wRnoTRKRRbIzUcyi5n3Iw9mS1szOjCTKZQ+ugypGN1t5DGOw1wHWl84ulc
         O49yPv7GdT9wiZbB6H4TW628Iau9Sef04fJ4L2EeMBM3K2Q8LSI8oLb9SaKHE4X8gNWL
         rw2/L6d13Mtnnza1KFMK4oZ52PNUvjunhu2hOgJpzKTbOso1pybnWTo7sxxGBj8fjoxt
         qXnn1GhSBwavrT1i9IlyevHtp3/XnpYBZGkkfjdoZqVvQG4voDRWNDUcr/OhimmlNt9x
         mlBVGxG6Bf7JFGKigt9HsYQNiFTbOoE15ZOBKhJ0+kWtSqbMrBqoa1Edpac/iTDVMygu
         VgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0JkMOGRKBdI5bA6CQscu0HT+g62xfOljvlEHb8uaOLg=;
        b=o0bygMYxduxcK8ZxexGCxV3BbE+DU2r1TXbSTb6sMVvN+wPEpY+5dP6ZDnWxYAC/6R
         WOJNOKfEPl3mgSiBGhgzBc27udrnyaAFkm0ovr5kUQ+//0wB3SG5jKDGHZ/6OSUVNz8F
         Y67h0TnQ+knhKd762vPQFpiqQVw28ezIMVNG9Dc8Oy1Wo7/NqUIiSTLSPmtN/fu9UMKW
         3JmB9w8Fbdfe2tmOek073PouppTgz55vJdaPD++jnFVbh+g9gokBhFC2figANMztRfDs
         XK0NoUbHeclctzU5+m6p5WZbKDL0pM4nuKOmsW0R+Y7+OAquKf2Ul1+wG1Ta3DN5L4q5
         q5iQ==
X-Gm-Message-State: AOAM533DWs42/r4e7vUMxdbhUOr0nj/aM9EUR11En7kB+ALYk2e5bwtT
	uHeRVw+74XUgqJOdz76AzxHRj20r8b7mF5Dt
X-Google-Smtp-Source: ABdhPJznjt8q5uHTbhcrSLbr1moqCJoD5gWeUVd3pidE0wrkGefARbtOMsnWeteMFKXubFrgISTehw==
X-Received: by 2002:a17:902:221:: with SMTP id 30mr20153645plc.222.1599498173491;
        Mon, 07 Sep 2020 10:02:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/18] oeqa: sdk: Capture stderr output
Date: Mon,  7 Sep 2020 07:02:10 -1000
Message-Id: <cf6cab12ca7ff40ac484cdaf27ea91ed49b901b0.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Redirect stderr to stdout when running subcommands while doing the SDK
tests. The tests will show stdout when CalledProcessError is raised,
but any output to stderr was lost.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7cb4e9ab8c1596281060e94a216966060103956e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/case.py                  | 2 +-
 meta/lib/oeqa/sdk/cases/assimp.py          | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py      | 2 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index ebb03af9eb..c45882689c 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -26,7 +26,7 @@ class OESDKTestCase(OETestCase):
                 return tarball
 
         tarball = os.path.join(workdir, archive)
-        subprocess.check_output(["wget", "-O", tarball, url])
+        subprocess.check_output(["wget", "-O", tarball, url], stderr=subprocess.STDOUT)
         return tarball
 
     def check_elf(self, path, target_os=None, target_arch=None):
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index f26b17f2e9..f166758e49 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -30,7 +30,7 @@ class BuildAssimp(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 902e93f623..681d0e750d 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -24,7 +24,7 @@ class BuildCpioTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 4211955f8d..385f8ccca8 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -28,7 +28,7 @@ class EpoxyTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index bbaa5c55c9..4d85adcaf1 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -31,7 +31,7 @@ class GalculatorTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 515acd2891..49ae756bf3 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -20,7 +20,7 @@ class BuildLzipTest(OESDKTestCase):
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-- 
2.17.1


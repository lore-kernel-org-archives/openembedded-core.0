Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F8CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17689.1754643014055437676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1JKO1nN;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23fc5aedaf0so13100635ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643013; x=1755247813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiTrGtb8GFkMb6sdBHFmR4RyTh6P85DiX0RqQYPUKbY=;
        b=I1JKO1nNtF5y2pQgdbflBgs2EcKMVQ09H8KgIpLcd8XKaLXHRYocD0S6AJW8W+8qGk
         JKND97bSKhjzKJU8fep+wrzz+4NTecUQEF6K1+rWfdqxct50Sg3uk/NGaLE9FiiEiY4c
         UAxW9yaJNPcnOPmWGRSP9xJxSJiOgezDq5+8P0s7sRfIzQl+SEC9FyRuJdugK3YIEYw4
         nwMHjhp4s0jryglzqKzbGNf9tcAym+t94tlTohUvVwi6V0XKhQUaMMT7tsJXjpcmt3Cx
         GJtAmzZbuvBUK8pp2tE5VLe0+/th04x1q/3irIZjE/YheBarCyN2TZ0grWm0u4OyvlBh
         pyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643013; x=1755247813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiTrGtb8GFkMb6sdBHFmR4RyTh6P85DiX0RqQYPUKbY=;
        b=JlxJrx1Gtoc5HBdZ9SEE98w8N8lYGepRHlbHd9UICZ2IfdB3H7CvFsMF6N8mB5Fneu
         Nw9gfrWNPxG4yiNTn1VhhpI3QRxdPPV21fZdYf6zYz0tQYDU8Xz2Un0925ZX8m+JMGro
         MD5hbQbw47fqu5V4E3ZA5qsAkaXxXQ1r7eLJYdgeIRo/B62jXW8U3elyjjKaF3Zz5yJh
         r0IRl3iA2lx47vp1y3176C9J131FfOEete/GbMCES8WkWyHcyPRKqMMrazwmgaMMMe7d
         4yZPsBpl9cH7tv4fhyVYP++wICrnwqybh0O9K82HSEHkrTdmEyr23+l9mVcQtr4sJ/vF
         qFHg==
X-Gm-Message-State: AOJu0YwxL41z0TExqWikh/geXKN5lrpmUgtw22gYHW3Ic5D4lyazQGms
	C7of4Cna1NyPO3Ad3yxQlmlxAgo8EkKyMZSgv2StUERKfhIEycPXF+r8gFz0Eg==
X-Gm-Gg: ASbGncvzaRmEOtYz4LJau/smx+ccwCDRDkS5YF09r7Q6uWWHg76i06DS4ML2oIRCVCk
	YgJnuX3RzKZzes9935oNyilNcVe2wzLbuk5NaF003Zqy1JQ2qZ5T7Z0g8os53CX9hgU382mudnW
	PmF9/tBlNM7k+SrCwm/mjPZwLRr2GC2qLak2U8B4ewrZYRdK5OW+lyyolnzLtU0lu3wB88H6Vsq
	XPm8JHuXju0qSUGi9ObZJqY7MXwPska9Ios2eFWpBS4OnEVfL+UX8pp5E6MIkzH9QWNlYoWTFbi
	p7oWNo5PMln+Rkwd9hHsd61nqQROM2/AZqROvkLMuixLvU2HjMsjQlFPcwnrub+RGGC1r4qXo36
	vJfNGvFO8KcCsQ09j7LnlWi6ufrFpbrClelmbaQ==
X-Google-Smtp-Source: AGHT+IFaFBifrUo8T3Uv3v+ONvco1IGwhGuO+qAy+qRHuc0Cl/dUSF67LUijiMhjnHJHHYEt95N9tw==
X-Received: by 2002:a17:903:1b30:b0:240:79ef:ae80 with SMTP id d9443c01a7336-242c1ff40d5mr33404445ad.8.1754643013090;
        Fri, 08 Aug 2025 01:50:13 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:12 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 13/23] bitbake: tests/fetch: Move commonly used imports to top
Date: Fri,  8 Aug 2025 14:19:21 +0530
Message-Id: <20250808084931.2156763-13-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221610

From: Philip Lorenz <philip.lorenz@bmw.de>

Avoid multiple import statements for anything that is used more than
once. Additionally, drop no longer used imports.

(Bitbake rev: 7c74310440f4d6ec47cf5bacf597e18308b3bb20)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62c4daafcef2c920607868a0629b9bda59b61951)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/tests/fetch.py | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 2d0bd29799..14480d2d65 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -7,7 +7,9 @@
 #
 
 import contextlib
+import shutil
 import unittest
+import urllib.parse
 import hashlib
 import tempfile
 import collections
@@ -1250,7 +1252,6 @@ class FetcherNetworkTest(FetcherTest):
 
 class SVNTest(FetcherTest):
     def skipIfNoSvn():
-        import shutil
         if not shutil.which("svn"):
             return unittest.skip("svn not installed,  tests being skipped")
 
@@ -1373,7 +1374,6 @@ class TrustedNetworksTest(FetcherTest):
         self.assertFalse(bb.fetch.trusted_network(self.d, url))
 
 class URLHandle(unittest.TestCase):
-
     datatable = {
        "http://www.google.com/index.html" : ('http', 'www.google.com', '/index.html', '', '', {}),
        "cvs://anoncvs@cvs.handhelds.org/cvs;module=familiar/dist/ipkg" : ('cvs', 'cvs.handhelds.org', '/cvs', 'anoncvs', '', {'module': 'familiar/dist/ipkg'}),
@@ -2253,7 +2253,6 @@ class GitShallowTest(FetcherTest):
 
 class GitLfsTest(FetcherTest):
     def skipIfNoGitLFS():
-        import shutil
         if not shutil.which('git-lfs'):
             return unittest.skip('git-lfs not installed')
         return lambda f: f
@@ -2373,8 +2372,6 @@ class GitLfsTest(FetcherTest):
 
     @skipIfNoGitLFS()
     def test_lfs_enabled(self):
-        import shutil
-
         uri = 'git://%s;protocol=file;lfs=1;branch=master' % self.srcdir
         self.d.setVar('SRC_URI', uri)
 
@@ -2385,8 +2382,6 @@ class GitLfsTest(FetcherTest):
 
     @skipIfNoGitLFS()
     def test_lfs_disabled(self):
-        import shutil
-
         uri = 'git://%s;protocol=file;lfs=0;branch=master' % self.srcdir
         self.d.setVar('SRC_URI', uri)
 
@@ -2396,8 +2391,6 @@ class GitLfsTest(FetcherTest):
         fetcher.unpack(self.d.getVar('WORKDIR'))
 
     def test_lfs_enabled_not_installed(self):
-        import shutil
-
         uri = 'git://%s;protocol=file;lfs=1;branch=master' % self.srcdir
         self.d.setVar('SRC_URI', uri)
 
@@ -2418,8 +2411,6 @@ class GitLfsTest(FetcherTest):
             ud.method._find_git_lfs = old_find_git_lfs
 
     def test_lfs_disabled_not_installed(self):
-        import shutil
-
         uri = 'git://%s;protocol=file;lfs=0;branch=master' % self.srcdir
         self.d.setVar('SRC_URI', uri)
 
@@ -2593,7 +2584,6 @@ class CrateTest(FetcherTest):
 
 class NPMTest(FetcherTest):
     def skipIfNoNpm():
-        import shutil
         if not shutil.which('npm'):
             return unittest.skip('npm not installed')
         return lambda f: f
@@ -3272,7 +3262,6 @@ class FetchPremirroronlyNetworkTest(FetcherTest):
         self.d.setVar("PREMIRRORS", self.recipe_url + " " + "file://{}".format(self.mirrordir) + " \n")
 
     def make_git_repo(self):
-        import shutil
         self.mirrorname = "git2_git.yoctoproject.org.fstests.tar.gz"
         os.makedirs(self.clonedir)
         self.git("clone --bare --shallow-since=\"01.01.2013\" {}".format(self.recipe_url), self.clonedir)
@@ -3301,7 +3290,6 @@ class FetchPremirroronlyMercurialTest(FetcherTest):
         the test covers also basic hg:// clone (see fetch_and_create_tarball
     """
     def skipIfNoHg():
-        import shutil
         if not shutil.which('hg'):
             return unittest.skip('Mercurial not installed')
         return lambda f: f
@@ -3357,7 +3345,6 @@ class FetchPremirroronlyBrokenTarball(FetcherTest):
             targz.write("This is not tar.gz file!")
 
     def test_mirror_broken_download(self):
-        import sys
         self.d.setVar("SRCREV", "0"*40)
         fetcher = bb.fetch.Fetch([self.recipe_url], self.d)
         with self.assertRaises(bb.fetch2.FetchError), self.assertLogs() as logs:
-- 
2.25.1



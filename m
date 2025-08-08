Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0E8CA0EC1
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.17686.1754643005805613109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhQLZyEo;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76bf3dafaa5so2969814b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643005; x=1755247805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S4/nMDbpKsHyrer8rYv5NE5Ste4bP4b8delBGYI+o4=;
        b=DhQLZyEo0XDaBQE3kaDhQvn3O5/IOF5ZWTin6fGeGWfgWEMvzsns9JHmdojacACvsZ
         vM+jbzxCljhj44Y/hkLYyT+bu4ywFbv/6qcrJHG55uQfw55i/YOg8MNbERJwL7SVACFL
         8OS4ZxgK1oS7WYjc0Pu5UoZCQDtfvAUQE25yoq6ibwYsPvErdodx0cj48U4HWFUSw07M
         vbjfQCKQRDu/89iaYUNjW5HdC3kp9huw8q3x6+3NulcG1JDvK0CQ34K7AWr95cHFqXo2
         IhyFOz1habEj2ymdNqU5IavVGd88IP+zjQz67tiWCs7o50kC8NdJkePGqvnvCV/x7s9t
         PzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643005; x=1755247805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S4/nMDbpKsHyrer8rYv5NE5Ste4bP4b8delBGYI+o4=;
        b=DaC4cTacoBDBBGHPdsud88ExsL7HkiByFAQyQ9sEV0QdIEg0OqThCtSbrZP9SYkJoP
         +VGEor9TEohD5vNKZmPZrWoMM/ZYWQjvTa7J0FQLDrkFesrzQVU7TLxMbEBMsePDW4EL
         nw1Lajcknn1eKW9ZQqGMrgF6O+R/4fuUXaVwThCIjJUsH4viBrx5IxVCp0JQuJhzsSJx
         IHMQNTOKnIqbytKQz7Rv0pS4Waqm2FOEwBbrKhtmDctnQRcYkDso1zaxFax/qfZkC/R4
         E3iOFVkiV5uvkvCRPl2WsoTrBBD/LZjNNWG86VKpL83E79B4ORgOnyR2Lq3Z0rwbGlB4
         08Cg==
X-Gm-Message-State: AOJu0YyvPxTSUlU8zEZCHTmyT/v14Vr1DsSRIoJsb8jI4mB9tqseD0ox
	cxu9qhInQ7+++yod4ZTET5ytml2hqsCCG1sxhltWSD3WWhaVHiynqRty4C+yig==
X-Gm-Gg: ASbGncvxwvFbQ1rbdh694DqSjkXZObk0pc/7gN0YxxJJ8Lk3cfrQLdEMhr4aXW64aY6
	T0lYafTes+Cy70AD5v1qIXJKdVUjG7m2HCAeVb6Zk+nyEqq1DcIExw6kTcjwyBINFd/5rcqQzYs
	PF3Fn7iheKwluhrsbcJIPruWhM7tYpSnTFaAV/mVMdVixCuW/e/y6dIqMuVz8cTP4XI2ZgpJZ4d
	TAjdLBLl8g0aYpK5gtii0lcE4gi0ihGTrQ+rAlwsobIaGhGaRyPuhGQG/JXdX9TmcuQRybjBnYS
	GHIfZS5ECQdi79n4eCGae7lRZW4cwc7H69UqRjeNYbfEmZKkLqciw1J5nvz748DFsH0U/N+gy+u
	I6u/DArkT8sEDdJef/08s0UwWew8m9bUY
X-Google-Smtp-Source: AGHT+IGi+eN0taqq0mPgmEXA+O36f1Pdr/HDRjBJTvCBgVwgx2dRuEANYNEUf9X8Ys4w0q3vT4yq6Q==
X-Received: by 2002:a17:903:187:b0:240:8381:45b9 with SMTP id d9443c01a7336-242c2afb941mr37249075ad.8.1754643004605;
        Fri, 08 Aug 2025 01:50:04 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:04 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Koch <stefan-koch@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 10/23] bitbake: tests/fetch: Adapt test cases for fast shallow fetches
Date: Fri,  8 Aug 2025 14:19:18 +0530
Message-Id: <20250808084931.2156763-10-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221607

From: Stefan Koch <stefan-koch@siemens.com>

- Address the absence of an initial full bare clone
- Utilize the initial shallow clone
- Modify existing test cases for this behavior
- Remove incompatible test cases

(Bitbake rev: 599fedacd7782dcb52825c22200f35344c102548)

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db267f2c94ec86e4a7c046c49d3a2260760ccbfa)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/tests/fetch.py | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index eed92ad6ea..ea91d20d1f 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -1763,7 +1763,6 @@ class GitShallowTest(FetcherTest):
     def fetch_shallow(self, uri=None, disabled=False, keepclone=False):
         """Fetch a uri, generating a shallow tarball, then unpack using it"""
         fetcher, ud = self.fetch_and_unpack(uri)
-        assert os.path.exists(ud.clonedir), 'Git clone in DLDIR (%s) does not exist for uri %s' % (ud.clonedir, uri)
 
         # Confirm that the unpacked repo is unshallow
         if not disabled:
@@ -1771,9 +1770,10 @@ class GitShallowTest(FetcherTest):
 
         # fetch and unpack, from the shallow tarball
         bb.utils.remove(self.gitdir, recurse=True)
-        bb.process.run('chmod u+w -R "%s"' % ud.clonedir)
-        bb.utils.remove(ud.clonedir, recurse=True)
-        bb.utils.remove(ud.clonedir.replace('gitsource', 'gitsubmodule'), recurse=True)
+        if os.path.exists(ud.clonedir):
+            bb.process.run('chmod u+w -R "%s"' % ud.clonedir)
+            bb.utils.remove(ud.clonedir, recurse=True)
+            bb.utils.remove(ud.clonedir.replace('gitsource', 'gitsubmodule'), recurse=True)
 
         # confirm that the unpacked repo is used when no git clone or git
         # mirror tarball is available
@@ -1856,7 +1856,12 @@ class GitShallowTest(FetcherTest):
         self.add_empty_file('c')
         self.assertRevCount(3, cwd=self.srcdir)
 
+        # Clone without tarball
+        self.d.setVar('BB_GIT_SHALLOW', '0')
+        fetcher, ud = self.fetch()
+
         # Clone and generate mirror tarball
+        self.d.setVar('BB_GIT_SHALLOW', '1')
         fetcher, ud = self.fetch()
 
         # Ensure we have a current mirror tarball, but an out of date clone
@@ -1868,6 +1873,7 @@ class GitShallowTest(FetcherTest):
         fetcher, ud = self.fetch()
         fetcher.unpack(self.d.getVar('WORKDIR'))
         self.assertRevCount(1)
+        assert os.path.exists(os.path.join(self.d.getVar('WORKDIR'), 'git', 'c'))
 
     def test_shallow_single_branch_no_merge(self):
         self.add_empty_file('a')
@@ -2065,11 +2071,12 @@ class GitShallowTest(FetcherTest):
         self.add_empty_file('b')
 
         # Fetch once to generate the shallow tarball
+        self.d.setVar('BB_GIT_SHALLOW', '0')
         fetcher, ud = self.fetch()
-        assert os.path.exists(os.path.join(self.dldir, ud.mirrortarballs[0]))
 
         # Fetch and unpack with both the clonedir and shallow tarball available
         bb.utils.remove(self.gitdir, recurse=True)
+        self.d.setVar('BB_GIT_SHALLOW', '1')
         fetcher, ud = self.fetch_and_unpack()
 
         # The unpacked tree should *not* be shallow
@@ -2244,20 +2251,6 @@ class GitShallowTest(FetcherTest):
         self.assertIn("No up to date source found", context.exception.msg)
         self.assertIn("clone directory not available or not up to date", context.exception.msg)
 
-    @skipIfNoNetwork()
-    def test_that_unpack_does_work_when_using_git_shallow_tarball_but_tarball_is_not_available(self):
-        self.d.setVar('SRCREV', 'e5939ff608b95cdd4d0ab0e1935781ab9a276ac0')
-        self.d.setVar('BB_GIT_SHALLOW', '1')
-        self.d.setVar('BB_GENERATE_SHALLOW_TARBALLS', '1')
-        fetcher = bb.fetch.Fetch(["git://git.yoctoproject.org/fstests;branch=master;protocol=https"], self.d)
-        fetcher.download()
-
-        bb.utils.remove(self.dldir + "/*.tar.gz")
-        fetcher.unpack(self.unpackdir)
-
-        dir = os.listdir(self.unpackdir + "/git/")
-        self.assertIn("fstests.doap", dir)
-
 class GitLfsTest(FetcherTest):
     def skipIfNoGitLFS():
         import shutil
-- 
2.25.1



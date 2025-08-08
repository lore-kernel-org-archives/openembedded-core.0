Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A78DC87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.17951.1754643030723984579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RD1lW44z;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2402774851fso17240375ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643030; x=1755247830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mju10L1DzfvHYtVqUH/MpwVBjl+k6reslyfZ5tqzU5A=;
        b=RD1lW44zQVTwwvzBrfnw8Xety6T9YktqcuAUFH8Hfnmb48SiNfQ5HqW3CSnlebqsIF
         QLKbhRBmii1svehDg8OMrGQ95AOrmCB/ZiUpSTG6KSckGXyfNu1vKoYx1azLKONSTGjI
         bMxkwk/T5V7VK5KTmBQe/yn/6upbVbzuTZ99fiyEmr4Kf7FpbrWc77CVXKFALcXFfrAq
         aFPYfpCFEc24CnsW+xrrQd0K8Twi/rlM1p6lMnHP5G3a+Gbw5o4SsmjlNB91kMexORd3
         JHM9S2pVxMyEfxGXnDG6J9k7Kix9Dlf1RD8GZJEUg2CXfoaDUjBdHoKQBpu+70SjbJdn
         SkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643030; x=1755247830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mju10L1DzfvHYtVqUH/MpwVBjl+k6reslyfZ5tqzU5A=;
        b=jxoGRPbJgTpgW2KYHnG4/qHtWSS2XQM0fFvEu+fJzB2JKHLnHD3dILK7S0VTBONBN0
         n4A7LzPpsBYXcUGgjiuR84hzP//k4DGRbtiQQqmfTCTnCaJ+slSW/Hl3BQwcBfHaTVz5
         /ny8QQiGeulhHcygSlDd+ymegymgrvD782Ozp3CxVxyw7xhbHdlquF6UGmhFfGgy0EIa
         kdGM+qgxOSbCqr7/pP5IOUcbi8GqxZiuM7FTVssgzOKTUK+KEbpQU7osTfWWGLswWMzS
         Wnd6X/aEDCppKrGZzrUm/MQWcu292xI4MrQvVuxMxbHmt8Pv9HkqZCTHsEm8ljQDxhF+
         XFNg==
X-Gm-Message-State: AOJu0YzTMIjVS/S3PqlwSrGrlPOfNMRdxJVgbfm/cDmXs/y5bM9eGM3t
	kccNHoAr/eH4sIbzKdt+gn5/v673yJ2j8HT9yk8mCL8Gj+6NiDnarXA8GbRupQ==
X-Gm-Gg: ASbGncvNON71E+Q8v3EJgrOE6EXQ5kpZlXjzJPfhupsfWzKogEhcZKGF88DBG0LkJhx
	2xfBwOcUuLR/3NMZHxG7l/9qvYvtIg+diEza/gMMd/OpxmHbhvw7cq0AJy/N/8vH7gOxBZXgTDb
	dAWmHJ4e3p2C04jLssLwzE9kJ9gzQNp4yXR5TbULTg/TH+P/Gsq/oPbAmeWDRtBWAAbRmCPBlrB
	m/Hatonhd39D3m4Tvr5AtLZPKo0Ty68HKSF3q2xENeIyowUBHgi4UpWItIyr8gqzMm/bXcOf1zW
	x2DK3xZQkLBBJTfzY9JqHbc/5d4eAt7Q2WE0MdXbvdskpfOVLTvF70BFCrmopmFwL9k7veYHBUH
	qk7zESzxr6qv/IrY0tVdj3ymkpZPxiV3m
X-Google-Smtp-Source: AGHT+IHQMnkpEIqgXusRVHL43DimxdCB8yevc/uLlz5nuQYX13rveBlpB/642UThxRltdvd7V8gZwQ==
X-Received: by 2002:a17:903:98f:b0:23f:f96f:9de7 with SMTP id d9443c01a7336-242c22fa800mr35051855ad.51.1754643029672;
        Fri, 08 Aug 2025 01:50:29 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:29 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 19/23] bitbake: tests/fetch: Test gitsm with LFS
Date: Fri,  8 Aug 2025 14:19:27 +0530
Message-Id: <20250808084931.2156763-19-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221616

From: Philip Lorenz <philip.lorenz@bmw.de>

Add a test case to verify that the gitsm fetcher properly handles
repositories storing objects with LFS.

The test case verifies that LFS objects are fetched on the initial clone
but also ensures that consecutive updates extend the original clone with
any newly referenced LFS objects.

(Bitbake rev: 2a8722ddd155596862029f6ea34e1e92c77e0b7f)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7331c399252c8b365e51290c8eba3d2f6aa6fa1)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/tests/fetch.py | 122 +++++++++++++++++++++++++++++++---
 1 file changed, 111 insertions(+), 11 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 5e76988570..6ca4745f8f 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -20,6 +20,7 @@ import tarfile
 from bb.fetch2 import URI
 from bb.fetch2 import FetchMethod
 import bb
+import bb.utils
 from bb.tests.support.httpserver import HTTPService
 
 def skipIfNoNetwork():
@@ -27,6 +28,18 @@ def skipIfNoNetwork():
         return unittest.skip("network test")
     return lambda f: f
 
+
+@contextlib.contextmanager
+def hide_directory(directory):
+    """Hide the given directory and restore it after the context is left"""
+    temp_name = directory + ".bak"
+    os.rename(directory, temp_name)
+    try:
+        yield
+    finally:
+        os.rename(temp_name, directory)
+
+
 class TestTimeout(Exception):
     # Indicate to pytest that this is not a test suite
     __test__ = False
@@ -2308,26 +2321,113 @@ class GitLfsTest(FetcherTest):
         unpacked_lfs_file = os.path.join(self.d.getVar('WORKDIR'), 'git', "Cat_poster_1.jpg")
         return unpacked_lfs_file
 
+    @skipIfNoGitLFS()
+    def test_gitsm_lfs(self):
+        """Test that the gitsm fetcher caches objects stored via LFS"""
+        self.git(["lfs", "install", "--local"], cwd=self.srcdir)
+
+        def fetch_and_verify(revision, filename, content):
+            self.d.setVar('SRCREV', revision)
+            fetcher, ud = self.fetch()
+
+            with hide_directory(submoduledir), hide_directory(self.srcdir):
+                workdir = self.d.getVar('WORKDIR')
+                fetcher.unpack(workdir)
+
+                with open(os.path.join(workdir, "git", filename)) as f:
+                    self.assertEqual(f.read(), content)
+
+        # Create the git repository that will later be used as a submodule
+        submoduledir = self.tempdir + "/submodule"
+        bb.utils.mkdirhier(submoduledir)
+        self.git_init(submoduledir)
+        self.git(["lfs", "install", "--local"], cwd=submoduledir)
+        self.commit_file('.gitattributes', '*.mp3 filter=lfs -text', cwd=submoduledir)
+
+        submodule_commit_1 = self.commit_file("a.mp3", "submodule version 1", cwd=submoduledir)
+        _ = self.commit_file("a.mp3", "submodule version 2", cwd=submoduledir)
+
+        # Add the submodule to the repository at its current HEAD revision
+        self.git(["-c", "protocol.file.allow=always", "submodule", "add", submoduledir, "submodule"],
+                 cwd=self.srcdir)
+        base_commit_1 = self.commit()
+
+        # Let the submodule point at a different revision
+        self.git(["checkout", submodule_commit_1], self.srcdir + "/submodule")
+        self.git(["add", "submodule"], cwd=self.srcdir)
+        base_commit_2 = self.commit()
+
+        # Add a LFS file to the repository
+        base_commit_3 = self.commit_file("a.mp3", "version 1")
+        # Update the added LFS file
+        base_commit_4 = self.commit_file("a.mp3", "version 2")
+
+        self.d.setVar('SRC_URI', "gitsm://%s;protocol=file;lfs=1;branch=master" % self.srcdir)
+
+        # Verify that LFS objects referenced from submodules are fetched and checked out
+        fetch_and_verify(base_commit_1, "submodule/a.mp3", "submodule version 2")
+        # Verify that the repository inside the download cache of a submodile is extended with any
+        # additional LFS objects needed when checking out a different revision.
+        fetch_and_verify(base_commit_2, "submodule/a.mp3", "submodule version 1")
+        # Verify that LFS objects referenced from the base repository are fetched and checked out
+        fetch_and_verify(base_commit_3, "a.mp3", "version 1")
+        # Verify that the cached repository is extended with any additional LFS objects required
+        # when checking out a different revision.
+        fetch_and_verify(base_commit_4, "a.mp3", "version 2")
+
+    @skipIfNoGitLFS()
+    def test_gitsm_lfs_disabled(self):
+        """Test that the gitsm fetcher does not use LFS when explicitly disabled"""
+        self.git(["lfs", "install", "--local"], cwd=self.srcdir)
+
+        def fetch_and_verify(revision, filename, content):
+            self.d.setVar('SRCREV', revision)
+            fetcher, ud = self.fetch()
+
+            with hide_directory(submoduledir), hide_directory(self.srcdir):
+                workdir = self.d.getVar('WORKDIR')
+                fetcher.unpack(workdir)
+
+                with open(os.path.join(workdir, "git", filename)) as f:
+                    # Assume that LFS did not perform smudging when the expected content is
+                    # missing.
+                    self.assertNotEqual(f.read(), content)
+
+        # Create the git repository that will later be used as a submodule
+        submoduledir = self.tempdir + "/submodule"
+        bb.utils.mkdirhier(submoduledir)
+        self.git_init(submoduledir)
+        self.git(["lfs", "install", "--local"], cwd=submoduledir)
+        self.commit_file('.gitattributes', '*.mp3 filter=lfs -text', cwd=submoduledir)
+
+        submodule_commit_1 = self.commit_file("a.mp3", "submodule version 1", cwd=submoduledir)
+
+        # Add the submodule to the repository at its current HEAD revision
+        self.git(["-c", "protocol.file.allow=always", "submodule", "add", submoduledir, "submodule"],
+                 cwd=self.srcdir)
+        base_commit_1 = self.commit()
+
+        # Add a LFS file to the repository
+        base_commit_2 = self.commit_file("a.mp3", "version 1")
+
+        self.d.setVar('SRC_URI', "gitsm://%s;protocol=file;lfs=1;branch=master;lfs=0" % self.srcdir)
+
+        # Verify that LFS objects referenced from submodules are not fetched nor checked out
+        fetch_and_verify(base_commit_1, "submodule/a.mp3", "submodule version 1")
+        # Verify that the LFS objects referenced from the base repository are not fetched nor
+        # checked out
+        fetch_and_verify(base_commit_2, "a.mp3", "version 1")
+
     @skipIfNoGitLFS()
     def test_fetch_lfs_on_srcrev_change(self):
         """Test if fetch downloads missing LFS objects when a different revision within an existing repository is requested"""
         self.git(["lfs", "install", "--local"], cwd=self.srcdir)
 
-        @contextlib.contextmanager
-        def hide_upstream_repository():
-            """Hide the upstream repository to make sure that git lfs cannot pull from it"""
-            temp_name = self.srcdir + ".bak"
-            os.rename(self.srcdir, temp_name)
-            try:
-                yield
-            finally:
-                os.rename(temp_name, self.srcdir)
-
         def fetch_and_verify(revision, filename, content):
             self.d.setVar('SRCREV', revision)
             fetcher, ud = self.fetch()
 
-            with hide_upstream_repository():
+            with hide_directory(self.srcdir):
                 workdir = self.d.getVar('WORKDIR')
                 fetcher.unpack(workdir)
 
-- 
2.25.1



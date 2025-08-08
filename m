Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5532ECA0EC1
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:17 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.17945.1754643016860276486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BnRaO8nQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso1908326a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643016; x=1755247816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icROQGy6UiGt5iJvHhaVy3ZR0M7Vr2Q4r0JodrrkCIA=;
        b=BnRaO8nQQlSuIqAPVHWxzt8Z4rFV8hkoxXoe5tJBevSv0XrOdW0An1Xx8HnodvnT9D
         tubiTlpg0nEvwx25dD7knd1JJhrN1pv3dSvMu3iBzaO0W2DCDHvCsRg905bqpOwWdaPK
         rBBmasuKKjubYkEX1P0ev0BDAwmebRJ/TAJ3ElR9OqTe5sYGcnZsj18d/f2/R7ljCxNZ
         6q68lZHHM3NjCGSsaKCEqUXU1ny+Eg3QFCP8zyrrLCBzH7Y9qmntCXb7yF1foWIaJ1K3
         luwM8fbJWv1mJOpuAp02Gd7ptkeylFng5znJxpzudQEENbkkXAJSvUENWoS4PbwYb7zb
         NvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643016; x=1755247816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icROQGy6UiGt5iJvHhaVy3ZR0M7Vr2Q4r0JodrrkCIA=;
        b=vqnBwaDM2navbgkqstwTU3cfIv1Ih9r4mNHNIyodBepMCHWLO0reoNVxzrh9hCF1B9
         bX5rN5PkvLGxo1FjE0K4RVN/k6QBalbMI074I5AeDIzaO5AHOwENaoklo2CKS4cBvrjT
         NdL39s84y5Us8HBK233gFssVL6gX1iLdDXBCogdc3ICAV1H/s1eyKBKpvNKzzET1MJjW
         5GiebSmIJ6MAi1XR8QQsf+6nafurDAzonYRKs2EQE2E/YOCvBG/I0bo0lTGqlyAy+MMP
         CjTu4BxBu3cUpyReKvIoA/FP06pPL8Oj7kpyEziuQeHchlYaW/MKSoltVqnyzVYKm29w
         FzLg==
X-Gm-Message-State: AOJu0Yy65ie+VH0BNpGJjFD7SlcxVWVzlrRgVieJYG177XqjWrxDGQ2n
	CYwQ7KGU1sluQBHKGmlJjvN2yxHcka6kv+LwAi+QL6S+Ei1fjsT4SDlp6ZxF9A==
X-Gm-Gg: ASbGncvJ/dDmzLwplbn6dfq34zQknRaJfoKJjG7DwectvLj4dvE459o9VJYBqr/ZKzI
	gkEIuZdkq8Zw+rAZSd0adNfUY/Hlhw2g1HIuPtldcBLLOzQWkYm1R9AT5iM65l1VImSv9P6ha3s
	53nS8M/ByclPaYfisLm52viaASjMsFFuxIPzoFy/q+j7WVCYH/mrekAwQKshnElomVI5UUu6/rL
	gJkwAno+ETjtuOQ6sNF5BjK37jnXuEhR2/70Eqla6tyuO1yrGWxUGtsSjlD79EJ9T4EhFU0bXkN
	bAjfzRnYgHRL//iHQuhfdXDAp+33S9/FmrYQ7CzhKqASY98N6vymM6qiKWGHBUvJbSdGjh4m9DC
	sMs/n9vICROA7C8Dqo9194XOKSihWg2wUaISTYw==
X-Google-Smtp-Source: AGHT+IE1scSUExoFf1swbMHNbe5cGlbY2w3JXqPrb8x5KwsiChhu24gW/lEiwNyvip1yDFmD7o9ctw==
X-Received: by 2002:a17:902:e94e:b0:240:79d5:8dc7 with SMTP id d9443c01a7336-242c22500b0mr36863255ad.46.1754643015854;
        Fri, 08 Aug 2025 01:50:15 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:15 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 14/23] bitbake: fetch2: Check for git-lfs existence before using it
Date: Fri,  8 Aug 2025 14:19:22 +0530
Message-Id: <20250808084931.2156763-14-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221611

From: Philip Lorenz <philip.lorenz@bmw.de>

So far, existence of `git-lfs` was only checked during unpacking. As the
binary is also used in earlier steps also check for its existence there.

Additionally, factor out the LFS existence check into a dedicated
function and call it wherever git-lfs is used for the first time.

(Bitbake rev: 5818367db9b261b7e07c347d38044e6cba8f9727)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7642477dc8550eeff75d34bd3bbdf574e2f5687c)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py  | 26 +++++++++----
 bitbake/lib/bb/tests/fetch.py | 73 ++++++++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 9e0950006e..10ee248473 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -346,6 +346,9 @@ class Git(FetchMethod):
         return False
 
     def lfs_need_update(self, ud, d):
+        if not self._need_lfs(ud):
+            return False
+
         if self.clonedir_need_update(ud, d):
             return True
 
@@ -531,7 +534,9 @@ class Git(FetchMethod):
     def lfs_fetch(self, ud, d, clonedir, revision, fetchall=False, progresshandler=None):
         """Helper method for fetching Git LFS data"""
         try:
-            if self._need_lfs(ud) and self._contains_lfs(ud, d, clonedir) and self._find_git_lfs(d) and len(revision):
+            if self._need_lfs(ud) and self._contains_lfs(ud, d, clonedir) and len(revision):
+                self._ensure_git_lfs(d, ud)
+
                 # Using worktree with the revision because .lfsconfig may exists
                 worktree_add_cmd = "%s worktree add wt %s" % (ud.basecmd, revision)
                 runfetchcmd(worktree_add_cmd, d, log=progresshandler, workdir=clonedir)
@@ -750,11 +755,11 @@ class Git(FetchMethod):
         runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=destdir)
 
         if self._contains_lfs(ud, d, destdir):
-            if need_lfs and not self._find_git_lfs(d):
-                raise bb.fetch2.FetchError("Repository %s has LFS content, install git-lfs on host to download (or set lfs=0 to ignore it)" % (repourl))
-            elif not need_lfs:
+            if not need_lfs:
                 bb.note("Repository %s has LFS content but it is not being fetched" % (repourl))
             else:
+                self._ensure_git_lfs(d, ud)
+
                 runfetchcmd("%s lfs install --local" % ud.basecmd, d, workdir=destdir)
 
         if not ud.nocheckout:
@@ -817,9 +822,11 @@ class Git(FetchMethod):
         Verifies whether the LFS objects for requested revisions have already been downloaded
         """
         # Bail out early if this repository doesn't use LFS
-        if not self._need_lfs(ud) or not self._contains_lfs(ud, d, wd):
+        if not self._contains_lfs(ud, d, wd):
             return True
 
+        self._ensure_git_lfs(d, ud)
+
         # The Git LFS specification specifies ([1]) the LFS folder layout so it should be safe to check for file
         # existence.
         # [1] https://github.com/git-lfs/git-lfs/blob/main/docs/spec.md#intercepting-git
@@ -869,11 +876,14 @@ class Git(FetchMethod):
             pass
         return False
 
-    def _find_git_lfs(self, d):
+    def _ensure_git_lfs(self, d, ud):
         """
-        Return True if git-lfs can be found, False otherwise.
+        Ensures that git-lfs is available, raising a FetchError if it isn't.
         """
-        return shutil.which("git-lfs", path=d.getVar('PATH')) is not None
+        if shutil.which("git-lfs", path=d.getVar('PATH')) is None:
+            raise bb.fetch2.FetchError(
+                "Repository %s has LFS content, install git-lfs on host to download (or set lfs=0 "
+                "to ignore it)" % self._get_repo_url(ud))
 
     def _get_repo_url(self, ud):
         """
diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 14480d2d65..5e76988570 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -9,6 +9,7 @@
 import contextlib
 import shutil
 import unittest
+import unittest.mock
 import urllib.parse
 import hashlib
 import tempfile
@@ -2276,12 +2277,18 @@ class GitLfsTest(FetcherTest):
         self.git_init(cwd=self.srcdir)
         self.commit_file('.gitattributes', '*.mp3 filter=lfs -text')
 
-    def commit_file(self, filename, content):
-        with open(os.path.join(self.srcdir, filename), "w") as f:
+    def commit(self, *, cwd=None):
+        cwd = cwd or self.srcdir
+        self.git(["commit", "-m", "Change"], cwd=cwd)
+        return self.git(["rev-parse", "HEAD"], cwd=cwd).strip()
+
+    def commit_file(self, filename, content, *, cwd=None):
+        cwd = cwd or self.srcdir
+
+        with open(os.path.join(cwd, filename), "w") as f:
             f.write(content)
-        self.git(["add", filename], cwd=self.srcdir)
-        self.git(["commit", "-m", "Change"], cwd=self.srcdir)
-        return self.git(["rev-parse", "HEAD"], cwd=self.srcdir).strip()
+        self.git(["add", filename], cwd=cwd)
+        return self.commit(cwd=cwd)
 
     def fetch(self, uri=None, download=True):
         uris = self.d.getVar('SRC_URI').split()
@@ -2390,6 +2397,21 @@ class GitLfsTest(FetcherTest):
         fetcher, ud = self.fetch()
         fetcher.unpack(self.d.getVar('WORKDIR'))
 
+    @skipIfNoGitLFS()
+    def test_lfs_enabled_not_installed_during_unpack(self):
+        uri = 'git://%s;protocol=file;lfs=1;branch=master' % self.srcdir
+        self.d.setVar('SRC_URI', uri)
+
+        # Careful: suppress initial attempt at downloading
+        fetcher, ud = self.fetch(uri=None, download=False)
+
+        fetcher.download()
+        # If git-lfs cannot be found, the unpack should throw an error
+        with self.assertRaises(bb.fetch2.FetchError):
+            with unittest.mock.patch("shutil.which", return_value=None):
+                shutil.rmtree(self.gitdir, ignore_errors=True)
+                fetcher.unpack(self.d.getVar('WORKDIR'))
+
     def test_lfs_enabled_not_installed(self):
         uri = 'git://%s;protocol=file;lfs=1;branch=master' % self.srcdir
         self.d.setVar('SRC_URI', uri)
@@ -2397,18 +2419,10 @@ class GitLfsTest(FetcherTest):
         # Careful: suppress initial attempt at downloading
         fetcher, ud = self.fetch(uri=None, download=False)
 
-        # Artificially assert that git-lfs is not installed, so
-        # we can verify a failure to unpack in it's absence.
-        old_find_git_lfs = ud.method._find_git_lfs
-        try:
-            # If git-lfs cannot be found, the unpack should throw an error
+        # If git-lfs cannot be found, the download should throw an error
+        with unittest.mock.patch("shutil.which", return_value=None):
             with self.assertRaises(bb.fetch2.FetchError):
                 fetcher.download()
-                ud.method._find_git_lfs = lambda d: False
-                shutil.rmtree(self.gitdir, ignore_errors=True)
-                fetcher.unpack(self.d.getVar('WORKDIR'))
-        finally:
-            ud.method._find_git_lfs = old_find_git_lfs
 
     def test_lfs_disabled_not_installed(self):
         uri = 'git://%s;protocol=file;lfs=0;branch=master' % self.srcdir
@@ -2417,17 +2431,30 @@ class GitLfsTest(FetcherTest):
         # Careful: suppress initial attempt at downloading
         fetcher, ud = self.fetch(uri=None, download=False)
 
-        # Artificially assert that git-lfs is not installed, so
-        # we can verify a failure to unpack in it's absence.
-        old_find_git_lfs = ud.method._find_git_lfs
-        try:
-            # Even if git-lfs cannot be found, the unpack should be successful
+        # Even if git-lfs cannot be found, the download / unpack should be successful
+        with unittest.mock.patch("shutil.which", return_value=None):
+            fetcher.download()
+            shutil.rmtree(self.gitdir, ignore_errors=True)
+            fetcher.unpack(self.d.getVar('WORKDIR'))
+
+    def test_lfs_enabled_not_installed_but_not_needed(self):
+        srcdir = os.path.join(self.tempdir, "emptygit")
+        bb.utils.mkdirhier(srcdir)
+        self.git_init(srcdir)
+        self.commit_file("test", "test content", cwd=srcdir)
+
+        uri = 'git://%s;protocol=file;lfs=1;branch=master' % srcdir
+        self.d.setVar('SRC_URI', uri)
+
+        # Careful: suppress initial attempt at downloading
+        fetcher, ud = self.fetch(uri=None, download=False)
+
+        # It shouldnt't matter that git-lfs cannot be found as the repository configuration does not
+        # specify any LFS filters.
+        with unittest.mock.patch("shutil.which", return_value=None):
             fetcher.download()
-            ud.method._find_git_lfs = lambda d: False
             shutil.rmtree(self.gitdir, ignore_errors=True)
             fetcher.unpack(self.d.getVar('WORKDIR'))
-        finally:
-            ud.method._find_git_lfs = old_find_git_lfs
 
 class GitURLWithSpacesTest(FetcherTest):
     test_git_urls = {
-- 
2.25.1



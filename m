Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9D4C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.17682.1754643000566462320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAGboEpp;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24031a3e05cso13504015ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642999; x=1755247799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrzoX/joTffAl1MPQX3ffgHU0uU261I4cyTWCxNEwXs=;
        b=SAGboEpp/xuA7JoCbudWWYTMoHehTIeSh3CKUTMR3anJAdisewpvvxQ4QuQ8hR/ldf
         dph12u6dHPv1rasKm2fJwhZvxXHk5bSb5GyD64FL8PobLRUMLKbPbcU5fWtkVBjv2/xh
         CwoHFwfBTTl0fGpnZFoUYtqdt0O0cWcaGWTPj6ZqRFzz2sTgJ/ZxB6R98r5/f02plYkH
         v2wjeDhYC6oQBu4raOljOfydVwATIt2SCtBK8BdTWqQJWTL0IS4AetzEHkvW/PRQ6mwU
         M9u+WyVXxxBZJ/UpMKLDhXTTHAPuja/aM4bs87w5nSeWrXKf0oJ6X1fA7mbuNqpx9eGn
         onjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642999; x=1755247799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrzoX/joTffAl1MPQX3ffgHU0uU261I4cyTWCxNEwXs=;
        b=D6l+SqcBx0nQYUg8XWXAt9GIFfbSqW6JYokIm9Cq1Rqud+03Z6P2lWkAl6nyvKU7By
         FYlD3RbDObndFhXYo8IXQsm7ujHI70EXrBw1TRJxdqDko/1N1Tf5C6D2Gx4TyT1L2WFG
         tq8MWsxqcNLlC5cNqBXpMN68viKnb9DyxR+v06l5WAQAHHjWqyNVSurLCIz85+D8fNZS
         JIPQYtMANkq3hvlamhWiWVpdl/sKyZpfJSnJ9gqtcxMYOkXg5hCZ8kaGZFNQa0Kn7/6y
         ofhm6ZbZTEZqPPM5fBwdHR7rS0blDleXfSM0mRm1MsAJwBHv5voJbaatCbUG0VpR7PUp
         0d+Q==
X-Gm-Message-State: AOJu0YyaJO1yILO8yyl7joIuL/etb8/MwM2+QnLUUnj6Myi6n0WAo5CG
	wxpxupfzfYUeq/ATmPeFNFYNFFbpAumHCzldKSymhOBxHBcVaRmYs1LGlbqLgA==
X-Gm-Gg: ASbGncusLXjuRPDJpPfYxB/rNKbZtHTSbH59tlsivowZWlVvzjkST+H+SEcMJNqsvRm
	G14NpzcRZIf/tEVEic3h0XqzU2GWlqjyUALxvRaM165dzyErJ2zeJXibpyRjRlHdnDXt/4IJ8Fg
	pDNAPSnYkeoGlQLbYqRsFI5AdDvvDeTwjgYgXf+6DkjEkWCukAlf+tv6L6jRPihlEbqvPzk4c1G
	Yq3rdC85w3y/V9lK2b63Kf9u5VVd5eUJ68ovfIu7aaQBVa8tM1cqVR1D2Ma9LYPiHsNyYNHjl27
	ZiYax9uepQJ/PmfUCIhL5U2gyw6ctKDIfvWW3PEVyQC+57E5xkdOayMJfngaMihjyvtTEs/bdoe
	qwwmtlb8ugM3nq80pL/P9IAx0dwuEzfjr
X-Google-Smtp-Source: AGHT+IHgpQbO9Dehk2Kcwx+Yhtn16RwqTCyDCC9JZFnJrqdswJ0M/3jS4qllO90OsPPukrMuaR/iXQ==
X-Received: by 2002:a17:902:d505:b0:234:9fe1:8fc6 with SMTP id d9443c01a7336-242b072bbb4mr97586895ad.18.1754642999210;
        Fri, 08 Aug 2025 01:49:59 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:58 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Koch <stefan-koch@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 08/23] bitbake: fetch2/git: Add support for fast initial shallow fetch
Date: Fri,  8 Aug 2025 14:19:16 +0530
Message-Id: <20250808084931.2156763-8-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221605

From: Stefan Koch <stefan-koch@siemens.com>

When `ud.shallow == 1`:
- Prefer an initial shallow clone over an initial full bare clone,
  while still utilizing any already existing full bare clones.
- If the Git error "Server does not allow request for unadvertised object"
  occurs, the initial full bare clone is fetched automatically.
  This may happen if the Git server does not allow the request
  or if the Git client has issues with this functionality,
  especially with the Git client from Ubuntu 20.04.

This improves:
- Resolve timeout issues during initial clones on slow internet connections
  by reducing the amount of data transferred.
- Eliminate the need to use an HTTPS tarball `SRC_URI`
  to reduce data transfer.
- Allow SSH-based authentication (e.g. cert and agent-based) when
  using non-public repos, so additional HTTPS tokens may not be required.

(Bitbake rev: 457288b2fda86fd00cdcaefac616129b0029e1f9)

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65ae50cd16a3989699bea845566d38476f2ae9a7)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 114 ++++++++++++++++++++++++++---------
 1 file changed, 85 insertions(+), 29 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 168f14d0c8..9a15abaa79 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -207,6 +207,7 @@ class Git(FetchMethod):
         if ud.bareclone:
             ud.cloneflags += " --mirror"
 
+        ud.shallow_skip_fast = False
         ud.shallow = d.getVar("BB_GIT_SHALLOW") == "1"
         ud.shallow_extra_refs = (d.getVar("BB_GIT_SHALLOW_EXTRA_REFS") or "").split()
 
@@ -446,6 +447,24 @@ class Git(FetchMethod):
             if ud.proto.lower() != 'file':
                 bb.fetch2.check_network_access(d, clone_cmd, ud.url)
             progresshandler = GitProgressHandler(d)
+
+            # Try creating a fast initial shallow clone
+            # Enabling ud.shallow_skip_fast will skip this
+            # If the Git error "Server does not allow request for unadvertised object"
+            # occurs, shallow_skip_fast is enabled automatically.
+            # This may happen if the Git server does not allow the request
+            # or if the Git client has issues with this functionality.
+            if ud.shallow and not ud.shallow_skip_fast:
+                try:
+                    self.clone_shallow_with_tarball(ud, d)
+                    # When the shallow clone has succeeded, use the shallow tarball
+                    ud.localpath = ud.fullshallow
+                    return
+                except:
+                    logger.warning("Creating fast initial shallow clone failed, try initial regular clone now.")
+
+            # When skipping fast initial shallow or the fast inital shallow clone failed:
+            # Try again with an initial regular clone
             runfetchcmd(clone_cmd, d, log=progresshandler)
 
         # Update the checkout if needed
@@ -508,48 +527,74 @@ class Git(FetchMethod):
                 if os.path.exists(os.path.join(ud.destdir, ".git", "lfs")):
                     runfetchcmd("tar -cf - lfs | tar -xf - -C %s" % ud.clonedir, d, workdir="%s/.git" % ud.destdir)
 
-    def build_mirror_data(self, ud, d):
-
-        # Create as a temp file and move atomically into position to avoid races
-        @contextmanager
-        def create_atomic(filename):
-            fd, tfile = tempfile.mkstemp(dir=os.path.dirname(filename))
-            try:
-                yield tfile
-                umask = os.umask(0o666)
-                os.umask(umask)
-                os.chmod(tfile, (0o666 & ~umask))
-                os.rename(tfile, filename)
-            finally:
-                os.close(fd)
+    def lfs_fetch(self, ud, d, clonedir, revision, fetchall=False, progresshandler=None):
+        """Helper method for fetching Git LFS data"""
+        try:
+            if self._need_lfs(ud) and self._contains_lfs(ud, d, clonedir) and self._find_git_lfs(d) and len(revision):
+                # Using worktree with the revision because .lfsconfig may exists
+                worktree_add_cmd = "%s worktree add wt %s" % (ud.basecmd, revision)
+                runfetchcmd(worktree_add_cmd, d, log=progresshandler, workdir=clonedir)
+                lfs_fetch_cmd = "%s lfs fetch %s" % (ud.basecmd, "--all" if fetchall else "")
+                runfetchcmd(lfs_fetch_cmd, d, log=progresshandler, workdir=(clonedir + "/wt"))
+                worktree_rem_cmd = "%s worktree remove -f wt" % ud.basecmd
+                runfetchcmd(worktree_rem_cmd, d, log=progresshandler, workdir=clonedir)
+        except:
+            logger.warning("Fetching LFS did not succeed.")
+
+    @contextmanager
+    def create_atomic(self, filename):
+        """Create as a temp file and move atomically into position to avoid races"""
+        fd, tfile = tempfile.mkstemp(dir=os.path.dirname(filename))
+        try:
+            yield tfile
+            umask = os.umask(0o666)
+            os.umask(umask)
+            os.chmod(tfile, (0o666 & ~umask))
+            os.rename(tfile, filename)
+        finally:
+            os.close(fd)
 
+    def build_mirror_data(self, ud, d):
         if ud.shallow and ud.write_shallow_tarballs:
             if not os.path.exists(ud.fullshallow):
                 if os.path.islink(ud.fullshallow):
                     os.unlink(ud.fullshallow)
-                tempdir = tempfile.mkdtemp(dir=d.getVar('DL_DIR'))
-                shallowclone = os.path.join(tempdir, 'git')
-                try:
-                    self.clone_shallow_local(ud, shallowclone, d)
-
-                    logger.info("Creating tarball of git repository")
-                    with create_atomic(ud.fullshallow) as tfile:
-                        runfetchcmd("tar -czf %s ." % tfile, d, workdir=shallowclone)
-                    runfetchcmd("touch %s.done" % ud.fullshallow, d)
-                finally:
-                    bb.utils.remove(tempdir, recurse=True)
+                self.clone_shallow_with_tarball(ud, d)
         elif ud.write_tarballs and not os.path.exists(ud.fullmirror):
             if os.path.islink(ud.fullmirror):
                 os.unlink(ud.fullmirror)
 
             logger.info("Creating tarball of git repository")
-            with create_atomic(ud.fullmirror) as tfile:
+            with self.create_atomic(ud.fullmirror) as tfile:
                 mtime = runfetchcmd("{} log --all -1 --format=%cD".format(ud.basecmd), d,
                         quiet=True, workdir=ud.clonedir)
                 runfetchcmd("tar -czf %s --owner oe:0 --group oe:0 --mtime \"%s\" ."
                         % (tfile, mtime), d, workdir=ud.clonedir)
             runfetchcmd("touch %s.done" % ud.fullmirror, d)
 
+    def clone_shallow_with_tarball(self, ud, d):
+        ret = False
+        tempdir = tempfile.mkdtemp(dir=d.getVar('DL_DIR'))
+        shallowclone = os.path.join(tempdir, 'git')
+        try:
+            try:
+                self.clone_shallow_local(ud, shallowclone, d)
+            except:
+                logger.warning("Fash shallow clone failed, try to skip fast mode now.")
+                bb.utils.remove(tempdir, recurse=True)
+                os.mkdir(tempdir)
+                ud.shallow_skip_fast = True
+                self.clone_shallow_local(ud, shallowclone, d)
+            logger.info("Creating tarball of git repository")
+            with self.create_atomic(ud.fullshallow) as tfile:
+                runfetchcmd("tar -czf %s ." % tfile, d, workdir=shallowclone)
+            runfetchcmd("touch %s.done" % ud.fullshallow, d)
+            ret = True
+        finally:
+            bb.utils.remove(tempdir, recurse=True)
+
+        return ret
+
     def clone_shallow_local(self, ud, dest, d):
         """
         Shallow fetch from ud.clonedir (${DL_DIR}/git2/<gitrepo> by default):
@@ -557,12 +602,20 @@ class Git(FetchMethod):
         - For BB_GIT_SHALLOW_REVS: git fetch --shallow-exclude=<revs> rev
         """
 
+        progresshandler = GitProgressHandler(d)
+        repourl = self._get_repo_url(ud)
         bb.utils.mkdirhier(dest)
         init_cmd = "%s init -q" % ud.basecmd
         if ud.bareclone:
             init_cmd += " --bare"
         runfetchcmd(init_cmd, d, workdir=dest)
-        runfetchcmd("%s remote add origin %s" % (ud.basecmd, ud.clonedir), d, workdir=dest)
+        # Use repourl when creating a fast initial shallow clone
+        # Prefer already existing full bare clones if available
+        if not ud.shallow_skip_fast and not os.path.exists(ud.clonedir):
+            remote = shlex.quote(repourl)
+        else:
+            remote = ud.clonedir
+        runfetchcmd("%s remote add origin %s" % (ud.basecmd, remote), d, workdir=dest)
 
         # Check the histories which should be excluded
         shallow_exclude = ''
@@ -600,10 +653,14 @@ class Git(FetchMethod):
             # The ud.clonedir is a local temporary dir, will be removed when
             # fetch is done, so we can do anything on it.
             adv_cmd = 'git branch -f advertise-%s %s' % (revision, revision)
-            runfetchcmd(adv_cmd, d, workdir=ud.clonedir)
+            if ud.shallow_skip_fast:
+                runfetchcmd(adv_cmd, d, workdir=ud.clonedir)
 
             runfetchcmd(fetch_cmd, d, workdir=dest)
             runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
+            # Fetch Git LFS data for fast shallow clones
+            if not ud.shallow_skip_fast:
+                self.lfs_fetch(ud, d, dest, ud.revisions[ud.names[0]])
 
         # Apply extra ref wildcards
         all_refs_remote = runfetchcmd("%s ls-remote origin 'refs/*'" % ud.basecmd, \
@@ -629,7 +686,6 @@ class Git(FetchMethod):
             runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
 
         # The url is local ud.clonedir, set it to upstream one
-        repourl = self._get_repo_url(ud)
         runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=dest)
 
     def unpack(self, ud, destdir, d):
-- 
2.25.1



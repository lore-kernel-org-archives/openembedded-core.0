Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41728C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:47 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.17674.1754642981539729346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOEkf5HB;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4209a0d426so1931678a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642980; x=1755247780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzk6GzJjKNvuZn2Lz3JKsjQTVz/JgU889oaPQwyPf84=;
        b=UOEkf5HBJ+LcHeHD9iPxi0NUFSNCy14VnzsEVpN5Q3cqdoCUqWhgzAUuiiVbRiK74U
         lu8sOV2TPdfS4Ob6Vx2AUkpMduAonQb//eFH3j+BoUvYvo3EkfbDKVHpnVpQc285+t9f
         6wivmycxHbXW7OclyTXXtj4Pfynqh6cq1zYY+Z+/+w0vCpL165jTbzTdSmFEWXtA5XP+
         NhCzOas0tXdja/6TDI5hK0No4scDt/8gGIXkf6BvvSsb53WHCCyp9iKqZdF2BXJRgG+k
         l6uAYlJLX6sa+XPMo5nyzSgnl0wsRErfPf01DxbrsQh8+e6DLHIe+uNqj78Y6AwDAuJr
         dWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642980; x=1755247780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzk6GzJjKNvuZn2Lz3JKsjQTVz/JgU889oaPQwyPf84=;
        b=m/8sMevyxg7G5TlUIhiiAjUZ7F2l4I8uQfUu2MZ6daeRTxZRaooHVhjATfGn3EqJdX
         MkBRXz4ViIfnhu3kwZCgZZErUn55CZwxkAIEK8NU/RyKSO0kmwPAxDoB06VmB97pvhit
         YAfORCnP9tx1zfGW/AfS1ePkpYnaMvsArJWb9thmDTxEhIADNSBDBry6NoMKM457xUj/
         6bUyT/UP8u7GNzQfTl/ZZMP53epwHFxS0Wpl3X/mWbiD2v2CvtbegDYNrNYW23uwylsu
         VC0q6bXAqa8d01iSSVtP+6X1ETqwqu6qle4BqlPW0AGdrFngmvNfYvFHPjq1RR6SE2dZ
         BQyg==
X-Gm-Message-State: AOJu0YxGftYpuMIELS21bomd5DhVD4lGx7JLutJCj7VxEG06e1d1GrPF
	9gDCzIdz1QWhAy2xGLBx9D2iJU5VyaUB96ppEp3c9we3ILnzYaXvgM+pLEzeJg==
X-Gm-Gg: ASbGncuXoos30XWLJOLCId98nbSi5FFgtK0d+EmmPvvqTKRT58BNnSKMKHLFrFidNKL
	SN7MxVNvMaM55CEmyljfWSfi72H+UzYoFeXMHALDfTg4hi+xYCXhFKUQcrZgMFgWLivG0SSAtHD
	2XBVhA44xHFjXUUPkBEasUfGyFV4UeitqWSDo+jmvCKP//H2Uq3il6tNaVz4KKq5/9ZIJ30OO3F
	dWkKz4JLn02CcUDPt3QoNLU2fg/TAhtiJwK5oDrlK6fP8NdWb/lBrwsvlow36NvFlpRkYzvL2TD
	2dpsuI+V+JkDdJqIMhVMN5otvhU+RHjF8KORt+nhV/qYOi6Z8aN4qh9iZPG9LUtxv9sI0L3rsL1
	Yt5qvb3ZyD+nLSzOvXfmoFO62MPjjEkyn
X-Google-Smtp-Source: AGHT+IEhvtMoYw/SZxEpkfBAfHmikfrajZ4iPU/oXfXxtlZxQLCsAkNUJrRDr6LxNHSDbjR5wBWWhw==
X-Received: by 2002:a17:902:c946:b0:237:f76f:ce34 with SMTP id d9443c01a7336-242c200831amr36000125ad.15.1754642980443;
        Fri, 08 Aug 2025 01:49:40 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:39 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 01/23] bitbake: fetch2/git: Use git shallow fetch to implement clone_shallow_local()
Date: Fri,  8 Aug 2025 14:19:09 +0530
Message-Id: <20250808084931.2156763-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221598

From: Robert Yang <liezhi.yang@windriver.com>

This patch can make the following settings much more faster:
BB_GIT_SHALLOW = "1"
BB_GENERATE_MIRROR_TARBALLS = "1"

* The previous implementation was:
  - Make a full clone for the repo from local ud.clonedir
  - Use git-make-shallow to remove unneeded revs

  It was very slow for recipes which have a lot of SRC_URIs, for example
  vulkan-samples and docker-compose, the docker-compose can't be done after 5
  hours.

  $ bitbake vulkan-samples -cfetch
  Before: 12 minutes
  Now: 2 minutes

  $ bitbake docker-compose -cfetch
  Before: More than 300 minutes
  Now: 15 minutes

* The patch uses git shallow fetch to fetch the repo from local
  ud.clonedir:
  - For BB_GIT_SHALLOW_DEPTH: git fetch --depth <depth> rev
  - For BB_GIT_SHALLOW_REVS: git fetch --shallow-exclude=<revs> rev

  Then the git repo will be shallow, and git-make-shallow is not needed any
  more.

  And git shallow fetch will download less commits than before since it doesn't
  need "rev^" to parse the dependencies, the previous code always need 'rev^'.

(Bitbake rev: a5a569c075224fe41707cfa9123c442d1fda2fbf)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2527cf58f4f390712641a99b276b9e0aeae01c6)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 78 ++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 6029144601..2194c839dd 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -551,18 +551,31 @@ class Git(FetchMethod):
             runfetchcmd("touch %s.done" % ud.fullmirror, d)
 
     def clone_shallow_local(self, ud, dest, d):
-        """Clone the repo and make it shallow.
+        """
+        Shallow fetch from ud.clonedir (${DL_DIR}/git2/<gitrepo> by default):
+        - For BB_GIT_SHALLOW_DEPTH: git fetch --depth <depth> rev
+        - For BB_GIT_SHALLOW_REVS: git fetch --shallow-exclude=<revs> rev
+        """
+
+        bb.utils.mkdirhier(dest)
+        init_cmd = "%s init -q" % ud.basecmd
+        if ud.bareclone:
+            init_cmd += " --bare"
+        runfetchcmd(init_cmd, d, workdir=dest)
+        runfetchcmd("%s remote add origin %s" % (ud.basecmd, ud.clonedir), d, workdir=dest)
 
-        The upstream url of the new clone isn't set at this time, as it'll be
-        set correctly when unpacked."""
-        runfetchcmd("%s clone %s %s %s" % (ud.basecmd, ud.cloneflags, ud.clonedir, dest), d)
+        # Check the histories which should be excluded
+        shallow_exclude = ''
+        for revision in ud.shallow_revs:
+            shallow_exclude += " --shallow-exclude=%s" % revision
 
-        to_parse, shallow_branches = [], []
         for name in ud.names:
             revision = ud.revisions[name]
             depth = ud.shallow_depths[name]
-            if depth:
-                to_parse.append('%s~%d^{}' % (revision, depth - 1))
+
+            # The --depth and --shallow-exclude can't be used together
+            if depth and shallow_exclude:
+                raise bb.fetch2.FetchError("BB_GIT_SHALLOW_REVS is set, but BB_GIT_SHALLOW_DEPTH is not 0.")
 
             # For nobranch, we need a ref, otherwise the commits will be
             # removed, and for non-nobranch, we truncate the branch to our
@@ -575,36 +588,49 @@ class Git(FetchMethod):
             else:
                 ref = "refs/remotes/origin/%s" % branch
 
-            shallow_branches.append(ref)
-            runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
+            fetch_cmd = "%s fetch origin %s" % (ud.basecmd, revision)
+            if depth:
+                fetch_cmd += " --depth %s" % depth
+
+            if shallow_exclude:
+                fetch_cmd += shallow_exclude
 
-        # Map srcrev+depths to revisions
-        parsed_depths = runfetchcmd("%s rev-parse %s" % (ud.basecmd, " ".join(to_parse)), d, workdir=dest)
+            # Advertise the revision for lower version git such as 2.25.1:
+            # error: Server does not allow request for unadvertised object.
+            # The ud.clonedir is a local temporary dir, will be removed when
+            # fetch is done, so we can do anything on it.
+            adv_cmd = 'git branch -f advertise-%s %s' % (revision, revision)
+            runfetchcmd(adv_cmd, d, workdir=ud.clonedir)
 
-        # Resolve specified revisions
-        parsed_revs = runfetchcmd("%s rev-parse %s" % (ud.basecmd, " ".join('"%s^{}"' % r for r in ud.shallow_revs)), d, workdir=dest)
-        shallow_revisions = parsed_depths.splitlines() + parsed_revs.splitlines()
+            runfetchcmd(fetch_cmd, d, workdir=dest)
+            runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
 
         # Apply extra ref wildcards
-        all_refs = runfetchcmd('%s for-each-ref "--format=%%(refname)"' % ud.basecmd,
-                               d, workdir=dest).splitlines()
+        all_refs_remote = runfetchcmd("%s ls-remote origin 'refs/*'" % ud.basecmd, \
+                                        d, workdir=dest).splitlines()
+        all_refs = []
+        for line in all_refs_remote:
+            all_refs.append(line.split()[-1])
+        extra_refs = []
         for r in ud.shallow_extra_refs:
             if not ud.bareclone:
                 r = r.replace('refs/heads/', 'refs/remotes/origin/')
 
             if '*' in r:
                 matches = filter(lambda a: fnmatch.fnmatchcase(a, r), all_refs)
-                shallow_branches.extend(matches)
+                extra_refs.extend(matches)
             else:
-                shallow_branches.append(r)
-
-        # Make the repository shallow
-        shallow_cmd = [self.make_shallow_path, '-s']
-        for b in shallow_branches:
-            shallow_cmd.append('-r')
-            shallow_cmd.append(b)
-        shallow_cmd.extend(shallow_revisions)
-        runfetchcmd(subprocess.list2cmdline(shallow_cmd), d, workdir=dest)
+                extra_refs.append(r)
+
+        for ref in extra_refs:
+            ref_fetch = os.path.basename(ref)
+            runfetchcmd("%s fetch origin --depth 1 %s" % (ud.basecmd, ref_fetch), d, workdir=dest)
+            revision = runfetchcmd("%s rev-parse FETCH_HEAD" % ud.basecmd, d, workdir=dest)
+            runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
+
+        # The url is local ud.clonedir, set it to upstream one
+        repourl = self._get_repo_url(ud)
+        runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=dest)
 
     def unpack(self, ud, destdir, d):
         """ unpack the downloaded src to destdir"""
-- 
2.25.1



Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D55C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.17953.1754643040395765932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnTF+BN/;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2400f746440so15071455ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643039; x=1755247839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL7Nq93SL1rXHkLsyteZmXDVJ6IrYtk6+gjnqxApHdM=;
        b=FnTF+BN/3D2DZ67J6qABl/QPnW6Yu+kogVJ/mSh//+M8uheIb3244nqX0+YCc9O9Aw
         e9D1sZiCFR6CKkE9N7IWSjg0vl5e/hSbLld7douK5DzGoj0kkspOTGsW6oYpeHst2bAK
         +LtPTv5Q8G21Pc7dsP3lwH/lvjlX5Ltc3cgvF5tBVInMJU6FaZ3vPU9jwdOIJaG1AXOe
         wusRlxCfQPhdgYlGPDUQZdN9LgMD/Styw+Fh9HpApwlxx4tkviPX5YRqu8+MZAb+RFzr
         EAnaL7D34XuWMRWfCz3kpcqXpMtuvuoJkP9u8I3+ktetHePsVAmGpwSHprRWSixXu7tO
         4SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643039; x=1755247839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL7Nq93SL1rXHkLsyteZmXDVJ6IrYtk6+gjnqxApHdM=;
        b=Cf6yi76487soFu6uIOOV3CXakOb1mdsklmai1BaSKAfW6q4qVwyRkUeite/B+L3YEr
         dIkcQrm4TS5/9pgFivAyNlER7438h3AlwNugQmGPIWWfCR6Dur+mufQ/S+m5s0mKHUyv
         ceqvIZsjI8RRdNgC2adCxkN31gIDIv129mkrPMXQU/v6j8rGrQNub6zxTNhDGWEnGdG6
         UXv7zmOhIqJic3X6w+z7Jas82CfgTGtUiadPZAlqi3I80J4oiynXx6pYugtWnVo+ZxAK
         rfl8Iq0l2d4/F2njzLOggEh3cM+dTTJYT9VChuBiQtuF7bLCgbwie695m7c/URT0sAmr
         Op+Q==
X-Gm-Message-State: AOJu0YxYZsEcw+pFQEwcsimQoXu0F29PUoXdTgV+nqao77ES/m0fQ52T
	nKIqvxkBZ1V0xZ8e7ZKDS1bgR7m8oCYPBw2MThuL1lSUgG39oPKdLrgTXjAz7Q==
X-Gm-Gg: ASbGnctUKZ3MCV3lHmlDBHi3WO65DTPm9w6FJd17Et/yCUXtFO+smKSDQaa3WqEyBx4
	j8yitGgs0JrXOaOLMxAnSK3mnIXY8dOdXlpfgG4MtCUSlyfRhnz8eCfjRZydqvmLrJ63hEjn0zi
	NNTpqiRN8740E5ld5RnyVA5DtiV9lBuS4Rjkj7fDuMc9OFKrl52I1toF/qyGtzYLTaGhSqddmSA
	iGQM/MWGSx2siZ8xdPfPvnvj18SYICzrVGeRYtLnDzFMHbBYMYGlE52s+N239ETP3N8uwq2fjvo
	sW6eG57WJiu1fuuK/asw2nz5/1PYHehXdVdQVS0JdmpIBl7A75B62Xb6FB9QdGuKJihbeDPWyCn
	4DD5hQIsGTqkw+K9UikEOZfqeUIi1gr5PKbB3hw==
X-Google-Smtp-Source: AGHT+IFJRDAdBgMyjveUSqYqoc4vwPIsEGsejePeir5ZZ3+vqUKKTENO1Rtl3nn3/ZIPEWBv4ThkJw==
X-Received: by 2002:a17:903:4b47:b0:240:8704:fb9 with SMTP id d9443c01a7336-242c22fb175mr28304075ad.53.1754643039371;
        Fri, 08 Aug 2025 01:50:39 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:38 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][scarthgap][PATCH 23/23] bitbake: fetch2/git: Add multiple revision support
Date: Fri,  8 Aug 2025 14:19:31 +0530
Message-Id: <20250808084931.2156763-23-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221620

In scarthgap single SRC_URI can still have multiple revisions
update the code in order to iterate over these revisions and
do the fetch.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 390d9ddafc..88fa119e1d 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -513,12 +513,13 @@ class Git(FetchMethod):
                 raise bb.fetch2.FetchError("Unable to find revision %s even from upstream" % missing_rev)
 
         if self.lfs_need_update(ud, d):
-            self.lfs_fetch(ud, d, ud.clonedir, ud.revision)
+            for name in ud.names:
+                self.lfs_fetch(ud, d, name, ud.clonedir, ud.revisions[name])
 
-    def lfs_fetch(self, ud, d, clonedir, revision, fetchall=False, progresshandler=None):
+    def lfs_fetch(self, ud, d, name, clonedir, revision, fetchall=False, progresshandler=None):
         """Helper method for fetching Git LFS data"""
         try:
-            if self._need_lfs(ud) and self._contains_lfs(ud, d, clonedir) and len(revision):
+            if self._need_lfs(ud) and self._contains_lfs(ud, d, name, clonedir) and len(revision):
                 self._ensure_git_lfs(d, ud)
 
                 # Using worktree with the revision because .lfsconfig may exists
@@ -649,7 +650,7 @@ class Git(FetchMethod):
             runfetchcmd(fetch_cmd, d, workdir=dest)
             runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
             # Fetch Git LFS data
-            self.lfs_fetch(ud, d, dest, ud.revisions[ud.names[0]])
+            self.lfs_fetch(ud, d, name, dest, ud.revisions[ud.names[0]])
 
         # Apply extra ref wildcards
         all_refs_remote = runfetchcmd("%s ls-remote origin 'refs/*'" % ud.basecmd, \
@@ -738,7 +739,7 @@ class Git(FetchMethod):
         repourl = self._get_repo_url(ud)
         runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=destdir)
 
-        if self._contains_lfs(ud, d, destdir):
+        if any(self._contains_lfs(ud, d, name, destdir) for name in ud.names):
             if not need_lfs:
                 bb.note("Repository %s has LFS content but it is not being fetched" % (repourl))
             else:
@@ -806,8 +807,9 @@ class Git(FetchMethod):
         Verifies whether the LFS objects for requested revisions have already been downloaded
         """
         # Bail out early if this repository doesn't use LFS
-        if not self._contains_lfs(ud, d, wd):
-            return True
+        for name in ud.names:
+            if not self._contains_lfs(ud, d, name, wd):
+                return True
 
         self._ensure_git_lfs(d, ud)
 
@@ -835,12 +837,12 @@ class Git(FetchMethod):
     def _need_lfs(self, ud):
         return ud.parm.get("lfs", "1") == "1"
 
-    def _contains_lfs(self, ud, d, wd):
+    def _contains_lfs(self, ud, d, name, wd):
         """
         Check if the repository has 'lfs' (large file) content
         """
         cmd = "%s grep lfs %s:.gitattributes | wc -l" % (
-            ud.basecmd, ud.revision)
+            ud.basecmd, ud.revisions[name])
 
         try:
             output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
-- 
2.25.1



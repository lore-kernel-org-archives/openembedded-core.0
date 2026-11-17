Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16515.1794918306657591590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=J+87KPaK;
 spf=pass (domain: snapchat.com, ip: 209.85.128.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so14182685e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794918305; x=1795523105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/UWLNqILpgzEimJ0gfV8xuI5YRqTgEwfzFx+YDxWjU=;
        b=J+87KPaKzrdxfZJy0an4GXlPiblu9yyySzGrAS4YUnnZ8fsE9o11+bWvzA62oqeOoJ
         Vk5uXc9C9TLujtl1VGP5/GZazRxLg5ZNVXNCpsjq199iTib0gNnxnTenOV+7VXHrjb+b
         Wp6T/8514Nbgg+edDNdUqAn2fQsDgc6JqSeQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918305; x=1795523105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/UWLNqILpgzEimJ0gfV8xuI5YRqTgEwfzFx+YDxWjU=;
        b=cIKjOgk2sRxlNxRTsci3TrX0aoCj+3I5bT5iD0q5DKvJ+yiUWW+VUM+n8RnSNqWfGK
         J9IWmcXKxdmn80E0p6gkFB+nfXUyDkxn6rkV6VpYBWbxjzxyT6cpvtSaonl0KQC6hSZF
         PhfN+M/KejPyEoVbK8LIT9tZlB//bFYLct+x6O96kdLbZnCqIiaTqjd8r1uPPxu7L+OP
         sY2O/0idlHcdlz6VO/CLIzGeGzG4ozFhX6ftTH7zyIa+r9sot+pHEuMs1voo9H2txs7T
         gh0d2DJNrB/0auFfv9GwWq3oRxZMkfSMSIeZ9V4Chq2U1rZ5FwLm7OhwZkQ4P+2gTUcM
         1AlA==
X-Gm-Message-State: APuU4Z/8XZDgRaG5yU4aEa4GijB6qy53eNl1PUpUXdRsjcEKaOSJd2b9
	4vyDGsHqqaUCb0DzKdMCPCE8K4mVbLqOgP1uyZQEzcz7uSR7cKuj7sBBzF4tLo3CM+7734dDjE7
	Yr4+JIKU=
X-Gm-Gg: AYBFou3SYQ78Nd0DvYMtkFxgkQONL8bqkrfmsl+9u3AKvrcOGARiPknzU/ycj5Ilhfb
	0fag9OycwvTkJaU5CBpMVGVbx3ViuvybzGFdf4T9XA8zVc8XdKRJZtnBUqrwK2hD7T50affi76x
	dk3SgSOIWEa0SrZEv3RRntaKMoJPDIKbvARBAWXgp8R4igF8+rNZ1oJ0l6PjfkOybi15hhnaVCk
	8xsdyNSEnPRJmdrNWz0S9E1Q5cT68mhQpsl77eZDBEmCkdDKCKOEgLxUUrkbPZ0iJVhLvOY1eNP
	Ma94QQ/HczCQiROkfwoGlu0vswo44Dmth2JbFMe4eclNUtG0ltujx+wIvhVqTmy4t7fOBngilQW
	d1Pm5rL6yfeRD3rjZI5+A8C3lIz2T3DQbZT5LKxq7d1iVGsr2BruzBI2093rJpC+hF+DZV8luJx
	oZ1SCuSj+rhbglT13JjjXEG7hvDcTgH+yElbt+FlW/1Ja5mZ1squ4b/mJ3/JY6fQNqF+v81c2vi
	d3F21JPSWbjPjSIuMBakyGcmU+OgKzOGvCgh4deeC3CxbPk7ZdOsrjExzdMuhQVPzaXKs/tioGr
	EUITVkPUMOBoDlTJd4plRr0788Vq0TwH1AwYK80ciovuZ00g+bx8sOj4L0atYtOH1YPENkRBfWp
	1K/3yJ5u1AilIwUWNSphsIEO4XqHNzzayaA==
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr296682935e9.28.1794918304689;
        Tue, 17 Nov 2026 04:25:04 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm26284925e9.4.2026.11.17.04.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:04 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v3 1/3] archiver.bbclass: archive shallow git sources which have no clone
Date: Tue, 17 Nov 2026 13:24:55 +0100
Message-ID: <20261117122457.435864-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117122457.435864-1-ecordonnier@snap.com>
References: <20261117122457.435864-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250439
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original archives a source if the fetcher's
localpath is a file, or a directory (which is unpacked and tarred). For git,
localpath was the clone in DL_DIR/git2, which a shallow fetch (BB_GIT_SHALLOW)
does not create when it uses the gitshallow tarball: since bitbake commit
457288b2f ("fetch2/git: Add support for fast initial shallow fetch") this is
what a shallow fetch does by default, and it also happens when the shallow
tarball is fetched from a mirror. The source was then silently skipped and not
archived at all.

The git fetcher now returns the shallow tarball as localpath in this case.
Copying it would make the archive differ depending on how the source was
fetched, so unpack git sources like a clone, which uses the shallow tarball.

AI-Generated: Claude Sonnet 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass            |  9 ++++-
 meta/lib/oeqa/selftest/cases/archiver.py | 48 ++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0400d6e373..d1a8dadec7 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -204,10 +204,15 @@ python do_ar_original() {
     fetch = bb.fetch.Fetch(urls, ld)
     tarball_suffix = {}
     for url in fetch.urls:
+        ud = fetch.ud[url]
+        is_git = isinstance(ud.method, bb.fetch.git.Git)
         local = fetch.localpath(url).rstrip("/");
-        if os.path.isfile(local):
+        # The localpath of a git source is the shallow tarball, instead of the
+        # clone, when the fetch used the shallow tarball only. Unpack it like
+        # a clone instead of archiving the tarball itself.
+        if os.path.isfile(local) and not is_git:
             shutil.copy(local, ar_outdir)
-        elif os.path.isdir(local):
+        elif os.path.isdir(local) or (is_git and os.path.isfile(local)):
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR'))
             fetch.unpack(tmpdir, (url,))
             # To handle recipes with more than one source, we add the "name"
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 8c5aa75e9b..84f13839c9 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -7,6 +7,8 @@
 import os
 import glob
 import re
+import shutil
+import tarfile
 from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 
@@ -176,6 +178,52 @@ class Archiver(OESelftestTestCase):
 
         self._test_archiver_mode('original', 'ed-1.21.1.tar.lz')
 
+    def test_archiver_mode_original_git_shallow(self):
+        """
+        Test that the archiver archives a shallow git source with
+        `ARCHIVER_MODE[src] = "original"` when only the shallow tarball is
+        available, but not the clone. This is what happens with the fast
+        initial shallow fetch, or when the shallow tarball is fetched from a
+        mirror.
+        """
+        target = 'gitrepotest'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'BB_GIT_SHALLOW = "1"\n'
+        features += 'BB_GENERATE_SHALLOW_TARBALLS = "1"\n'
+        features += 'DL_DIR = "${TOPDIR}/downloads-shallow"\n'
+        self.write_config(features)
+
+        # Fetch to create the shallow tarball, then remove the clone if the
+        # fetcher fell back to a full clone, so that the second fetch has to
+        # use the shallow tarball. cleansstate makes sure that the archive is
+        # created again and not restored from sstate.
+        bitbake('-c cleansstate %s' % target)
+        bitbake('-c fetch %s' % target)
+        bb_vars = get_bb_vars(['DL_DIR'])
+        self.track_for_cleanup(bb_vars['DL_DIR'])
+        self.assertTrue(glob.glob(os.path.join(bb_vars['DL_DIR'], 'gitshallow_*.tar.gz')),
+                        'Missing shallow tarball in DL_DIR')
+        shutil.rmtree(os.path.join(bb_vars['DL_DIR'], 'git2'))
+        bitbake('-c cleansstate %s' % target)
+
+        bitbake('-c deploy_archives %s' % target)
+
+        names = self._get_original_git_archive_names(target)
+        self.assertTrue([n for n in names if n.endswith('/COPYING')], 'Archive has no source files: %s' % names[:20])
+
+    def _get_original_git_archive_names(self, target):
+        """
+        Return the names of the files in the original source archive of the
+        git source of target.
+        """
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'], target)
+        archives = glob.glob(os.path.join(bb_vars['DEPLOY_DIR_SRC'], '*', '%s-*' % target, '%s-*.tar.*' % target))
+        self.assertEqual(len(archives), 1, 'Expected one source archive for %s, found %s' % (target, archives))
+        with tarfile.open(archives[0]) as tar:
+            return tar.getnames()
+
     def test_archiver_mode_patched(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
-- 
2.43.0


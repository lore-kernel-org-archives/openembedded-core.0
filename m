Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11431.1793366543845190131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=HXtIOUKp;
 spf=pass (domain: snapchat.com, ip: 209.85.221.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso391631f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793366542; x=1793971342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKMu/2h78He6JTBgSTzIZ2rGtQcSqM8neGCHEgBXo4g=;
        b=HXtIOUKppFi517gUeHRAcMS7Hr2d5CrsFzzdfhFijSk+Crieq/qeEH5aosnJEWUgCo
         Fee+l+gOR5+SdHnhJ6xgXm0eHwxK6YJa05hXHa08lUKBZj9YIB1qLWlcRJFXmXXO+n+e
         WpKdexI1s7QvsbfmdYKFpSHzxIl570Py+Zyzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366542; x=1793971342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKMu/2h78He6JTBgSTzIZ2rGtQcSqM8neGCHEgBXo4g=;
        b=ynWGBeGiavbepIjEj51mE6PN30C97arni0aAUths21iDLOeTsmMdBkE0UUiqac8vdH
         AW8ukJnZxeTLNbwUCeLvIaVKnt0Dl9DD3Wr2bfYg0DGVG9i96cAfOVH+/IW547VwM/5D
         cudITHDU/J3BiSyUXeo9jhh++4Tx/UAM3vOy6CGSMja0ntl+EEfJbX0fcYJotpHEJm8n
         yvuKdVqFjW2g6apIqK1vFoZkJ+q2yOy3XLyrqDKs9qGYo175V+dQ+YrRFqmAoC7P8VgL
         yjqhO52OihO9mJvkxlQGArL0wBZyU1qUeHI5UHyg67sUB4b08GfKJVDnGMQ2ctG4wHmO
         dSTg==
X-Gm-Message-State: AFq9FYLe+9jQ5BYWrmwJWiFP2pjH76ICF5xsL/8xgW3yO3gXTuoJ1JnC
	OXI6jQhCoMy6K7pBWUMfFmkvWJW1izd0amgjBvfq0lG2MQ0Iarh/VbhgC+V6N0WWymLv2CbENWk
	VWRBrcJ0=
X-Gm-Gg: AYBFou2TY/dfJyurJsRe+s6VCac2ULQ7tbjOnGvUwD+x7A8NNLEQuHn6psD8YYNkID8
	Z5m2gkw3VsnNJQ77FdIb3t4zN4nnLYZ/aWidpvp/mpzGa7OwTCL3LS+noCbuFCQgcdR3f4/LjpJ
	5z40M7Pjzb1mNly8jeHqiv3jDAKlNU5M4n0PvxhCVmCEncdJlG9ET7a49P0x1mmSsp6smDyT+aj
	VN4UGEBA4/TPlrn0w108G0Vt800j89wrhMYR6pd0XW8n3EdwN8xFJF2aHdYJWdy0PznI5r9Fnld
	JrRrEuGgwiuMdwe+j4y5cocCQepFHWKYUPiLEHIGWCA27VcJfTYz0SJPxKjqQLKkkfCD9Ydzg9B
	OCcHSrTYvbq/mYs2snEuoXx5Ng/e4TUI7ZeC4J/CbVUd0Hf1OBspPMeUHn8y9dwET7Jli9CvO0w
	Jv9LUSPGSQA1BdQ3l3aq27qGQxUklhClPl+erKS3nPbzQ0RoDSY2t9E0IPL7rQyR4t5fq/I9VTu
	obEIS6aXs57pTC8bb4pLOmEPcCTP8cOybRA4ntBrtItlSSL720RiqgyChR2pWNC4x5tLOpeYIZl
	m4lOt8zaoDAY7Z1eXrDJJsbSX/ocmoConDejv2iXH+zR5K0Opg9QLklEeL2Nfir836z+KAvP
X-Received: by 2002:a5d:64c4:0:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48e6e3072d7mr5652391f8f.12.1793366541905;
        Fri, 30 Oct 2026 06:22:21 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm3312900f8f.20.2026.10.30.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:22:21 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] archiver.bbclass: archive shallow git sources which have no clone
Date: Fri, 30 Oct 2026 14:22:19 +0100
Message-ID: <20261030132219.2280397-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249038
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original archives a source if the fetcher's
localpath is a file, or a directory (which is unpacked and tarred). For git,
localpath is the clone in DL_DIR/git2. A shallow fetch (BB_GIT_SHALLOW) can
use the gitshallow tarball (ud.fullshallow) without creating the clone: since
bitbake commit 457288b2f ("fetch2/git: Add support for fast initial shallow
fetch") this is what a shallow fetch does by default, and it also happens when
the shallow tarball is fetched from a mirror. In this case, the source was
silently skipped and not archived at all.

Treat this case like a directory source: unpack() can unpack the shallow
tarball. Use the same check as unpack() (clonedir_need_update()), so that the
case of an out of date clone, where unpack() also uses the shallow tarball, is
handled as well.

The shallow tarball only contains the repository, so the unpacked tree has a
.git with all the (compressed) objects, which would double the size of the
archive. Drop it. The .git of a clone has no objects either (clone -s only
references them via objects/info/alternates), so neither archive contains a
usable repository.

AI-Generated: Claude Sonnet 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass            | 14 +++++++-
 meta/lib/oeqa/selftest/cases/archiver.py | 41 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0400d6e373..06ce6443ee 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -204,12 +204,24 @@ python do_ar_original() {
     fetch = bb.fetch.Fetch(urls, ld)
     tarball_suffix = {}
     for url in fetch.urls:
+        ud = fetch.ud[url]
         local = fetch.localpath(url).rstrip("/");
+        # A shallow git fetch which used the shallow tarball has no up to date
+        # clone, which is what localpath() points to. unpack() then uses the
+        # shallow tarball, using the same check as here.
+        shallow = getattr(ud, 'shallow', False) and os.path.isfile(ud.fullshallow) \
+                  and ud.method.clonedir_need_update(ud, ld)
         if os.path.isfile(local):
             shutil.copy(local, ar_outdir)
-        elif os.path.isdir(local):
+        elif os.path.isdir(local) or shallow:
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR'))
             fetch.unpack(tmpdir, (url,))
+            if shallow:
+                # The unpacked shallow tarball has a .git with all the objects,
+                # which would ship the sources twice. Drop it: the .git of a
+                # clone has no objects either (clone -s), so neither archive
+                # contains a usable repository.
+                bb.utils.remove(os.path.join(ud.destdir, '.git'), recurse=True)
             # To handle recipes with more than one source, we add the "name"
             # URL parameter as suffix. We treat it as an error when
             # there's more than one URL without a name, or a name gets reused.
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 8c5aa75e9b..70aa5a4b1c 100644
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
 
@@ -176,6 +178,45 @@ class Archiver(OESelftestTestCase):
 
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
+        bb_vars = get_bb_vars(['DL_DIR', 'DEPLOY_DIR_SRC'])
+        self.track_for_cleanup(bb_vars['DL_DIR'])
+        self.assertTrue(glob.glob(os.path.join(bb_vars['DL_DIR'], 'gitshallow_*.tar.gz')),
+                        'Missing shallow tarball in DL_DIR')
+        shutil.rmtree(os.path.join(bb_vars['DL_DIR'], 'git2'))
+        bitbake('-c cleansstate %s' % target)
+
+        bitbake('-c deploy_archives %s' % target)
+
+        archives = glob.glob(os.path.join(bb_vars['DEPLOY_DIR_SRC'], '*', '%s-*' % target, '%s-*.tar.*' % target))
+        self.assertEqual(len(archives), 1, 'Expected one source archive for %s, found %s' % (target, archives))
+        with tarfile.open(archives[0]) as tar:
+            names = tar.getnames()
+        self.assertTrue([n for n in names if n.endswith('/COPYING')], 'Archive has no source files: %s' % names[:20])
+        self.assertFalse([n for n in names if '/.git/' in n], 'Archive contains git objects')
+
     def test_archiver_mode_patched(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
-- 
2.43.0


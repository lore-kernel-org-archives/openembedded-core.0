Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17571.1793382352412632828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=RjkT06XS;
 spf=pass (domain: snapchat.com, ip: 209.85.128.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so9935745e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793382351; x=1793987151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akEzDyyR0nPyoS65nkff5PGNsxQ7dCLK+1bnMvBuSqQ=;
        b=RjkT06XSfAtIePDCsZwNvBjcPy7oknYWpOYLACqtToSvNrO0rKTvdRmrTCYnN3a9d/
         oc29Dl01KI5GWuKTqHjqm1K67uimHW6+nkiVoP2gBZ4T3vKbQhabpJ83H7yubSDrLIvp
         2iPteWj8HINc4SzgqQ73nTe/IOWPrH5Zm0exs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382351; x=1793987151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akEzDyyR0nPyoS65nkff5PGNsxQ7dCLK+1bnMvBuSqQ=;
        b=1K7lZt2qK3Hk00JrI2YRPU3XWMtl7lwvsXqUHIQOVliCpLBgWVsYczQD/Kv98PbFeM
         Jss5ngPL6z+jQWDwGZc6V6CcHwQxl0EyZAEaVyYrnwL52XksCuNmrUQy7d8GtfIszDFg
         dOYV4FjNAOtPV7NjmC1zmMvqIiB0n8uMvgaJvxyJpXTgDBW/JWWWtr4w0gh9hv2VxgtL
         CipsUsowpXCr0ko5vYa/MQn+4fgD8nqBNUar6AxD0JJ8AtrkIMovpZEgVOEoydV8vkvQ
         u/w1tjGS+47cZK341wOxPIGcTVyZESo5YLHcASly2/1p7nseopyZKmIsViFi5Gkdk425
         eBeg==
X-Gm-Message-State: AFq9FYJYzI4HLraVWIDCZm/VkfttgJB2sRgpexvfvZZhqnZXkESr39XP
	EW6VHnfWttNQhdUPjvDrUt3jx5dQVfHvbenE3VHW6CmXuYiDIGFpUz+aP7+sJd+DvXVqjp/YLSa
	rKecyPMY=
X-Gm-Gg: AYBFou0zvrV/YXE+ahaR0qqxpgQ/RyDn+UlFRpSx272rJpphHpr+vHoGjo1PftKUKhe
	hP3T+0wBMRaTW0i01lt8puR6mivVu1Q93NM0WNo16XIronxLNJh6ucaGkekR6b/FVMKRkqnA4nF
	kGuz1qD6aDYMhtbxcEIm/neqk7XOABLH1toUFFzPLZ3nonqoDbQO0jJf7aNHw1Tf3DbUi9L4Skp
	7zKQv7ePUBWqRG2jQJvyQOprUCK9JAQBLQzBDCB6UyWasre1vkjspWMK1iBjWtMXSHZCfRRRqUA
	gnXKWdd0KQX444eBKXqPPIOZxYfx1HanHYJbAk6e2pgxVMla3e3+f8cZ7oDzxLvmNNJ0VG+dIAI
	pPfsfVJL80I/da41b0N1Zmds4Y48vd/uC8eVtUgCH1dKrK8Sw2bttZLjxhfJHEZyTwufW5ygOhc
	w1+G4xxA326JwPc5pwykLi+jNJ2ar+eJSIYOT6ZZNM/s0KEqRhZRjpTHImAV1XH9zDBb5mkrJ+r
	121uYoYCNtwehFR6IOgxHDTO6Ea3fbpW1HnARWYYu0+kly0t1t70TESZa26AT0/owusZjcNlZKp
	dpTGFiMTn6kWYPf0zyqaRwlsraMME60TlOmyhYO1wLnV802A49qZK2yvZrZosKYrWfTH7IHkdw=
	=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr73961285e9.19.1793382350580;
        Fri, 30 Oct 2026 10:45:50 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm80991385e9.15.2026.10.30.10.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:45:50 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2 1/3] archiver.bbclass: archive shallow git sources which have no clone
Date: Fri, 30 Oct 2026 18:45:34 +0100
Message-ID: <20261030174536.2724008-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030174536.2724008-1-ecordonnier@snap.com>
References: <20261030174536.2724008-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249062
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

Treat this case like a directory source, as unpack() populates the
directory from the shallow tarball. Use the same check as unpack()
(clonedir_need_update()), so that the case of an out of date clone, where
unpack() also uses the shallow tarball, is handled as well.

AI-Generated: Claude Sonnet 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass            |  8 +++-
 meta/lib/oeqa/selftest/cases/archiver.py | 48 ++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0400d6e373..f6cca35186 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -204,10 +204,16 @@ python do_ar_original() {
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


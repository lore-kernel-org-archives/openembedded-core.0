Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17420.1793382354904134540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WDUUXDCq;
 spf=pass (domain: snapchat.com, ip: 209.85.128.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12157245e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793382353; x=1793987153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTYTMWdQDa+If8tLZBpiTnWTn8B3l4VynpUSztSIowg=;
        b=WDUUXDCqD4Br8qnS2QM1+fg/iRRgdcPsB/smjl0mGdhLhpxCWPF9rsmSiOqWm/lq8F
         F5B8NXt2vZQvJ8P+mz6kVbw4okHmrYx1FYRXmeNnQ0VZqwALi25XgcWUJb4v7eju1UKD
         Rfg9rIx9U6bLbIBm8bPpFzQGDWJHVhTuZH2Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382353; x=1793987153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTYTMWdQDa+If8tLZBpiTnWTn8B3l4VynpUSztSIowg=;
        b=RWlIYS+ZRKxtKBB7Io8/SYlakVyvYk7AnzScT3n5AD8bIWcQTtu72/cKD4Nch1WHrB
         L8GKV6UuONny5yeQE2vXKXOummyRydPR+7E2ysmeh629DXdXQwW/9aei9Vf6awf0OQGM
         H43g4O9xdEMhfBRnA5wI+zi+buX6YNDyvpfNVwO902/BPyjb78x2JAB0qJeBRXrgySzR
         Z5ZyNjC+pFAXgDha1u6s4P3e7sNAVBCf5RR0lr2yhEhs+7hv6pQAF6tnh6Fc0tZ7N8gX
         iDnXy6vQ99NKancondjJ/A8h/H0iCaTR4WfRigQ/DsKVfp3x2b40SCSwkvCzDCZ9ML8U
         Kg5w==
X-Gm-Message-State: AFq9FYKdQhX3buy5uhLNks24CPn0kPyu5ezr/O6Sw5nsELi6Je4XG6GY
	t82d4FcX9TCSy9yPGWB328t1X1Ply/YwBgi558QldVQLejnf3viH5fZDj48lva+8TCP211eoJYc
	ZpL0nFUU=
X-Gm-Gg: AYBFou2phiiJzc2UN/pBckQYog4Yhwcj2iuF/BEMAqdB9Ifefr1IfH24Iuc8FndBTyc
	ISIYpRtj8HQ7nvMn2XbGIkKON/lVdkZzfohbD1Zg2hklYIwlNp8O+VcOzL5pvf3RSzW3f3JfdkO
	Lz77EDqUs65ZZ83w42ffnVnG9p4rEFPbg5JASjD7/4t6GVeGP8AyOIMnZ/QpVrsp8K0DQrYt3HA
	xYB+dn1e0K3yGp4RS/dEdiV3O4maFGBuzd8YON9o6ruaUdJKfUYmY7Sod7ibC1Gp4YQ+BoqMJ5a
	XRxnYRbnrz3jY9zHU7greZsnmDfE5StclxqQlIJC+3DJGhfC2eKBSSziLJkMqoKNJP+txD7JzKW
	4bPhnH5Cbxc2xqpgNvWC3wcBzfp2Dly79EtRwTgKidUIkEjPH/+gDloyMG4RLD0InkUqg8F+JMt
	Hhkbc6EXAMdyN2nj7KE+PFG25kafjqvWXFoMbIR8O7pGqT/V/mP+Tlp7yGAotgrUMB0FFHR89Ew
	JMAlg2Naz3/yzEnv7ONy+58XkvuUgPJkDqpv1+ywkxy3vpYLpMVjF1OtIWBlMLuiX1NyKFi11A1
	u4psP4iQUI4+VbtsFBjd2MYsFzskUZsipCffGFZik9oYNwjGZvJEM3fTdjEpggTyiHhmSoKCIQ=
	=
X-Received: by 2002:a05:600c:468b:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4ac182dcb7amr67339075e9.14.1793382353134;
        Fri, 30 Oct 2026 10:45:53 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm80991385e9.15.2026.10.30.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:45:52 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2 2/3] archiver.bbclass: remove .git from original git source archives
Date: Fri, 30 Oct 2026 18:45:35 +0100
Message-ID: <20261030174536.2724008-3-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030174536.2724008-1-ecordonnier@snap.com>
References: <20261030174536.2724008-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249063
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original unpacks git sources and archives the
unpacked tree, including its .git. This .git is of no use in the archive:

- For a clone, unpack() uses clone -s, so .git has no objects, only a
  reference to the clone in DL_DIR via objects/info/alternates. It is
  confusing and still wastes a little space.
- For a shallow tarball, .git has all the (compressed) objects, which
  duplicates the sources and doubles the size of the archive.

Remove it, as well as the .git files of submodules. Keep it with nocheckout
(which bareclone implies), where the repository is what gets unpacked.

AI-Generated: Claude Opus 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass            | 12 +++++++
 meta/lib/oeqa/selftest/cases/archiver.py | 43 ++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index f6cca35186..a6b5706abd 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -216,6 +216,18 @@ python do_ar_original() {
         elif os.path.isdir(local) or shallow:
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR'))
             fetch.unpack(tmpdir, (url,))
+            if isinstance(ud.method, bb.fetch.git.Git) and not ud.nocheckout:
+                # The .git of a clone has no objects (clone -s only references
+                # them via objects/info/alternates), and the one of a shallow
+                # tarball duplicates the sources, so it is of no use in the
+                # archive. This includes the .git files of submodules. Keep it
+                # with nocheckout (and bareclone), where it is the source.
+                for root, dirs, files in os.walk(ud.destdir):
+                    if '.git' in dirs:
+                        dirs.remove('.git')
+                        bb.utils.remove(os.path.join(root, '.git'), recurse=True)
+                    if '.git' in files:
+                        os.remove(os.path.join(root, '.git'))
             # To handle recipes with more than one source, we add the "name"
             # URL parameter as suffix. We treat it as an error when
             # there's more than one URL without a name, or a name gets reused.
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 84f13839c9..d55787cfc4 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -212,6 +212,49 @@ class Archiver(OESelftestTestCase):
 
         names = self._get_original_git_archive_names(target)
         self.assertTrue([n for n in names if n.endswith('/COPYING')], 'Archive has no source files: %s' % names[:20])
+        self._assert_no_git(names)
+
+    def test_archiver_mode_original_git(self):
+        """
+        Test that the archive of a git source with
+        `ARCHIVER_MODE[src] = "original"` has no .git directory.
+        """
+        target = 'gitrepotest'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        self.write_config(features)
+
+        bitbake('-c cleansstate %s' % target)
+        bitbake('-c deploy_archives %s' % target)
+
+        names = self._get_original_git_archive_names(target)
+        self.assertTrue([n for n in names if n.endswith('/COPYING')], 'Archive has no source files: %s' % names[:20])
+        self._assert_no_git(names)
+
+    def test_archiver_mode_original_gitsm(self):
+        """
+        Test that the archive of a git source with submodules with
+        `ARCHIVER_MODE[src] = "original"` contains the submodules, but neither
+        the .git directory nor the .git files of the submodules.
+        """
+        target = 'git-submodule-test'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'COPYLEFT_LICENSE_INCLUDE = "*"\n'
+        self.write_config(features)
+
+        bitbake('-c cleansstate %s' % target)
+        bitbake('-c deploy_archives %s' % target)
+
+        names = self._get_original_git_archive_names(target)
+        self.assertTrue([n for n in names if n.endswith('/.gitmodules')], 'Archive has no submodules: %s' % names[:20])
+        self._assert_no_git(names)
+
+    def _assert_no_git(self, names):
+        git = [n for n in names if '.git' in n.split('/')]
+        self.assertFalse(git, 'Archive contains .git: %s' % git[:20])
 
     def _get_original_git_archive_names(self, target):
         """
-- 
2.43.0


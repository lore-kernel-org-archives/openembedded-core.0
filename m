Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16615.1794918309059322478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=HRXC3JDR;
 spf=pass (domain: snapchat.com, ip: 209.85.128.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so49523955e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794918307; x=1795523107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hH/63JWspZgGNrIfbPrejmS6sbbQDwPKnISV2wmysP0=;
        b=HRXC3JDRRTm5y3xp/qOyaQUMn+CSdTao5+yhghb+3XulDVKBddj0S0WwoOJWQNBFet
         i2+wlUWND6CJkT7hKr1dXI7/t24FOEAW62b9Hcy2Z3BqH69MN/tzAAMA/LAPPeNkTS1n
         2F2/uSlpeFNkOwgNzYmmv5mUAZQVjUBESTMPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918307; x=1795523107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hH/63JWspZgGNrIfbPrejmS6sbbQDwPKnISV2wmysP0=;
        b=0kWMR7X7C/xtNutELSTyfKjMFJwh47E4amxqU0PtcQ1ZX/5rnjoDJ4zohBkDDw0EI3
         sqohQ6VkFy1cMQmG6lVyOdLuNpVI8JKMkUEm6aNPoKmomVtYA7FiCJg48pRCRHQ/Ucij
         O/VVNPQGxSSPeSVp4ZZtW/DXut1EE269Lx+SPtNKdhK2ylr1owIwAzEG038rgJh3ouW7
         6IPb6fpra53xAANZ2PvJiUceiUDnUbZrtakIbK15MvpmaqNyNteGEmIibBwheK64pvcc
         NKHdcXJkXPpZnCYCkXZfyu0ZmgMzdaSxJpeLXIHWZUlQI7aYq8b+15OBfzeVaX45lO6A
         0mMA==
X-Gm-Message-State: APuU4Z+JZZauVLP6Und08zY34wMGfYqpFRheQSNxJ0iEm04iZLv1rJqf
	z18sC+thd8Si4UjTOahktRp251ScPpx9eB4znEqx0LbxrRuvza3XzxN5HPX9I3Snk+ybcrqLoh5
	/cZcXawI=
X-Gm-Gg: AYBFou0mdAlIzmlyYNC6ayufYZOtnhfkAZoNsqDPP/5r7Ahk5MOjXpF2XxICsMz8zLZ
	qo0EkX/XKoPNAF+sLWICzuoAstqy/KWPlvaRphmXxc0zpEQuvtqUxH/nxj/ZKKJfTTRW9rkwayV
	KiRXoSFE3XR/NtmXFQWC/Hgj1xb/+g/T7UFbU5X/N0JkO+XyjROYp4uQp7dlPuC0SxQxcILOXlN
	+3HR8/Nw9/sn5MCVxHBbNWwlHECnXyiaUNaYxAyX0IoLZu6FSW13XHRPnYmjeBF6SVv5YCjn2AG
	XW5eDpXtxbk2gTNy9obaRUh8ixXEarAVMOg4zGnu6FbL0T/UliMsVarbgSQu5eokz00myEm+X2F
	M9Scl18IqA3ov1OanMeyh/AdhkdrQNS7wxuZgC3a2fOVIXAT0LLOft/znjmMMot5EWCaTv0ZE+F
	bGmkWqBCA5YGb810XWDS0Mm8cUPzfAo5lbrefajueRtD+ozC/+/0/0ALHQfTRStrcvxElcIX8I+
	npPBRLUpVv6Xu4s8OoQOZqpdrHHDnr/qD7v8N0dcgDRrqnIXCXysju6a2xp7Dw0e1NbDhjHrG0x
	SSqKSfGpU0rzsQ/OGE/o1A/4k/O2dhF+vmWI+y4v7qLZPiFsHt3r7XcRWblEAhecxOxtmhowVe/
	TNPh0x7VUOvj2Wlw8KZMTab8ZZ9DqCJASXg==
X-Received: by 2002:a05:600c:3b9d:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb5dbfb103mr279010275e9.9.1794918307106;
        Tue, 17 Nov 2026 04:25:07 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm26284925e9.4.2026.11.17.04.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:06 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v3 2/3] archiver.bbclass: remove .git from original git source archives
Date: Tue, 17 Nov 2026 13:24:56 +0100
Message-ID: <20261117122457.435864-3-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117122457.435864-1-ecordonnier@snap.com>
References: <20261117122457.435864-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250440
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
index d1a8dadec7..d22213be33 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -215,6 +215,18 @@ python do_ar_original() {
         elif os.path.isdir(local) or (is_git and os.path.isfile(local)):
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR'))
             fetch.unpack(tmpdir, (url,))
+            if is_git and not ud.nocheckout:
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


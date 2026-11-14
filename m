Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3643.1794686925549986490
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 12:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zjoR/J3v;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2054860a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686925; x=1795291725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKdBYuYtMErKZBzgWkSszVoKKBaaXaVfH5Z3XNe43K0=;
        b=zjoR/J3vTt88EEF8qlMGYbj0/UDEMxtqtx2xr754JHSKTERP2ssvHROVeaOOZLoMPw
         YSDHsoYvweGRLfdVcvp7exHjDOhWg0fv3EWRRcouREBW/5Kwf9x59l3IzI6CbxbsywU4
         6CQTKxKhlAlDevP77EGC+MO5wDJPpfrILagO1vhMg86yMrQC7aWOcTMdicQyDkjUhA1c
         SBIHjjiUuYAcLfDn/4pSCzm8jjEJH8BbTJ3XRXKmccffV5lkGk5+C0h+YGSl3tR6MXE7
         ET/hLReQmgL3YbhlEe48bUkx3NvELjNF2ngUzmg1H+xCn1kHY/Tb0G8A/SlQNgRimFoE
         lZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686925; x=1795291725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKdBYuYtMErKZBzgWkSszVoKKBaaXaVfH5Z3XNe43K0=;
        b=cRHNEES3Sj2coDPIfFMScRZFh5amz3J52EVq4kxvAC7Io9OzwUiAVQ/z70nJ9aq2f7
         t8Agis2gmLoyGRZvDGbLFK9ZQKaJNL+EHR4CB8JHRhwEHluWKGBeTyE0MFMTK4bjn838
         8X4e3sLwLCpx+qqm3f2P/lNhKphJaoTFR60gTGuM/+EmBdFxe7Ui2+pdgA3DZOHtbY09
         QWHqvAjMa0hC+5JEzct0hO4WOAvVMikrS8ooatpeOoU5gOOUUHy8nmqB7pH9+I6JinY6
         l43YQi2C/TLPfxlZIAp4Tykt2kJyGnZAOdu850a9T+vEC9GoY1WD86SiZb6T2OB/JceT
         lSzw==
X-Gm-Message-State: APuU4Z8tXy5pcBKNFWoeMHopoCup0wfw/sC2UT+vlIvULkR+6B9EkCZN
	99VbrnWLB8qT+ljaL1s+be+9WemdBDiXoOZs66lEkpZCvxvIEyMfZBa2l3i0MM3z
X-Gm-Gg: AYBFou24O2MiuFRWAL3fS7xlrH0VEUyucuCZpxQH8x/rewGoM4HduFVCj4BrPc2tBsV
	ius0WYP7euEHtxhwU9KoVJZfDv3zF+Nq+F5A5eswJs5cxZhmd3R2fhaRx/L0repvkb/z3iBLvMu
	r+Pk/zzvFHr44QjgHllfQfr3VtC2R/Hvh4Pefm8wGoGfD4oNi0yMesKBdm4bjYkaFyj4I/URDis
	ug68DmIEYx7siKLXXZcWKgIqNewg/xxOvo9pwcSIteXvNfNC2EY7H7tyC03wVAnFo8Xls44/7oQ
	oTyW0QA3KrB/yDF6XQ+pN2Ev74xn33KNKf+dpMieW9r4+Tq2gH06y9nPlvYtD8GwVWuwnSJ4oUH
	k95aN+mnua9IV95rUY4RoejX1mywRVflNGO5/Tai/f3Pg449AYWINy7dziQOREXh5D8/Zs8y8Ug
	gpYg4qVW0Y6wldxinef0kM7B7ipEVZFacVGprkdOdSmpukgwBz91RjxghwLTC9izD9IwcktJGe0
	KM+lUZu8564J8+7Fu43/cI8JFHhSdX2dPVIentnuTG7HlONBcEVRtuTYUgD4Tl/zx5ck68iM5xK
	tGG3FhEcUCzsOjsbHcwNMg9xdPRdKgXD5eXduZG1m+COa/cN41Y3hYQMy2a7HA==
X-Received: by 2002:a17:90a:e7cc:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3b1b0a1000dmr6423122a91.32.1794686924794;
        Sat, 14 Nov 2026 12:08:44 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm14965358a91.0.2026.11.14.12.08.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 12:08:44 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] oeqa/selftest/oelib: add tests for oe.distro_check
Date: Sat, 14 Nov 2026 12:08:10 -0800
Message-ID: <20261114200810.31078-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200810.31078-1-tim.orling@konsulko.com>
References: <20261114200810.31078-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 20:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250211
Content-Type: text/plain; charset="utf-8"

Nothing in OE-Core uses oe.distro_check any more (its user is the
Recipe Reporting System on the layer index), so nothing exercised it.
Test, without network access, that create_distro_packages_list()
skips a distro whose fetch fails and that Debian style Sources lists
are read from both .gz and .xz files.

Without the two previous changes the skip and .xz tests fail.

[YOCTO #16503]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../oeqa/selftest/cases/oelib/distro_check.py | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/distro_check.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
new file mode 100644
index 0000000000..f47d1dd4a4
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -0,0 +1,59 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import gzip
+import io
+import lzma
+import os
+import tempfile
+from unittest import mock
+from unittest.case import TestCase
+
+import bb
+# oe.distro_check uses bb as a builtin, which bb.build sets up
+import bb.build
+import oe.distro_check
+
+SOURCES = b"Package: foo\nVersion: 1.0\n\nPackage: bar\nVersion: 2.0\n"
+
+class TestDebianStyleSourcePackageList(TestCase):
+    def check(self, url, data):
+        with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(data)):
+            names = oe.distro_check.get_debian_style_source_package_list(url, "main", None)
+        self.assertEqual(names, {"foo:main", "bar:main"})
+
+    def test_gzip(self):
+        self.check("http://example.com/Sources.gz", gzip.compress(SOURCES))
+
+    def test_xz(self):
+        self.check("http://example.com/Sources.xz", lzma.compress(SOURCES))
+
+class TestCreateDistroPackagesList(TestCase):
+    def test_skip_failed_distro(self):
+        """
+        A distro whose package list can't be fetched is skipped, and the
+        other distros' lists are still written.
+        """
+        def fail(d):
+            raise OSError("HTTP Error 404: Not Found")
+
+        def ok(d):
+            return "1.0", {"foo:main"}
+
+        fetchers = {"get_latest_released_%s_source_package_list" % name: ok
+                    for name in ("ubuntu", "fedora", "opensuse", "clear")}
+        fetchers["get_latest_released_debian_source_package_list"] = fail
+
+        with tempfile.TemporaryDirectory() as tmpdir, \
+                mock.patch.multiple(oe.distro_check, **fetchers), \
+                mock.patch.object(bb, "note"), \
+                mock.patch.object(bb, "warn") as warn:
+            oe.distro_check.create_distro_packages_list(tmpdir, None)
+            lists = sorted(os.listdir(os.path.join(tmpdir, "package_lists")))
+
+        self.assertEqual(lists, ["Clear-1.0", "Fedora-1.0", "Ubuntu-1.0", "openSUSE-1.0"])
+        warn.assert_called_once()
+        self.assertIn("Debian", warn.call_args[0][0])
-- 
2.56.1


Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.46640.1609166188274422167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=K4DkrzgE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id j13so6594044pjz.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GjF1TrSiWkwElkPW96cR39m9l/9NDp9AT6i9HSt8ARw=;
        b=K4DkrzgECdAEHYXi3A4DurVSz28aVZwCW6WqmLx7/PTaCOvLKWPoTCyn2KVHwiAEpp
         igd1hnM5+JC1M2k2dr04BQ/1pS3ysfnnBIj71/SIiIOzhLfraTg+K9qnBAeuQvPfPunc
         0V49Vms1wMtKrkswtcw6gcawSX/XP1Wtj86ZndnxeQUuhLmLmdN8C6qzJ4f/YO8qoWUg
         25q+Vr1c7W05b1qfIOiK5U/2fNdnwhS+3UyNzaICgEJtlJXfB/xK/hcwdECDs+W6evVd
         oUoYiSmQJ1jdqbnKmMdbCb2Fz053n0oMe5BkCQV6Ee8RQTfKVvOv2zA905E+lcm5Q6BF
         xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GjF1TrSiWkwElkPW96cR39m9l/9NDp9AT6i9HSt8ARw=;
        b=dkOdR/kzq0BTRmxK4Fbehkz6lz8XMy0o9lfZoflExS3T/6RF4BXYFQw3LZtkTpn6iK
         iELdQvfbwxfWC8dIk2UwHPYKJCdWIq5goC7QkDMYyrPbYbshImi8zSUO3WCXjLizoPaH
         IBkAWzAszaUuKwxD6OlPKG0ydXI3H7Hj/Pv9yBQ8gPSt+4YjnuAe6NKx+2nFWGAGqr8I
         qYtH5hxC+ynBd+yBOQ3Ap2Xd+RRCQ+M3c+ZqEM3o7wHxUmEsZPgHHQ9PzPc0NKl6fex8
         yeRzNf5ijSRVtmwvgYgKgzLFOXhZq1PZR1mUpKnXjeUP39LmwuVZ9zfTV/Yj9UYwMlkz
         l42w==
X-Gm-Message-State: AOAM531ibBVWpEqgAIcG/N1itifOSlx8gJ+2lDkBon1NV57nlh8EHZwD
	bJdCYzqxUNXFBEgrU2+mgFmdpGRo8Kz/k0PLGeI=
X-Google-Smtp-Source: ABdhPJySQboeskVPwBoGy3+oGfU+KtJKEvaJiddNKlgYHAztynGgYw7ULoXUOiRTtLCKTOKjASEuFA==
X-Received: by 2002:a17:902:9a90:b029:da:ba07:efdc with SMTP id w16-20020a1709029a90b02900daba07efdcmr45293313plp.1.1609166187419;
        Mon, 28 Dec 2020 06:36:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] selftest/reproducible: add an exclusion list for items that are not yet reproducible
Date: Mon, 28 Dec 2020 04:35:47 -1000
Message-Id: <89bad5e656a4d7f9b001d6f3a5a112f758b6d415.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Hopefully over time this list will be reduced to an empty one.

Non-reproducible excluded packages are not given to diffoscope and do not cause a
failure, but still saved side-by-side with non-reproducible failing ones to make
investigation easier.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 406bd0d48d8f90e2c836f7d3e204f21d5f13c833)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 82 +++++++++++++++++++-
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 89924f3b9e..181c08b4c8 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -17,6 +17,72 @@ import stat
 import os
 import datetime
 
+# For sample packages, see:
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-0t7wr_oo/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-4s9ejwyp/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-haiwdlbr/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-hwds3mcl/
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
+# (both packages/ and packages-excluded/)
+exclude_packages = [
+	'acpica-src',
+	'babeltrace2-ptest',
+	'bootchart2-doc',
+	'cups',
+	'cwautomacros',
+	'dtc',
+	'efivar',
+	'epiphany',
+	'gcr',
+	'git',
+	'glide',
+	'go-dep',
+	'go-helloworld',
+	'go-runtime',
+	'go_',
+	'groff',
+	'gst-devtools',
+	'gstreamer1.0-python',
+	'gtk-doc',
+	'igt-gpu-tools',
+        'kernel-devsrc',
+	'libaprutil',
+	'libcap-ng',
+	'libhandy-1-src',
+	'libid3tag',
+	'libproxy',
+	'libsecret-dev',
+	'libsecret-src',
+	'lttng-tools-dbg',
+	'lttng-tools-ptest',
+	'ltp',
+	'meson',
+	'ovmf-shell-efi',
+	'parted-ptest',
+	'perf',
+	'python3-cython',
+	'qemu',
+	'quilt-ptest',
+	'rsync',
+	'ruby',
+	'spirv-tools-dev',
+	'swig',
+	'syslinux-misc',
+	'systemd-bootchart',
+	'valgrind-ptest',
+	'vim',
+	'watchdog',
+	'xmlto',
+	'xorg-minimal-fonts'
+	]
+
+def is_excluded(package):
+    package_name = os.path.basename(package)
+    for i in exclude_packages:
+        if package_name.startswith(i):
+            return True
+    return False
+
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
 SAME = 'SAME'
@@ -39,6 +105,7 @@ class PackageCompareResults(object):
         self.total = []
         self.missing = []
         self.different = []
+        self.different_excluded = []
         self.same = []
 
     def add_result(self, r):
@@ -46,7 +113,10 @@ class PackageCompareResults(object):
         if r.status == MISSING:
             self.missing.append(r)
         elif r.status == DIFFERENT:
-            self.different.append(r)
+            if is_excluded(r.reference):
+                self.different_excluded.append(r)
+            else:
+                self.different.append(r)
         else:
             self.same.append(r)
 
@@ -54,10 +124,11 @@ class PackageCompareResults(object):
         self.total.sort()
         self.missing.sort()
         self.different.sort()
+        self.different_excluded.sort()
         self.same.sort()
 
     def __str__(self):
-        return 'same=%i different=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.missing), len(self.total))
+        return 'same=%i different=%i different_excluded=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total))
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
@@ -211,6 +282,7 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
+                self.write_package_list(package_class, 'different_excluded', result.different_excluded)
                 self.write_package_list(package_class, 'same', result.same)
 
                 if self.save_results:
@@ -218,8 +290,12 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.reference, '/'.join([save_dir, 'packages', strip_topdir(d.reference)]))
                         self.copy_file(d.test, '/'.join([save_dir, 'packages', strip_topdir(d.test)]))
 
+                    for d in result.different_excluded:
+                        self.copy_file(d.reference, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.reference)]))
+                        self.copy_file(d.test, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.test)]))
+
                 if result.missing or result.different:
-                    fails.append("The following %s packages are missing or different: %s" %
+                    fails.append("The following %s packages are missing or different and not in exclusion list: %s" %
                             (c, '\n'.join(r.test for r in (result.missing + result.different))))
 
         # Clean up empty directories
-- 
2.17.1


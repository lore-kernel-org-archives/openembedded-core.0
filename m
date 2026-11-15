Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1684.1794713443200514979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 19:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lFDo8P42;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so997950b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 19:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794713442; x=1795318242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpiH+ka+C0qnZgLtsc8W1U1hP9CbLYWaVOM3yMs5PHI=;
        b=lFDo8P42iaz1KSAkcgeTuO8Qj0Z0FjPktefCXNESNzpXjTszCOlWvWHbhGkNKlyOjj
         I1PpGXmDtZYBGqifeedlSFdGesvBZ3cJ1soxkpOeleL/MMsxxBLUFlLl8T0X0Ri4KUsz
         LHwTbGbJqC8/3MYiqtOShyzEeUm2FZc2k4LHRpWr3f+lNeCcdS7A15jwen767jpFXwO8
         jny2qApEzlJdhzh+IDw3i8UzBrcT2vqNf7T0ZrvFntyIsICe5CPU0e/mc4yLjvYdJKk6
         F3fkJ5XBHH7KF1zlnyhF5JAhGcG+hKxO0VXWnWLaohjEz+5deZWcgqGmchxrfj21aWSK
         cChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794713442; x=1795318242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpiH+ka+C0qnZgLtsc8W1U1hP9CbLYWaVOM3yMs5PHI=;
        b=rKzNZbi0f/Ppng1EVMW+mT3JUB73zQy4T/kiiOom8wjc+Md3QJCC1Iegge6KX1RhZp
         AEJyplBh/zquIqkM+YNuRtNb2HhCsB4bIM1PyptbIFslzfYIRXhEz6jWYSFEDSdJU1X/
         B0IcPNhTz8eJdHHD1bHXDKMVFLxcRbrnNyfkfMv/rpQfe6GUWN2KeDr+otxX1cLmxAu6
         cxsRtA078QOV4lZoR44FGjriKHtdv7+e4amGY4fQveGt+lPZeM+n8cnpod8J0kbiWibR
         H7Q+nssJ9GGITZXrm9Ra+soD6IFw4gXzSc3QHkKBWUZtSqc1tzwnShxZQxUh3460sE52
         RDsA==
X-Gm-Message-State: APuU4Z8NAAXPt73fxyJjHyhd41MH7i7igXSUAYklKBhBoDSAg59/rrNv
	VVR7UZFiGc/ud99I37xUMOdbqHH8ZveBqylF2/taDRqxrPtO5vpH/W4pcZJ6DA==
X-Gm-Gg: AYBFou18r2krRiXwmMkTjSbZMMnaFsKXv2gnxlKpcLB9E5w0yghezepRpOZ6PfgNv0T
	6JO4wyJZmIpYiDjskJNG9BzZvhj0wcI2skEU3Jv5KAjlJsFRPNYkMXPDO/hY3lu/MFRTkud4kob
	7DuVvJ9tcWEXbnCnfYPIkm4ePENVTXk1HXoheMZN1Moya09rX9j/LeQFquDzPaxoZ/i0HTG7cGK
	/Zmu7mYOgiAjZ63K4ZBV1MKpqNwqzyKr3VpMLjfLlN5Rfw/kOcw7GFRv7fncORHJPB/VjLOsfd6
	VqloIzmBnSMRFJIUlbf1pTFMWgc9WQsF3DM0ODx5Zraz9db88L8G0ZHBm41wksaTbSEPGFSmw+w
	3s3M33lMoYUYiRshQGX6ruQXkbSQshjS8t5mVTa7dwbzT728eojYu2nVRJdFHaazzXOjctTWhOD
	qcIWPdEDyX1pHxFiKHNarU5gOOdVJCNvChYySlfMMVyCoO7SlNG7ssVdjC17rT0GM73Of+AFmHt
	sMIq9aqbddl4IvSZeGVkNWoAQEHe8zgbmcGxMMM8KjT4I6/128jzZSvIo49UmbjzBSTjwN8fgY6
	1lNboTR0k1Gw8NHXPbUkcIr0cDqDp6d5utXci1lwaejxVkxwBKI5j75MFcT1GQ==
X-Received: by 2002:a05:6a00:1821:b0:8a0:7140:7fbb with SMTP id d2e1a72fcca58-8beb7d1a49amr6396299b3a.51.1794713442370;
        Sat, 14 Nov 2026 19:30:42 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6dbd9sm2414381b3a.27.2026.11.14.19.30.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 19:30:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] lib/oe/distro_check: also list the Debian binary packages
Date: Sat, 14 Nov 2026 19:30:19 -0800
Message-ID: <20261115033018.75976-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 03:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250221
Content-Type: text/plain; charset="utf-8"

Only the source package names were recorded from Debian style Sources
files, but Debian names Python modules' source packages after the
upstream project and their binary packages python3-<name>, as OE does,
so a recipe such as python3-brotli never matched Debian's "brotli",
which builds python3-brotli. Record the names in each Binary field too.

Tested against Debian 13.7: 91775 names instead of 37593, 5316 of them
python3-*.

[YOCTO #16512]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

This applies on top of "distro_check: fix the Ubuntu and openSUSE
package lists, drop Clear":
https://lore.kernel.org/all/20261115021914.67744-1-tim.orling@konsulko.com/

 meta/lib/oe/distro_check.py                   | 22 ++++++++++++++-----
 .../oeqa/selftest/cases/oelib/distro_check.py | 18 +++++++++++++++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 03237804b2..c92468bb64 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -127,16 +127,28 @@ def find_latest_debian_release(url, d):
         return "_NotFound_"
 
 def get_debian_style_source_package_list(url, section, d):
-    "Return the list of package-names stored in the debian style Sources.gz or Sources.xz file"
+    """
+    Return the names of the source packages in a debian style Sources.gz or
+    Sources.xz file, and of the binary packages they build (e.g. Debian's
+    "brotli" builds "python3-brotli")
+    """
     import gzip
     import lzma
 
     opener = lzma.open if url.endswith(".xz") else gzip.open
     package_names = set()
+    field = None
     for line in opener(create_socket(url, d), mode="rt"):
-        if line.startswith("Package:"):
-            pkg = line.split(":", 1)[1].strip()
-            package_names.add(pkg + ":" + section)
+        if line[:1] in (" ", "\t"):
+            # Continuation of the previous field
+            names = line if field == "Binary" else ""
+        else:
+            field, _, value = line.partition(":")
+            names = value if field in ("Package", "Binary") else ""
+        for name in names.split(","):
+            name = name.strip()
+            if name:
+                package_names.add(name + ":" + section)
     return package_names
 
 def get_latest_released_debian_source_package_list(d):
@@ -191,7 +203,7 @@ def create_distro_packages_list(distro_check_dir, d):
         except Exception as e:
             bb.warn("Cannot fetch packages for %s: %s" % (name, e))
             continue
-        bb.note("Distro: %s, Latest Release: %s, # src packages: %d" % (name, release, len(package_list)))
+        bb.note("Distro: %s, Latest Release: %s, # packages: %d" % (name, release, len(package_list)))
         if len(package_list) == 0:
             bb.error("Didn't fetch any packages for %s %s" % (name, release))
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index d783384251..32abba8e39 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -52,6 +52,24 @@ Version: 99.10
 Supported: 0
 """
 
+SOURCES_WITH_BINARIES = b"""Package: brotli
+Binary: python3-brotli, brotli, libbrotli-dev,
+ libbrotli1
+Version: 1.1.0-2
+Description: an example
+ Binary: not-a-package
+
+Package: six
+Binary: python3-six
+"""
+
+class TestDebianStyleBinaryPackages(TestCase):
+    def test_binary_packages(self):
+        with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(gzip.compress(SOURCES_WITH_BINARIES))):
+            names = oe.distro_check.get_debian_style_source_package_list("http://example.com/Sources.gz", "main", None)
+        self.assertEqual(names, {"brotli:main", "python3-brotli:main", "libbrotli-dev:main", "libbrotli1:main",
+                                 "six:main", "python3-six:main"})
+
 class TestFindLatestUbuntuRelease(TestCase):
     def test_latest_supported(self):
         with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(META_RELEASE)):
-- 
2.56.1


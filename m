Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37798.1795369025831165650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=osJYAMeO;
 spf=pass (domain: konsulko.com, ip: 209.85.216.51, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b402824d07so1698783a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795369025; x=1795973825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xn7nZZqS7L/2LxuXtJQbINaw5hcU6SWw8qZ4v4gEOOs=;
        b=osJYAMeOTaztvCvnHaYvWJ4k995Jk1CWzS/P6yWQwdJIX7X4uZ+9lfv1u8/Aj0d0VY
         J4/gIihuxmB9XZAj3idUADcgmfdW77S/dya20nysO9+unbe5vY4BUainkhXCfNjE9o1r
         ppcMCyjgATtlpUiPlnuRbWUBBFDiluvc3PuS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369025; x=1795973825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn7nZZqS7L/2LxuXtJQbINaw5hcU6SWw8qZ4v4gEOOs=;
        b=QQ1sFIGS481ZPU4xG4fBpId4mU6+vupemyTfM6WF2QtdzY9uw3tZhfJONjViPNpph2
         ZEgwRB4hzK+vUfxcstQAqWG6Mk6H/BYTXTXQfDhSESuAY9vOusnJwS9LBpZWNiFAw7+o
         u7W6r86L20OhfwBaGLMdRp4uMazqBVIv+9AiezkvfN6PgL2Ml6nflnPXUCloxIDWtfM1
         ke9p7FHwdYyaCNIPimqFP21mRrvs6skzB5Q/GN/XE5EYi5N2utLUSOTvR3Bgh3/FcWOR
         d/FSUZUlrSR8MxCsNIT8o1CcbxSSjre8c4fAme85J64iTiZhmbWUr9cp2gb0kiVWcNTG
         nkow==
X-Gm-Message-State: APuU4Z/2ykEtji1JngRXOrontk85cHShpp7uI7ob6CR+e2lfWlQ+ozeN
	BOYbhC3apzYzMqgHWjpWA9zmrl5Z1YIQkKRqNg6hV8W1h0eyZgBQlMPXgUSP9p2qS0P7iyBti2r
	sQ7Sr
X-Gm-Gg: AZFdTZde13iO5utJDmFUdwzJEA5wvQ0a6D/WH9GTKFcit74w5aN5Zvu3odG7pxPHmSC
	KfN4PSoGeKJvYV5Qpdb/dSjjaCU6d1osCGlKnQ15op1Sfppw9dhDSchuKermzz/hPG7kffPi7zH
	w8amd9b54XQ5naAJQrk6ZEnakCwyPnQ/sok3Jnt6ZuQyBBd4cxwYOl+MGgFQU8NfS+7z2sIA4om
	Cvg/mIG1+9/MkuS4P7P+53lWj5pmMga70Nm7h+Ao0beey+UqgrH+rb5tghdoefMOqfAsiG3yffO
	v9ELd2CF1BoQ58D9wIXIOwK2z66WuwCmVIuwkheA6O6rctkfv1l0qD30sNwAMdAd4y4dkAaGImQ
	JVDuByfl0DWCN+B4B44HBBacch7M62bOMMKHFszc/OLayElT3x7b+6QElNHI3qgBF9UMS3OELcf
	QmApnlpzNQzhTb+7lTl7AkCdNmEq8uK4JzWnFBGOUb8n6oB2PRypBmlo+J2F1y6egheDdeQfdt+
	wH9APhQchm34kpOFHNe4b7v4iFNsyvBr0GtLD/2BeSt4b1Val8LnF/RzIE8P/O2pAxoTsvYg1sq
	33l7Nam6LZJtn/y7kkQxVM4UNvtt0djT6z3nqCdBOAF8G0LjYAUHh5ashB0vSjnbVMqlGs9OmFy
	AQ4RFZ99WVGpXhEWyeT0XkE+PE3w=
X-Received: by 2002:a17:90a:e7d0:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b41c8d926amr8759523a91.21.1795369025169;
        Sun, 22 Nov 2026 09:37:05 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:6b04:91fb:ab00:ec51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm4091293a12.23.2026.11.22.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:37:04 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] lib/oe/distro_check: also list Ubuntu's universe packages
Date: Sun, 22 Nov 2026 09:36:57 -0800
Message-ID: <20261122173657.2492428-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250875
Content-Type: text/plain; charset="utf-8"

Only main was read, which in Ubuntu holds just the ~2,400 packages
Canonical supports, so recipes for packages in universe (e.g. nasm)
never matched Ubuntu although the same packages match Debian's main.
Read universe as well, from the release and from -updates. The
list for Ubuntu 26.04 (resolute) grows from 3,059 to 40,556 names.

Tested with a new oelib selftest and by fetching the Ubuntu 26.04 lists.

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py                   | 13 ++++++----
 .../oeqa/selftest/cases/oelib/distro_check.py | 24 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index d8e487318c..d83652b487 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -164,10 +164,15 @@ def find_latest_ubuntu_release(d):
 def get_latest_released_ubuntu_source_package_list(d):
     "Returns list of all the name os packages in the latest ubuntu distro"
     latest = find_latest_ubuntu_release(d)
-    url = "http://archive.ubuntu.com/ubuntu/dists/%s/main/source/Sources.gz" % latest
-    package_names = get_debian_style_source_package_list(url, "main", d)
-    url = "http://archive.ubuntu.com/ubuntu/dists/%s-updates/main/source/Sources.gz" % latest
-    package_names |= get_debian_style_source_package_list(url, "updates", d)
+    # Ubuntu's main only holds the packages Canonical supports; most of
+    # what Debian has in main is in Ubuntu's universe.
+    # (AI-generated: Claude Opus 5.5)
+    package_names = set()
+    for component in ("main", "universe"):
+        url = "http://archive.ubuntu.com/ubuntu/dists/%s/%s/source/Sources.gz" % (latest, component)
+        package_names |= get_debian_style_source_package_list(url, component, d)
+        url = "http://archive.ubuntu.com/ubuntu/dists/%s-updates/%s/source/Sources.gz" % (latest, component)
+        package_names |= get_debian_style_source_package_list(url, "updates", d)
     return latest, package_names
 
 def create_distro_packages_list(distro_check_dir, d):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index d783384251..a27be60c42 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -57,6 +57,30 @@ class TestFindLatestUbuntuRelease(TestCase):
         with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(META_RELEASE)):
             self.assertEqual(oe.distro_check.find_latest_ubuntu_release(None), "resolute")
 
+class TestUbuntuPackageList(TestCase):
+    def test_main_and_universe(self):
+        """
+        The Ubuntu list has the packages in universe as well as main, from
+        the release and from its updates.
+        """
+        sources = {
+            "resolute/main": b"Package: bash\n",
+            "resolute/universe": b"Package: nasm\n",
+            "resolute-updates/main": b"Package: openssl\n",
+            "resolute-updates/universe": b"Package: nginx\n",
+        }
+
+        def fake_socket(url, d):
+            dist, component = url.split("/dists/")[1].split("/")[:2]
+            return io.BytesIO(gzip.compress(sources[dist + "/" + component]))
+
+        with mock.patch.object(oe.distro_check, "find_latest_ubuntu_release", return_value="resolute"), \
+                mock.patch.object(oe.distro_check, "create_socket", side_effect=fake_socket):
+            latest, names = oe.distro_check.get_latest_released_ubuntu_source_package_list(None)
+
+        self.assertEqual(latest, "resolute")
+        self.assertEqual(names, {"bash:main", "nasm:universe", "openssl:updates", "nginx:updates"})
+
 class TestOpenSUSE(TestCase):
     LISTING = b"""<a href="../">..</a> <a href="./15.0-Current/">15.0-Current/</a>
 <a href="./15.6/">15.6/</a> <a href="./16.0/">16.0/</a> <a href="./42.3/">42.3/</a>"""
-- 
2.47.3


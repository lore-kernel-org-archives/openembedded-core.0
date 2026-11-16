Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32051.1794847849236644472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cwIAW+kv;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2017870b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847848; x=1795452648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxQIJ/H9ZDA39BejsOkq5bLhL3ZRaynTDcM/9uwmkCQ=;
        b=cwIAW+kvyrQ9hAyrwnSXv4Nj9L70v0rK0uWLBgxS1pA8EJjjzLbYjU8E0cwuMPZdkQ
         ZzaHg2nsYmLFwDhvmCpBL0hw7p8LH4wYGQbieGP9GYj3acINWBC6s9SgxGEtl+AtzaMY
         S4jHPZbJKpLK6cRZAvSpAyo3QKTGuEDrG3xtCkXjc0bl/5lhPEzXoe+IL6QLPUzGdpL1
         2IXoCVnW2jugTrnLePafCgDxtV6bm23CjS8EmLyC3i2syoero85//Dh53RXbkqoJaLky
         QSEUXpLNObAv17+J0+vFw00AxBGkpMCWl8hFwYFeefnywUHvSK6oRKjKzFi6wsKfD0No
         2U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847848; x=1795452648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxQIJ/H9ZDA39BejsOkq5bLhL3ZRaynTDcM/9uwmkCQ=;
        b=smNVRyjHtJ6DAnJBGrhQnZ+RZ/+sjjf+jYZVwVDoMLQDQybE5YQw6VJiDP111ihKSz
         aZIL8dyaxL4zID8sSskZq0MmRSCtf4V36ih4mbRB3Fa17pyfOR92pyt74Mu/S4kpvTIW
         bBBsktC3iSr7XGAhH/1H2G8zSFuaILccZqQqRzbNbWo8htHBpGEUSEKfEudSfEAST9en
         I41y1iHcuvE8o12s2hv1lduIhqD4Ae04UNCKgitVDtOqGXFYhluWQnfBQ+u9Czk2ZLjo
         EBZwaKJmbVMrM77N+LpjruEGVJMRtEufYpbvlET/C4mzpkZJ9jE5z78lUdLuvQgoLv7k
         yYPQ==
X-Gm-Message-State: APuU4Z/Pc3XTJwEzZCss67/UE8JNwAbohm01ZXhfLx3q0kC9JBzx4v7m
	29sYOj3U5MafR7TX3AKeazMFHO+Uel6N46J2oa0Bj0k7wDOtwq0D/+28iWcCBw==
X-Gm-Gg: AYBFou2+dXOuegY5Cmnm7qSvQhlxwUIoeCp1GKu0voPjm1SmA/Qp67ZYH7+21EQHWHD
	qZhZr7wjQXzq9NXvhQAzQsAOqjbtz7CUK34DjfRFuEp3V8o6GzB/qu6nMH+X5ZuwAeSejEGCoFr
	lM9YiCmGPx+DAP3O5cHcUtJb/eCndXSCOISRkldFT5Obp0l4qEOS07jHi3IGKzY+bOKx4zvmDrx
	lxF85VZ5PWg3tv8RBi+WOLE6n7s7/V7/Z6jg/r5qTENdhlxJt+DudYD5W1RnLVmL0J7DcNeNnYA
	Peg48al6q02JvlqxxB96TwzweD4fW4hTMifDNzJxxUt+NTDViDsByw1a6cEgGEJR1F0aey5uF9E
	bEpxsFHQJ4Nk2pMiVi+imZ5mFT//QAA1di1BzAo9o2R1Axr+XDaFdCH6t5zMYHj6ph1frgyfjI6
	KHn2bbxui6zcn8F6MG3lXy+X4+zPzfwVkMyx7WJqNWkrDZaBnwA/goyDTXmuvFFovF8g6Fynyq4
	bkE4Vf8rCEGQW+41G7wrKRG15U59Y9J9d6zhWOqI581rHjJjGOF9B8TkT69hNWJQKgnJTYRiMde
	El+BcBjadYVqYnNG9OBo084yfml8fhU1iguCes8DGPjjgVNSE5a+pM8buWBNng==
X-Received: by 2002:a05:6a00:2918:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8beb5ab49bcmr9604149b3a.10.1794847848486;
        Mon, 16 Nov 2026 08:50:48 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm3974561b3a.16.2026.11.16.08.50.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:50:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/3] lib/oe/distro_check: find the latest Ubuntu release from meta-release
Date: Mon, 16 Nov 2026 08:50:30 -0800
Message-ID: <20261116165032.1829-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116165032.1829-1-tim.orling@konsulko.com>
References: <20261116165032.1829-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250367
Content-Type: text/plain; charset="utf-8"

find_latest_ubuntu_release() asked the archive for its dists/ listing
newest first and took the first *-updates entry, but the archive ignores
the sort and lists the oldest first, so Ubuntu was always xenial. Read
the release list that do-release-upgrade uses instead, and take the last
supported release.

Tested against changelogs.ubuntu.com and archive.ubuntu.com: resolute,
with main and updates packages.

[YOCTO #16509]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py                   | 26 ++++++++++---------
 .../oeqa/selftest/cases/oelib/distro_check.py | 26 +++++++++++++++++++
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 223bed2ec2..814b35b8d8 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -131,23 +131,25 @@ def get_latest_released_debian_source_package_list(d):
     package_names |= get_debian_style_source_package_list(url, "updates", d)
     return latest, package_names
 
-def find_latest_ubuntu_release(url, d):
+def find_latest_ubuntu_release(d):
     """
-    Find the latest listed Ubuntu release on the given ubuntu/dists/ URL.
-
-    To avoid matching development releases look for distributions that have
-    updates, so the resulting distro could be any supported release.
+    Find the latest supported Ubuntu release, from the list of releases
+    that do-release-upgrade reads. The releases are listed oldest first.
     """
-    url += "?C=M;O=D" # Descending Sort by Last Modified
-    for link in get_links_from_url(url, d):
-        if "-updates" in link:
-            distro = link.replace("-updates", "")
-            return distro
-    return "_NotFound_"
+    latest = "_NotFound_"
+    dist = None
+    listing = create_socket("https://changelogs.ubuntu.com/meta-release", d).read().decode("utf-8")
+    for line in listing.splitlines():
+        key, _, value = line.partition(":")
+        if key == "Dist":
+            dist = value.strip()
+        elif key == "Supported" and value.strip() == "1" and dist:
+            latest = dist
+    return latest
 
 def get_latest_released_ubuntu_source_package_list(d):
     "Returns list of all the name os packages in the latest ubuntu distro"
-    latest = find_latest_ubuntu_release("http://archive.ubuntu.com/ubuntu/dists/", d)
+    latest = find_latest_ubuntu_release(d)
     url = "http://archive.ubuntu.com/ubuntu/dists/%s/main/source/Sources.gz" % latest
     package_names = get_debian_style_source_package_list(url, "main", d)
     url = "http://archive.ubuntu.com/ubuntu/dists/%s-updates/main/source/Sources.gz" % latest
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index f47d1dd4a4..7545fa0c42 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -31,6 +31,32 @@ class TestDebianStyleSourcePackageList(TestCase):
     def test_xz(self):
         self.check("http://example.com/Sources.xz", lzma.compress(SOURCES))
 
+META_RELEASE = b"""Dist: noble
+Name: Noble Numbat
+Version: 24.04.5 LTS
+Supported: 1
+
+Dist: questing
+Name: Questing Quokka
+Version: 25.10
+Supported: 0
+
+Dist: resolute
+Name: Resolute Raccoon
+Version: 26.04.1 LTS
+Supported: 1
+
+Dist: zzz
+Name: Not supported any more
+Version: 99.10
+Supported: 0
+"""
+
+class TestFindLatestUbuntuRelease(TestCase):
+    def test_latest_supported(self):
+        with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(META_RELEASE)):
+            self.assertEqual(oe.distro_check.find_latest_ubuntu_release(None), "resolute")
+
 class TestCreateDistroPackagesList(TestCase):
     def test_skip_failed_distro(self):
         """
-- 
2.56.1


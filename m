Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1064.1794709174000554785
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 18:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tkyG6bw6;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso787729a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709173; x=1795313973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxQIJ/H9ZDA39BejsOkq5bLhL3ZRaynTDcM/9uwmkCQ=;
        b=tkyG6bw6pP/JUvwo7kENg8CeS++1Y4wLCUH8tdNQGrrWkHz1i6dzG01h9Ew5WmyZ5Z
         Ed+5mIHfMETCQCfeQnlRUlLynOXcazIOwrFMeYbB88gdKOdcrNZlDt7V++Zgc/lVYSjD
         L0wYCt7S8CtNg9PLfAKHyeXRjUyzCFn6OcaBADUoT8Sx3nuYgytrz+iEDy/7VWJMQW7A
         XxVBBw6gcwHlmUVynYh3U31ZNE6sPZxRZsdzxwEfwaiNphqIFNqaD0bqwmGlQ/ZobeJ9
         o6+IsI8PfonxRR+eJIP8SHlZmT5nyLB3O9XN45/uf0PBM3HFi3qBghCf4YwkEQ44nK7/
         WjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709173; x=1795313973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxQIJ/H9ZDA39BejsOkq5bLhL3ZRaynTDcM/9uwmkCQ=;
        b=UuMnrKPd4Ox32v0Srlg2mgY3wEwEj6V4Aj0/6N8PYUQecVuk5fLw7NMZjnb4y/W4eH
         8mZoGj6GWIk8svVtLPGTb7hGBrxyaXInOh3CROaTUVf6ona5DWKIAQsYlvdoYalBQYqb
         8ZUxjOoVlbRH/7i9AHOzYMrlR3efEA97qg/JqUt+TWoIYcxkcZ+f8Hpn/7QXF0THkYvQ
         s/ipQtaLDGLHtJkbCR6cWFT+O+uOGtzQ2jnv5RzMuLCIl+UWzzlsn461PbzKDm8DfLh9
         Nv56g8ONuGC3NsWeRwFb+YmOM6pIxTohpiCi05MsALnhM31S9l0ylvoEOpoP5He7sUOY
         jCmg==
X-Gm-Message-State: APuU4Z94K0hcFOOtMl+AAIJP4Itn2UAaJ+XX+SWsilAiv7wq0F38Ho4L
	Ri0X/paf9L5ex6w4dWP8Fm8sEBQB5tPOcbMk2v/ORknLxCW0j1sqlNbkbuaAYQ==
X-Gm-Gg: AYBFou3UVLP3jzXuJIgMuNzOKwX9bKBdU+I1yFdRFlf9FwC6HpxinwrNaS41BzWksdr
	IbzaQtozRYl3oZrXoIezWjtwLFEQxJYOH0ApKSMDeHOqer2ZQMjrdm+Pbe7WJjkmLatgGp8St/K
	JEatY3lPOvchnGIHigBjFAjv33VWEoaJViJfTmQg+RzkDx0gAns6LDe4d5McIPTwJvKJFLsncZ0
	AO57LpvrvcsVkDOvdXk4ZD1rbuhjjp4xFDgsHRN0jLfc2KjnqUSI3s8kFMCUwn3Wxsi+5efO3q/
	v6VhWmeQkY6KElUOrfKWMrC9UtsMckXBqZm0AGAfjqLD2Kt/VzZqgVcO+7ZRHKT8smnv8GI3JgH
	tGJ4iADDRpOY/vEI5HSeEtQavWFyYNLKwzrDSU/JA5GwiUrLmMyKsrvDl8HLij71sVv2N5rroPQ
	rfIHZ2jQY9ZtOIlO6nKd92DzMtskAxLnkNLW9qi37TgIFs262OfOKq/tRgxNRVLRS2i6rwDm7HY
	Wo/5Fv++nAV91A+VZBCWFd7A1IxB390W0jzBFTtPhfHovfDmu5dvkpX0M6/7Cm+hSLRQv3YEAGY
	X3UtvZKUgJ2jLwQ+xRnoeweND9wWz5OJwuo7TWo+gYX43MkI178T0xRyjFmGW7ogGwywwWrP+Hf
	WSZk4FPc=
X-Received: by 2002:a17:90b:5910:b0:3b0:aaed:48d0 with SMTP id 98e67ed59e1d1-3b1b0b4d0d0mr6044381a91.37.1794709173259;
        Sat, 14 Nov 2026 18:19:33 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm15651545a91.1.2026.11.14.18.19.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 18:19:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] lib/oe/distro_check: find the latest Ubuntu release from meta-release
Date: Sat, 14 Nov 2026 18:19:12 -0800
Message-ID: <20261115021914.67744-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115021914.67744-1-tim.orling@konsulko.com>
References: <20261115021914.67744-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 02:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250218
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


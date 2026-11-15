Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1066.1794709176870045690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 18:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qnhQdcgT;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e977109392so12788815ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709176; x=1795313976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHJFeKPh9q+8Bgo7YqhSwhLPT8bJoyiRvshXUshE0KM=;
        b=qnhQdcgTucX5iIJE/3A6F/7pypcrj7zZkq2tL4r55uEIFP4RTqmMAVBo218yNPM657
         W/3Mga5ZZL1XAXmOdWm28q7FWzH8qO0cSU66XqwDLZ60zpQeJaFjNEh5var3Nbv8+eM0
         aoXdpwUL5C/cCWVakth0Ntjjm0oAT2xvVG2f0hkJ6avhCVcnMhGIimRQvaiZst1UstZV
         gDmDXSQW14L09Bmh1KGCCxIcCJOCbLva1jmxbVtdQ+qbN1bhiRHGNqQKZfmyfCTgEcOY
         7Fyprnr+d1N6Z/JUoGxGkVYre2bf0ZRaQQLpcOHmNhhgV5adcUAMgMwZ0HebvcM8x0En
         h+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709176; x=1795313976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHJFeKPh9q+8Bgo7YqhSwhLPT8bJoyiRvshXUshE0KM=;
        b=b2yJcMm8L1nTOSmvZycvZdo69x+u43sRDhJQuZFHtSsjs5QkzgBYgV08lr/zl+wEK5
         wwSfMp8eC+LUrQILIVUlwhUffvK337cpmHYWcs1QSl//04EV/B7uZ3oA+aV/xJd0Ui7I
         tYF/3ScQWqT+xtTBRlJ8QJ4pYci+z0awgS+Vh9A+zYHRvGBXVbpSu+t9mcPvx9knUTxc
         MKF+5YTc/fJzBKInhl0y8wC8VBV4Q/By5jm/VezH762UG5iIauKKCE9kWIMtNhveRqLu
         xiKciIx/3JOhBdZGL0B65t9/nvz91i7/gNYBUcN2UvNjBwgVUsAANPnuiUloUKlX4IJh
         klog==
X-Gm-Message-State: APuU4Z8vJGkVnn5+KF+OgDdUqBP/LPIMDunsB8ffwwtHW0dAWTxuptnG
	EY0AfsxxSScPz+cYO4kfp3f+GI3rB5rX2cEFy0+VSZEameQE5NniOszs883ZPA==
X-Gm-Gg: AYBFou26ILZfUAq71TDJ8gR/ObngHm/VZhbmWYVzZOaqJvh3ab8qIbmbgTa9BoiTn5X
	A1ECFNJhlrpaAApq8nEQKJvWz7NHBfOcM+674gyJYbpSQj3h7CCcJ2MlDnVlG1/lnlNsRDjfMDk
	pGUn088aqkqHC/MqcD0YsacqUIpvKtWKktY8sHzbw/buHTQ1H5WQuFyvb0Z3xqGIDSrTjCsulH/
	iIQVV8O+yAMhvp2vY/uCwJkqsGEUPHwP6K0j936biJ4Wd2cvI5F+xgs6Uod5HjHND0lCSeWgpiV
	oDeLJOgRkUEXGwjEooGDz60TTxzmW6DXBBF1ophx424XXQyCOQREra7XWI0/su/5xjQwfT3TGVv
	Ix4pQambXhVR4GJVfXdlp4M5Vygy531QpBo/TLNbdiBa3XWMiq3rnc8Sncp23xaXDCsEKzJqoXo
	QgEyUXqVIyfCiRSxvRyq/UBABIXYNQizGMdDfhU7DfoqhpoUB9aWogCko/1yvZi5iromCx6onQm
	w3UidKITH5SXeEw4sqvT+dEU38RW3CmsvzqQDwaKGNoxG7wrXITIC7Vck0lt4TISpqW7MUUgL3P
	smOO0seTURID+N8fzsHxmwpzdyt5SAAJH6TwFoknxiKcX/DB0T+XwS0896uFPg==
X-Received: by 2002:a17:90b:498f:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b1b0b86af7mr6271692a91.57.1794709176122;
        Sat, 14 Nov 2026 18:19:36 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm15651545a91.1.2026.11.14.18.19.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 18:19:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] lib/oe/distro_check: fix the openSUSE Leap package lists
Date: Sat, 14 Nov 2026 18:19:13 -0800
Message-ID: <20261115021914.67744-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115021914.67744-1-tim.orling@konsulko.com>
References: <20261115021914.67744-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 02:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250219
Content-Type: text/plain; charset="utf-8"

download.opensuse.org's listings now link to "./15.6/", which
find_latest_numeric_release() couldn't parse, so the Leap URLs had an
empty release and failed with HTTP 404. Accept "./" links, ignore Leap
42.x (which came before 15.0), read the source RPMs from repo/oss/src/,
where they now are, and allow for there being no update repository, as
for Leap 16.

Tested against download.opensuse.org: Leap 16.1 is fetched again.

[YOCTO #16510]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py                   | 30 ++++++++++++++++---
 .../oeqa/selftest/cases/oelib/distro_check.py | 19 ++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 814b35b8d8..e37599c5d9 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -22,7 +22,11 @@ def get_links_from_url(url, d):
     soup = BeautifulSoup(create_socket(url,d), "html.parser", parse_only=SoupStrainer("a"))
     hyperlinks = []
     for line in soup.find_all('a', href=True):
-        hyperlinks.append(line['href'].strip('/'))
+        href = line['href']
+        # Some listings (e.g. MirrorCache) link to "./name/"
+        if href.startswith('./'):
+            href = href[2:]
+        hyperlinks.append(href.strip('/'))
     return hyperlinks
 
 def find_latest_numeric_release(url, d):
@@ -84,12 +88,30 @@ def get_latest_released_fedora_source_package_list(d):
     package_names |= get_source_package_list_from_url_by_letter("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates", d)
     return latest, package_names
 
+def find_latest_opensuse_leap_release(url, d):
+    "Find the latest Leap release on the given url, ignoring Leap 42.x, which came before 15.0"
+    releases = []
+    for link in get_links_from_url(url, d):
+        try:
+            version = tuple(int(n) for n in link.split("."))
+        except ValueError:
+            continue
+        if version[0] != 42:
+            releases.append((version, link))
+    return max(releases)[1] if releases else "_NotFound_"
+
 def get_latest_released_opensuse_source_package_list(d):
     "Returns list of all the name os packages in the latest opensuse distro"
-    latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/leap", d)
+    from urllib.error import HTTPError
+    latest = find_latest_opensuse_leap_release("http://download.opensuse.org/source/distribution/leap/", d)
 
-    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/leap/%s/repo/oss/suse/src/" % latest, "main", d)
-    package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
+    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/leap/%s/repo/oss/src/" % latest, "main", d)
+    # Leap 16 has no separate update repository
+    try:
+        package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
+    except HTTPError as e:
+        if e.code != 404:
+            raise
     return latest, package_names
 
 def get_latest_released_clear_source_package_list(d):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index 7545fa0c42..7add8d70f9 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -57,6 +57,25 @@ class TestFindLatestUbuntuRelease(TestCase):
         with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(META_RELEASE)):
             self.assertEqual(oe.distro_check.find_latest_ubuntu_release(None), "resolute")
 
+class TestOpenSUSE(TestCase):
+    LISTING = b"""<a href="../">..</a> <a href="./15.0-Current/">15.0-Current/</a>
+<a href="./15.6/">15.6/</a> <a href="./16.0/">16.0/</a> <a href="./42.3/">42.3/</a>"""
+
+    def test_links_relative_to_current_directory(self):
+        try:
+            from bs4 import BeautifulSoup, SoupStrainer
+        except ImportError:
+            self.skipTest("bs4 is not available")
+        with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(self.LISTING)):
+            links = oe.distro_check.get_links_from_url("http://example.com/leap/", None)
+        self.assertEqual(links, ["..", "15.0-Current", "15.6", "16.0", "42.3"])
+
+    def test_latest_leap_release(self):
+        # Leap 42.x came before 15.0
+        links = ["..", "15.0-Current", "15.6", "16.0", "16.1", "42.2", "42.3", "42.3-Current"]
+        with mock.patch.object(oe.distro_check, "get_links_from_url", return_value=links):
+            self.assertEqual(oe.distro_check.find_latest_opensuse_leap_release("http://example.com/leap/", None), "16.1")
+
 class TestCreateDistroPackagesList(TestCase):
     def test_skip_failed_distro(self):
         """
-- 
2.56.1


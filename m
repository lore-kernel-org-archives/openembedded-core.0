Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32648.1794847852411220952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pYRCWunk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b2f59de176so4068865b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847852; x=1795452652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orzU68MGDCCuaKvQk8PKaKqaPrJAEhezmVmnBZA4nwE=;
        b=pYRCWunkH20Jg9/Z+BpQAzHki9vAbx7wDebbeG113RvffomKyesF2t7gWy1WmXqHkr
         LpRE9fhh7naADMlmwu0ORPM8Zj8N9FcoRlpgW0aUFgwSYuZxG4ykdQHueT3uYdDYLryM
         hMBsQGtZoI4vSSk4AiBUYzRhulkFd+C5XqCcpL9zXitwSRR3XjMaUTutFmQT9QW0h0Pl
         S9hcVH2XKuyXTi+htKLIX5SPWkKHJFTGUirhU0kw6mybAi/wCUOD8iQ1kko3XFGsG2NS
         ijdC7zhXMhXr+fq2DmsdsDAx/20NYmYDr2MsNdXoC6/fSCvHPyN9FWi4fQ1nWzEV3vBP
         hVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847852; x=1795452652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orzU68MGDCCuaKvQk8PKaKqaPrJAEhezmVmnBZA4nwE=;
        b=hp/rGCfAeRiesqyEeQrn3wVJT9rpc5XJdP63yCN5zkC+85Mv7SEMMEHdeJarCPPfpv
         GSNN2mmE7DXiXHXK2p8EGa17T06vTetzYu0eMdYhwES5Kg79S2P3JmerhO9dmBFNd+T4
         AgvctH6J4v7i0Bt3FqdzXkYLFHKoQiLTVv6qsZsOiOYUuFzCJs2pY5l7rSTCfmwSMQ3G
         a/lMPTr7jhL2qA/xDbqCfCIwjc9jq7osSQazWEHo8IIixJExNXUZHHthtF+orS4Yst7n
         /hjY+V/MgeGD6Dyzg0Ucg5A/wquOdNuLjB6T34NntrLz8IBBFyerrFMzN0SI26nx+A64
         xKpg==
X-Gm-Message-State: APuU4Z+nu/oeMt1ahYW//UC2+d6tKSV0OkUJjcfTK42Z7BJQpcicFPyo
	EJ7Sk3XXDgQBpyARjEUp+FQA/JfIt+EvYBOea5o9lsgkv3TRxCmZiLYvKga9iQ==
X-Gm-Gg: AYBFou2fB5XsYEfUIJitpPyxxgQIdDm9e7HkexavGFaQsuRfeaSMtUYxMGJJcoOWnnu
	8UN1joAF9b5HaG3sl6Px/50P66jUGIMIgnQw/pA4oQRFPMAWCrVzOCior3cXhAYmbr6jBggVP7q
	MudTr6VFt7SFZV19JtjjkoNWPRU8OgpOb1bPQw8Y++f0c7OXi21lzdLdBoMWU6w7MPB0v3efg9J
	LplXSmDmj7EBP1XHPLFyDbkDwveXhpFHYq2SBfqESErs07Cqe6UVQ18Qh5qjNpAaFb85mFE7ddv
	qqfeWs8sl3uXHD2BtgxffnZ/VqJlXV70RUaqJuYkpT2xaH4AqOOLMQ80hcmMBzdxyfpEKfJCt93
	Y5BCWbU6xcLv5GrJ1Q14wzAYBisicA2ius29B+JV852e8eQom+Otrnry/d6Cmurhv+JM0fGEbAZ
	PZsdGNjTc7BLouRZYnbSoUFOEl9jllzhXkpyYVmXppeDPxUbHIwK4+9Rm6I9hMiqBwjEgbcQpFf
	nEpBpCRZ+2cY0XhhQRdY2fmBzmgCol3VyJWsDPdA2By59p6q39Bs6ogzNw5qfRJufFT7Xfoec+Q
	ZgBh4a6kmrYC5kPCt/ejQne6sVq0XBARLlPUIoKg2t4jP3IzOTTj128DPPWNNg==
X-Received: by 2002:a05:6a00:1a92:b0:8b1:e8dc:c894 with SMTP id d2e1a72fcca58-8beb20cec55mr10256526b3a.5.1794847851726;
        Mon, 16 Nov 2026 08:50:51 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm3974561b3a.16.2026.11.16.08.50.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:50:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/3] lib/oe/distro_check: fix the openSUSE Leap package lists
Date: Mon, 16 Nov 2026 08:50:31 -0800
Message-ID: <20261116165032.1829-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116165032.1829-1-tim.orling@konsulko.com>
References: <20261116165032.1829-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250368
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
Changes in v2: use str.removeprefix() for the "./" links

 meta/lib/oe/distro_check.py                   | 27 ++++++++++++++++---
 .../oeqa/selftest/cases/oelib/distro_check.py | 19 +++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 814b35b8d8..b5c05a6765 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -22,7 +22,8 @@ def get_links_from_url(url, d):
     soup = BeautifulSoup(create_socket(url,d), "html.parser", parse_only=SoupStrainer("a"))
     hyperlinks = []
     for line in soup.find_all('a', href=True):
-        hyperlinks.append(line['href'].strip('/'))
+        # Some listings (e.g. MirrorCache) link to "./name/"
+        hyperlinks.append(line['href'].removeprefix('./').strip('/'))
     return hyperlinks
 
 def find_latest_numeric_release(url, d):
@@ -84,12 +85,30 @@ def get_latest_released_fedora_source_package_list(d):
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


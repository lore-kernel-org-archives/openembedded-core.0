Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32053.1794847854936531170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TswRFCmJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058315c79so2030286b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847854; x=1795452654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAaoIdOPq16BftmcX4ia8osuUbzZkHU0Se+tz/kqG74=;
        b=TswRFCmJBWpSb779mgOFuhvJKZKh7Qd3NCrX3j7ModVV+YxnNPZLHwwcxj89hHk9r9
         R44hWmeX0UVlugT3/TeX1Tg2MoqDSRy96juTjsprKULccjJaMdGl5EHBWWDsKU4kKWQ1
         fPHao6rnOSJNLTkKXH56ZdzKAoxjZlXgOM4HI/vOydRryn3/p+KjRwKULF9wlSOUddm3
         g+1VpQHDW2c6BZ4LRCPlqM9kebFJJivaExqZyYTF6OXxzK7j46XQQoR7CvRK10aH4Q3V
         ZBJoJuLmccCpFsGrtwJzmw4OQJYTt9rD0a/qJ0fkglHOWzVsUvLyx6rpa2ZPgQeNZE9H
         wrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847854; x=1795452654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAaoIdOPq16BftmcX4ia8osuUbzZkHU0Se+tz/kqG74=;
        b=t38IdOVuPsoRumAzVd329vYJVz+TS4reuG8Icee/LJ+1d3XAVkOQk/bzgYzhbAGcul
         d32X5W/5FMQ44Z8fpNvGpjk2ip3G8kqgfh9xfaQgK4mOC4akvR8wSxVxtK559SKLiWC4
         /oT/F6aT5gLni1ZZ82mv5GQKOWe7PDJBiJ6h2irVub7RWmoVenafGusKsCER4V73i+q4
         n/uawPfipHIl2SPWVqXWTHkvEYoyApiBS9tCZPFx4Mw52OWG2LhY2n/tbaVb4NAFtAm4
         Ukf8iiYk+cyrG4KbGrN/hHxu+1jd9S1bfYNl1SKk7AFSFmkAokoPGyI4WSF+1YiAkZq1
         Y9iw==
X-Gm-Message-State: APuU4Z9oAjR6Y0nWqRdK88yJLgH6F72t96MmePm1Ak+IKe7wO1AIAvf3
	D1ixcaf9OYzxq1+AYgH7NhtghIPJnpmCow8Su2TeAFR7QLoYNzHATZ1VZ1BCRg==
X-Gm-Gg: AYBFou1DosahiUq6El8BJonO8VWApoYfhqijVBYEN0KZx9Gw0pj1wOW96oXt1n6gI/S
	TUBf7wl/GwEZwyAg+HSao6sRlEZoMY3AHOl/7UjfjXb/ShOR/lhEXv7wmSuo6NMS0RXELxq6ItS
	Wtfhj6P7Ab6953u+Btv43wyLIoOC/R7/VSrn8MxHF2X75w7DOdvTljnkHo5bjjtp/eKQgSE3xkr
	V7I7rr61wk3ecHxDDN2gUi9jIrKWPkAKhX/0Vy3IWb7FuDfK7isn/DZtxe5b76MTVTh0FzYrnxS
	Tg4n1Rcx3iJ/ud5TPRLm05WjYjQhW0iyTGIrviW+/7M18D9xsEBPBcSTnaR+Z0dHX1D+hLkS3uT
	yBNjNi8qCqM4F5ZNGueDcTVvTG1bDSeruCW7BNyD4R1n8HWuibGOS1FILKtzl5ZebunRxY9q73s
	HiSrh1pQK1a7BSZ3MkVLfPMZzX9XKnaH2BhWWtL5Sr8/UiZWIjDK1hwuHUJSt8ok1H3H+0rf9Rx
	hFY2QIG9Fl3gx/b+taCFZS8xU8j/EFpu9GQVlb9UM0e6hpmYuYG13ogC1AWQ7206s0dwffXKg1C
	f+S0jNph+6u79Q0x2O0VloOZ/CWN3sBR6mbVn7vAWQcNqrBPHR1fzE/v8/qutg==
X-Received: by 2002:a05:6a00:340f:b0:8b6:400d:7cc3 with SMTP id d2e1a72fcca58-8beb6198e25mr8971299b3a.27.1794847854138;
        Mon, 16 Nov 2026 08:50:54 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm3974561b3a.16.2026.11.16.08.50.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:50:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 3/3] lib/oe/distro_check: drop Clear Linux
Date: Mon, 16 Nov 2026 08:50:32 -0800
Message-ID: <20261116165032.1829-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116165032.1829-1-tim.orling@konsulko.com>
References: <20261116165032.1829-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250369
Content-Type: text/plain; charset="utf-8"

Clear Linux OS was discontinued in 2025 and download.clearlinux.org no
longer resolves, so its package list could only ever fail.

[YOCTO #16511]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py                        | 6 ------
 meta/lib/oeqa/selftest/cases/oelib/distro_check.py | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index b5c05a6765..d8e487318c 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -111,11 +111,6 @@ def get_latest_released_opensuse_source_package_list(d):
             raise
     return latest, package_names
 
-def get_latest_released_clear_source_package_list(d):
-    latest = find_latest_numeric_release("https://download.clearlinux.org/releases/", d)
-    package_names = get_source_package_list_from_url("https://download.clearlinux.org/releases/%s/clear/source/SRPMS/" % latest, "main", d)
-    return latest, package_names
-
 def find_latest_debian_release(url, d):
     "Find the latest listed debian release on the given url"
 
@@ -185,7 +180,6 @@ def create_distro_packages_list(distro_check_dir, d):
                             ("Ubuntu", get_latest_released_ubuntu_source_package_list),
                             ("Fedora", get_latest_released_fedora_source_package_list),
                             ("openSUSE", get_latest_released_opensuse_source_package_list),
-                            ("Clear", get_latest_released_clear_source_package_list),
                            )
 
     for name, fetcher_func in per_distro_functions:
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index 7add8d70f9..d783384251 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -89,7 +89,7 @@ class TestCreateDistroPackagesList(TestCase):
             return "1.0", {"foo:main"}
 
         fetchers = {"get_latest_released_%s_source_package_list" % name: ok
-                    for name in ("ubuntu", "fedora", "opensuse", "clear")}
+                    for name in ("ubuntu", "fedora", "opensuse")}
         fetchers["get_latest_released_debian_source_package_list"] = fail
 
         with tempfile.TemporaryDirectory() as tmpdir, \
@@ -99,6 +99,6 @@ class TestCreateDistroPackagesList(TestCase):
             oe.distro_check.create_distro_packages_list(tmpdir, None)
             lists = sorted(os.listdir(os.path.join(tmpdir, "package_lists")))
 
-        self.assertEqual(lists, ["Clear-1.0", "Fedora-1.0", "Ubuntu-1.0", "openSUSE-1.0"])
+        self.assertEqual(lists, ["Fedora-1.0", "Ubuntu-1.0", "openSUSE-1.0"])
         warn.assert_called_once()
         self.assertIn("Debian", warn.call_args[0][0])
-- 
2.56.1


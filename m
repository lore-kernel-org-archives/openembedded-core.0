Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1000.1794709179573814094
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 18:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cjbkapgc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e946155442so28212895ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709179; x=1795313979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWhlih1UIGEC7C8IHNZPd4lwkm+odTxWgMQ0Hmrhn1E=;
        b=cjbkapgcq8BO34dDTU7WRGSwAQV5ccYMO3hS/3RMK4k989XSzFjEC7NWZ5jb4ReGCM
         sPsinSb6/Cqq+ml3V395qiJ07yfJ1MOU0JrdgAlmm4qqdV5gDFYK3lE1HxBh/CQPvbjN
         5XxCgXrrjRQeY8N73S3ttTXtiXJrDtGFvD6Ehrhe9Z8ODnt+XvfZ+0I7sy5vNcAiAdzo
         jxQPOot0H4egYni8YePiekFbxpslq/+pQRAFRAgkdI1gf5WbgO1C9IX587jQVgqkHgi0
         KWUG1P4k+1VLs2w2uHuBVvPNwpXMgdMUBJDw0MFO9Gks0bO6oqkaCewBqYSbJf0j6IGX
         FK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709179; x=1795313979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWhlih1UIGEC7C8IHNZPd4lwkm+odTxWgMQ0Hmrhn1E=;
        b=SaOPpzU1Shj4gejdYCnBJsTppY3aJxZBnO2d0J37Nzc59lbkWCpX8ZE4a479Z3uOGt
         dm3hzhkH42/AX7ExsJ/nLHUZuFY2U/IOP10c44JRj5UDHpU7owwAdUpne7p4QV3hxnl1
         NBJZjFdUs7yM+uRCRSw53epL1SUEiXH50QKV0vqC30AThFNL7pv4a0orZDyeCwjiEfOP
         wqRzFLmJrOV5OcB6VOLwrck1m4haxEL0Cvxelju3rv1Axgi8teGaZoyFqTfxmGvoHdMm
         5yDkv+Lz4zbilJ+7EJBH4eDVKQA1F9VmH/k7V5aJYxu7Xy1XQsu08kruZsAF2O/Lndz9
         vLUQ==
X-Gm-Message-State: APuU4Z9ELjvwIUlzzGFP8mpQ1R92W8OMaSHycmxk5Xv7zfUxj8z3xeQ1
	NNNw0YRJjIR0lZBtSzpJMFqJBLZz0JxIyEZfSlfGuIkiFcx/Q+zmpapx+OOv7g==
X-Gm-Gg: AYBFou35aEW5fv5TsuhGVUUmYykWF9iTtGD8mTMf/yMAZlabXNzLF+M2b7k5TSoOlOJ
	1cKI4bOdZkmJPJRjo0ay0JpVTgT/ChbrcjyIMnSrthrp/gnC76EQ3Cud41FdqaaNmMJo74JRcay
	Ch9DK9sbVSqUxKXFevAL8XkL55k9SgDE2Kyw82SyxVIs8CC6uYnCR6l84l5a2pc/jyQ0p42nez8
	8iSnb3XSfv+iH5/DoJqwXoz/FekEp1NbwZ8LHBE59rjYPRY7Xa67HdxhT1DBcSyMXXS5D9etqru
	jHz9DU9Wd58E6PFcHO3MqT6gUz+r0byqFPvbIZ9mGDO8gdZTPe/TxVCeM7NA+qyGd2/87TACyZW
	sHo4RdXSITl8HpJqjd8LigrdIhK2R5vsruA6PMNWLjUH9DVO9NhvbjPFNZKHaFUPZYMeAiPepuh
	V+L/xPflKXs93QRrAqPb/PJL/Zi6itvrFnkU4e3ibSutI5MAFWj49htJXcdx8hLROKFnTVeUbYi
	K4ZBzoYfUrgiVvk1j3ILQvhU2M4yA4E1DEhqOyhJth71kwyQVNY5vIaqYr2lhZ5Nh4spK0iInxQ
	pyLUibGUQImy5ovoLiPdYJGcROFjw5Hz75omyMN0mcQ/Y4XDstaX2RtGMxTp0wkd92zQWVI6TPJ
	3/WqDM7o=
X-Received: by 2002:a17:90b:28cd:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b1b087c1c9mr6197523a91.8.1794709178845;
        Sat, 14 Nov 2026 18:19:38 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm15651545a91.1.2026.11.14.18.19.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 18:19:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] lib/oe/distro_check: drop Clear Linux
Date: Sat, 14 Nov 2026 18:19:14 -0800
Message-ID: <20261115021914.67744-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115021914.67744-1-tim.orling@konsulko.com>
References: <20261115021914.67744-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 02:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250220
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
index e37599c5d9..03237804b2 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -114,11 +114,6 @@ def get_latest_released_opensuse_source_package_list(d):
             raise
     return latest, package_names
 
-def get_latest_released_clear_source_package_list(d):
-    latest = find_latest_numeric_release("https://download.clearlinux.org/releases/", d)
-    package_names = get_source_package_list_from_url("https://download.clearlinux.org/releases/%s/clear/source/SRPMS/" % latest, "main", d)
-    return latest, package_names
-
 def find_latest_debian_release(url, d):
     "Find the latest listed debian release on the given url"
 
@@ -188,7 +183,6 @@ def create_distro_packages_list(distro_check_dir, d):
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

